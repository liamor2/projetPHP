<?php

require_once 'vendor/autoload.php';
require_once 'app/config.php';
require_once 'app/controllers/StarshipController.php';
require_once 'app/controllers/UserController.php';
require_once 'app/controllers/MiscController.php';

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

route_request();


function route_request(){
    $controller = $_GET['controller'] ?? 'misc';
    $action = $_GET['action'] ?? 'home';

    switch($controller){
        case 'starships':
            StarshipController::$action();
            break;
        case 'users':
            UserController::$action();
            break;
        case 'misc':
            MiscController::$action();
            break;
        default:
            MiscController::notFound();
    }
}

?>
