package com.clinicmanag.clinic.service;

import com.clinicmanag.clinic.model.Doctor;
import com.clinicmanag.clinic.model.Patient;
import com.clinicmanag.clinic.model.User;
import com.clinicmanag.clinic.repository.DepartmentRepository;
import com.clinicmanag.clinic.repository.UserRepository;
import com.clinicmanag.clinic.repository.impl.DepartmentRepositoryImpl;
import com.clinicmanag.clinic.repository.impl.UserRepositoryImpl;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class DashboardService {

    private final UserRepository userRepository;
    private final DepartmentRepository departmentRepository;

    public DashboardService() {
        this(new UserRepositoryImpl(), new DepartmentRepositoryImpl());
    }

    public DashboardService(UserRepository userRepository,
                            DepartmentRepository departmentRepository) {
        this.userRepository = userRepository;
        this.departmentRepository = departmentRepository;
    }

    // ================================================================
    //  STATS
    // ================================================================

    public long countPatients() {
        return userRepository.findAll().stream()
                .filter(u -> u instanceof Patient)
                .count();
    }

    public long countDoctors() {
        return userRepository.findAll().stream()
                .filter(u -> u instanceof Doctor)
                .count();
    }

    public long countDepartments() {
        return departmentRepository.findAll().size();
    }

    /**
     * Pour l'instant : 0 (Appointment pas encore créé).
     */
    public long countAppointmentsToday() {
        return 0;
    }

    // ================================================================
    //  DERNIERS UTILISATEURS
    // ================================================================

    public List<User> findLatestUsers(int limit) {
        return userRepository.findAll().stream()
                .sorted(Comparator.comparing(User::getId).reversed())
                .limit(limit)
                .collect(Collectors.toList());
    }
}