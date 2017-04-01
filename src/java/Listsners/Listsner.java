/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Listsners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.Cookie;

/**
 * Web application lifecycle listener.
 *
 * @author ahmedmar3y
 */
public class Listsner implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
   
//        Cookie ck = new Cookie("email", "");
//            ck.setMaxAge(0);
//            sce.getServletContext().get.addCookie(ck);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {


    }
}
