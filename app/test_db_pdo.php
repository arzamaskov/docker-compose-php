<?php

$user = 'root';
$password = 'root';
$pdo = null;

try {
    $database = 'mysql:host=db:3306';
    $pdo = new PDO($database, $user, $password);
    echo 'Success: A proper connection to MySQL was made! The docker database is great.';
} catch (PDOException $e) {
    echo "Error: Unable to connect to MySQL. Error:\n $e";
}

$pdo = null;
