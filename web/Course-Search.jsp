<%@page import="Entities.User"%>
<%@page import="com.google.common.reflect.TypeToken"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="Clients.LinksClient"%>
<%@page import="Entities.Links"%>
<%@page import="Entities.Course"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- Compatibility Meta IE -->
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- First Mobile Meta -->
        <title>Course-Details</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/materialize.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Sansita" rel="stylesheet">
        <link rel="stylesheet" href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700'>
        <link rel="stylesheet" href="css/Course-Search.css">
    </head>


    <body class="photo3">
        

        <%

//            System.out.print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"+session.getId());
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
                <a href="Home.jsp" class="brand-logo">
                    <img src="images/logo.png">


                </a>


                <ul class="right hide-on-med-and-down">

                    <li><a href="#">
                            <div class="nav-wrapper container">
                                <form action="Search" method="get">
                                    <div class="input-field">

                                        <input id="ajax" name="search" type="search" list="json-datalist" required>
                                        <label for="search"><i class="material-icons fa fa-search fa-lg"></i></label>
                                        <i class="material-icons fa fa-times"></i>
                                        <datalist id="json-datalist"     ></datalist>

                                    </div>
                                </form>
                        </a>
                    </li>
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="Exam.jsp">Exam</a></li>


                    <!-- Dropdown Trigger -->

                    <li><a class="dropdown-button" href="#!" data-activates="dropdown1">
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
                                <form action="Search" method="get">
                                    <div class="input-field">

                                        <input id="ajax" name="search" type="search" list="json-datalist" required>
                                        <label for="search"><i class="material-icons fa fa-search fa-lg"></i></label>
                                        <i class="material-icons fa fa-times"></i>
                                        <datalist id="json-datalist"     ></datalist>

                                    </div>
                                </form>
                        </a>
                    </li>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="#!">Help</a></li>
                    <li class="divider"></li>
                    <li><a href="Logout">Logout</a></li>


                </ul>


            </div>
        </nav>

        <%  } else {


        %>
        <ul id="dropdown1" class="dropdown-content">
            <!--<li><a href="profile.jsp">Profile</a></li>-->
            <li><a href="SignUp.jsp">SignUp</a></li>
            <li><a href="Login.jsp">Login</a></li>
            <li class="divider"></li>

            <li><a href="#!">Help</a></li>
            <!--<li class="divider"></li>-->

            <!--<li><a href="Logout">Logout</a></li>-->

        </ul>

        <!-- END Dropdown Structure -->
        <!-- Start Navbar-->
        <nav>
            <div class="nav-wrapper">
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="mob_icon fa fa-bars fa-lg"></i></a>
                <a href="Home_2.jsp" class="brand-logo">
                    <img src="images/logo.png">
                </a>


                <ul class="right hide-on-med-and-down">

                    <li><a href="#">
                            <div class="nav-wrapper container">
                                <form action="Search" method="get">
                                    <div class="input-field">

                                        <input id="ajax" name="search" type="search" list="json-datalist" required>
                                        <label for="search"><i class="material-icons fa fa-search fa-lg"></i></label>
                                        <i class="material-icons fa fa-times"></i>
                                        <datalist id="json-datalist"     ></datalist>

                                    </div>
                                </form>
                        </a>
                    </li>
                    <li><a href="Home_2.jsp">Home</a></li>
                    <li><a href="Login.jsp?hh=Please Login First Then Exam">Exam</a></li>


                    <!-- Dropdown Trigger -->

                    <li><a class="dropdown-button" href="#!" data-activates="dropdown1">
                            <!--<img class="profile-photo" src="images/salma.jpg">-->

                            <i class="fa fa-arrow-down"></i>
                        </a>
                    </li>
                    <!-- END Dropdown Trigger -->
                </ul>

                <!-- Start Navbar For Mob-->
                <ul class="side-nav mob" id="mobile-demo">
                    <li><a href="#">
                            <div class="nav-wrapper container">
                                <form action="Search" method="get">
                                    <div class="input-field">

                                        <input id="ajax" name="search" type="search" list="json-datalist" required>
                                        <label for="search"><i class="material-icons fa fa-search fa-lg"></i></label>
                                        <i class="material-icons fa fa-times"></i>
                                        <datalist id="json-datalist"     ></datalist>

                                    </div>
                                </form>
                        </a>
                    </li>
                    <li><a href="SignUp.jsp">SignUp</a></li>
                    <li><a href="Login.jsp">Login</a></li>
                    <li class="divider"></li>
                    <li ><a href="#">Help</a></li>


                </ul>


            </div>
        </nav>
        <%            }
        %>

        <!-- ------------------------------------------- End NavBar ----------------------------------------- -->
        <%            try {
                List<Course> courses = (List<Course>) session.getAttribute("courses");

//                out.println(courses+"   ++++++++++++++++++++++++++++++++++++++++++++++++");
//                application.set
                boolean f = false;

                for (Course cc : courses) {
                    f = true;
                    int id = cc.getId();
                    String name = cc.getName();
                    String desc = cc.getDescription();

                    String final_grade = cc.getFinal1();
                    String min_grade = cc.getMinGrade();
                    String time = cc.getTime();

//                    List<Links> links = cc.getLinksList();
                    LinksClient ccc = new LinksClient();
                    String json = ccc.GetLink(id + "");
                    GsonBuilder builder = new GsonBuilder();
                    Gson gson = builder.create();
                    List<Links> links = gson.fromJson(json, new TypeToken<List<Links>>() {
                    }.getType());


        %>




        <section class="Course-Search container">
            <div class=" row">
                <div class="name col m6 s12"> 


                    <%                        for (Links ll : links) {
                    %>
                 
                    <a href=<%=ll.getLinks()%>  target="_blank" > <i class="fa fa-youtube fa fa-2x" aria-hidden="true"></i><%= ll.getLinkName()%></a>
                        <% 
                        String nnnn=ll.getLinks();
                        %>
                    
                    <!--youtube Embeded application--> 

                    <iframe width="300" height="300" src="<%=nnnn%>"  >
                    </iframe>
                    <!-------------------------------------->
                    <br>
                    <br>

                    <%
                        }

                    %>
                </div>
                <div class="brande center col m6 s12"><p ><%= name%></p></div> 
                <hr>
                <div class="Details  col m6 s12">

                    <i class="fa fa-film fa-lg"></i> <h5>  Course Time:  </h5>  <span><%= time%></span> <br>
                    <i class="fa fa-graduation-cap fa-lg"></i>  <h5> Description:  </h5>  <span><%= desc%></span> <br>
                    <i class="fa fa-globe fa-lg"> </i><h5>  Final grade : </h5> <span><%= final_grade%></span> <br>
                    <i class="fa fa-globe fa-lg"> </i><h5>  Min grade : </h5> <span><%= min_grade%></span> <br>

                    <i class="fa fa-star fa-lg"></i> <h5> Rate : </h5> <span>4/5 </span>
                    <span class="glyphicon glyphicon-star" style="color:#F7CA18;"></span>
                    <span class="glyphicon glyphicon-star" style="color:#F7CA18;"></span>
                    <span class="glyphicon glyphicon-star" style="color:#F7CA18;"></span>
                    <span class="glyphicon glyphicon-star" style="color:#F7CA18;"></span>
                    <span class="glyphicon glyphicon-star" style="color:#808080;"></span>
                    </span> <br>

                </div>
            </div>
        </section>


        <%            }

            if (f == false) {
        %>
        <div class="brande center col m6 s12"><p >Course Not Found ...</p></div> 

        <%
            }
//            session.invalidate();
        } catch (Exception e) {
        %>

        <div class="brande center col m6 s12"><p >Search To Get a Content of Course ..........</p></div> 

        <%
            }
        %>

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




    </body>

    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/materialize.js"></script>    
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="js.js" ></script>
