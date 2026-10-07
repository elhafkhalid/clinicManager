package com.clinicmanag.clinic.service;

import com.clinicmanag.clinic.exception.ConflictException;
import com.clinicmanag.clinic.exception.NotFoundException;
import com.clinicmanag.clinic.model.Department;
import com.clinicmanag.clinic.repository.DepartmentRepository;
import com.clinicmanag.clinic.repository.impl.DepartmentRepositoryImpl;

import java.util.List;
import java.util.Locale;

public class DepartmentService {
    private final DepartmentRepository departmentRepository;

    public DepartmentService() {
        this(new DepartmentRepositoryImpl());
    }

    public DepartmentService(DepartmentRepository departmentRepository) {
        this.departmentRepository = departmentRepository;
    }

    public List<Department> findAll(){
        return departmentRepository.findAll();
    }

    public Department findById(Long id){
        return departmentRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Département introuvable : id=" + id));
    }

    public void create(String name){

        if(name == null || name.isBlank()){
            throw new ConflictException("Le nom du département est obligatoire");
        }

        name = name.trim();

        if(departmentRepository.existByName(name))
            throw new ConflictException("Un département avec ce nom existe déjà");

        Department department = new Department(name);

        departmentRepository.save(department);

    }

    public void update(Long id,String newName){

        if(id == null)
            throw new ConflictException("L'id du département est obligatoire");
        if(newName == null || newName.isBlank())
            throw new ConflictException("Le nom du département est obligatoire");

        newName = newName.trim();

        if(departmentRepository.existsByNameAndIdNot(newName,id))
            throw new ConflictException("Un autre département porte déjà ce nom");


        Department existing = findById(id);
        existing.setName(newName);

        departmentRepository.save(existing);
    }
}