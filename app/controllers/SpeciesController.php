<?php

require_once 'app/config.php';
require_once 'app/models/SpeciesModel.php';

class SpeciesController {
    public static function index() {
        $species = SpeciesModel::getAll();
        $twig = CreateTwigEnvironment();

        echo $twig->render('species_list.html.twig', [
            'species' => $species
        ]);
    }
}