package com.clinicmanag.clinic.service;

import com.clinicmanag.clinic.exception.ConflictException;
import com.clinicmanag.clinic.exception.NotFoundException;
import com.clinicmanag.clinic.model.Doctor;
import com.clinicmanag.clinic.model.Specialty;
import com.clinicmanag.clinic.repository.DoctorRepository;
import com.clinicmanag.clinic.repository.impl.DoctorRepositoryImpl;
import com.clinicmanag.clinic.util.PasswordUtil;

import java.util.List;

public class DoctorService {
    private final DoctorRepository doctorRepository;
    private final SpecialtyService specialtyService;


    public DoctorService() {
        this(new DoctorRepositoryImpl(), new SpecialtyService());
    }


    public DoctorService(DoctorRepository doctorRepository,
                         SpecialtyService specialtyService) {
        this.doctorRepository = doctorRepository;
        this.specialtyService = specialtyService;
    }

    public List<Doctor> findAll(){
        return doctorRepository.findAll();
    }

    public Doctor findById(Long id){
        return doctorRepository.findById(id).orElseThrow(
                () -> new NotFoundException("Médecin introuvable"));
    }


    public Doctor create(String nom, String email, String motDePasse,
                         String matricule, String titre, Long specialtyId) {


        if (nom == null || nom.isBlank()) {
            throw new ConflictException("Le nom est obligatoire");
        }
        if (email == null || email.isBlank()) {
            throw new ConflictException("L'email est obligatoire");
        }
        if (motDePasse == null || motDePasse.length() < 6) {
            throw new ConflictException("Le mot de passe doit contenir au moins 6 caractères");
        }
        if (matricule == null || matricule.isBlank()) {
            throw new ConflictException("Le matricule est obligatoire");
        }
        if (titre == null || titre.isBlank()) {
            throw new ConflictException("Le titre est obligatoire");
        }
        if (specialtyId == null) {
            throw new ConflictException("La spécialité est obligatoire");
        }

        nom = nom.trim();
        email = email.trim().toLowerCase();
        matricule = matricule.trim();
        titre = titre.trim();

        if (doctorRepository.existsByEmail(email)) {
            throw new ConflictException("Cet email est déjà utilisé");
        }

        if (doctorRepository.existsByMatricule(matricule)) {
            throw new ConflictException("Ce matricule est déjà attribué");
        }

        Specialty specialty = specialtyService.findById(specialtyId);

        Doctor doctor = new Doctor();

        doctor.setNom(nom);
        doctor.setEmail(email);
        doctor.setMotDePasseHash(PasswordUtil.hash(motDePasse));
        doctor.setEnabled(true);
        doctor.setMatricule(matricule);
        doctor.setTitre(titre);
        doctor.setSpecialty(specialty);

        return doctorRepository.save(doctor);
    }


    public Doctor update(Long id, String nom, String email, String motDePasse,
                         String matricule, String titre, Long specialtyId) {


        if (id == null) {
            throw new ConflictException("L'id du médecin est obligatoire");
        }


        if (nom == null || nom.isBlank()) {
            throw new ConflictException("Le nom est obligatoire");
        }
        if (email == null || email.isBlank()) {
            throw new ConflictException("L'email est obligatoire");
        }
        if (matricule == null || matricule.isBlank()) {
            throw new ConflictException("Le matricule est obligatoire");
        }
        if (titre == null || titre.isBlank()) {
            throw new ConflictException("Le titre est obligatoire");
        }
        if (specialtyId == null) {
            throw new ConflictException("La spécialité est obligatoire");
        }

        nom = nom.trim();
        email = email.trim().toLowerCase();
        matricule = matricule.trim();
        titre = titre.trim();

        Doctor existing = findById(id);

        if (doctorRepository.existsByEmailAndIdNot(email, id)) {
            throw new ConflictException("Cet email est déjà utilisé par un autre compte");
        }

        if (doctorRepository.existsByMatriculeAndIdNot(matricule, id)) {
            throw new ConflictException("Ce matricule est déjà attribué à un autre médecin");
        }

        Specialty specialty = specialtyService.findById(specialtyId);

        existing.setNom(nom);
        existing.setEmail(email);
        existing.setMatricule(matricule);
        existing.setTitre(titre);
        existing.setSpecialty(specialty);


        if (motDePasse != null && !motDePasse.isBlank()) {
            if (motDePasse.length() < 6) {
                throw new ConflictException("Le mot de passe doit contenir au moins 6 caractères");
            }
            existing.setMotDePasseHash(PasswordUtil.hash(motDePasse));
        }

        return doctorRepository.save(existing);
    }

    public Doctor desactiver(Long id) {
        if (id == null) {
            throw new ConflictException("L'id du médecin est obligatoire");
        }

        Doctor existing = findById(id);

        if (!existing.isEnabled()) {
            throw new ConflictException("Ce médecin est déjà désactivé");
        }

        existing.setEnabled(false);
        return doctorRepository.save(existing);
    }

}