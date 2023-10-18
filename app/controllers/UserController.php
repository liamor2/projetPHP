<?php

require_once 'app/config.php';
require_once 'app/models/UserModel.php';

class UserController {
    public static function login() {
        $twig = CreateTwigEnvironment();
        echo $twig->render('user_login.html.twig', [
            'user' => $_SESSION['user'] ?? null
        ]);
    }

    public static function logout() {
        session_destroy();
        header('Location: index.php?controller=misc&action=home');
    }

    public static function authenticate() {
        $email = $_POST['email'];
        $password = $_POST['password'];
        $confirm_password = $_POST['confirm_password'];

        if ($password != $confirm_password) {
            header('Location: index.php?controller=users&action=login');
        } else {
            $user = UserModel::getByEmailAndPassword($email, $password);
            if ($user != false && $user != null) {
                $_SESSION['user'] = $user;
                header('Location: index.php?controller=misc&action=home');
                var_dump($_SESSION['user']);
            } else {
                header('Location: index.php?controller=users&action=login');
            }
        }
    }

    public static function register() {
        $twig = CreateTwigEnvironment();

        echo $twig->render('user_register.html.twig');
    }

    public static function create() {
        $name = $_POST['name'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $user = UserModel::create($name, $email, $password);

        if($user){
            $_SESSION['user'] = $user;
            header('Location: index.php?controller=misc&action=home');
        } else {
            header('Location: index.php?controller=users&action=register');
        }
    }

    public static function edit() {
        $id = $_GET['user_id'];
        $user = UserModel::getById($id);
        $twig = CreateTwigEnvironment();

        echo $twig->render('user_edit.html.twig', [
            'user' => $user
        ]);
    }

    public static function update() {
        $id = $_GET['user_id'];
        $name = $_POST['name'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $user = UserModel::update($id, $name, $email, $password);

        if($user){
            $_SESSION['user'] = $user;
            header('Location: index.php?controller=misc&action=home');
        } else {
            header('Location: index.php?controller=users&action=edit&user_id=' . $id);
        }
    }

    public static function delete() {
        $id = $_GET['user_id'];
        $user = UserModel::delete($id);
        header('Location: index.php?controller=misc&action=home');
    }

    public static function show() {
        $id = $_GET['user_id'];
        $user = UserModel::getById($id);
        $twig = CreateTwigEnvironment();

        echo $twig->render('user_show.html.twig', [
            'user' => $user
        ]);
    }
}