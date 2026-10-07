package com.clinicmanag.clinic.repository;

import com.clinicmanag.clinic.model.User;

import java.util.List;
import java.util.Optional;

/**
 * Contrat d'accès aux données pour User.
 * ⚠️ AUCUNE logique métier ici — uniquement du CRUD.
 */
public interface UserRepository {

    /**
     * Sauvegarde (création ou mise à jour).
     */
    User save(User user);

    /**
     * Cherche un user par son id.
     */
    Optional<User> findById(Long id);

    /**
     * Cherche un user par son email (unique).
     */
    Optional<User> findByEmail(String email);

    /**
     * Tous les users.
     */
    List<User> findAll();

    /**
     * Supprime un user.
     */
    void delete(User user);

    /**
     * Vérifie si un email existe déjà.
     */
    boolean existsByEmail(String email);
}