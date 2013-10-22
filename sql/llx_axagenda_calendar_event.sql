CREATE TABLE IF NOT EXISTS `llx_axagenda_calendar_event` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `userId` bigint(255) NOT NULL,
  `calendarId` bigint(255) NOT NULL,
  `repeatType` longtext NOT NULL,
  `startTime` varchar(255) NOT NULL,
  `endTime` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL,
  `description` longtext,
  `subject` varchar(255) DEFAULT NULL,
  `update_date` datetime NOT NULL,
  `locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2A9BEA59743E7F7` (`calendarId`),
  KEY `FK2A9BEA59581C403A` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

