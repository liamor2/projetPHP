<?php

class SpeciesModel {

    public static function getAll() {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM species');
        $req->execute();
        $species = $req->fetchAll();
        return $species;
    }

    public static function getById($id) {
        global $bdd;
        $req = $bdd->prepare('SELECT * FROM species WHERE id = :id');
        $req->execute(array(
            'id' => $id
        ));
        $species = $req->fetch();
        return $species;
    }

    public static function create($name) {
        global $bdd;
        $req = $bdd->prepare('INSERT INTO species (species_name) VALUES (:name)');
        $req->execute(array(
            'name' => $name
        ));
        $species = $req->fetch();
        return $species;
    }

    public static function update($id, $name) {
        global $bdd;
        $req = $bdd->prepare('UPDATE species SET species_name = :name WHERE id = :id');
        $req->execute(array(
            'id' => $id,
            'name' => $name
        ));
        $species = $req->fetch();
        return $species;
    }

    public static function delete($id) {
        global $bdd;
        $req = $bdd->prepare('DELETE FROM species WHERE id = :id');
        $req->execute(array(
            'id' => $id
        ));
        $species = $req->fetch();
        return $species;
    }
}