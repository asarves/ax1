<?php

// bootstrap.php
require_once "vendor/autoload.php";

use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping\Driver\YamlDriver;

/* $paths = array("./src"); */
/* $isDevMode = true; */

/* // the connection configuration */
/* $dbParams = array( */
/* 		  'driver'   => 'pdo_mysql', */
/* 		  'user'     => 'root', */
/* 		  'password' => 'admin', */
/* 		  'dbname'   => 'mycalendar', */
/* 		  ); */

/* $config = Setup::createAnnotationMetadataConfiguration($paths, $isDevMode); */
/* $entityManager = EntityManager::create($dbParams, $config); */

/* $regexp = '/calendar|user/'; */
/* $config->setFilterSchemaAssetsExpression($regexp); */


/* // $config instanceof Doctrine\ORM\Configuration */
/* $driver = new YamlDriver(array('src/yml')); */
/* $config->setMetadataDriverImpl($driver); */



use Doctrine\Common\ClassLoader,
  Doctrine\ORM\Configuration,
  Doctrine\Common\Cache\ArrayCache,
  Doctrine\DBAL\Logging\EchoSQLLogger;

class Doctrine {

  public $em = null;

  public function __construct()
  {
    // load database configuration from CodeIgniter
    require_once 'config/database.php';

    // Set up class loading. You could use different autoloaders, provided by your favorite framework,
    // if you want to.
    require_once 'vendor/doctrine/common/lib/Doctrine/Common/ClassLoader.php';


    $doctrineClassLoader = new ClassLoader('Doctrine',  DOL_URL_ROOT.'/'.'libraries');
    $doctrineClassLoader->register();
    $entitiesClassLoader = new ClassLoader('models', 'src');
    $entitiesClassLoader->register();
    $proxiesClassLoader = new ClassLoader('Proxies', DOL_URL_ROOT.'/'.'models/proxies');
    $proxiesClassLoader->register();

    // Set up caches
    $config = new Configuration;
    $cache = new ArrayCache;
    $config->setMetadataCacheImpl($cache);
    $driverImpl = $config->newDefaultAnnotationDriver(array(DOL_URL_ROOT.'/'.'models/Entities'));
    $config->setMetadataDriverImpl($driverImpl);
    $config->setQueryCacheImpl($cache);

    $config->setQueryCacheImpl($cache);

    // Proxy configuration
    $config->setProxyDir(APPPATH.'/models/proxies');
    $config->setProxyNamespace('Proxies');

    // Set up logger
    $logger = new EchoSQLLogger;
    $config->setSQLLogger($logger);

    $config->setAutoGenerateProxyClasses( TRUE );

    // Database connection information
    $connectionOptions = array(
			       'driver' => 'pdo_mysql',
			       'user' =>     $db['default']['username'],
			       'password' => $db['default']['password'],
			       'host' =>     $db['default']['hostname'],
        'dbname' =>   $db['default']['database']
			       );

    // Create EntityManager
    $this->em = EntityManager::create($connectionOptions, $config);
  }
}