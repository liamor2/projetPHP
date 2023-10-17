<?php

require_once 'app/config.php';

class MiscController {
    public static function home() {
        $twig = CreateTwigEnvironment();

        echo $twig->render('home.html.twig');
    }

    public static function notFound() {
        $twig = CreateTwigEnvironment();

        echo $twig->render('not_found.html.twig');
    }
}

?>