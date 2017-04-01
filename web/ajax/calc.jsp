<%@page import="java.util.List"%>
<%@page import="classes.question"%>
<%@page import="classes.DB"%>


<%
    int id = Integer.parseInt(request.getParameter("group1"));
    List<question> l = DB.getquestions(id);

    String arr = request.getParameter("arr");
    String[] arr1 = arr.split(",");

    int i = 0;
    int value = 0;
    for (question q : l) {
        if (q.getCorrect().equals(arr1[i])) {
            value += 10;
        }
        i++;
    }

    if (value >= 50) {
        DB.store(value, id, 11);





%>


<div class="info details_down3 ">
    <i class="fa fa-hourglass" aria-hidden="true"></i>
    <h5> Score  </h5> <span>100</span> <br>
    <i class="fa fa-calendar-plus-o" aria-hidden="true"></i>

    <h5>Your Score is  </h5> <span><%= value%></span> <br>

    <i class="fa fa-file-text" aria-hidden="true"></i>
    <h5>Thank You ! </h5><br>
</div>

<%
} else {%>
<div class="info details_down3 ">
    <i class="fa fa-hourglass" aria-hidden="true"></i>
    <h5> Score  </h5> <span>100</span> <br>
    <i class="fa fa-calendar-plus-o" aria-hidden="true"></i>

    <h5>Your Score is  </h5> <span><%= value%></span> <br>

    <i class="fa fa-file-text" aria-hidden="true"></i>
    <h5>Sorry you have to try again your exam </h5><br>
</div>
</div>
<%
    }

%>