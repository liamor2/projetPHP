<?php

require_once 'app/models/StarshipModel.php';
require_once 'app/models/ModelModel.php';
require_once 'app/models/UserModel.php';
require_once 'app/config.php';

class StarshipController {
    public static function index() {
        $starships = StarshipModel::getAllJoinModelUser();
        $model = ModelModel::getAll();
        $user = UserModel::getAll();
        $twig = CreateTwigEnvironment();

        echo $twig->render('starship_list.html.twig', [
            'starships' => $starships,
            'models' => $model,
            'users' => $user
        ]);
    }

    public static function delete() {
        $id = $_GET['starship_id'];
        $starship = StarshipModel::delete($id);
        header('Location: index.php?controller=starships&action=index');
    }

    public static function add() {
        $name = $_POST['starship_name'];
        $model = $_POST['model_id'];
        $owner = $_POST['user_id'];
        $starship = StarshipModel::create($model, $name, $owner);
        header('Location: index.php?controller=starships&action=index');
    }

    public static function edit() {
        $id = $_GET['starship_id'];
        $starship = StarshipModel::getJoinModelUser($id);
        $model = ModelModel::getAll();
        $user = UserModel::getAll();
        $twig = CreateTwigEnvironment();

        echo $twig->render('starship_edit.html.twig', [
            'starship' => $starship,
            'models' => $model,
            'users' => $user
        ]);
    }

    public static function show() {
        $id = $_GET['starship_id'];
        $starship = StarshipModel::getJoinModelUserSpecies($id);
        $twig = CreateTwigEnvironment();

        echo $twig->render('starship_show.html.twig', [
            'starship' => $starship
        ]);
    }

    public static function update() {
        $id = $_POST['starship_id'];
        $name = $_POST['starship_name'];
        $model = $_POST['model_id'];
        $owner = $_POST['user_id'];
        $starship = StarshipModel::update($id, $model, $name, $owner);
        header('Location: index.php?controller=starships&action=index');
    }
}