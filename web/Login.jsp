<%@page import="LoginFacebook.FBConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- Compatibility Meta IE -->
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- First Mobile Meta -->
        <title>Login</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/materialize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat"> 
        <link rel="stylesheet" href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700'>
        <link rel="stylesheet" href="css/login.css">
    </head>

    <body>


        <%
            FBConnection fbConnection = new FBConnection();
        %>
        <!-- ------------------------------------------- Start Main ----------------------------------------- -->
        <div class="photo">
            <div class="overlay">

                <div class="row"> 
                    <div class="col s6 push-s3">


                        <form class=" test" method="post" action="Login">  

                            <!--/Login With facebook-->
                            <div style="text-align: center;"
                                 style="margin: 0 auto; background-image: url(./img/fbloginbckgrnd.jpg); height: 360px; width: 610px;">

                                <a href="<%=fbConnection.getFBAuthUrl()%>"> 
                                    <img  src="./img/facebookloginbutton.png" />
                                </a>
                            </div>
                            <!------------------------------------->

                            <p style="color:red; size: 40px;" >${param.Home}</p>
                            <!--//Home-->
                            <p style="color:red; size: 40px;" >${param.message}</p>
                            <p style="color:red; size: 40px;" >${param.hh}</p>


                            <p style="color: #ffffff; size: 50px;" > ${param.login}</p>
                            <div class="input-field ">
                                <i class="fa fa-user fa-2x prefix"></i>
                                <input id="icon_prefix1" type="email" class="validate center" name="Email">
                                <label for="icon_prefix1">E-mail</label>
                            </div>
                            <label id="check1"></label>
                            <div class="input-field">
                                <i class="fa fa-key fa-2x prefix"></i>
                                <input id="password" type="password" class="validate center" name="password">
                                <label for="password">Password</label>
                            </div>
                            <label id="check2"></label>
                            <a href="#"> <p class="Forget">Forget Password ?</p></a> 

                            <button class="btn waves-effect waves-light col m5 s12 offset-m1 login" type="submit" name="action" value="login"> Login
                            </button>    

                        </form>

                        <form action="SignUp.jsp" method="get" >
                            <button class="btn waves-effect waves-light col m5 s12 offset-m1 sign" type="submit" name="action" value="sign"> Sign up
                            </button>
                        </form>

                    </div>

                </div>
            </div>
        </div>
        <!-- ------------------------------------------- End main ----------------------------------------- -->

        <script src="js/jquery-1.11.1.min.js"></script>

        <script src="js/materialize.min.js"></script>    
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>