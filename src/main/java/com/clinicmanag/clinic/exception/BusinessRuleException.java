package com.clinicmanag.clinic.exception;

/**
 * Levée quand une règle métier est violée.
 * Ex : note sur un RDV non terminé, durée invalide...
 */
public class BusinessRuleException extends BusinessException {

    public BusinessRuleException(String message) {
        super(message);
    }
}