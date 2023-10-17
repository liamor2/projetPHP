<?php

class StarshipModel {
    public static function getAll() {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM starship');
        $req->execute();
        $starships = $req->fetchAll();
        return $starships;
    }

    public static function getById($id) {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM starship WHERE starship_id = :id');
        $req->execute(array(
            'id' => $id
        ));
        $starship = $req->fetch();
        return $starship;
    }

    public static function create($model, $name, $owner) {
        global $bdd;
        $req = $bdd->prepare('INSERT INTO starship (starship_model, starship_name, starship_owner) VALUES (:model, :name, :owner)');
        $req->execute(array(
            'model' => $model,
            'name' => $name,
            'owner' => $owner
        ));
        $starship = $req->fetch();
        return $starship;
    }

    public static function update($id, $model, $name, $owner) {
        global $bdd;
        $req = $bdd->prepare('UPDATE starship SET starship_model = :model, starship_name = :name, starship_owner = :owner WHERE starship_id = :id');
        $req->execute(array(
            'id' => $id,
            'model' => $model,
            'name' => $name,
            'owner' => $owner
        ));
        $starship = $req->fetch();
        return $starship;
    }

    public static function delete($id) {
        global $bdd;
        $req = $bdd->prepare('DELETE FROM starship WHERE starship_id = :id');
        $req->execute(array(
            'id' => $id
        ));
        $starship = $req->fetch();
        return $starship;
    }

    public static function getAllByUser($userId) {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM starship WHERE starship_owner = :owner');
        $req->execute(array(
            'owner' => $userId
        ));
        $starships = $req->fetchAll();
        return $starships;
    }

    public static function getJoinModel($id) {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM starship INNER JOIN model ON starship.starship_model = model.model_id WHERE starship.starship_id = :id');
        $req->execute(array(
            'id' => $id
        ));
        $starship = $req->fetch();
        return $starship;
    }

    public static function getJoinUser($id) {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM starship INNER JOIN user ON starship.starship_owner = user.user_id WHERE starship.starship_id = :id');
        $req->execute(array(
            'id' => $id
        ));
        $starship = $req->fetch();
        return $starship;
    }

    public static function getJoinModelUser($id) {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM starship INNER JOIN model ON starship.starship_model = model.model_id INNER JOIN user ON starship.starship_owner = user.user_id WHERE starship.starship_id = :id');
        $req->execute(array(
            'id' => $id
        ));
        $starship = $req->fetch();
        return $starship;
    }

    public static function getAllJoinModel() {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM starship INNER JOIN model ON starship.starship_model = model.model_id');
        $req->execute();
        $starships = $req->fetchAll();
        return $starships;
    }

    public static function getAllJoinUser() {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM starship INNER JOIN user ON starship.starship_owner = user.user_id');
        $req->execute();
        $starships = $req->fetchAll();
        return $starships;
    }

    public static function getAllJoinModelUser() {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM starship INNER JOIN model ON starship.starship_model = model.model_id INNER JOIN user ON starship.starship_owner = user.user_id');
        $req->execute();
        $starships = $req->fetchAll();
        return $starships;
    }
}

?>