package com.example.restservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import com.example.restservice.entity.Demande;
import com.example.restservice.repository.DemandeRepository;

@Service
public class DemandeService {

    @Autowired
    private DemandeRepository repo;

    public List<Demande> getAll() {
        return repo.findAll();
    }

    public Demande getById(Integer id) {
        return repo.findById(id).orElse(null);
    }

    public void save(Demande demande) {
        repo.save(demande);
    }

    public void delete(Integer id) {
        repo.deleteById(id);
    }
}