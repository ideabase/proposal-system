<?php

$vendorDir = dirname(__DIR__);

return array (
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
    'version' => '2.0.0.1',
    'description' => 'Edit rich text content in Craft CMS using Redactor by Imperavi.',
    'developer' => 'Pixel & Tonic',
    'developerUrl' => 'https://pixelandtonic.com/',
    'changelogUrl' => 'https://raw.githubusercontent.com/craftcms/redactor/master/CHANGELOG.md',
    'downloadUrl' => 'https://github.com/craftcms/redactor/archive/master.zip',
  ),
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
);
