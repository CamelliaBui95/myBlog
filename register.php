<?php include 'includes/login-logout.php' ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/login.css">
    <title>Sign Up</title>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Welcome to <span class="color-brand">My Blog</span></h1>
    </div>
    <div class="container mt-5 flex">
        <div class="row g-3 align-items-center border-1 pt-5 pb-5 small">
           <h2 class="text-center mt-0 mb-3">Sign Up</h2>
           <form class="medium-large center" action="register.php" method="POST">
                <div class="col-auto">
                    <label for="inputUsername" class="col-form-label">Username</label>
                </div>
                <div class="col-auto">
                    <input type="text" id="inputUsername" class="form-control" aria-describedby="usernameHelpInline" name="username">
                </div>

                <div class="col-auto">
                    <label for="inputEmail" class="col-form-label">Email</label>
                </div>
                <div class="col-auto">
                    <input type="text" id="inputEmail" class="form-control" aria-describedby="emailHelpInline" name="email">
                </div>

                <div class="col-auto">
                    <label for="inputPassword" class="col-form-label">Password</label>
                </div>
                <div class="col-auto">
                    <input type="password" id="inputPassword" class="form-control" aria-describedby="passwordHelpInline" name="password">
                </div>
        
                <p class="text-center mt-3 mb-0">Or <a href="login.php">Log In</a></p>
                <div class="col-auto flex">
                    <input type="submit" id="submit-btn" class="form-control mt-3"  value="Register">
                </div>
           </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>