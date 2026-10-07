package com.clinicmanag.clinic.repository.impl;

import com.clinicmanag.clinic.model.Specialty;
import com.clinicmanag.clinic.repository.SpecialtyRepository;
import com.clinicmanag.clinic.util.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class SpecialtyRepositoryImpl implements SpecialtyRepository {

    @Override
    public List<Specialty> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            return em.createQuery(
                            "SELECT s FROM Specialty s " +
                                    "JOIN FETCH s.department " +
                                    "ORDER BY s.name",
                            Specialty.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Specialty> findById(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            Specialty spec = em.find(Specialty.class, id);
            return Optional.ofNullable(spec);
        } finally {
            em.close();
        }
    }

    @Override
    public void save(Specialty specialty) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            if (specialty.getId() == null) {
                em.persist(specialty);                  // INSERT
            } else {
                em.merge(specialty);        // UPDATE
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
    public boolean existsByName(String name) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            Long count = em.createQuery(
                            "SELECT COUNT(s) FROM Specialty s WHERE LOWER(s.name) = LOWER(:name)",
                            Long.class)
                    .setParameter("name", name)
                    .getSingleResult();
            return count > 0;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean existsByNameAndIdNot(String name, Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            Long count = em.createQuery(
                            "SELECT COUNT(s) FROM Specialty s " +
                                    "WHERE LOWER(s.name) = LOWER(:name) AND s.id <> :id",
                            Long.class)
                    .setParameter("name", name)
                    .setParameter("id", id)
                    .getSingleResult();
            return count > 0;
        } finally {
            em.close();
        }
    }
}