<?php
class StarshipController {
    private $model;

    public function __construct($model) {
        $this->model = $model;
    }

    public function listStarship() {
        $starship = $this->model->getAllStarship();

        if ($starship === false) {
            echo "An error occured while getting the starship list.";
            return;
        }

        include 'views/listStarshipView.php';
    }
}
?>