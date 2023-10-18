<?php

class UserModel {
    public static function getByEmail($email) {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM users WHERE user_email = :email');
        $req->execute(array(
            'email' => $email
        ));
        $user = $req->fetch();
        return $user;
    }

    public static function getByEmailAndPassword($email, $password) {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM users WHERE user_email = :email AND user_password = :password');
        $req->execute(array(
            'email' => $email,
            'password' => $password
        ));
        $user = $req->fetch();
        return $user;
    }

    public static function create($name, $email, $password) {
        global $bdd;
        $req = $bdd->prepare('INSERT INTO users (user_name, user_email, user_password, user_role) VALUES (:name, :email, :password, :role)');
        $req->execute(array(
            'name' => $name,
            'email' => $email,
            'password' => $password,
            'role' => 'user'
        ));
        $user = $req->fetch();
        return $user;
    }

    public static function update($id, $name, $email) {
        global $bdd;
        $req = $bdd->prepare('UPDATE users SET user_name = :name, user_email = :email WHERE user_id = :id');
        $req->execute(array(
            'id' => $id,
            'name' => $name,
            'email' => $email
        ));
        $user = $req->fetch();
        return $user;
    }

    public static function delete($id) {
        global $bdd;
        $req = $bdd->prepare('DELETE FROM users WHERE user_id = :id');
        $req->execute(array(
            'id' => $id
        ));
        $user = $req->fetch();
        return $user;
    }

    public static function getAll() {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM users');
        $req->execute();
        $users = $req->fetchAll();
        return $users;
    }

    public static function getById($id) {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM users WHERE user_id = :id');
        $req->execute(array(
            'id' => $id
        ));
        $user = $req->fetch();
        return $user;
    }
}

?>