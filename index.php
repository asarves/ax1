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

/**
 *	\file		mypage.php
 *	\ingroup	axagenda
 *	\brief		This file is an example php page
 *				Put some comments here
 */

//if (! defined('NOREQUIREUSER'))	define('NOREQUIREUSER','1');
//if (! defined('NOREQUIREDB'))		define('NOREQUIREDB','1');
//if (! defined('NOREQUIRESOC'))	define('NOREQUIRESOC','1');
//if (! defined('NOREQUIRETRAN'))	define('NOREQUIRETRAN','1');
//if (! defined('NOCSRFCHECK'))		define('NOCSRFCHECK','1');
//if (! defined('NOTOKENRENEWAL'))	define('NOTOKENRENEWAL','1');
// If there is no menu to show
//if (! defined('NOREQUIREMENU'))	define('NOREQUIREMENU','1');
// If we don't need to load the html.form.class.php
//if (! defined('NOREQUIREHTML'))	define('NOREQUIREHTML','1');
//if (! defined('NOREQUIREAJAX'))	define('NOREQUIREAJAX','1');
// If this page is public (can be called outside logged session)
//if (! defined("NOLOGIN"))			define("NOLOGIN",'1');
// Choose the following lines to use the correct relative path
// (../, ../../, etc)
$res = 0;
if (! $res && file_exists("../main.inc.php")) {
    $res = @include("../main.inc.php");
}
if (! $res && file_exists("../../main.inc.php")) {
    $res = @include("../../main.inc.php");
}
if (! $res && file_exists("../../../main.inc.php")) {
    $res = @include("../../../main.inc.php");
}
// The following should only be used in development environments
if (! $res && file_exists("../../../dolibarr/htdocs/main.inc.php")) {
    $res = @include("../../../dolibarr/htdocs/main.inc.php");
}
if (! $res && file_exists("../../../../dolibarr/htdocs/main.inc.php")) {
    $res = @include("../../../../dolibarr/htdocs/main.inc.php");
}
if (! $res && file_exists("../../../../../dolibarr/htdocs/main.inc.php")) {
    $res = @include("../../../../../dolibarr/htdocs/main.inc.php");
}
if (! $res) {
    die("Main include failed");
}


// Change this following line to use the correct relative path from htdocs
// (do not remove DOL_DOCUMENT_ROOT)
llxHeader('', 'MyPageName', '');
// End of page

require_once DOL_DOCUMENT_ROOT . '/axagenda/load_mycalendar.php';

llxFooter();
$db->close();
