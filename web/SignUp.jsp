<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- Compatibility Meta IE -->
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- First Mobile Meta -->
        <title>Sign UP</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/materialize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat"> 
        <link rel="stylesheet" href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700'>
        <link rel="stylesheet" href="css/signup.css">

        <script type="text/javascript">



        </script>

    </head>



    <body>
        <!-- ------------------------------------------- Start Main ----------------------------------------- -->
        <div class=" photo2"> 
            <div class="overlay"> 
                <div class="container">
                    <form class="forma row"  method="post" action="SignUp" encType="multipart/form-data"  >
                        <div class="col l6 s12">
                            <p style="color:red; size: 40px;" >${param.message}</p>
                            <p style="color:red; size: 40px;" >${param.sign}</p>

                            <div class="input-field ">
                                <i class="fa fa-user fa-2x prefix"></i>
                                <input id="icon_prefix1" type="text" class="validate  center" name="FirstName"  >
                                <label for="icon_prefix1">First Name</label> 

                            </div>
                            <label id="check1"></label>



                            <div class="input-field ">
                                <i class="fa fa-user fa-2x prefix"></i>
                                <input id="icon_prefix2" type="text" class="validate center" name="LastName">
                                <label for="icon_prefix2">Last Name</label>

                            </div>
                            <label id="check2"></label>

                            <div class="input-field ">
                                <i class="fa fa-user fa-2x prefix"></i>
                                <input id="icon_prefix3" type="email" class="validate center" name="Email" >
                                <label for="icon_prefix3">Email</label>
                            </div>
                            <label id="check3"></label>


                            <div class="input-field ">
                                <i class="fa fa-user fa-2x prefix"></i>
                                <input id="icon_prefix4" type="text" class="validate center" name="Faculty"  >
                                <label for="icon_prefix4">Faculty</label>

                            </div>      
                            <label id="check4"></label>
                        </div>

                        <div class="col l6 s12">

                            <div class="input-field ">
                                <i class="fa fa-user fa-2x prefix"></i>
                                <input id="icon_prefix5" type="number" class="validate center" name="Telephone" >
                                <label for="icon_prefix5">Telephone</label>

                            </div>
                            <label id="check5"></label>

                            <div class="input-field " >
                                <i class="fa fa-key fa-2x prefix"></i>
                                <input id="password1" type="password" class="validate center" name="Password" >
                                <label for="password1">Password</label>

                            </div>
                            <label id="check6"></label>

                            <div class="input-field " >
                                <i class="fa fa-key fa-2x prefix"></i>
                                <input id="password2" type="password" class="validate center" name="confirm">
                                <label for="password2">Confirm Password</label>

                            </div>
                            <label id="check7"></label>
                            <label id="labelpassword"></label>
                            <div class="file-field input-field">

                                <div class="file-path-wrapper">
                                    <input id="upload" class="file-path validate" type="text" >
                                    <label for="upload">Upload Photo</label>
                                    <label id="check8"></label>
                                </div>
                                <div class="btn upload">
                                    <span>Photo</span>
                                    <input type="file" name="file" value="select images..." >
                                </div>
                            </div>
                        </div>

                        <button id="valid" class="btn waves-effect waves-light col m5 s12 offset-m3 sign" type="submit" name="sign"> Sign up
                        </button>       
                    </form>
                </div>
            </div>    
        </div>
        <!-- ------------------------------------------- End main ----------------------------------------- -->



        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/materialize.min.js"></script>    
        <script src="js/custom2.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>

    </body>
</html>
