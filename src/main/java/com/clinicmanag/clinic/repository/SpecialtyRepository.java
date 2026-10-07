package com.clinicmanag.clinic.repository;

import com.clinicmanag.clinic.model.Specialty;

import java.util.List;
import java.util.Optional;

public interface SpecialtyRepository {

    List<Specialty> findAll();

    Optional<Specialty> findById(Long id);

    void save(Specialty specialty);

    boolean existsByName(String name);

    boolean existsByNameAndIdNot(String name, Long id);
}