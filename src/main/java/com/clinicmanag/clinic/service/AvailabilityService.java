package com.clinicmanag.clinic.service;

import com.clinicmanag.clinic.exception.ConflictException;
import com.clinicmanag.clinic.model.Availability;
import com.clinicmanag.clinic.model.Doctor;
import com.clinicmanag.clinic.repository.AvailabilityRepository;
import com.clinicmanag.clinic.repository.impl.AvailabilityRepositoryImpl;

import java.time.DayOfWeek;
import java.time.LocalTime;
import java.util.List;

public class AvailabilityService {

    private final AvailabilityRepository availabilityRepository;
    private final DoctorService doctorService;

    public AvailabilityService() {
        this(new AvailabilityRepositoryImpl(), new DoctorService());
    }


    public AvailabilityService(AvailabilityRepository availabilityRepository,
                               DoctorService doctorService) {
        this.availabilityRepository = availabilityRepository;
        this.doctorService = doctorService;
    }

    public List<Availability> findByDoctor(Long doctorId) {
        if (doctorId == null) {
            throw new IllegalArgumentException("L'id du doctor est obligatoire");
        }
        return availabilityRepository.findByDoctorId(doctorId);
    }


    public Availability create(Long doctorId, String jourStr,
                               String heureDebutStr, String heureFinStr) {


        if (doctorId == null) {
            throw new ConflictException("Doctor obligatoire");
        }
        if (jourStr == null || jourStr.isBlank()
                || heureDebutStr == null || heureDebutStr.isBlank()
                || heureFinStr == null || heureFinStr.isBlank()) {
            throw new ConflictException("Tous les champs sont obligatoires");
        }


        DayOfWeek jour;
        try {
            jour = DayOfWeek.valueOf(jourStr.toUpperCase());
        } catch (IllegalArgumentException e) {
            throw new ConflictException("Jour invalide : " + jourStr);
        }

        LocalTime heureDebut;
        LocalTime heureFin;
        try {
            heureDebut = LocalTime.parse(heureDebutStr);
            heureFin = LocalTime.parse(heureFinStr);
        } catch (Exception e) {
            throw new ConflictException("Format d'heure invalide");
        }

        if (!heureDebut.isBefore(heureFin)) {
            throw new ConflictException("L'heure de début doit être avant l'heure de fin");
        }

        Doctor doctor = doctorService.findById(doctorId);

        List<Availability> existantes = availabilityRepository.findByDoctorId(doctorId);
        for (Availability a : existantes) {
            if (a.getJour() == jour
                    && chevauche(heureDebut, heureFin,
                    a.getHeureDebut(), a.getHeureFin())) {
                throw new ConflictException(
                        "Ce créneau chevauche une disponibilité existante");
            }
        }

        Availability availability = new Availability();
        availability.setJour(jour);
        availability.setHeureDebut(heureDebut);
        availability.setHeureFin(heureFin);
        availability.setDoctor(doctor);

        return availabilityRepository.save(availability);
    }

    private boolean chevauche(LocalTime d1, LocalTime f1,
                              LocalTime d2, LocalTime f2) {
        return d1.isBefore(f2) && d2.isBefore(f1);
    }

}