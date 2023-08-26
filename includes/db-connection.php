<?php
    include_once '.env';
    $type = "mysql";
    $server = "localhost";
    $charset = "utf8mb4";
    $port = "3036";
    $db_name = "myBlogDb";
    $dsn = "$type:host=$server;dbname=$db_name;port=$port;charset=$charset";

    // $username = $_ENV["username"];
    // $password = $_ENV["password"];

   
    /*if(!$username || !$password) {
        echo "<h1>Username or Password to db is missing</h1>";
        exit;
    }*/

    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ];

    try {
        $pdo = new PDO($dsn, $username, $password, $options);
    } catch (PDOException $e) {
        // re-throw exception as a way to handle pdo exception
        // if there is no pdo's exception handler => error shows username and password
        throw new PDOException($e->getMessage(), $e->getCode());
    }
    
?>