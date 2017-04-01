<%@page import="classes.helper"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="classes.course"%>
<%@page import="java.util.List"%>
<%@page import="classes.question"%>
<%@page import="classes.DB"%>
<%
    int id = Integer.parseInt(request.getParameter("group1"));
    course c = DB.geton(id);
    List<question> q = DB.getquestions(id);
    /////////////////////////////////////////////////////////////
    Integer[][] ansNum = new Integer[10][5];
    String[][] ansStr = new String[10][5];
    StringTokenizer st;
    
    // Integer[] test=helper.randQ(4);
     Integer[]test2=helper.randQ(10);
     for (int i = 0; i < 10; i++) {
            ansNum[i][0] = test2[i];
            //make shufle on array
            Integer[] a = helper.randQ(4);
            System.arraycopy(a, 0, ansNum[i], 1, 4);
        }
    int src=0; 
    int n=0;
    for (question qu : q) {
            ansStr[src++][0] = qu.getQuestion();   
        }
    src=0;
     for (question qu : q) {
         n=0;
       st = new StringTokenizer(qu.getAnswers() , "$");
              while (st.hasMoreTokens()) {
                    ansStr[src][++n] = st.nextToken().trim();
                }
              ansStr[src][4]=qu.getCorrect();
                src++;
     }
///////////////////Get answers//////////////////////

%>

<h1>Exam For <%= c.getName()%> </h1>
<!-- Start Testimonials Carousel -->
<div id="carousel-testimonials" class="carousel slide" data-ride="carousel" data-interval="false">

    <div class="carousel-inner" role="listbox">
        <% int i = 0;
         for (int a=0;a<q.size();a++) { %>
        <div class="item">

            <div class="qustion ">
                <h5> <%= ++i%>- <%= ansStr[ ansNum[a][0] ][0] %>  </h5>
                <form action="" method="">
                  <% for(int k=0;k<4;k++){ %> 
                    <p>
                        <input name="group4" value="<%= ansStr[ ansNum[a][0] ][ ansNum[a][k+1]+1 ] %>" type="radio" id="qustion<%=i%>-<%=k%>" />
                        <label for="qustion<%=i%>-<%=k%>" > <%= ansStr[ ansNum[a][0] ][ ansNum[a][k+1]+1 ] %>  </label>
                    </p> 
                    <% } %>
                </form>
            </div>

        </div>
        <% }%>
    </div>

    <ol class="carousel-indicators">
        
        <% int v=0;
        for (question qu : q) { %>
        <li id="kkv" data-target="#carousel-testimonials" data-slide-to="<%= v++ %>" ">
            <h4><%= v %></h4>
        </li>
        <% }%>
        
       
    </ol>
</div>
