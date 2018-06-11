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
    'version' => '2.1.0',
    'description' => 'Edit rich text content in Craft CMS using Redactor by Imperavi.',
    'developer' => 'Pixel & Tonic',
    'developerUrl' => 'https://pixelandtonic.com/',
    'developerEmail' => 'support@craftcms.com',
    'documentationUrl' => 'https://github.com/craftcms/redactor',
    'changelogUrl' => 'https://raw.githubusercontent.com/craftcms/redactor/master/CHANGELOG.md',
    'downloadUrl' => 'https://github.com/craftcms/redactor/archive/master.zip',
  ),
  'craftcms/redactor-clips' => 
  array (
    'class' => 'craft\\redactorclips\\Plugin',
    'basePath' => $vendorDir . '/craftcms/redactor-clips/src',
    'handle' => 'redactor-clips',
    'aliases' => 
    array (
      '@craft/redactorclips' => $vendorDir . '/craftcms/redactor-clips/src',
    ),
    'name' => 'Redactor Clips',
    'version' => '2.0.0',
    'description' => 'This plugin Adds Redactor’s “Clips” plugin to Rich Text fields in Craft, which lets you insert predefined code snippets.',
    'developer' => 'Pixel & Tonic',
    'developerUrl' => 'https://pixelandtonic.com/',
    'developerEmail' => 'support@craftcms.com',
    'documentationUrl' => 'https://github.com/craftcms/redactor-clips',
    'changelogUrl' => 'https://raw.githubusercontent.com/craftcms/redactor-clips/v2/CHANGELOG.md',
    'downloadUrl' => 'https://github.com/craftcms/redactor-clips/archive/v2.zip',
  ),
);
