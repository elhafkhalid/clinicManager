package com.clinicmanag.clinic.repository.impl;

import com.clinicmanag.clinic.model.Department;
import com.clinicmanag.clinic.repository.DepartmentRepository;
import com.clinicmanag.clinic.util.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class DepartmentRepositoryImpl implements DepartmentRepository {

    @Override
    public List<Department> findAll(){
        EntityManager em = JpaUtil.getEntityManager();
        try{
            return em.createQuery("SELECT d FROM Department d ORDER BY d.name",
                            Department.class)
                    .getResultList();
        }finally {
            em.close();
        }
    }

    @Override
    public Optional<Department> findById(Long id){
        EntityManager em = JpaUtil.getEntityManager();
        try{
            Department dep = em.find(Department.class,id);
            return Optional.ofNullable(dep);
        }finally {
            em.close();
        }
    }

    @Override
    public void save(Department department){
        EntityManager em = JpaUtil.getEntityManager();

        try{
            em.getTransaction().begin();
            if(department.getId() == null){
                em.persist(department);
            }else {
                 em.merge(department);
            }
            em.getTransaction().commit();

        }catch( RuntimeException e) {
            if(em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw e;
        }finally {
            em.close();
        }
    }


    @Override
    public boolean existByName(String name){
        EntityManager em = JpaUtil.getEntityManager();
        try{
            Long count = em.createQuery(
                    "SELECT COUNT(d) FROM Department d WHERE LOWER(d.name) = LOWER(:name)",Long.class
            ).setParameter("name",name)
                    .getSingleResult();

            return count > 0;
        }finally {
            em.close();
        }
    }

   @Override
    public boolean existsByNameAndIdNot(String name,Long id){
        EntityManager em = JpaUtil.getEntityManager();

        try{
            Long count = em.createQuery(
                    "SELECT COUNT(d) from Department d " +
                            "WHERE LOWER(d.name) = LOWER(:name) AND d.id <> :id ", Long.class)
                    .setParameter("name",name)
                    .setParameter("id",id)
                    .getSingleResult();

            return count >0;

        }finally {
            em.close();
        }
    }
}