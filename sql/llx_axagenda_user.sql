CREATE TABLE IF NOT EXISTS `llx_axagenda_user` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_show` int(1) NOT NULL,
  `enabled` int(1) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

