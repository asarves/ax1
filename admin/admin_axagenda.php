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
 * 	\file		admin/axagenda.php
 * 	\ingroup	axagenda
 * 	\brief		This file is an example module setup page
 * 				Put some comments here
 */
// Dolibarr environment
$res = @include("../../main.inc.php"); // From htdocs directory
if (! $res) {
    $res = @include("../../../main.inc.php"); // From "custom" directory
}


// Libraries
require_once DOL_DOCUMENT_ROOT . "/core/lib/admin.lib.php";
require_once '../lib/axagenda.lib.php';
require_once '../lib/doctrine/bootstrap.php';


//require_once "../class/myclass.class.php";
// Translations
$langs->load("axagenda@axagenda");

// Access control
if (! $user->admin) {
    accessforbidden();
}

// Parameters
$action = GETPOST('action', 'alpha');

/*
 * Actions
 */

/*
 * View
 */
$page_name = "AxAgendaSetup";
llxHeader('', $langs->trans($page_name));

// Subheader
$linkback = '<a href="' . DOL_URL_ROOT . '/admin/modules.php">'
    . $langs->trans("BackToModuleList") . '</a>';
print_fiche_titre($langs->trans($page_name), $linkback);

// Configuration header
$head = axagendaAdminPrepareHead();
dol_fiche_head(
    $head,
    'settings',
    $langs->trans("Module10000Name"),
    0,
    "axagenda@axagenda"
);

// Setup page goes here



/******* DOCTRINE *******/ 

$user = $entityManager->find('AxUser', 1);

echo $user->getEmail() . "\n";

echo 'HELLO';


/*******  FIN -- DOCTRINE *******/ 



// echo $langs->trans("AxAgendaSetupPage");

llxFooter();

$db->close();
