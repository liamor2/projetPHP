<?php

class ModelModel {
    
        public static function getAll() {
            global $bdd;
            $req = $bdd->prepare('SELECT * FROM models');
            $req->execute();
            $model = $req->fetchAll();
            return $model;
        }
    
        public static function getById($id) {
            global $bdd;
            $req = $bdd->prepare('SELECT * FROM models WHERE model_id = :id');
            $req->execute(array(
                'id' => $id
            ));
            $model = $req->fetch();
            return $model;
        }
    
        public static function create($name, $manufacturer, $species, $length, $width, $height, $minCrew, $maxCrew, $cargo_capacity, $starship_class) {
            global $bdd;
            $req = $bdd->prepare('INSERT INTO models (model_name, model_manufacturer, model_species, model_length, model_width, model_height, model_minCrew, model_maxCrew, model_cargo_capacity, model_starship_class) VALUES (:name, :manufacturer, :species, :length, :width, :height, :minCrew, :maxCrew, :cargo_capacity, :starship_class)');
            $req->execute(array(
                'name' => $name,
                'manufacturer' => $manufacturer,
                'species' => $species,
                'length' => $length,
                'width' => $width,
                'height' => $height,
                'minCrew' => $minCrew,
                'maxCrew' => $maxCrew,
                'cargo_capacity' => $cargo_capacity,
                'starship_class' => $starship_class
            ));
            $model = $req->fetch();
            return $model;
        }
    
        public static function update($id, $name, $manufacturer, $species, $length, $width, $height, $minCrew, $maxCrew, $cargo_capacity, $starship_class) {
            global $bdd;
            $req = $bdd->prepare('UPDATE models SET model_name = :name, model_manufacturer = :manufacturer, model_species = :species, model_length = :length, model_width = :width, model_height = :height, model_minCrew = :minCrew, model_maxCrew = :maxCrew, model_cargo_capacity = :cargo_capacity, model_starship_class = :starship_class WHERE model_id = :id');
            $req->execute(array(
                'id' => $id,
                'name' => $name,
                'manufacturer' => $manufacturer,
                'species' => $species,
                'length' => $length,
                'width' => $width,
                'height' => $height,
                'minCrew' => $minCrew,
                'maxCrew' => $maxCrew,
                'cargo_capacity' => $cargo_capacity,
                'starship_class' => $starship_class
            ));
            $model = $req->fetch();
            return $model;
        }
    
        public static function delete($id) {
            global $bdd;
            $req = $bdd->prepare('DELETE FROM models WHERE model_id = :id');
            $req->execute(array(
                'id' => $id
            ));
            $model = $req->fetch();
            return $model;
        }
}