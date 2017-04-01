/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Clients.UserClient;
import Entities.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ahmed
 */
public class SignUp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        String AllName = "";
        User user = new User();
        UserClient u = new UserClient();

        if (!ServletFileUpload.isMultipartContent(request)) {
            String relativeWebPath = "/images/profile";
            String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
            String ImageName = "user.png";
            user.setImagename(ImageName);
            user.setImagepath(absoluteDiskPath);
        } else {

            FileItemFactory itemfactory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(itemfactory);
            try {
                List<FileItem> items = upload.parseRequest(request);

                for (FileItem item : items) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        String contentType = item.getContentType();//image/jpeg
                        if (!contentType.equals("image/png") & !contentType.equals("image/jpeg")) {
                            String relativeWebPath = "/images/profile";
                            String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                            String ImageName = "user.png";
                            user.setImagename(ImageName);
                            user.setImagepath(absoluteDiskPath);
                            continue;

                        }

                        String relativeWebPath = "/images/profile";
                        String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                        System.out.println(absoluteDiskPath);
                        File uploadDir = new File(absoluteDiskPath);
                        File file = File.createTempFile("img", ".png", uploadDir);
                        String ImageName = file.getName();
                        user.setImagename(ImageName);
//                        System.out.println(item.get() + "   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                        user.setImagepath(absoluteDiskPath);
                        item.write(file);

                    } else {
                        //here...
                        String fieldname = item.getFieldName();

                        String fieldvalue = item.getString();
                        if (fieldname.equals("Email")) {

                            if (u.find_email_JSON(fieldvalue).getStatus() != 200) {
                                request.getRequestDispatcher("SignUp.jsp?sign=" + URLEncoder.encode("This Email used Try Another Email........ ")).forward(request, response);

                            } else {
                                user.setEmail(fieldvalue);

                            }
                        } else if (fieldname.equals("FirstName")) {

                            AllName += fieldvalue;
                        } else if (fieldname.equals("LastName")) {
                            AllName += " " + fieldvalue;
                            user.setName(AllName);
                        } else if (fieldname.equals("Faculty")) {
                            user.setFaculty(fieldvalue);

                        } else if (fieldname.equals("Telephone")) {
                            user.setTelephone(fieldvalue);

                        } else if (fieldname.equals("Password")) {
                            user.setPass(fieldvalue);

                        }

                    }
                }

            } catch (FileUploadException e) {

                out.println("upload fail");
            } catch (Exception ex) {
                ex.printStackTrace();
                out.println("can't save");
            }
            u.create_JSON(user);
            response.sendRedirect("Login.jsp?login=" + URLEncoder.encode("Done SignUp Please Login With Email ........ "));

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
