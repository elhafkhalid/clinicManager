package com.clinicmanag.clinic.repository.impl;

import com.clinicmanag.clinic.model.Availability;
import com.clinicmanag.clinic.repository.AvailabilityRepository;
import com.clinicmanag.clinic.util.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;

public class AvailabilityRepositoryImpl implements AvailabilityRepository {

    @Override
    public List<Availability> findByDoctorId(Long doctorId) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return em.createQuery(
                            "SELECT a FROM Availability a " +
                                    "WHERE a.doctor.id = :doctorId " +
                                    "ORDER BY a.jour, a.heureDebut",
                            Availability.class)
                    .setParameter("doctorId", doctorId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public Availability save(Availability availability) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            if (availability.getId() == null) {
                em.persist(availability);               // INSERT
            } else {
                availability = em.merge(availability);  // UPDATE
            }
            em.getTransaction().commit();
            return availability;
        } catch (RuntimeException e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }
}