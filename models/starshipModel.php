<?php
class StarshipModel {
    private $conn;

    public function __construct($dbConnection) {
        $this->conn = $dbConnection;
    }

    public function getAllStarship() {
        $query = "SELECT * FROM starship";
        $result = $this->conn->query($query);

        if ($result === false) {
            return false;
        }

        return $result->fetch_all(MYSQLI_ASSOC);
    }
}
?>