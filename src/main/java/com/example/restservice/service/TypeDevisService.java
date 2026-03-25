package com.example.restservice.service;

import com.example.restservice.entity.TypeDevis;
import com.example.restservice.repository.TypeDevisRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeDevisService {

    @Autowired
    private TypeDevisRepository repo;

    public List<TypeDevis> getAll() {
        return repo.findAll();
    }
}