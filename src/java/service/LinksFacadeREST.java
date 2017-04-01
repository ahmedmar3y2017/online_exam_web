/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import Entities.Links;
import Singleton.Connection;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.util.ArrayList;
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
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


@javax.ejb.Stateless
@Path("entities.links")
public class LinksFacadeREST extends AbstractFacade<Links> {

    @PersistenceContext(unitName = "webPU")
    private EntityManager em;

    public LinksFacadeREST() {
        super(Links.class);
    }

    @POST
    @Override
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(Links entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") String id, Links entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") String id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{CourseId}")
    @Produces(MediaType.APPLICATION_JSON)
    public String GetLink(@PathParam("CourseId") int CourseId) {

        SessionFactory fact =Connection.getConnection();
        Session session = fact.openSession();
        List<String> links = new ArrayList<String>();
        session.beginTransaction();
        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.create();
        Query query = session.createQuery("from Links l where l.courseId.id=:id ");
        query.setInteger("id", CourseId);
        List<Links> list = query.list();
        for (Links ll : list) {

            Links link = new Links();
            link.setId(ll.getId());
            link.setLinkName(ll.getLinkName());
            link.setLinks(ll.getLinks());

            links.add(gson.toJson(link));

        }

        session.getTransaction().commit();
        session.close();

        return links.toString();

    }

    @GET
    @Override
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Links> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Links> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

}
