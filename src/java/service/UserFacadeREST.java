package service;

import Entities.User;
import Singleton.Connection;
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
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@javax.ejb.Stateless
@Path("entities.user")
public class UserFacadeREST extends AbstractFacade<User> {

    @PersistenceContext(unitName = "webPU")
    private EntityManager em;

    public UserFacadeREST() {
        super(User.class);
    }

    @POST
    @Override
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(User entity) {

        try {

            SessionFactory fact =Connection.getConnection();
            Session session = fact.openSession();
            session.beginTransaction();
            // ------------------ insert user ------------------------

            User uu = new User();
            uu.setEmail(entity.getEmail());
            uu.setFaculty(entity.getFaculty());
            uu.setImagename(entity.getImagename());
            uu.setName(entity.getName());
            uu.setPass(entity.getPass());
            uu.setTelephone(entity.getTelephone());
            uu.setImagepath(entity.getImagepath());

            //-------------- save into database --------------------
            session.save(uu);
            session.getTransaction().commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
//            throw WebApplicationException(Response.status(Response.Status.CREATED));

        }

//        return Response.ok("").build();
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public void editUser(@PathParam("id") Integer id, @QueryParam("param") String param, User entity) {

        SessionFactory fact =Connection.getConnection();
        Session session = fact.openSession();

        if (entity.getName() != null) {
            session.beginTransaction();

            User uu = (User) session.get(User.class, id);
            uu.setName(entity.getName());

            session.update(uu);

            session.getTransaction().commit();

        } else if (entity.getEmail() != null) {
            session.beginTransaction();

            User uu = (User) session.get(User.class, id);
            uu.setEmail(entity.getEmail());

            session.update(uu);

            session.getTransaction().commit();
        } else if (entity.getFaculty() != null) {
            session.beginTransaction();

            User uu = (User) session.get(User.class, id);
            uu.setFaculty(entity.getFaculty());

            session.update(uu);

            session.getTransaction().commit();
        } else if (entity.getTelephone() != null) {
            session.beginTransaction();

            User uu = (User) session.get(User.class, id);
            uu.setTelephone(entity.getTelephone());

            session.update(uu);

            session.getTransaction().commit();
        } else if (entity.getPass() != null) {
            session.beginTransaction();

            User uu = (User) session.get(User.class, id);
            uu.setPass(entity.getPass());

            session.update(uu);

            session.getTransaction().commit();
        }

        session.close();

    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{email}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response find_email(@PathParam("email") String email) {
        try {

            SessionFactory fact = Connection.getConnection();
            Session session = fact.openSession();
            session.beginTransaction();

//            String email = u.getEmail();
            Query query = session.createQuery("from User where email=?");

            query.setString(0, email);
            List<User> lu = query.list();
            if (lu == null) {

                return Response.ok("Done").entity("Done").build();

            } else {
                for (User uu : lu) {
//                    System.out.println(uu.getEmail()+"++++++++++++++++++++++++++------------------");
                    if (uu.getEmail().equals(email)) {

                        return Response.status(Response.Status.BAD_REQUEST).entity("Email Exist").build();
                    }

                }
            }

            session.getTransaction().commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
            return Response.status(Response.Status.BAD_REQUEST).build();
        }

        return Response.ok("Done email").entity("Done email").build();
    }
//    
//    @GET
//    @Override
//    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
//    public List<User> findAll() {
//        return super.findAll();
//    }
//    

    @GET
    @Path("{email}/{password}")
    @Produces(MediaType.APPLICATION_JSON)
    public User check_login(@PathParam("email") String email, @PathParam("password") String pass) {

        SessionFactory fact = Connection.getConnection();
        Session session = fact.openSession();
        try {

            session.beginTransaction();

            Query query = session.createQuery("from User where email=:email and pass=:pass");
            query.setParameter("email", email);
            query.setParameter("pass", pass);

            List<User> ul = query.list();
            Iterator i = ul.iterator();
            if (i.hasNext()) {
                User tt = (User) i.next();

                return tt;

            } else {

                return null;

            }

        } catch (Exception ee) {
            ee.printStackTrace();
            return null;

        } finally {

            session.getTransaction().commit();
            session.close();
        }
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
