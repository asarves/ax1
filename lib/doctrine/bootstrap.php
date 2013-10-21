<?php

// bootstrap.php
require_once "vendor/autoload.php";

use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping\Driver\YamlDriver;

$paths = array("src","src/yml", 
	       "/home/greg/WORK/AUXILIAE/dolibarr.jobenfance/htdocs/axagenda/lib/doctrine", 
	       "/home/greg/WORK/AUXILIAE/dolibarr.jobenfance/htdocs/axagenda/lib/doctrine/src", 
	       "/home/greg/WORK/AUXILIAE/dolibarr.jobenfance/htdocs/axagenda/lib/doctrine/src/yml");
$isDevMode = false;

// the connection configuration
$dbParams = array(
		  'driver'   => 'pdo_mysql',
		  'user'     => 'root',
		  'password' => 'admin',
		  'dbname'   => 'mycalendar',
		  );

$config = Setup::createAnnotationMetadataConfiguration($paths, $isDevMode);
$entityManager = EntityManager::create($dbParams, $config);

$regexp = '/calendar|user/';
$config->setFilterSchemaAssetsExpression($regexp);


// $config instanceof Doctrine\ORM\Configuration
$paths2 = array("src","src/yml", 
	       "/home/greg/WORK/AUXILIAE/dolibarr.jobenfance/htdocs/axagenda/lib/doctrine", 
	       "/home/greg/WORK/AUXILIAE/dolibarr.jobenfance/htdocs/axagenda/lib/doctrine/src", 
	       "/home/greg/WORK/AUXILIAE/dolibarr.jobenfance/htdocs/axagenda/lib/doctrine/src/yml");

// $driver = new YamlDriver(array('src/yml'));
$driver = new YamlDriver($paths2);
$config->setMetadataDriverImpl($driver);
