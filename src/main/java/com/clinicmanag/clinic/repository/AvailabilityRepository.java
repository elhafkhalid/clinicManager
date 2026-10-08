package com.clinicmanag.clinic.repository;

import com.clinicmanag.clinic.model.Availability;

import java.util.List;
import java.util.Optional;

public interface AvailabilityRepository {

    List<Availability> findByDoctorId(Long doctorId);

    void save(Availability availability);

    Optional<Availability> findById(Long id);
}