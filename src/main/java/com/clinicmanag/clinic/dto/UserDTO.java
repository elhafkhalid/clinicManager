package com.clinicmanag.clinic.dto;

/**
 * Version "safe" d'un User pour les vues.
 * ⚠️ NE CONTIENT JAMAIS motDePasseHash.
 */
public class UserDTO {

    private Long id;
    private String nom;
    private String email;
    private boolean enabled;
    private String role;      // "Patient", "Doctor", "Admin", "Staff"

    public UserDTO() {
    }

    public UserDTO(Long id, String nom, String email, boolean enabled, String role) {
        this.id = id;
        this.nom = nom;
        this.email = email;
        this.enabled = enabled;
        this.role = role;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public boolean isEnabled() { return enabled; }
    public void setEnabled(boolean enabled) { this.enabled = enabled; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}