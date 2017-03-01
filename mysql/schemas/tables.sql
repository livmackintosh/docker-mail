-- Docker-Mail SQL Schema --
CREATE SCHEMA IF NOT EXISTS `docker_mail` DEFAULT CHARACTER SET utf8 ;
USE `docker_mail` ;

CREATE TABLE `storage_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(4) DEFAULT '1',
  `public_key` text,
  `pwhash_opslimit` int(11) DEFAULT NULL,
  `pwhash_memlimit` int(11) DEFAULT NULL,
  `pwhash_salt` varchar(255) DEFAULT NULL,
  `sk_nonce` varchar(255) DEFAULT NULL,
  `locked_secretbox` text,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;
