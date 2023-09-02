<?php include 'includes/login-logout.php';
      require 'includes/error-handlers.php';
      require 'includes/db-connection.php';
   
      //phpinfo();

    require_login($logged_in);
?>
<?php include_once 'includes/header.php'?>
<h1 class="mt-3">Home Page</h1>
<?php include_once 'includes/footer.php'?>