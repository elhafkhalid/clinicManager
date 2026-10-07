package com.clinicmanag.clinic.exception;

/**
 * Levée quand une entité n'existe pas en base.
 * Ex : "Patient introuvable : id=5"
 */
public class NotFoundException extends BusinessException {

    public NotFoundException(String message) {
        super(message);
    }
}