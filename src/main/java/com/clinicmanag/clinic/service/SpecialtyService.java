package com.clinicmanag.clinic.service;

import com.clinicmanag.clinic.exception.ConflictException;
import com.clinicmanag.clinic.exception.NotFoundException;
import com.clinicmanag.clinic.model.Department;
import com.clinicmanag.clinic.model.Specialty;
import com.clinicmanag.clinic.repository.SpecialtyRepository;
import com.clinicmanag.clinic.repository.impl.SpecialtyRepositoryImpl;

import java.util.List;

public class SpecialtyService {

    private final SpecialtyRepository specialtyRepository;
    private final DepartmentService departmentService;

    public SpecialtyService() {

        this(new SpecialtyRepositoryImpl(), new DepartmentService());
    }

    public SpecialtyService(SpecialtyRepository specialtyRepository,
                            DepartmentService departmentService) {
        this.specialtyRepository = specialtyRepository;
        this.departmentService = departmentService;
    }

    public List<Specialty> findAll() {
        return specialtyRepository.findAll();
    }

    public Specialty findById(Long id) {
        return specialtyRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Spécialité introuvable : id=" + id));
    }

    public void create(String name, Long departmentId) {

        if (name == null || name.isBlank()) {
            throw new ConflictException("Le nom de la spécialité est obligatoire");
        }
        name = name.trim();

        if (departmentId == null) {
            throw new ConflictException("Le département est obligatoire");
        }

        if (specialtyRepository.existsByName(name)) {
            throw new ConflictException("Une spécialité avec ce nom existe déjà");
        }

        Department department = departmentService.findById(departmentId);

        Specialty specialty = new Specialty();
        specialty.setName(name);
        specialty.setDepartment(department);

        specialtyRepository.save(specialty);
    }

    public void update(Long id, String newName, Long newDepartmentId) {


        if (id == null) {
            throw new ConflictException("L'id de la spécialité est obligatoire");
        }

        if (newName == null || newName.isBlank()) {
            throw new ConflictException("Le nom de la spécialité est obligatoire");
        }
        newName = newName.trim();

        if (newDepartmentId == null) {
            throw new ConflictException("Le département est obligatoire");
        }

        Specialty existing = findById(id);

        if (specialtyRepository.existsByNameAndIdNot(newName, id)) {
            throw new ConflictException("Une autre spécialité porte déjà ce nom");
        }

        Department department = departmentService.findById(newDepartmentId);

        existing.setName(newName);
        existing.setDepartment(department);

        specialtyRepository.save(existing);
    }
}