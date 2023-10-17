<?php

class UserMode {
    public static function getByEmail($email) {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM users WHERE email = :email');
        $req->execute(array(
            'email' => $email
        ));
        $user = $req->fetch();
        return $user;
    }

    public static function getByEmailAndPassword($email, $password) {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM users WHERE email = :email AND password = :password');
        $req->execute(array(
            'email' => $email,
            'password' => $password
        ));
        $user = $req->fetch();
        return $user;
    }

    public static function create($name, $email, $password) {
        global $bdd;
        $req = $bdd->prepare('INSERT INTO users (name, email, password, role) VALUES (:name, :email, :password, :role)');
        $req->execute(array(
            'name' => $name,
            'email' => $email,
            'password' => $password,
            'role' => 'user'
        ));
        $user = $req->fetch();
        return $user;
    }

    public static function update($id, $name, $email, $password) {
        global $bdd;
        $req = $bdd->prepare('UPDATE users SET name = :name, email = :email, password = :password WHERE id = :id');
        $req->execute(array(
            'id' => $id,
            'name' => $name,
            'email' => $email,
            'password' => $password
        ));
        $user = $req->fetch();
        return $user;
    }

    public static function delete($id) {
        global $bdd;
        $req = $bdd->prepare('DELETE FROM users WHERE id = :id');
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
}

?>