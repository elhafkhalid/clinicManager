package com.clinicmanag.clinic.repository.impl;

import com.clinicmanag.clinic.model.Availability;
import com.clinicmanag.clinic.repository.AvailabilityRepository;
import com.clinicmanag.clinic.util.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

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
    public void save(Availability availability) {
        EntityManager em = JpaUtil.getEntityManager();

        try {
            em.getTransaction().begin();

            if (availability.getId() == null) {
                em.persist(availability);               // INSERT
            } else {
                 em.merge(availability);  // UPDATE
            }

            em.getTransaction().commit();

        } catch (RuntimeException e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Availability> findById(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            List<Availability> result = em.createQuery(
                            "SELECT a FROM Availability a " +
                                    "JOIN FETCH a.doctor " +
                                    "WHERE a.id = :id",
                            Availability.class)
                    .setParameter("id", id)
                    .getResultList();

            return result.isEmpty()
                    ? Optional.empty()
                    : Optional.of(result.get(0));

        } finally {
            em.close();
        }
    }
}