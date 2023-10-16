<?php

require_once 'models/starshipModel.php';
require_once 'controllers/starshipController.php';

$dbConnection = new mysqli('localhost', 'root', '', 'bddSC');

if ($dbConnection->connect_errno) {
    echo "Failed to connect to MySQL: " . $dbConnection->connect_error;
    exit();
}

$starshipModel = new StarshipModel($dbConnection);

$starshipController = new StarshipController($starshipModel);

$starshipController->listStarship();

?>