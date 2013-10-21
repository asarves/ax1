<?php

$arrayofcss = [ "/axagenda/js/extjs/resources/css/ext-all.css", "/axagenda/js/feyaSoft/calendar/css/calendar.css" ];

$arrayofjs = [ "/axagenda/js/jquery.js", 
	       "/axagenda/js/extjs/ext-all-debug.js",
	       "/axagenda/js/feyaSoft/calendar/util/LabelField.js",
	       "/axagenda/js/feyaSoft/calendar/util/DatePicker.js",
	       "/axagenda/js/feyaSoft/calendar/util/SearchField.js",
	       "/axagenda/js/feyaSoft/calendar/common/CONST_PHP.js",
	       "/axagenda/js/feyaSoft/calendar/common/LanManager.js",
	       "/axagenda/js/feyaSoft/calendar/common/Mask.js",
	       "/axagenda/js/feyaSoft/calendar/common/RepeatType.js",
	       "/axagenda/js/feyaSoft/calendar/common/CommentTip.js",
	       "/axagenda/js/feyaSoft/calendar/common/BackThread.js",
	       "/axagenda/js/feyaSoft/calendar/view/BasicView.js",
	       "/axagenda/js/feyaSoft/calendar/store/DataSource.js",
	       "/axagenda/js/feyaSoft/calendar/editor/EventEditor.js",
	       "/axagenda/js/feyaSoft/calendar/editor/DetailEditor.js",
	       "/axagenda/js/feyaSoft/calendar/editor/CalendarEditor.js",
	       "/axagenda/js/feyaSoft/calendar/control/EventHandler.js",
	       "/axagenda/js/feyaSoft/calendar/view/layout/Block.js",
	       "/axagenda/js/feyaSoft/calendar/view/layout/BlockMap.js",
	       "/axagenda/js/feyaSoft/calendar/view/layout/Line.js",
	       "/axagenda/js/feyaSoft/calendar/view/layout/LayoutGrid.js",
	       "/axagenda/js/feyaSoft/calendar/view/layout/CalendarLayout.js",
	       "/axagenda/js/feyaSoft/calendar/view/popup/ExpirePopup.js",
	       "/axagenda/js/feyaSoft/calendar/view/popup/SettingPopup.js",
	       "/axagenda/js/feyaSoft/calendar/view/DayView.js",
	       "/axagenda/js/feyaSoft/calendar/view/MonthView.js",
	       "/axagenda/js/feyaSoft/calendar/view/ResultView.js",
	       "/axagenda/js/feyaSoft/calendar/view/CalendarContainer.js",
	       "/axagenda/js/feyaSoft/calendar/view/WestPanel.js",
	       "/axagenda/js/feyaSoft/calendar/view/MainPanel.js",
	       "/axagenda/js/feyaSoft/calendar/view/Viewer-tabpanel.js" ];


foreach($arrayofjs as $jsfile) {
  print '<script type="text/javascript" src="'.$jsfile.'"></script>'."\n";
}
foreach($arrayofcss as $cssfile) {
  print '<link rel="stylesheet" type="text/css" href="'.$cssfile.'"></link>'."\n";
}









