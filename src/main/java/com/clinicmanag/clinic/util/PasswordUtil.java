package com.clinicmanag.clinic.util;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Utilitaire pour hasher et vérifier les mots de passe.
 * Utilise BCrypt (standard OWASP).
 *
 * IMPORTANT : ne jamais stocker de mot de passe en clair.
 */

public final class PasswordUtil {


    private static final int ROUNDS = 12;

    private PasswordUtil() {

    }


    public static String hash(String motDePasseEnClair) {
        if (motDePasseEnClair == null || motDePasseEnClair.isBlank()) {
            throw new IllegalArgumentException("Mot de passe vide");
        }
        return BCrypt.hashpw(motDePasseEnClair, BCrypt.gensalt(ROUNDS));
    }


    public static boolean check(String motDePasseEnClair, String hash) {
        if (motDePasseEnClair == null || hash == null) {
            return false;
        }
        try {
            return BCrypt.checkpw(motDePasseEnClair, hash);
        } catch (IllegalArgumentException e) {

            return false;
        }
    }
}