package com.clinicmanag.clinic.repository;

import com.clinicmanag.clinic.model.Doctor;

import java.util.List;
import java.util.Optional;

public interface DoctorRepository {

    List<Doctor> findAll();

    Optional<Doctor> findById(Long id);

    Doctor save(Doctor doctor);

    boolean existsByEmail(String email);

    boolean existsByEmailAndIdNot(String email, Long id);

    boolean existsByMatricule(String matricule);

    boolean existsByMatriculeAndIdNot(String matricule, Long id);

}