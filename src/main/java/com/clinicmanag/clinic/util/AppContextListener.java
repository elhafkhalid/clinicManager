package com.clinicmanag.clinic.util;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println(">>> Initialisation JPA...");
        JpaUtil.getEntityManager().close();
        System.out.println(">>> JPA initialisé");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println(">>> Fermeture JPA...");
        JpaUtil.close();
    }
}