<?php 
    session_start();
    $logged_in = $_SESSION['logged_in'] ?? false;

    $username = 'Camellia';
    $email = 'camellia.bui95@gmail.com';
    $password = 'abc1234';

    function login() {
        // update session
        session_regenerate_id(true);
        $_SESSION['logged_in'] = true;
    }

    function logout() {
        // clear server's session array;
        $_SESSION = [];

        // delete session cookie;
        $params = session_get_cookie_params();
        setcookie('PHPSESSID', '', time() - 3600, $params['path'], $params['domain'], $params['secure'], $params['httponly']);

        // destroy session text file;
        session_destroy();
    }

    function require_login($logged_in) {
        if($logged_in == false) {
            header('Location: login.php');
            exit;
        }
    }
?>