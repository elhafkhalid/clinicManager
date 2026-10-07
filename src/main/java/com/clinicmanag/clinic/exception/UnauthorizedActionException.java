package com.clinicmanag.clinic.exception;

/**
 * Levée quand un utilisateur tente une action interdite.
 * Ex : modifier une note validée, annuler un RDV < 12h avant.
 */
public class UnauthorizedActionException extends BusinessException {

    public UnauthorizedActionException(String message) {
        super(message);
    }
}