package com.clinicmanag.clinic.model;

import com.clinicmanag.clinic.model.enums.GroupeSanguin;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "patients")
public class Patient extends User {

    @Column(nullable = false, unique = true)
    private String cin;

    @Enumerated(EnumType.STRING)
    @Column(name = "groupe_sanguin")
    private GroupeSanguin groupeSanguin;

    @OneToMany(mappedBy = "patient")
    private List<Appointment> appointments = new ArrayList<>();

    // ===== Constructeurs =====

    public Patient() {
    }

    public Patient(String nom, String email, String motDePasseHash, String cin) {
        super(nom, email, motDePasseHash);
        this.cin = cin;
    }

    // ===== Getters / Setters =====

    public String getCin() {
        return cin;
    }
    public void setCin(String cin) {
        this.cin = cin;
    }

    public GroupeSanguin getGroupeSanguin() {
        return groupeSanguin;
    }
    public void setGroupeSanguin(GroupeSanguin groupeSanguin) {
        this.groupeSanguin = groupeSanguin;
    }

    public List<Appointment> getAppointments() { return appointments; }
    public void setAppointments(List<Appointment> appointments) { this.appointments = appointments; }
}