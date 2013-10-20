<?php

// bootstrap.php
require_once "vendor/autoload.php";

use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping\Driver\YamlDriver;

$paths = array("src");
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
$driver = new YamlDriver(array('src/yml'));
$config->setMetadataDriverImpl($driver);