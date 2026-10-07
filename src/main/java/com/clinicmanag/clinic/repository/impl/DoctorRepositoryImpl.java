package com.clinicmanag.clinic.repository.impl;

import com.clinicmanag.clinic.model.Doctor;
import com.clinicmanag.clinic.repository.DoctorRepository;
import com.clinicmanag.clinic.util.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class DoctorRepositoryImpl implements DoctorRepository {

    @Override
    public List<Doctor> findAll() {
        EntityManager em = JpaUtil.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT d FROM Doctor d "+
                            "JOIN FETCH d.specialty s "+
                            "JOIN FETCH s.department " +
                            "ORDER BY d.nom",Doctor.class)
                    .getResultList();
        }finally {
            em.close();
        }
    }

    @Override
    public Optional<Doctor> findById(Long id) {
        EntityManager em = JpaUtil.getEntityManager();

        try {

            List<Doctor> result = em.createQuery(
                    "SELECT d FROM Doctor d "+
                            "JOIN FETCH d.specialty s "+
                            "JOIN FETCH s.department " +
                            "WHERE d.id = :id", Doctor.class)
                    .setParameter("id",id)
                    .getResultList();

            return result.isEmpty()
                    ?Optional.empty()
                    :Optional.of(result.get(0));
        }finally {
            em.close();
        }
    }

    @Override
    public Doctor save(Doctor doctor) {

          EntityManager em = JpaUtil.getEntityManager();

          try {

              em.getTransaction().begin();

              if(doctor.getId() == null) {
                  em.persist(doctor);
              }else {
                  doctor = em.merge(doctor);
              }

              em.getTransaction().commit();
              return doctor;

          }catch(RuntimeException e) {

              if(em.getTransaction().isActive())
                  em.getTransaction().rollback();

              throw e;

          }finally {
              em.close();
          }
    }

    @Override
    public boolean existsByEmail(String email) {
        EntityManager em = JpaUtil.getEntityManager();

        try {

            Long count = em.createQuery(
                    "SELECT COUNT(u) FROM User u WHERE " +
                            "LOWER(u.email) = LOWER(:email)", Long.class)
                    .setParameter("email",email)
                    .getSingleResult();

            return count>0;

        }finally {
            em.close();
        }
    }

    @Override
    public boolean existsByEmailAndIdNot(String email, Long id) {
        EntityManager em = JpaUtil.getEntityManager();

        try{

            Long count = em.createQuery(
                    "SELECT COUNT(u) FROM User u " +
                    "WHERE LOWER(u.email) = LOWER(:email) " +
                    "AND u.id <> :id", Long.class)
                    .setParameter("email",email)
                    .setParameter("id",id)
                    .getSingleResult();

            return count > 0;
        }finally {
            em.close();
        }
    }

    @Override
    public boolean existsByMatricule(String matricule) {
        EntityManager em = JpaUtil.getEntityManager();

        try {

            Long count = em.createQuery(
                    "SELECT count(d) FROM Doctor d " +
                    "WHERE lower(d.matricule)  = lower(:matricule) ", Long.class)
                    .setParameter("matricule",matricule)
                    .getSingleResult();

            return count > 0;

        }finally {
            em.close();
        }
    }

    @Override
    public boolean existsByMatriculeAndIdNot(String matricule, Long id) {
        EntityManager em = JpaUtil.getEntityManager();

        try {

            Long count = em.createQuery(
                    "SELECT COUNT(d) FROM Doctor d " +
                            "WHERE lower(d.matricule) = lower(:matricule) " +
                            "AND d.id <> :id", Long.class)
                    .setParameter("matricule",matricule)
                    .setParameter("id",id)
                    .getSingleResult();

            return count > 0;

        }finally {
            em.close();
        }
    }
}