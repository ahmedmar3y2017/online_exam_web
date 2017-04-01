<%@page import="Entities.User"%>
<%@page import="classes.course"%>
<%@page import="classes.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- Compatibility Meta IE -->
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- First Mobile Meta -->
        <title>Exam</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/materialize.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">     
        <link rel="stylesheet" href="css/Exam.css">
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

        <script type="text/javascript">
            console.log("ahmed");
            jQuery(document).ready(function ($) {

                //  var num = 0;
                var val;
                $('.Details a').click(function () {

                    $('.Details form input[type="radio"]:checked').each(function () {
                        val = this.value;
                    });

                    $.ajax({
                        url: "ajax/data.jsp",
                        data: {'group1': val},
                        success: function (data) {
                            console.log("ahmed");
                            $('.Details .info').html(data);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("zizo");
                        }
                    });
                });

                $('.name button').click(function () {
                    $.ajax({
                        url: "ajax/question.jsp",
                        data: {'group1': val},
                        success: function (data) {
                            $('.hd').html(data);
                            $('.hd .item').first().addClass('active');
                            $('#kkv').first().addClass('active');

                        },
                    });


                });

                $('.confirm_btn1').click(function (event) {
                    var i = 0;
                    var arr = new Array();
                    $('input[type="radio"]:checked').each(function () {
                        // alert(this.value);
                        arr[i++] = this.value;
                    });
                    ///
                    if (arr.length < 10) {
                        event.preventDefault();
                        alert("Please answer all questions");

                    } else {
                        $(".brande3").slideDown(1000);
                        $(".examm").slideUp(1000);
                        $(".details_down3").slideDown(1000);
                        $.ajax({
                            url: "ajax/calc.jsp",
                            data: {"group1": val, "arr": arr.toString()},
                            success: function (data) {
                                $('.final').html(data);
                            }
                        });


                    }

                });

            });

            console.log("ahmed");

        </script> 

    </head>


    <body class="photo3">

        <!-- ------------------------------------------- Start NavBar ----------------------------------------- -->
        <%

            User user = (User) session.getAttribute("user");

            if (user != null) {
                session.setAttribute("user", user);
        %>

        <!-- Start Navbar-->
        <nav>
            <div class="nav-wrapper">
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="mob_icon fa fa-bars fa-lg"></i></a>
                <a href="Home.html" class="brand-logo">
                    <img src="images/logo.png">
                </a>


                <ul class="right hide-on-med-and-down">

                    <li><a href="#">
                            <div class="nav-wrapper container">
                                <form>
                                    <div class="input-field">
                                        <input id="search" type="search" required>
                                        <label for="search"><i class="material-icons fa fa-search fa-lg"></i></label>
                                        <i class="material-icons fa fa-times"></i>
                                    </div>
                                </form>
                        </a>
                    </li>
               

                    <li><a class="dropdown-button" href="#!" data-activates="dropdown1">
                            <img class="profile-photo" src=<%="'images/profile/" + user.getImagename() + "'"%>>

                        </a>
                    </li>
              
                    <!-- END Dropdown Trigger -->
                </ul>

                <!-- Start Navbar For Mob-->
                <ul class="side-nav mob" id="mobile-demo">
                    <li><a href="#">
                            <div class="nav-wrapper container">
                                <form>
                                    <div class="input-field">
                                        <input id="search" type="search" required>
                                        <label for="search"><i class="material-icons fa fa-search fa-lg"></i></label>
                                        <i class="material-icons fa fa-times"></i>
                                    </div>
                                </form>
                        </a>
                    </li>
                    <hr>
                    <li><a href="Home.jsp">Home</a></li>
                    <hr>
                    <li><a href="Profile.jsp">profile</a></li>
                    <hr>

                    <li><a  href="Logout">Log out</a></li>
                    <hr>
                </ul>


            </div>
        </nav>

        <!-- ------------------------------------------- End NavBar ----------------------------------------- -->

        <section class="Course-Search container ">
            <div class=" row">

                <div class="brande center col  s12 brande2">
                    <p >Select Your Course</p>
                </div>
                <hr>

                <div class="Details  col s12  ">
                    <div class="info details_down2">
                        <form action="#">
                            <%! DB db = new DB();
                                int i = 0;%>
                            <% for (course l : db.getAll()) {%>
                            <p>
                                <input name="group1" type="radio" id="<%= ++i%>" value="<%= l.getId()%>" />
                                <label for="<%= i%>"> <%=l.getName()%> </label>
                            </p>
                            <% }%>
                            <a class="waves-effect waves-light btn-large confirm_btn">Confirm</a>
                        </form>
                    </div>
                </div>
                <div class="name col m6 s12 offset-s3">

                    <button class="waves-effect waves-light btn exam_btn">Get Started</button>
                </div>

                <div class="brande center col m6 s12 brande1">
                    <p >Select Your Course</p>
                </div>


                <div class="Details  col m6 s12  ">

                    <div class="info details_down ">
                        <%--
                        <i class="fa fa-hourglass" aria-hidden="true"></i>
                        <h5> Exam Time: </h5> <span>30 Minutes</span> <br>
                        <i class="fa fa-calendar-plus-o" aria-hidden="true"></i>
                        <h5>Final Grade: </h5> <span>100</span> <br>
                        <i class="fa fa-calendar-minus-o" aria-hidden="true"></i>
                        <h5> Min Grade: </h5>  <span>50</span> <br>
                        <i class="fa fa-file-text" aria-hidden="true"></i>
                        <h5> Course Discription: </h5> <span>Java Course ......</span> <br>
                        --%>
                    </div> 
                </div>

                <div class="brande center col  s12 brande3">
                    <p > Your Score</p>
                </div>


                <div class="Details  col  s12 final  ">
                    <!--                    <div class="info details_down3 ">
                                            <i class="fa fa-hourglass" aria-hidden="true"></i>
                                            <h5> Score  </h5> <span>100</span> <br>
                                            <i class="fa fa-calendar-plus-o" aria-hidden="true"></i>
                                            <h5>Your Score is  </h5> <span>70</span> <br>
                                            <i class="fa fa-file-text" aria-hidden="true"></i>
                                            <h5>Thank You ! </h5><br>
                                        </div>-->
                </div>

            </div>
        </section>

        <!-- -------------------------------------------  start Question ----------------------------------------- -->

        <section class="testimonials text-center wow rotateInUpRight examm small_exam" data-wow-duration="1.5s" data-wow-offset="450">
            <div class="container hd">

                <!-- End Testimonials Carousel -->
            </div>
            <a class="waves-effect waves-light btn-large confirm_btn1">Confirm</a>
        </section>
        <!-- -------------------------------------------  End Question ----------------------------------------- -->

        <!-- -------------------------------------------  start Footer ----------------------------------------- -->


        <section class="footr">
            <div class="container row">
                <div class="Copyright col s6">
                    <p>Â© 2017 Copyright <span>Al-Appachi TEAM</span></p>
                </div>
                <div class="social col s6">

                </div>

            </div>
        </section>

        <!-- -------------------------------------------  end Footer ----------------------------------------- -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/jquery.bxslider.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/custom.js"></script>
        <%        } else {
                response.sendRedirect("Login.jsp?hh=Please Login First Then Go to Exam ...");

            }
        %>

    </body>
</html>
