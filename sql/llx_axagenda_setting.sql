CREATE TABLE IF NOT EXISTS `llx_axagenda_setting` (
  `userId` int(255) NOT NULL,
  `hourFormat` varchar(255) DEFAULT NULL,
  `dayFormat` varchar(255) DEFAULT NULL,
  `weekFormat` varchar(255) DEFAULT NULL,
  `monthFormat` varchar(255) DEFAULT NULL,
  `fromtoFormat` varchar(255) DEFAULT NULL,
  `activeStartTime` varchar(255) NOT NULL,
  `activeEndTime` varchar(255) NOT NULL,
  `createByDblclick` tinyint(1) NOT NULL,
  `hideInactiveRow` tinyint(1) NOT NULL,
  `singleDay` tinyint(1) NOT NULL,
  `language` varchar(255) NOT NULL,
  `intervalSlot` int(255) NOT NULL DEFAULT '30',
  `startDay` varchar(255) NOT NULL DEFAULT '0',
  `readOnly` tinyint(1) DEFAULT NULL,
  `initialView` int(11) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
