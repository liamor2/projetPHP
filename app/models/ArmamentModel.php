<?php

class ArmamentModel {
    
        public static function getAll() {
            global $bdd;
            $req = $bdd->prepare('SELECT * FROM armament');
            $req->execute();
            $armament = $req->fetchAll();
            return $armament;
        }
    
        public static function getById($id) {
            global $bdd;
            $req = $bdd->prepare('SELECT * FROM armament WHERE id = :id');
            $req->execute(array(
                'id' => $id
            ));
            $armament = $req->fetch();
            return $armament;
        }
    
        public static function create($name, $manufacturer, $type, $size) {
            global $bdd;
            $req = $bdd->prepare('INSERT INTO armament (name, manufacturer, type, size) VALUES (:name, :manufacturer, :type, :size)');
            $req->execute(array(
                'name' => $name,
                'manufacturer' => $manufacturer,
                'type' => $type,
                'size' => $size
            ));
            $armament = $req->fetch();
            return $armament;
        }

        public static function update($id, $name, $manufacturer, $type, $size) {
            global $bdd;
            $req = $bdd->prepare('UPDATE armament SET name = :name, manufacturer = :manufacturer, type = :type, size = :size WHERE id = :id');
            $req->execute(array(
                'id' => $id,
                'name' => $name,
                'manufacturer' => $manufacturer,
                'type' => $type,
                'size' => $size
            ));
            $armament = $req->fetch();
            return $armament;
        }

        public static function delete($id) {
            global $bdd;
            $req = $bdd->prepare('DELETE FROM armament WHERE id = :id');
            $req->execute(array(
                'id' => $id
            ));
            $armament = $req->fetch();
            return $armament;
        }

    }
?>