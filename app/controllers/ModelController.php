<?php

require_once 'app/config.php';
require_once 'app/models/ModelModel.php';
require_once 'app/models/SpeciesModel.php';

class ModelController {
    public static function index() {
        $models = ModelModel::getAll();
        $twig = CreateTwigEnvironment();

        echo $twig->render('model_list.html.twig', [
            'models' => $models
        ]);
    }

    public static function delete() {
        $id = $_GET['id'];
        $model = ModelModel::delete($id);
        header('Location: index.php?controller=models&action=index');
    }

    public static function model() {
        $id = $_GET['id'];
        $model = ModelModel::getById($id);
        $twig = CreateTwigEnvironment();
        $twig->addExtension(new \Twig\Extension\DebugExtension());

        echo $twig->render('model_view.html.twig', [
            'model' => $model
        ]);
    }

    public static function edit() {
        $id = $_GET['id'];
        $model = ModelModel::getById($id);
        $species = SpeciesModel::getAll();
        $twig = CreateTwigEnvironment();

        echo $twig->render('model_edit.html.twig', [
            'model' => $model,
            'species' => $species
        ]);
    }

    public static function update() {
        $id = $_POST['model_id'];
        $name = $_POST['model_name'];
        $manufacturer = $_POST['model_manufacturer'];
        $species = $_POST['model_species'];
        $length = $_POST['model_length'];
        $width = $_POST['model_width'];
        $height = $_POST['model_height'];
        $minCrew = $_POST['model_minCrew'];
        $maxCrew = $_POST['model_maxCrew'];
        $cargo_capacity = $_POST['model_cargo_capacity'];
        $starship_class = $_POST['model_starship_class'];
        $model = ModelModel::update($id, $name, $manufacturer, $species, $length, $width, $height, $minCrew, $maxCrew, $cargo_capacity, $starship_class);
        header('Location: index.php?controller=models&action=index');
    }
}