CREATE TABLE IF NOT EXISTS `llx_axagenda_event_reminder` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `eventId` int(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `early` int(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `alerted` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;




