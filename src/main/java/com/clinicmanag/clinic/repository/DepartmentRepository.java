package com.clinicmanag.clinic.repository;

import com.clinicmanag.clinic.model.Department;

import java.util.List;
import java.util.Optional;

public interface DepartmentRepository {
    List<Department> findAll();
    Optional<Department> findById(Long id);
    void save(Department department);
    boolean existByName(String name);
    boolean existsByNameAndIdNot(String name, Long id);
}