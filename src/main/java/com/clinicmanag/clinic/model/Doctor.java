package com.clinicmanag.clinic.model;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "doctors")
public class Doctor extends User {

    @Column(nullable = false, unique = true)
    private String matricule;

    @Column(nullable = false)
    private String titre;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "specialty_id")
    private Specialty specialty;

    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Availability> availabilities = new ArrayList<>();

    @OneToMany(mappedBy = "doctor", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<DoctorAbsence> absences = new ArrayList<>();

    @OneToMany(mappedBy = "doctor")
    private List<Appointment> appointments = new ArrayList<>();

    public Doctor() {
    }

    public Doctor(String nom, String email, String motDePasseHash,
                  String matricule, String titre) {
        super(nom, email, motDePasseHash);
        this.matricule = matricule;
        this.titre = titre;
    }


    public String getMatricule() { return matricule; }
    public void setMatricule(String matricule) { this.matricule = matricule; }


    public String getTitre() { return titre; }
    public void setTitre(String titre) { this.titre = titre; }


    public Specialty getSpecialty() { return specialty; }
    public void setSpecialty(Specialty specialty) { this.specialty = specialty; }


    public List<Availability> getAvailabilities() {
        return availabilities;
    }
    public void setAvailabilities(List<Availability> availabilities) {
        this.availabilities = availabilities;
    }


    public List<DoctorAbsence> getAbsences() {
        return absences;
    }
    public void setAbsences(List<DoctorAbsence> absences) {
        this.absences = absences;
    }

    public List<Appointment> getAppointments() { return appointments; }
    public void setAppointments(List<Appointment> appointments) { this.appointments = appointments; }
}