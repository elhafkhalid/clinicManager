package com.clinicmanag.clinic.service;

import com.clinicmanag.clinic.dto.LoginDTO;
import com.clinicmanag.clinic.dto.RegisterDTO;
import com.clinicmanag.clinic.exception.ConflictException;
import com.clinicmanag.clinic.exception.NotFoundException;
import com.clinicmanag.clinic.exception.UnauthorizedActionException;
import com.clinicmanag.clinic.model.Patient;
import com.clinicmanag.clinic.model.User;
import com.clinicmanag.clinic.repository.UserRepository;
import com.clinicmanag.clinic.repository.impl.UserRepositoryImpl;
import com.clinicmanag.clinic.util.PasswordUtil;

public class AuthService {

    private final UserRepository userRepository;


    public AuthService() {
        this(new UserRepositoryImpl());
    }


    public AuthService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    public User register(RegisterDTO dto) {

        if (dto.getEmail() == null || dto.getEmail().isBlank()) {
            throw new ConflictException("Email obligatoire");
        }
        if (dto.getMotDePasse() == null || dto.getMotDePasse().length() < 6) {
            throw new ConflictException("Mot de passe : 6 caractères minimum");
        }


        if (userRepository.existsByEmail(dto.getEmail())) {
            throw new ConflictException("Email déjà utilisé");
        }


        Patient patient = new Patient();

        patient.setNom(dto.getNom());
        patient.setEmail(dto.getEmail());
        patient.setMotDePasseHash(PasswordUtil.hash(dto.getMotDePasse()));
        patient.setCin(dto.getCin());
        patient.setEnabled(true);


        return userRepository.save(patient);
    }


    public User login(LoginDTO dto) {


        User user = userRepository.findByEmail(dto.getEmail())
                .orElseThrow(() -> new NotFoundException("Email ou mot de passe incorrect"));


        if (!user.isEnabled()) {
            throw new UnauthorizedActionException("Compte désactivé");
        }


        if (!PasswordUtil.check(dto.getMotDePasse(), user.getMotDePasseHash())) {
            throw new NotFoundException("Email ou mot de passe incorrect");
        }

        return user;
    }
}