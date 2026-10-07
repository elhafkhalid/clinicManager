package com.clinicmanag.clinic.model;

import com.clinicmanag.clinic.model.enums.StatutAppointment;
import com.clinicmanag.clinic.model.enums.TypeAppointment;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "appointments")
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "date_heure", nullable = false)
    private LocalDateTime dateHeure;

    @Column(name = "duree_minutes", nullable = false)
    private int dureeMinutes;

    @Column(nullable = false)
    private String motif;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private TypeAppointment type;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private StatutAppointment statut;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "patient_id", nullable = false)
    private Patient patient;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "doctor_id", nullable = false)
    private Doctor doctor;

    @OneToOne(mappedBy = "appointment", cascade = CascadeType.ALL, orphanRemoval = true)
    private MedicalNote medicalNote;

    // ===== Constructeurs =====

    public Appointment() {
    }

    public Appointment(LocalDateTime dateHeure, int dureeMinutes, String motif,
                       TypeAppointment type, StatutAppointment statut,
                       Patient patient, Doctor doctor) {
        this.dateHeure = dateHeure;
        this.dureeMinutes = dureeMinutes;
        this.motif = motif;
        this.type = type;
        this.statut = statut;
        this.patient = patient;
        this.doctor = doctor;
    }

    // ===== Getters / Setters =====

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public LocalDateTime getDateHeure() { return dateHeure; }
    public void setDateHeure(LocalDateTime dateHeure) { this.dateHeure = dateHeure; }

    public int getDureeMinutes() { return dureeMinutes; }
    public void setDureeMinutes(int dureeMinutes) { this.dureeMinutes = dureeMinutes; }

    public String getMotif() { return motif; }
    public void setMotif(String motif) { this.motif = motif; }

    public TypeAppointment getType() { return type; }
    public void setType(TypeAppointment type) { this.type = type; }

    public StatutAppointment getStatut() { return statut; }
    public void setStatut(StatutAppointment statut) { this.statut = statut; }

    public Patient getPatient() { return patient; }
    public void setPatient(Patient patient) { this.patient = patient; }

    public Doctor getDoctor() { return doctor; }
    public void setDoctor(Doctor doctor) { this.doctor = doctor; }

    public MedicalNote getMedicalNote() { return medicalNote; }
    public void setMedicalNote(MedicalNote medicalNote) { this.medicalNote = medicalNote; }
}