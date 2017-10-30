-- LuckPerms SQLite Schema

CREATE TABLE `{prefix}user_permissions` (
  `id`         INTEGER PRIMARY KEY NOT NULL,
  `uuid`       VARCHAR(36)         NOT NULL,
  `permission` VARCHAR(200)        NOT NULL,
  `value`      BOOL                NOT NULL,
  `server`     VARCHAR(36)         NOT NULL,
  `world`      VARCHAR(36)         NOT NULL,
  `expiry`     INT(11)             NOT NULL,
  `contexts`   VARCHAR(200)        NOT NULL
);
CREATE INDEX `{prefix}user_permissions_uuid` ON `{prefix}user_permissions` (`uuid`);
CREATE INDEX `{prefix}user_permissions_permission` ON `{prefix}user_permissions` (`permission`);

CREATE TABLE `{prefix}group_permissions` (
  `id`         INTEGER PRIMARY KEY NOT NULL,
  `name`       VARCHAR(36)         NOT NULL,
  `permission` VARCHAR(200)        NOT NULL,
  `value`      BOOL                NOT NULL,
  `server`     VARCHAR(36)         NOT NULL,
  `world`      VARCHAR(36)         NOT NULL,
  `expiry`     INT(11)             NOT NULL,
  `contexts`   VARCHAR(200)        NOT NULL
);
CREATE INDEX `{prefix}group_permissions_name` ON `{prefix}group_permissions` (`name`);
CREATE INDEX `{prefix}group_permissions_permission` ON `{prefix}group_permissions` (`permission`);

CREATE TABLE `{prefix}players` (
  `uuid`          VARCHAR(36) NOT NULL,
  `username`      VARCHAR(16) NOT NULL,
  `primary_group` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`uuid`)
);
CREATE INDEX `{prefix}players_username` ON `{prefix}players` (`username`);

CREATE TABLE `{prefix}groups` (
  `name` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`name`)
);

CREATE TABLE `{prefix}actions` (
  `id`         INTEGER PRIMARY KEY NOT NULL,
  `time`       BIGINT              NOT NULL,
  `actor_uuid` VARCHAR(36)         NOT NULL,
  `actor_name` VARCHAR(36)         NOT NULL,
  `type`       CHAR(1)             NOT NULL,
  `acted_uuid` VARCHAR(36)         NOT NULL,
  `acted_name` VARCHAR(36)         NOT NULL,
  `action`     VARCHAR(256)        NOT NULL
);

CREATE TABLE `{prefix}tracks` (
  `name`   VARCHAR(36) NOT NULL,
  `groups` TEXT        NOT NULL,
  PRIMARY KEY (`name`)
);