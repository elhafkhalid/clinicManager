package com.clinicmanag.clinic.dto;

/**
 * Données d'inscription d'un nouveau patient.
 * Le mot de passe est en clair ICI — il sera hashé par AuthService.
 */
public class RegisterDTO {

    private String nom;
    private String email;
    private String motDePasse;
    private String cin;

    public RegisterDTO() {
    }

    public RegisterDTO(String nom, String email, String motDePasse, String cin) {
        this.nom = nom;
        this.email = email;
        this.motDePasse = motDePasse;
        this.cin = cin;
    }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMotDePasse() { return motDePasse; }
    public void setMotDePasse(String motDePasse) { this.motDePasse = motDePasse; }

    public String getCin() { return cin; }
    public void setCin(String cin) { this.cin = cin; }
}