<?php

require_once 'app/config.php';

class MiscController {
    public static function home() {
        $twig = CreateTwigEnvironment();
        $twig->addExtension(new \Twig\Extension\DebugExtension());

        echo $twig->render('home.html.twig', [
            'user' => $_SESSION['user'] ?? null
        ]);
    }

    public static function notFound() {
        $twig = CreateTwigEnvironment();

        echo $twig->render('not_found.html.twig');
    }
}

?>