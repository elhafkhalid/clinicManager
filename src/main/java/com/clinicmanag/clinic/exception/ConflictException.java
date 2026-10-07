package com.clinicmanag.clinic.exception;

/**
 * Levée quand une ressource entre en conflit.
 * Ex : email déjà utilisé, créneau déjà réservé, matricule déjà pris.
 */
public class ConflictException extends BusinessException {

    public ConflictException(String message) {
        super(message);
    }
}