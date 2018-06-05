<?php

$vendorDir = dirname(__DIR__);

return array (
  'barrelstrength/sprout-fields' => 
  array (
    'class' => 'barrelstrength\\sproutfields\\SproutFields',
    'basePath' => $vendorDir . '/barrelstrength/sprout-fields/src',
    'handle' => 'sprout-fields',
    'aliases' => 
    array (
      '@barrelstrength/sproutfields' => $vendorDir . '/barrelstrength/sprout-fields/src',
    ),
    'name' => 'Sprout Fields',
    'version' => '3.1.2',
    'description' => 'International, Craft-friendly field types.',
    'developer' => 'Barrel Strength',
    'developerUrl' => 'https://barrelstrengthdesign.com',
    'developerEmail' => 'sprout@barrelstrengthdesign.com',
    'documentationUrl' => 'https://sprout.barrelstrengthdesign.com/craft-plugins/fields',
    'changelogUrl' => 'https://raw.githubusercontent.com/BarrelStrength/sprout-fields/master/CHANGELOG.md',
    'downloadUrl' => 'https://github.com/BarrelStrength/sprout-fields/archive/master.zip',
  ),
  'newism/craft3-fields' => 
  array (
    'class' => 'newism\\fields\\NsmFields',
    'basePath' => $vendorDir . '/newism/craft3-fields/src',
    'handle' => 'nsm-fields',
    'aliases' => 
    array (
      '@newism/fields' => $vendorDir . '/newism/craft3-fields/src',
    ),
    'name' => 'NSM Fields',
    'version' => '0.0.10',
    'schemaVersion' => '1.0.0',
    'description' => 'Address, telephone and email fields for CraftCMS 3.x',
    'developer' => 'Newism',
    'developerUrl' => 'http://newism.com.au',
    'documentationUrl' => 'https://github.com/newism/craft3-fields/blob/master/README.md',
    'changelogUrl' => 'https://raw.githubusercontent.com/newism/craft3-fields/master/CHANGELOG.md',
    'hasCpSettings' => true,
    'hasCpSection' => false,
  ),
  'craftcms/redactor' => 
  array (
    'class' => 'craft\\redactor\\Plugin',
    'basePath' => $vendorDir . '/craftcms/redactor/src',
    'handle' => 'redactor',
    'aliases' => 
    array (
      '@craft/redactor' => $vendorDir . '/craftcms/redactor/src',
    ),
    'name' => 'Redactor',
    'version' => '2.1.0',
    'description' => 'Edit rich text content in Craft CMS using Redactor by Imperavi.',
    'developer' => 'Pixel & Tonic',
    'developerUrl' => 'https://pixelandtonic.com/',
    'developerEmail' => 'support@craftcms.com',
    'documentationUrl' => 'https://github.com/craftcms/redactor',
    'changelogUrl' => 'https://raw.githubusercontent.com/craftcms/redactor/master/CHANGELOG.md',
    'downloadUrl' => 'https://github.com/craftcms/redactor/archive/master.zip',
  ),
);
