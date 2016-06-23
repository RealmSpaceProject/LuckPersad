package me.lucko.luckperms.data.methods;

import me.lucko.luckperms.LuckPermsPlugin;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLiteDatastore extends SQLDatastore {

    private static final String CREATETABLE_UUID = "CREATE TABLE IF NOT EXISTS `lp_uuid` (`name` VARCHAR(16) NOT NULL, `uuid` VARCHAR(36) NOT NULL, PRIMARY KEY (`name`));";
    private static final String CREATETABLE_USERS = "CREATE TABLE IF NOT EXISTS `lp_users` (`uuid` VARCHAR(36) NOT NULL, `name` VARCHAR(16) NOT NULL, `perms` TEXT NOT NULL, PRIMARY KEY (`uuid`));";
    private static final String CREATETABLE_GROUPS = "CREATE TABLE IF NOT EXISTS `lp_groups` (`name` VARCHAR(36) NOT NULL, `perms` TEXT NULL, PRIMARY KEY (`name`));";

    private final File file;
    private Connection connection = null;

    public SQLiteDatastore(LuckPermsPlugin plugin, File file) {
        super(plugin, "SQLite");
        this.file = file;
    }

    @Override
    public void init() {
        setupTables(CREATETABLE_UUID, CREATETABLE_USERS, CREATETABLE_GROUPS);
    }

    @Override
    public void shutdown() {

    }

    @Override
    Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                Class.forName("org.sqlite.JDBC");
            } catch (ClassNotFoundException ignored) {}

            connection = DriverManager.getConnection("jdbc:sqlite:" + file.getAbsolutePath());
        }

        return connection;
    }
}
