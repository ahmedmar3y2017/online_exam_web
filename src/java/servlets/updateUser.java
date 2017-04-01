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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ahmedmar3y
 */
public class updateUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            User user = (User) request.getServletContext().getAttribute("user");

            if (user != null) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String faculty = request.getParameter("faculty");
                String mobile = request.getParameter("mobile");
                String new_pass = request.getParameter("new_pass");
                String old_pass = request.getParameter("old_pass");
                String confirm = request.getParameter("confirm");

                if (name != null) {
                    User uu = new User();
                    uu.setName(name);

                    UserClient cc = new UserClient();
                    cc.editUser(uu, String.valueOf(user.getId()));
                    user.setName(name);

                    request.getRequestDispatcher("profile.jsp?updatename=" + URLEncoder.encode("Done Update name", "UTF-8")).forward(request, response);
                }
                if (email != null) {

                    User uu = new User();
                    uu.setEmail(email);

                    UserClient cc = new UserClient();
                    cc.editUser(uu, String.valueOf(user.getId()));
                    user.setEmail(email);

                    request.getRequestDispatcher("profile.jsp?updateemail=" + URLEncoder.encode("Done Update Email", "UTF-8")).forward(request, response);

                }
                if (faculty != null) {

                    User uu = new User();
                    uu.setFaculty(faculty);

                    UserClient cc = new UserClient();
                    cc.editUser(uu, String.valueOf(user.getId()));
                    user.setFaculty(faculty);

                    request.getRequestDispatcher("profile.jsp?updatefaculty=" + URLEncoder.encode("Done Update faculty", "UTF-8")).forward(request, response);

                }
                if (mobile != null) {

                    User uu = new User();
                    uu.setTelephone(mobile);

                    UserClient cc = new UserClient();
                    cc.editUser(uu, String.valueOf(user.getId()));
                    user.setTelephone(mobile);

                    request.getRequestDispatcher("profile.jsp?updatemobile=" + URLEncoder.encode("Done Update mobile", "UTF-8")).forward(request, response);

                }
                if (new_pass != null) {

                    User uu = new User();
                    uu.setPass(new_pass);
                    UserClient cc = new UserClient();
                    if (old_pass.equals(user.getPass())) {

                        cc.editUser(uu, String.valueOf(user.getId()));
                        user.setPass(new_pass);
                        request.getRequestDispatcher("profile.jsp?update_pass=" + URLEncoder.encode("Done Update Password", "UTF-8")).forward(request, response);

                    } else {

                        request.getRequestDispatcher("profile.jsp?error_pass=" + URLEncoder.encode("Error old Password", "UTF-8")).forward(request, response);

                    }

                }

            } else {
                response.sendRedirect("Login");
            }

        } catch (Exception ee) {
            ee.printStackTrace();
            response.sendRedirect("Login");

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
