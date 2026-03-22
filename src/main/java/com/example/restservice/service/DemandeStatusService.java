package com.example.restservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import com.example.restservice.entity.DemandeStatus;
import com.example.restservice.repository.DemandeStatusRepository;

@Service
public class DemandeStatusService {

    @Autowired
    private DemandeStatusRepository repo;

    public void save(DemandeStatus ds) {
        repo.save(ds);
    }

    public List<DemandeStatus> getAll() {
        return repo.findAll();
    }
}