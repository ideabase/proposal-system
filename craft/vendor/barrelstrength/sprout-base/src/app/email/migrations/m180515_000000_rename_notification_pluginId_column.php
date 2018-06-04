<?php

namespace barrelstrength\sproutbase\app\email\migrations;

use craft\db\Migration;

/**
 * m180515_000000_rename_notification_pluginId_column migration.
 */
class m180515_000000_rename_notification_pluginId_column extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        $table = '{{%sproutemail_notificationemails}}';

        if ($this->db->columnExists($table, 'pluginId')) {
            $this->renameColumn($table, 'pluginId', 'pluginHandle');
        }

        return true;
    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        echo "m180515_000000_rename_notification_pluginId_column cannot be reverted.\n";
        return false;
    }
}
