<?php

namespace barrelstrength\sproutbase\app\import\services;

use barrelstrength\sproutimport\themes\SimpleTheme;
use barrelstrength\sproutbase\app\import\base\Theme;
use craft\base\Component;
use craft\events\RegisterComponentTypesEvent;

class Themes extends Component
{
    const EVENT_REGISTER_THEME_TYPES = 'registerThemesTypes';

    /**
     * @var array
     */
    protected $themes = [];

    public function getSproutImportThemes(): array
    {
        $themeTypes = [
            SimpleTheme::class
        ];

        $event = new RegisterComponentTypesEvent([
            'types' => $themeTypes
        ]);

        $this->trigger(self::EVENT_REGISTER_THEME_TYPES, $event);

        $themes = $event->types;

        if ($themes !== null) {
            foreach ($themes as $themeClass) {

                // Create an instance of our Theme object
                $theme = new $themeClass();

                $this->themes[$themeClass] = $theme;
            }
        }

        uasort($this->themes, function($a, $b) {
            /**
             * @var $a Theme
             * @var $b Theme
             */
            return $a->getName() <=> $b->getName();
        });

        return $this->themes;
    }
}