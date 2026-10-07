package com.clinicmanag.clinic.exception;

/**
 * Classe mère de toutes les exceptions métier.
 * Permet de catcher TOUTES les erreurs métier en un seul catch.
 */
public class BusinessException extends RuntimeException {

    public BusinessException(String message) {
        super(message);
    }

    public BusinessException(String message, Throwable cause) {
        super(message, cause);
    }
}