package com.clinicmanag.clinic.repository;

import com.clinicmanag.clinic.model.Availability;

import java.util.List;

public interface AvailabilityRepository {

    List<Availability> findByDoctorId(Long doctorId);

    Availability save(Availability availability);
}