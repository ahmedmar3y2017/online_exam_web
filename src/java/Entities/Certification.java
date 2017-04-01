/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ahmed
 */
@Entity
@Table(name = "certification")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Certification.findAll", query = "SELECT c FROM Certification c"),
    @NamedQuery(name = "Certification.findByUserId", query = "SELECT c FROM Certification c WHERE c.certificationPK.userId = :userId"),
    @NamedQuery(name = "Certification.findByCourseId", query = "SELECT c FROM Certification c WHERE c.certificationPK.courseId = :courseId"),
    @NamedQuery(name = "Certification.findByDate", query = "SELECT c FROM Certification c WHERE c.date = :date"),
    @NamedQuery(name = "Certification.findByGrade", query = "SELECT c FROM Certification c WHERE c.grade = :grade"),
    @NamedQuery(name = "Certification.findByCertified", query = "SELECT c FROM Certification c WHERE c.certified = :certified")})
public class Certification implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CertificationPK certificationPK;
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Column(name = "grade")
    private Integer grade;
    @Column(name = "certified")
    private Integer certified;
    @JoinColumn(name = "course_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Course course;
    @JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;

    public Certification() {
    }

    public Certification(CertificationPK certificationPK) {
        this.certificationPK = certificationPK;
    }

    public Certification(int userId, int courseId) {
        this.certificationPK = new CertificationPK(userId, courseId);
    }

    public CertificationPK getCertificationPK() {
        return certificationPK;
    }

    public void setCertificationPK(CertificationPK certificationPK) {
        this.certificationPK = certificationPK;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getCertified() {
        return certified;
    }

    public void setCertified(Integer certified) {
        this.certified = certified;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (certificationPK != null ? certificationPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Certification)) {
            return false;
        }
        Certification other = (Certification) object;
        if ((this.certificationPK == null && other.certificationPK != null) || (this.certificationPK != null && !this.certificationPK.equals(other.certificationPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Certification[ certificationPK=" + certificationPK + " ]";
    }
    
}
