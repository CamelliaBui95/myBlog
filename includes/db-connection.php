<?php
    require_once('vendor/autoload.php'); 

    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
    $dotenv->safeLoad();

    $type = "mysql";
    $server = $_ENV['DB_SERVER'];
    $charset = "utf8mb4";
    $port = $_ENV['DB_PORT'];
    $db_name = $_ENV['DB_NAME'];
    $dsn = "$type:host=$server;dbname=$db_name;port=$port;charset=$charset";

    $username = $_ENV['DB_USERNAME'];
    $password = $_ENV['DB_PASSWORD'];*/
   
    if(!$username || !$password) {
        echo "<h1>Username or Password to db is missing</h1>";
        exit;
    }

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
    }*/
    
?>