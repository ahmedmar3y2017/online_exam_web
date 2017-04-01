/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class DB {

    public static List<course> getAll() {
        SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionfactory.openSession();
        session.beginTransaction();

        // c=(course)session.get(course.class, 24);
        List<course> list = session.createCriteria(course.class).list();

        return list;
    }

    public static course geton(int id) {
        course c;
        SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionfactory.openSession();
        session.beginTransaction();

        c = (course) session.get(course.class, id);
        return c;
    }

    public static List<question> getquestions(int id) {
        SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionfactory.openSession();
        session.beginTransaction();

        // c=(course)session.get(course.class, 24);
        List<question> list = session.createCriteria(question.class).add(Restrictions.eq("course_id", id)).list();

        return list;
    }

    public static void store(int grade, int course_id, int user_id) {
        SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionfactory.openSession();
        session.beginTransaction();

        certification cert = new certification();
        cert.setGrade(grade);
        cert.setCourse_id(course_id);
        cert.setUser_id(user_id);
        cert.setDate(new Date());
        session.save(cert);

        session.getTransaction().commit();
        session.close();
    }

    public static List<certification> check(int course_id, int user_id) {

        SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionfactory.openSession();
        session.beginTransaction();

        certification cert = new certification();

        cert.setCourse_id(course_id);
        cert.setUser_id(user_id);

        List<certification> list = session.createCriteria(certification.class).add(
                Restrictions.and(
                        Restrictions.eq("course_id", course_id),
                        Restrictions.eq("user_id", user_id)
                )).list();
        
        return list;

    }
}
