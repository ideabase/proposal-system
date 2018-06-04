<?php
/**
 * @link      https://sprout.barrelstrengthdesign.com/
 * @copyright Copyright (c) Barrel Strength Design LLC
 * @license   http://sprout.barrelstrengthdesign.com/license
 */

namespace barrelstrength\sproutbase\app\import\base;

use Craft;
use craft\base\Plugin;

/**
 * Class Theme
 */
abstract class Theme
{
    /**
     * The Plugin class for the plugin where this theme lives
     *
     * @var null|Plugin
     */
    protected $plugin;

    public function __construct()
    {
        $pluginHandle = Craft::$app->getPlugins()->getPluginHandleByClass(get_class($this));

        $this->plugin = Craft::$app->getPlugins()->getPlugin($pluginHandle);
    }

    public function getPlugin()
    {
        return $this->plugin;
    }

    /**
     * The Theme Name
     *
     * @return string
     */
    abstract public function getName(): string;

    /**
     * The Theme Description
     *
     * @return string
     */
    abstract public function getDescription(): string;

    /**
     * Get Class name
     *
     * @return string
     */
    public function getClassName()
    {
        return get_class($this);
    }

    /**
     * Get the Theme Version.
     *
     * Default assumes Theme version is the plugin version. However, if multiple themes
     * are included in one plugin, each theme can override the plugin version with a
     * unique theme version.
     *
     * @return string
     */
    public function getVersion()
    {
        return $this->plugin->getVersion();
    }

    /**
     * The folder where this theme's import files are located
     *
     * @default plugin-handle/src/schema
     *
     * @return string
     */
    public function getSchemaFolder()
    {
        return $this->plugin->getBasePath().DIRECTORY_SEPARATOR.'schema';
    }

    /**
     * The folder where this theme's template files are located
     *
     * @default plugin-handle/src/templates
     *
     * @return string
     */
    public function getSourceTemplateFolder()
    {
        return $this->plugin->getBasePath().DIRECTORY_SEPARATOR.'templates';
    }

    /**
     * The folder where this them will place it's template files
     *
     * @return string
     * @throws \yii\base\Exception
     */
    public function getDestinationTemplateFolder()
    {
        return Craft::$app->getPath()->getSiteTemplatesPath();
    }
}
