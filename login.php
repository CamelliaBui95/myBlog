<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/login.css">
    <title>Welcome to My Blog</title>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Welcome to <span class="color-brand">My Blog</span></h1>
    </div>
    <div class="flex mt-8">
        <div class="row g-3 align-items-center border-1 pt-5 pb-5 small">
           <h2 class="text-center mt-0 mb-3">Already registered ?</h2>
           <form class="medium-large center" action="">

                <div class="col-auto">
                    <label for="inputEmail" class="col-form-label">Email</label>
                </div>
                <div class="col-auto">
                    <input type="text" id="inputEmail" class="form-control" aria-describedby="passwordHelpInline" name="email">
                </div>

                <div class="col-auto">
                    <label for="inputPassword" class="col-form-label">Password</label>
                </div>
                <div class="col-auto">
                    <input type="password" id="inputPassword" class="form-control" aria-describedby="passwordHelpInline" name="password">
                </div>

                <div class="col-auto flex">
                    <input type="submit" id="submit-btn" class="form-control mt-4"  value="Log In">
                </div>
           </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>