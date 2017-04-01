<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Entities.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- Compatibility Meta IE -->
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- First Mobile Meta -->
        <title>Online-Course</title>
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Sansita" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/materialize.min.css">
        <link rel="stylesheet" href="css/Home.css">
    </head>
    <body>    
        <%

            User uu = (User) session.getAttribute("user");
            if (uu != null) {

        %>


        <ul id="dropdown1" class="dropdown-content">
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="#!">Help</a></li>
            <li class="divider"></li>

            <li><a href="Logout">Logout</a></li>

        </ul>

        <!-- END Dropdown Structure -->



        <!-- Start Navbar-->
        <nav>
            <div class="nav-wrapper">
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="mob_icon fa fa-bars fa-lg"></i></a>
                <a href="main.html" class="brand-logo">
                    <img  src="images/logo.png">

                </a>


                <ul class="right hide-on-med-and-down">

                    <li><a href="#">
                            <div class="nav-wrapper container">
                                <form method="post" action="Search" >
                                    <div class="input-field">

                                        <input name="search" type="search" id="ajax" list="json-datalist" placeholder="e.g. datalist" required="true">
                                        <datalist id="json-datalist"  ></datalist>
                                        <label for="search"><i class="material-icons fa fa-search fa-lg"></i></label>
                                        <i class="material-icons fa fa-times"></i>
                                    </div>

                                </form>
                        </a>
                    </li>

                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="Exam.jsp">Exam</a></li>

                    <li class="aboutt"><a href="#">About US</a></li>
                    <li class="team"><a href="#">Our Team</a></li>

                    <!-- Dropdown Trigger -->

                    <li><a class="dropdown-button" href="#!" data-activates="dropdown1">
                            <!--<img class="profile-photo" src="images/salma.jpg">-->
                            <img class="profile-photo" src=<%="'images/profile/" + uu.getImagename() + "'"%>/>
                            <i class="fa fa-arrow-down"></i>
                        </a>
                    </li>
                    <!-- END Dropdown Trigger -->
                </ul>

                <!-- Start Navbar For Mob-->
                <ul class="side-nav mob" id="mobile-demo">
                    <li><a href="#">
                            <div class="nav-wrapper container">
                                <form method="post" action="Search" >
                                    <div class="input-field">

                                        <input name="search" type="search" id="ajax" list="json-datalist" placeholder="e.g. datalist" required="true">
                                        <datalist id="json-datalist"  ></datalist>
                                        <label for="search"><i class="material-icons fa fa-search fa-lg"></i></label>
                                        <i class="material-icons fa fa-times"></i>
                                    </div>

                                </form>
                        </a>
                    </li>
                    <hr>

                    <li><a href="Exam.jsp">Exam</a></li>
                    <hr>
                    <li><a href="profile.jsp">profile</a></li>

                    <hr>
                    <li><a href="Logout">Logout</a></li>
                    <hr>
                </ul>
            </div>
        </nav>


        <!-- Start Slider -->


        <div id="myCarousel" class="carousel slide slide1" data-ride="carousel">
            <!-- Indicators -->

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">

                    <img src="images/work2.jpeg" alt="Chania">

                </div>

                <div class="item">

                    <img src="images/work2.jpeg" alt="Chania">

                </div>

                <div class="item">

                    <img src="images/work2.jpeg" alt="Chania">

                </div>

                <div class="item">

                    <img src="images/work2.jpeg" alt="Chania">

                </div>
            </div>
        </div>
        <!-- End Slider -->

        <!-- ---------------------------- Start Section Features ---------------------------- -->
        <section class="features text-center">
            <div class="container">
                <h1>Our <span> Features</span> </h1>
                <div class="row">
                    <div class="col l3 s6 wow bounceInLeft " data-wow-duration="1.5s"data-wow-offset="250">
                        <div class="feat">
                            <i class="icons fa fa-check-square-o fa-2x" aria-hidden="true"></i>
                            <h4>Exam</h4>
                            <p>Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                        </div>
                    </div>
                    <div class="col l3 s6 wow bounceInUp " data-wow-duration="1.5s"data-wow-offset="250">
                        <div class="feat">
                            <i class="icons fa  fa-sign-language fa-2x" aria-hidden="true"></i>
                            <h4>Section</h4>
                            <p>Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                        </div>
                    </div>
                    <div class="col l3 s6 wow bounceInRight " data-wow-duration="1.5s"data-wow-offset="250">
                        <div class="feat">
                            <i class=" icons fa fa-line-chart fa-2x" aria-hidden="true"></i>
                            <h4>Awesome</h4>
                            <p>Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                        </div>
                    </div>
                    <div class="col l3 s6 wow bounceInDown " data-wow-duration="1.5s"data-wow-offset="250">
                        <div class="feat">
                            <i class="icons fa fa-file-archive-o fa-2x" aria-hidden="true"></i>
                            <h4>Documented</h4>
                            <p>Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ---------------------------- End Section Features ------------------------------ -->


        <!-- ---------------------------- Start Section About --------------------------------- -->
        <section class="about text-center wow bounceIn " data-wow-duration="1.5s"data-wow-offset="200">
            <div class="container">
                <h1> About <span>US</span></h1>
                <p class="lead">gings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustain <strong>Course Online</strong></p>
            </div>
        </section>
        <!-- ---------------------------- End Section About --------------------------------- -->


        <!-- -------------------------------------------  Start  our-team ----------------------------------------- -->


        <section class="container center">
            <h1>Our<span class="te">-TEAM</span></h1>
            <p>Ut enim ad minim veniam, quis nostrud exercitation <br> ullamco laboris nisi ut aliquip ex ea commodo consequat</p>

            <div class="row our-team">

                <div class="info col l3 s12">
                    <img src="images/zidan.jpg">
                    <h5>Ashraf Zidan</h5>

                    <div class="social">



                        <a href="https://www.facebook.com/ashraf.zidan.33483" target="_blank"> <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i> </a>
                        <a href="https://twitter.com/ZI_D_aN7" target="_blank"> <i class="fa fa-twitter fa-2x" aria-hidden="true"></i> </a>
                        <a href="https://www.instagram.com/ashraf.zidan/" target="_blank"> <i class="fa fa-instagram fa-2x" aria-hidden="true"></i> </a>
                    </div>
                </div>

                <div class="info col l3 s12">
                    <img src="images/abdo.jpg">
                    <h5>Abdo H.Ahmed</h5>

                    <div class="social">



                        <a href="https://www.facebook.com/feidi33" target="_blank">  <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i> </a>
                        <a href="https://twitter.com/Abdo_H_Ahmed3" target="_blank"> <i class="fa fa-twitter fa-2x" aria-hidden="true"></i> </a>
                        <a href="https://www.instagram.com/abdelhameed_3/" target="_blank"> <i class="fa fa-instagram fa-2x" aria-hidden="true"></i> </a>
                    </div>
                </div>

                <div class="info col l3 s12">
                    <img src="images/marie.jpg">
                    <h5>Ahmed Marie</h5>

                    <div class="social">
                        <a href="https://www.facebook.com/profile.php?id=100006444793974" target="_blank">  <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i> </a>
                        <a href="https://twitter.com/ahmed_mar3y2015" target="_blank"> <i class="fa fa-twitter fa-2x" aria-hidden="true"></i> </a>
                        <a href="https://www.instagram.com/ahmed_m_mar3y/" target="_blank"> <i class="fa fa-instagram fa-2x" aria-hidden="true"></i> </a>
                    </div>

                </div>

                <div class="info col l3 s12">
                    <img src="images/team.jpg">
                    <h5>Ahmed Eldeeb</h5>

                    <div class="social">

                        <a href="#">  <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i> </a>
                        <a href="#"> <i class="fa fa-twitter fa-2x" aria-hidden="true"></i> </a>
                        <a href="#"> <i class="fa fa-instagram fa-2x" aria-hidden="true"></i> </a>
                    </div>

                </div>
        </section>
        <!-- -------------------------------------------  End  our-team ----------------------------------------- -->

        <section class="keep">
            <div class="overlay">
                <div class="row">
                    <div class="container center col  s12">

                        <h1>Keep In Touch</h1>
                        <p>Sign Up for Newsletter Don't Worry about Spam We Hate it Too</p>

                        <form class="form-inline" action="" method="">

                            <input class="form-control input-lg" type="text" placeholder="Write Your E-mail">


                            <button class="btn waves-effect waves-light large"><i class="fa fa-edit"></i> Subscribe</button>

                        </form>
                        <button class="btn waves-effect waves-light hiddeen s12 "><i class="fa fa-edit"></i> Subscribe</button>


                    </div>
                </div>
            </div>
        </section>


        <!-- -------------------------------------------  end  contact-us ----------------------------------------- -->

        <!-- -------------------------------------------  start Footer ----------------------------------------- -->


        <section class="footr">
            <div class="container row">
                <div class="Copyright col s6">
                    <p>© 2017 Copyright <span>Al-Appachi TEAM</span></p>
                </div>
                <div class="social col s6">
                    <p> Desgined by   <span> <a target="_blank" href="https://www.facebook.com/ashraf.zidan.33483">Ashraf Zidan   <span>   && </span></a>   <a target="_blank" href="https://www.facebook.com/feidi33">Abdo H.Ahmed</a> </span></p>
                </div>

            </div>
        </section>
        <!-- -------------------------------------------  end Footer ----------------------------------------- -->
        <!-- Start Scroll To Top -->
        <section class="scroll-top">
            <div id="scroll-top">
                <i class="fa fa-chevron-up fa-3x"></i>
            </div>
        </section>
        <!-- End Scroll To Top -->


        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>

        <script src="js/materialize.js"></script>

        <script src="js/custom.js"></script>
        <script src="js.js" ></script>
        <%        } else {
                response.sendRedirect("Login.jsp?hh=Please Login First Then Go to home");

            }
        %>


    </body>
</html>