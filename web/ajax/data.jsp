<%@page import="java.util.List"%>
<%@page import="classes.certification"%>
<%@page import="classes.course"%>
<%@page import="classes.DB"%>
<%
    int id=Integer.parseInt(request.getParameter("group1"));
    
    List<certification> cert=DB.check(id,23);
    
    if(cert.size() <1){
    course c=DB.geton(id); 
%>


                        <i class="fa fa-hourglass" aria-hidden="true"></i>
                        <h5> Exam Time: </h5> <span><%= c.getTime() %></span> <br>
                        <i class="fa fa-calendar-plus-o" aria-hidden="true"></i>
                        <h5>Final Grade: </h5> <span><%= c.getFinal()%></span> <br>
                        <i class="fa fa-calendar-minus-o" aria-hidden="true"></i>
                        <h5> Min Grade: </h5>  <span><%= c.getMin_grade() %></span> <br>
                        <i class="fa fa-file-text" aria-hidden="true"></i>
                        <h5> Course Discription: </h5> <span><%= c.getDiscription() %></span> <br>
   <%}else{
   %>       
   <i class="fa fa-hourglass" aria-hidden="true"></i>
   <h5> Message: </h5> <span>Sorry you have taken this exam before</span> <br>
   
   <script>
       $('.exam_btn').attr("disabled","disabled");
 
   </script>
   
   <% } %>