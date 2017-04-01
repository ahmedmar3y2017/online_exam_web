<%@page import="com.sun.xml.internal.ws.api.message.saaj.SAAJFactory"%>
<%@page import="Entities.UserCertify"%>
<%@page import="com.google.common.reflect.TypeToken"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="Clients.CertifyClient"%>
<%@page import="Entities.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- Compatibility Meta IE -->
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- First Mobile Meta -->
        <title>Profile</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/materialize.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Sansita" rel="stylesheet">
        <link rel="stylesheet" href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700'>
        <link rel="stylesheet" href="css/Profile.css">
    </head>


    <body> 

        <%
            User user = (User) session.getAttribute("user");

            if (user != null) {
                session.setAttribute("user", user);
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

                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="Exam.jsp">Exam</a></li>


                    <!-- Dropdown Trigger -->

                    <li><a class="dropdown-button" href="#!" data-activates="dropdown1">
                            <!--<img class="profile-photo" src="images/salma.jpg">-->
                            <img class="profile-photo" src=<%="'images/profile/" + user.getImagename() + "'"%>/>

                            <i class="fa fa-arrow-down"></i>
                        </a>
                    </li>
                    <!-- END Dropdown Trigger -->
                </ul>

                <!-- Start Navbar For Mob-->
                <ul class="side-nav mob" id="mobile-demo">
                    <li><a href="#">
                            <div class="nav-wrapper container">
                                <form   method="post" action="Search" >
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
                    <li><a href="Home.html">Home</a></li>
                    <li><a href="Exam.html">Exam</a></li>
                    <hr>
                    <li><a href="Profile.jsp">profile</a></li>

                    <hr>
                    <li><a href="Logout">Logout</a></li>
                    <hr>
                </ul>
            </div>
        </nav>

        <!-- ------------------------------------------- End NavBar ----------------------------------------- -->



        <!-- -------------------------Start Profile------------------- -->
        <section class="Profile">
            <div class="container">
                <div class="row">

                    <div class="photo col l3 s12"> 

                        <div class="profile-photo2">
                            <!--<img  src="images/zidan.jpg">-->
                            <img alt="User Photo" style="width:300px;height:400px;"  src=<%="'images/profile/" + user.getImagename() + "'"%>/>

                            <div class="overlay">

                                <button class="custommize  btn" > Update Photo </button>
                            </div>
                        </div>
                    </div>



                    <div class="input-field  info col l6 s12 offset-l3">
                        <p style="color:red; size: 40px;" >${param.updatename}</p>

                        <form class="forma1" action="updateUser" method="post">
                            <h5 class="center"><%= user.getName()%><i class="fa fa-pencil-square-o one"> </i> </h5>

                            <div class="row" >

                                <input id="hid1" class="hidden col s12 validate" type="text" name="name" value=<%= user.getName()%>>
                                <label id="check1"></label>


                                <button  id="Changes1" class="col s12  btn hidden "  >Save Changes</button>
                            </div>
                        </form>


                        <br>
                        <p style="color:red; size: 40px;" >${param.updateemail}</p>

                        <form class="forma2" action="updateUser" method="post">
                            <span>E-mail : </span> <h5><%= user.getEmail()%><i class="fa fa-pencil-square-o two"></i></h5>
                            <div class="row">

                                <input id="hid2" class="col 16  s12  validate hidden" type="email" name="email" value=<%= user.getEmail()%>>

                                <label id="check2"></label>
                                <button id="Changes2" class="col 16 s12 btn hidden">Save Changes</button>

                            </div>
                        </form>

                        <br>
                        <p style="color:red; size: 40px;" >${param.updatefaculty}</p>

                        <form  class="forma3"  action="updateUser" method="post">
                            <span>StuDied at :</span> <h5><%= user.getFaculty()%><i class="fa fa-pencil-square-o three"></i></h5>
                            <div class="row">


                                <input id="hid3" class="validate hidden" type="text" name="faculty" value=<%= user.getFaculty()%>>
                                <label id="check3"></label>
                                <button id="Changes3" class="col 16 s12 btn hidden">Save Changes</button>
                            </div>

                        </form> 

                        <br>
                        <p style="color:red; size: 40px;" >${param.updatemobile}</p>

                        <form class="forma4"  action="updateUser" method="post">
                            <span>Mobil :</span> <h5><%= user.getTelephone()%><i class="fa fa-pencil-square-o four"></i></h5>
                            <i class="fa fa-pencil-square-o"></i>


                            <div class="row">



                                <input  id="hid4" class="hidden col 16 s12 validate" type="number" name="mobile" value=<%= user.getTelephone()%>>
                                <label id="check4"></label>
                                <button id="Changes4" class="col 16 s12 btn hidden">Save Changes</button>

                            </div>
                        </form>
                        <br>

                        <p style="color:red; size: 40px;" >${param.update_pass}</p>

                        <form class="forma5"  action="updateUser" method="post">
                            <span class="">finally</span>  <h4>Change Password <i class="fa fa-pencil-square-o five"></i></h4>
                            <div class="row">
                                <p style="color:red; size: 40px;" >${param.error_pass}</p>


                                <div class="hidden col  s12" id="hid5"> <span> old Password : </span> 

                                    <input type="Password" name="old_pass" id="Password">



                                </div> 
                                <div class="hidden col  s12" id="hid6" > <span > New Password : </span>
                                    <input type="Password" name="new_pass" id="password1"> 

                                    <label id="check6"></label>

                                </div>

                                <div class="hidden col  s12" id="hid7"><span> Confirm Password : </span> 
                                    <input  type="Password" name="conf_pass" id="password2">

                                    <label id="check7"></label>
                                    <button id="Changes5" class="col 16 s12 btn hidden">Save Changes</button>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>   
            </div>


            <div class="row">
                <div class="grade grade2 col l6 s12"> 
                    <button class="grades btn">Grades <i class="fa fa-bar-chart" aria-hidden="true"></i></button>

                    <div id="Grades" class="hidden ">

                        <%
                            CertifyClient cc = new CertifyClient();
                            String data = cc.find(String.valueOf(user.getId()));

                            GsonBuilder builder = new GsonBuilder();
                            Gson gson = builder.create();
                            List<UserCertify> cer = gson.fromJson(data, new TypeToken<List<UserCertify>>() {
                            }.getType());
                            int count = 0;

                            if (cer.size() == 0) {
                        %>
                        <h5 style="color: red"> No Course You Exam  </h5>  <br>    
                        <h6 style="color: red">Go to Exam By The Following Link .... </h6>  <br>   
                        <a style="color: #304ffe" href="Exam.jsp" >TO Exam ...</a>


                        <%
                            }
                            for (UserCertify certify : cer) {

                        %>                      
                        <h6 style="color: #304ffe">--------------------------------- Course Number : <%=  ++count%>---------------------------------</h6>  <br> <hr>   

                        <h6>Course Name : </h6> <span class="center"><%= certify.getCourseName()%></span> <br> <hr>
                        <h6>Course Description : </h6> <span class="center"><%= certify.getCourse_desc()%></span>  <br> <hr> 
                        <h6>Course Date : </h6> <span class="center"><%= certify.getDate()%></span> <br> <hr>
                        <h6>Final Grade : </h6> <span class="center"><%= certify.getFinalGrade()%></span>  <br> <hr>   
                        <h6>Your Grade : </h6> <span class="center"><%= certify.getGrade()%></span>  <br> <hr>   


                        <%                        }


                        %>

                    </div>


                </div>
            </div>

        </section>   
        <!-- -------------------------End Profile------------------- -->


        <!-- -------------------------------------------  start Footer --------------------------------- -->


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
        <%        } else {
                response.sendRedirect("Login.jsp?hh=Please Login First Then Go to Profile");

            }
        %>

    </body>

    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/materialize.js"></script>    
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="js.js"></script>


    <!--<script src="jsAdmin.js"></script>-->
