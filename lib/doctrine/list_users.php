
<?php

require_once 'bootstrap.php';


$user = $entityManager->find('AxUser', 1);

echo $user->getEmail() . "\n";


