/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import Entities.Course;
import Entities.Links;
import Entities.User;
import Singleton.Connection;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.util.ArrayList;
import java.util.Arrays;
import static java.util.Collections.list;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author ahmed
 */
@javax.ejb.Stateless
@Path("entities.course")
public class CourseFacadeREST extends AbstractFacade<Course> {

    @PersistenceContext(unitName = "webPU")
    private EntityManager em;

    public CourseFacadeREST() {
        super(Course.class);
    }

    @POST
    @Override
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(Course entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Integer id, Course entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }

    @GET
//    @Override
    @Produces(MediaType.APPLICATION_JSON)
    public String findCoursesName() {
        JSONArray jSONArray = new JSONArray();

        SessionFactory fact =Connection.getConnection();
        Session session = fact.openSession();
        try {
            session.beginTransaction();
            Query q = session.createQuery("from Course");

            List<Course> courses = q.list();
            for (Course cc : courses) {

                JSONObject jSONObject = new JSONObject();
                jSONObject.put("id", cc.getId());
                jSONObject.put("name", cc.getName());
                jSONArray.put(jSONObject);
            }

        } catch (Exception ee) {
            ee.printStackTrace();

        } finally {

            session.getTransaction().commit();
            session.close();
        }

        return jSONArray.toString();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Course> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("/{courseName}")
    @Produces(MediaType.APPLICATION_JSON)
    public String GetCourses(@PathParam("courseName") String courseName) throws JSONException {

        SessionFactory fact =Connection.getConnection();
        Session session = fact.openSession();
        session.beginTransaction();

        Query query = session.createQuery("from Course where name LIKE :name");

        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.create();
        List<Course> courses = query.setString("name", "%" + courseName + "%").list();
        List<String> list = new ArrayList<String>();
        for (Course cc : courses) {
            Course course = new Course();
            course.setId(cc.getId());
            course.setName(cc.getName());
            course.setDescription(cc.getDescription());
            course.setTime(cc.getTime());
            course.setMinGrade(cc.getMinGrade());
            course.setFinal1(cc.getFinal1());

            list.add(gson.toJson(course));

        }
        session.getTransaction().commit();
        session.close();
        return list.toString();
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

}
