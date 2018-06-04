<?php
/**
 * @link      https://sprout.barrelstrengthdesign.com/
 * @copyright Copyright (c) Barrel Strength Design LLC
 * @license   http://sprout.barrelstrengthdesign.com/license
 */

namespace barrelstrength\sproutbase\app\fields\helpers;

use barrelstrength\sproutbase\app\fields\models\Address as AddressModel;
use CommerceGuys\Addressing\Model\AddressFormat;
use CommerceGuys\Addressing\Model\Subdivision;
use Craft;
use CommerceGuys\Addressing\Repository\AddressFormatRepository;
use CommerceGuys\Addressing\Repository\SubdivisionRepository;
use CommerceGuys\Addressing\Repository\CountryRepository;
use CommerceGuys\Addressing\Formatter\DefaultFormatter;
use CommerceGuys\Addressing\Model\Address;
use craft\helpers\Template;
use craft\helpers\UrlHelper;

class AddressHelper
{
    /**
     * @var AddressFormat
     */
    protected $addressObj;

    /**
     * @var SubdivisionRepository
     */
    protected $subdivisonObj;

    /**
     * @var
     */
    private $name;

    /**
     * @var
     */
    private $addressModel;

    /**
     * @var
     */
    protected $countryCode;

    /**
     * @param                   $countryCode
     * @param string            $name
     * @param AddressModel|null $addressModel
     */
    public function setParams($countryCode, $name = 'address', AddressModel $addressModel = null)
    {
        $this->name = $name;
        $this->addressModel = ($addressModel == null) ? new AddressModel : $addressModel;
        $this->countryCode = $countryCode;
    }

    /**
     * @return null|string|string[]
     * @throws \Twig_Error_Loader
     * @throws \yii\base\Exception
     */
    public function getAddressFormHtml()
    {
        $countryCode = $this->countryCode;

        $addressRepo = new AddressFormatRepository;
        $this->subdivisonObj = new SubdivisionRepository;
        $this->addressObj = $addressRepo->get($countryCode);
        $format = $this->addressObj->getFormat();

        // Remove unused format
        $format = preg_replace('/%recipient/', '', $format);
        $format = preg_replace('/%organization/', '', $format);

        // Removed the extra country name embedded on the commerceguys addressing json file
        $countryName = $this->getCountryNameByCode($countryCode);
        if ($countryName) {
            $countryName = strtoupper($countryName);

            $format = preg_replace('/'.$countryName.'/', '', $format);
        }
        // Remove dash on format
        $format = preg_replace('/-/', '', $format);

        // Insert line break based on the format
        //$format = nl2br($format);

        // More whitespace
        $format = preg_replace('/,/', '', $format);

        $format = preg_replace('/%addressLine1/', $this->addressLine('address1'), $format);
        $format = preg_replace('/%addressLine2/', $this->addressLine('address2'), $format);
        $format = preg_replace('/%dependentLocality/', $this->dependentLocality(), $format);
        $format = preg_replace('/%locality/', $this->locality(), $format);

        if (preg_match('/%sortingCode/', $format)) {
            $format = preg_replace('/%sortingCode/', $this->sortingCode(), $format);
        }

        $format = preg_replace('/%administrativeArea/', $this->administrativeArea(), $format);
        $format = preg_replace('/%postalCode/', $this->postalCode(), $format);

        if ($this->addressModel->id != null) {
            $format .= $this->getAddressInfoInput();
        }

        return $format;
    }

    /**
     * @return string
     * @throws \Twig_Error_Loader
     * @throws \yii\base\Exception
     */
    private function getAddressInfoInput()
    {
        return $this->renderTemplates('hidden', [
            'fieldClass' => 'field-address-id',
            'name' => $this->name.'[id]',
            'value' => $this->addressModel->id
        ]);
    }

    /**
     * @param AddressModel|null $addressModel
     * @param string            $namespace
     *
     * @return \Twig_Markup
     * @throws \Twig_Error_Loader
     * @throws \yii\base\Exception
     */
    public function displayAddressForm(AddressModel $addressModel = null, $namespace = 'address')
    {
        $countryCode = $this->defaultCountryCode();

        if ($addressModel->countryCode !== null) {
            $countryCode = $addressModel->countryCode;
        }

        $this->setParams($countryCode, $namespace, $addressModel);

        $countryInput = $this->countryInput();

        $form = $this->getAddressFormHtml();

        $html = $this->renderTemplates('form', [
            'countryInput' => Template::raw($countryInput),
            'form' => Template::raw($form),
            'actionUrl' => UrlHelper::actionUrl('sprout-base/fields-address/change-form')
        ]);

        return Template::raw($html);
    }

    /**
     * @param null $hidden
     *
     * @return string
     * @throws \Twig_Error_Loader
     * @throws \yii\base\Exception
     */
    public function countryInput($hidden = null)
    {
        $countries = $this->getCountries();

        return $this->renderTemplates(
            'select',
            [
                'class' => 'sproutaddress-country-select',
                'label' => $this->renderHeading('Country'),
                'name' => $this->name.'[countryCode]',
                'inputName' => 'countryCode',
                'options' => $countries,
                'value' => $this->countryCode,
                'nameValue' => $this->name,
                'hidden' => $hidden,
                'addressInfo' => $this->addressModel
            ]
        );
    }

    /**
     * @param $addressName
     *
     * @return string
     * @throws \Twig_Error_Loader
     * @throws \yii\base\Exception
     */
    private function addressLine($addressName)
    {
        $value = $this->addressModel->$addressName;

        $addressLabel = $this->renderHeading('Address 1');

        if ($addressName === 'address2') {
            $addressLabel = $this->renderHeading('Address 2');
        }

        return $this->renderTemplates(
            'text',
            [
                'fieldClass' => 'field-address-input',
                'label' => $addressLabel,
                'name' => $this->name."[$addressName]",
                'value' => $value,
                'inputName' => $addressName,
                'addressInfo' => $this->addressModel
            ]
        );
    }

    /**
     * @return string
     * @throws \Twig_Error_Loader
     * @throws \yii\base\Exception
     */
    private function sortingCode()
    {
        $value = $this->addressModel->sortingCode;

        return $this->renderTemplates(
            'text',
            [
                'fieldClass' => 'field-address-input',
                'label' => $this->renderHeading('Sorting Code'),
                'name' => $this->name.'[sortingCode]',
                'value' => $value,
                'inputName' => 'sortingCode',
                'addressInfo' => $this->addressModel
            ]
        );
    }

    /**
     * @return string
     * @throws \Twig_Error_Loader
     * @throws \yii\base\Exception
     */
    private function locality()
    {
        $value = $this->addressModel->locality;

        return $this->renderTemplates(
            'text',
            [
                'fieldClass' => 'field-address-input',
                'label' => $this->renderHeading($this->addressObj->getLocalityType()),
                'name' => $this->name.'[locality]',
                'value' => $value,
                'inputName' => 'locality',
                'addressInfo' => $this->addressModel
            ]
        );
    }

    /**
     * @return string
     * @throws \Twig_Error_Loader
     * @throws \yii\base\Exception
     */
    private function dependentLocality()
    {
        $value = $this->addressModel->dependentLocality;

        return $this->renderTemplates(
            'text',
            [
                'fieldClass' => 'field-address-input',
                'label' => $this->renderHeading($this->addressObj->getDependentLocalityType()),
                'name' => $this->name.'[dependentLocality]',
                'value' => $value,
                'inputName' => 'dependentLocality',
                'addressInfo' => $this->addressModel
            ]
        );
    }

    /**
     * @return string
     * @throws \Twig_Error_Loader
     * @throws \yii\base\Exception
     */
    private function administrativeArea()
    {
        $value = $this->addressModel->administrativeArea;

        $options = [];

        if ($this->subdivisonObj->getAll($this->countryCode)) {

            $states = $this->subdivisonObj->getAll($this->countryCode);

            if (!empty($states)) {

                /** @var Subdivision $state */
                foreach ($states as $state) {
                    $stateName = $state->getName();
                    $options[$stateName] = $stateName;
                }

                return $this->renderTemplates(
                    'select',
                    [
                        'fieldClass' => 'field-address-input',
                        'label' => $this->renderHeading($this->addressObj->getAdministrativeAreaType()),
                        'name' => $this->name.'[administrativeArea]',
                        'options' => $options,
                        'value' => $value,
                        'inputName' => 'administrativeArea',
                        'addressInfo' => $this->addressModel
                    ]
                );
            }
        }

        return $this->renderTemplates(
            'text',
            [
                'fieldClass' => 'field-address-input',
                'label' => $this->renderHeading($this->addressObj->getAdministrativeAreaType()),
                'name' => $this->name.'[administrativeArea]',
                'value' => $value,
                'inputName' => 'administrativeArea',
                'addressInfo' => $this->addressModel
            ]
        );
    }

    /**
     * @return string
     * @throws \Twig_Error_Loader
     * @throws \yii\base\Exception
     */
    public function postalCode()
    {
        $value = $this->addressModel->postalCode;

        return $this->renderTemplates(
            'text',
            [
                'fieldClass' => 'field-address-input',
                'label' => $this->renderHeading($this->addressObj->getPostalCodeType()),
                'name' => $this->name.'[postalCode]',
                'value' => $value,
                'inputName' => 'postalCode',
                'addressInfo' => $this->addressModel
            ]
        );
    }

    /**
     * @param AddressModel $model
     *
     * @return string
     */
    public function getAddressWithFormat(AddressModel $model)
    {
        $address = new Address();
        $addressFormatRepository = new AddressFormatRepository();
        $countryRepository = new CountryRepository();
        $subdivisionRepository = new SubdivisionRepository();

        $formatter = new DefaultFormatter($addressFormatRepository, $countryRepository, $subdivisionRepository);

        $address = $address
            ->withCountryCode($model->countryCode)
            ->withAdministrativeArea($model->administrativeArea)
            ->withLocality($model->locality)
            ->withPostalCode($model->postalCode)
            ->withAddressLine1($model->address1)
            ->withAddressLine2($model->address2);

        if ($model->dependentLocality != null) {
            $address->withDependentLocality($model->dependentLocality);
        }

        return $formatter->format($address);
    }

    /**
     * @param $value
     *
     * @return array|bool
     */
    public function validate($value)
    {
        if (!isset($value['countryCode'])) {
            return true;
        }

        $countryCode = $value['countryCode'];

        if (empty($value['postalCode']) || !isset($value['postalCode'])) {
            return true;
        }

        $addressFormatRepository = new AddressFormatRepository();

        $addressObj = $addressFormatRepository->get($countryCode);

        $postalName = $addressObj->getPostalCodeType();
        $errors = [];

        if ($addressObj->getPostalCodePattern() != null) {
            $pattern = $addressObj->getPostalCodePattern();

            if (preg_match('/^'.$pattern.'$/', $value['postalCode'])) {
                return true;
            } else {
                $errors['postalCode'] = Craft::t('sprout-base', ucwords($postalName).' is invalid.');
            }
        }

        if (!empty($errors)) {
            return $errors;
        }

        return true;
    }

    /**
     * @param $countryCode
     * @param $postalCode
     *
     * @return bool
     */
    public function validatePostalCode($countryCode, $postalCode)
    {
        $addressFormatRepository = new AddressFormatRepository();

        $addressObj = $addressFormatRepository->get($countryCode);

        if ($addressObj->getPostalCodePattern() != null) {
            $pattern = $addressObj->getPostalCodePattern();

            if (preg_match('/^'.$pattern.'$/', $postalCode)) {
                return true;
            }
        }

        return false;
    }

    /**
     * @param $countryCode
     *
     * @return string
     */
    public function getPostalName($countryCode)
    {
        $addressFormatRepository = new AddressFormatRepository();

        $addressObj = $addressFormatRepository->get($countryCode);

        $postalName = $addressObj->getPostalCodeType();

        return ucwords($postalName);
    }

    /**
     * @param $title
     *
     * @return null|string
     */
    public function renderHeading($title)
    {
        return Craft::t('sprout-base', str_replace('_', ' ', ucwords($title)));
    }

    /**
     * @return array
     */
    public function getCountries()
    {
        $countries =
            [
                'AF' => 'Afghanistan',
                'AX' => 'Aland Islands',
                'AL' => 'Albania',
                'DZ' => 'Algeria',
                'AS' => 'American Samoa',
                'AD' => 'Andorra',
                'AO' => 'Angola',
                'AI' => 'Anguilla',
                'AQ' => 'Antarctica',
                'AG' => 'Antigua And Barbuda',
                'AR' => 'Argentina',
                'AM' => 'Armenia',
                'AW' => 'Aruba',
                'AU' => 'Australia',
                'AT' => 'Austria',
                'AZ' => 'Azerbaijan',
                'BS' => 'Bahamas',
                'BH' => 'Bahrain',
                'BD' => 'Bangladesh',
                'BB' => 'Barbados',
                'BY' => 'Belarus',
                'BE' => 'Belgium',
                'BZ' => 'Belize',
                'BJ' => 'Benin',
                'BM' => 'Bermuda',
                'BT' => 'Bhutan',
                'BO' => 'Bolivia',
                'BA' => 'Bosnia And Herzegovina',
                'BW' => 'Botswana',
                'BV' => 'Bouvet Island',
                'BR' => 'Brazil',
                'IO' => 'British Indian Ocean Territory',
                'BN' => 'Brunei Darussalam',
                'BG' => 'Bulgaria',
                'BF' => 'Burkina Faso',
                'BI' => 'Burundi',
                'KH' => 'Cambodia',
                'CM' => 'Cameroon',
                'CA' => 'Canada',
                'CV' => 'Cape Verde',
                'KY' => 'Cayman Islands',
                'CF' => 'Central African Republic',
                'TD' => 'Chad',
                'CL' => 'Chile',
                'CN' => 'China',
                'CX' => 'Christmas Island',
                'CC' => 'Cocos (Keeling) Islands',
                'CO' => 'Colombia',
                'KM' => 'Comoros',
                'CG' => 'Congo',
                'CD' => 'Congo, Democratic Republic',
                'CK' => 'Cook Islands',
                'CR' => 'Costa Rica',
                'CI' => 'Cote D\'Ivoire',
                'HR' => 'Croatia',
                'CU' => 'Cuba',
                'CY' => 'Cyprus',
                'CZ' => 'Czech Republic',
                'DK' => 'Denmark',
                'DJ' => 'Djibouti',
                'DM' => 'Dominica',
                'DO' => 'Dominican Republic',
                'EC' => 'Ecuador',
                'EG' => 'Egypt',
                'SV' => 'El Salvador',
                'GQ' => 'Equatorial Guinea',
                'ER' => 'Eritrea',
                'EE' => 'Estonia',
                'ET' => 'Ethiopia',
                'FK' => 'Falkland Islands (Malvinas)',
                'FO' => 'Faroe Islands',
                'FJ' => 'Fiji',
                'FI' => 'Finland',
                'FR' => 'France',
                'GF' => 'French Guiana',
                'PF' => 'French Polynesia',
                'TF' => 'French Southern Territories',
                'GA' => 'Gabon',
                'GM' => 'Gambia',
                'GE' => 'Georgia',
                'DE' => 'Germany',
                'GH' => 'Ghana',
                'GI' => 'Gibraltar',
                'GR' => 'Greece',
                'GL' => 'Greenland',
                'GD' => 'Grenada',
                'GP' => 'Guadeloupe',
                'GU' => 'Guam',
                'GT' => 'Guatemala',
                'GG' => 'Guernsey',
                'GN' => 'Guinea',
                'GW' => 'Guinea-Bissau',
                'GY' => 'Guyana',
                'HT' => 'Haiti',
                'HM' => 'Heard Island & Mcdonald Islands',
                'VA' => 'Holy See (Vatican City State)',
                'HN' => 'Honduras',
                'HK' => 'Hong Kong',
                'HU' => 'Hungary',
                'IS' => 'Iceland',
                'IN' => 'India',
                'ID' => 'Indonesia',
                'IR' => 'Iran, Islamic Republic Of',
                'IQ' => 'Iraq',
                'IE' => 'Ireland',
                'IM' => 'Isle Of Man',
                'IL' => 'Israel',
                'IT' => 'Italy',
                'JM' => 'Jamaica',
                'JP' => 'Japan',
                'JE' => 'Jersey',
                'JO' => 'Jordan',
                'KZ' => 'Kazakhstan',
                'KE' => 'Kenya',
                'KI' => 'Kiribati',
                'KR' => 'Korea',
                'KW' => 'Kuwait',
                'KG' => 'Kyrgyzstan',
                'LA' => 'Lao People\'s Democratic Republic',
                'LV' => 'Latvia',
                'LB' => 'Lebanon',
                'LS' => 'Lesotho',
                'LR' => 'Liberia',
                'LY' => 'Libyan Arab Jamahiriya',
                'LI' => 'Liechtenstein',
                'LT' => 'Lithuania',
                'LU' => 'Luxembourg',
                'MO' => 'Macao',
                'MK' => 'Macedonia',
                'MG' => 'Madagascar',
                'MW' => 'Malawi',
                'MY' => 'Malaysia',
                'MV' => 'Maldives',
                'ML' => 'Mali',
                'MT' => 'Malta',
                'MH' => 'Marshall Islands',
                'MQ' => 'Martinique',
                'MR' => 'Mauritania',
                'MU' => 'Mauritius',
                'YT' => 'Mayotte',
                'MX' => 'Mexico',
                'FM' => 'Micronesia, Federated States Of',
                'MD' => 'Moldova',
                'MC' => 'Monaco',
                'MN' => 'Mongolia',
                'ME' => 'Montenegro',
                'MS' => 'Montserrat',
                'MA' => 'Morocco',
                'MZ' => 'Mozambique',
                'MM' => 'Myanmar',
                'NA' => 'Namibia',
                'NR' => 'Nauru',
                'NP' => 'Nepal',
                'NL' => 'Netherlands',
                'AN' => 'Netherlands Antilles',
                'NC' => 'New Caledonia',
                'NZ' => 'New Zealand',
                'NI' => 'Nicaragua',
                'NE' => 'Niger',
                'NG' => 'Nigeria',
                'NU' => 'Niue',
                'NF' => 'Norfolk Island',
                'MP' => 'Northern Mariana Islands',
                'NO' => 'Norway',
                'OM' => 'Oman',
                'PK' => 'Pakistan',
                'PW' => 'Palau',
                'PS' => 'Palestinian Territory, Occupied',
                'PA' => 'Panama',
                'PG' => 'Papua New Guinea',
                'PY' => 'Paraguay',
                'PE' => 'Peru',
                'PH' => 'Philippines',
                'PN' => 'Pitcairn',
                'PL' => 'Poland',
                'PT' => 'Portugal',
                'PR' => 'Puerto Rico',
                'QA' => 'Qatar',
                'RE' => 'Reunion',
                'RO' => 'Romania',
                'RU' => 'Russian Federation',
                'RW' => 'Rwanda',
                'BL' => 'Saint Barthelemy',
                'SH' => 'Saint Helena',
                'KN' => 'Saint Kitts And Nevis',
                'LC' => 'Saint Lucia',
                'MF' => 'Saint Martin',
                'PM' => 'Saint Pierre And Miquelon',
                'VC' => 'Saint Vincent And Grenadines',
                'WS' => 'Samoa',
                'SM' => 'San Marino',
                'ST' => 'Sao Tome And Principe',
                'SA' => 'Saudi Arabia',
                'SN' => 'Senegal',
                'RS' => 'Serbia',
                'SC' => 'Seychelles',
                'SL' => 'Sierra Leone',
                'SG' => 'Singapore',
                'SK' => 'Slovakia',
                'SI' => 'Slovenia',
                'SB' => 'Solomon Islands',
                'SO' => 'Somalia',
                'ZA' => 'South Africa',
                'GS' => 'South Georgia And Sandwich Isl.',
                'ES' => 'Spain',
                'LK' => 'Sri Lanka',
                'SD' => 'Sudan',
                'SR' => 'Suriname',
                'SJ' => 'Svalbard And Jan Mayen',
                'SZ' => 'Swaziland',
                'SE' => 'Sweden',
                'CH' => 'Switzerland',
                'SY' => 'Syrian Arab Republic',
                'TW' => 'Taiwan',
                'TJ' => 'Tajikistan',
                'TZ' => 'Tanzania',
                'TH' => 'Thailand',
                'TL' => 'Timor-Leste',
                'TG' => 'Togo',
                'TK' => 'Tokelau',
                'TO' => 'Tonga',
                'TT' => 'Trinidad And Tobago',
                'TN' => 'Tunisia',
                'TR' => 'Turkey',
                'TM' => 'Turkmenistan',
                'TC' => 'Turks And Caicos Islands',
                'TV' => 'Tuvalu',
                'UG' => 'Uganda',
                'UA' => 'Ukraine',
                'AE' => 'United Arab Emirates',
                'GB' => 'United Kingdom',
                'US' => 'United States',
                'UM' => 'United States Outlying Islands',
                'UY' => 'Uruguay',
                'UZ' => 'Uzbekistan',
                'VU' => 'Vanuatu',
                'VE' => 'Venezuela',
                'VN' => 'Viet Nam',
                'VG' => 'Virgin Islands, British',
                'VI' => 'Virgin Islands, U.S.',
                'WF' => 'Wallis And Futuna',
                'EH' => 'Western Sahara',
                'YE' => 'Yemen',
                'ZM' => 'Zambia',
                'ZW' => 'Zimbabwe',
            ];

        return $countries;
    }

    /**
     * @param $code
     *
     * @return mixed|null
     */
    public function getCountryNameByCode($code)
    {
        $countries = $this->getCountries();

        if ($countries[$code]) {
            return $countries[$code];
        }

        return null;
    }

    /**
     * @return string
     */
    public function defaultCountryCode()
    {
        return 'US';
    }

    /**
     * @param $template
     * @param $params
     *
     * @return string
     * @throws \Twig_Error_Loader
     * @throws \yii\base\Exception
     */
    public function renderTemplates($template, $params)
    {
        $html = Craft::$app->view->renderTemplate('sprout-base-fields/_components/fields/formfields/address/'.$template, $params);

        return $html;
    }
}