<?php
/**
 * @link      https://sprout.barrelstrengthdesign.com/
 * @copyright Copyright (c) Barrel Strength Design LLC
 * @license   http://sprout.barrelstrengthdesign.com/license
 */

namespace barrelstrength\sproutbase\app\forms\web\assets\groups;

use craft\web\AssetBundle;
use craft\web\assets\cp\CpAsset;

class RecentEntriesAsset extends AssetBundle
{
    public function init()
    {
        // define the path that your publishable resources live
        $this->sourcePath = '@sproutbase/app/forms/web/assets/recententries/dist';

        // define the dependencies
        $this->depends = [
            CpAsset::class,
        ];

        // define the relative path to CSS/JS files that should be registered with the page
        // when this asset bundle is registered
        $this->js = [
            'js/SproutFormsRecentEntriesChartWidget.js',
        ];

        parent::init();
    }
}