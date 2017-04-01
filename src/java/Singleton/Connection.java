/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Singleton;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author ahmedmar3y
 */
public class Connection {

    private static SessionFactory fact=null;

    private  Connection() {
   
    }
    
    // problem to many  connection of database because after time make exception too many connection 
    // lazy singleton pattern 
    public static SessionFactory getConnection() {

        if (fact == null) { 
            fact = new Configuration().configure().buildSessionFactory();
        }

        return fact;

    }

}
