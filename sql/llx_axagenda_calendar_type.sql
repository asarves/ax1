CREATE TABLE IF NOT EXISTS `llx_axagenda_calendar_type` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userId` int(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL,
  `description` longtext,
  `hide` tinyint(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7503A39B581C403A` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

