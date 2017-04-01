/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Clients.UserClient;
import Entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ahmed
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static int counter = 1;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        if (action.equals("login")) {

            String email = request.getParameter("Email");
            String pass = request.getParameter("password");

            User user = new User();

            user.setEmail(email);

            user.setPass(pass);

            UserClient u = new UserClient();
            User uu = u.check_login_JSON(User.class, email, pass);
            if (uu != null) {
                HttpSession sess = request.getSession();
                sess.setAttribute("user", uu);
                

                response.sendRedirect("Home.jsp");

            } else //                out.println(counter + "\t Login Again Error username Or Password");
            {
                if (counter <= 3) {
                    counter++;
                    request.getRequestDispatcher("Login.jsp?message=" + URLEncoder.encode("Login Again Error username Or Password", "UTF-8")).forward(request, response);

//                    request.getRequestDispatcher("Login.jsp").include(request, response);
                } else {
                    counter = 1;
//                    out.println("Please Signup For Login");
                    request.getRequestDispatcher("SignUp.jsp?message=" + URLEncoder.encode("Please Signup For Login", "UTF-8")).forward(request, response);
//                    response.sendRedirect("");

                }
            }

        } // if click sign button
        else {
            response.sendRedirect("SignUp.jsp");

        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
