package com.clinicmanag.clinic.util;

import com.clinicmanag.clinic.model.Admin;
import com.clinicmanag.clinic.repository.UserRepository;
import com.clinicmanag.clinic.repository.impl.UserRepositoryImpl;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class DataInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        UserRepository userRepository = new UserRepositoryImpl();

        String adminEmail = "admin@clinic.com";

        if (!userRepository.existsByEmail(adminEmail)) {
            Admin admin = new Admin();
            admin.setNom("Administrateur");
            admin.setEmail(adminEmail);
            admin.setMotDePasseHash(PasswordUtil.hash("admin123"));
            admin.setEnabled(true);

            userRepository.save(admin);
            System.out.println(">>> Admin par défaut créé : " + adminEmail + " / admin123");
        } else {
            System.out.println(">>> Admin déjà existant");
        }
    }
}