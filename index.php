<?php
/* <one line to give the program's name and a brief idea of what it does.>
 * Copyright (C) <year>  <name of author>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
$res=0;
if (! $res && file_exists("../main.inc.php")) $res=@include("../main.inc.php");// to work if your module directory is into dolibarr root htdocs directory
if (! $res && file_exists("../../main.inc.php")) $res=@include("../../main.inc.php");// to work if your module directory is into a subdir of root htdocs directory
if (! $res) die("Include of main fails");

@include("./load_mycalendar.php");

$head = ''; $title=''; $help_url=''; $target=''; $disablejs=0; $disablehead=0; $morequerystring='';

$arrayofjs = '';
llxHeader($head, $title, $target, $disablejs, $disablehead, $arrayofjs, $arrayofcss, $morequerystring);


echo '<div id="calendar-container"></div>';


llxFooter();
$db->close();





