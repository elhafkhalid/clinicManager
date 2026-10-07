package com.clinicmanag.clinic.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtil {
   private static final EntityManagerFactory EMF;


   static {
       try{
           EMF = Persistence.createEntityManagerFactory("clinicPU");

       }catch(Throwable ex){
           System.err.println("Échec création EntityManagerFactory : " + ex);
           throw new ExceptionInInitializerError(ex);
       }
   }


   public static EntityManager getEntityManager(){
       return EMF.createEntityManager();
   }


   public static void close(){
       if(EMF != null && EMF.isOpen()){
           EMF.close();
       }
   }
}