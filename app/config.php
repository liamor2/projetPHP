<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bddSC";

try {
    $bdd = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "Connected successfully";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

function createTwigEnvironment(){
    $loader = new \Twig\Loader\FilesystemLoader(__DIR__ . '\views');
    $twig = new \Twig\Environment($loader, [
        'cache' => false
    ]);
    return $twig;
}

?>