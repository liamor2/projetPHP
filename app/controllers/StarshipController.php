<?php

require_once 'app/models/StarshipModel.php';
require_once 'app/config.php';

class StarshipController {
    public static function index() {
        $starships = StarshipModel::getAllJoinModelUser();
        $twig = CreateTwigEnvironment();

        echo $twig->render('starship_list.html.twig', [
            'starships' => $starships
        ]);
    }
}