<?php include 'includes/login-logout.php';
    require_login($logged_in);
?>

<?php include_once 'includes/header.php'?>

<h1 class="mt-3">Hello <?= $username ?></h1>

<?php include_once 'includes/footer.php'?>