<?php
/**
 * @link      https://sprout.barrelstrengthdesign.com/
 * @copyright Copyright (c) Barrel Strength Design LLC
 * @license   http://sprout.barrelstrengthdesign.com/license
 */

namespace barrelstrength\sproutbase\app\import\base;

abstract class SettingsImporter extends Importer
{
    /**
     * @return bool
     */
    public function isSettings()
    {
        return true;
    }

    /**
     * @return \craft\base\Model|mixed|null
     * @throws \Exception
     */
    public function getModel()
    {
        if (!$this->model) {
            $model = null;

            // If we have a Settings handle, use it to get our Settings Model
            if (isset($this->rows['handle'])) {
                $handle = $this->rows['handle'];
                $model = $this->getModelByHandle($handle);
            }

            // If the Settings handle doesn't return anything, it doesn't exist yet
            // So just create a generic settings model
            if (!$model) {
                $model = parent::getModel();
            }

            $this->model = $model;
        }

        return $this->model;
    }

    /**
     * A generic method that allows you to define how to retrieve the model of
     * an importable data type using it's handle.
     *
     * In the case for importing fields, this is the getFieldByHandle method in the Fields Service.
     * In the case for importing sections, this is the getSectionByHandle method in the Sections Service.
     *
     * @param null $handle
     *
     * @return null
     */
    public function getModelByHandle($handle = null)
    {
        return null;
    }

    /**
     * @param $id
     *
     * @return mixed
     */
    abstract public function deleteById($id);

    /**
     * @return string
     */
    public function getSettingsHtml()
    {
        return '';
    }
}