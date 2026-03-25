package com.example.restservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

import com.example.restservice.entity.Demande;
import com.example.restservice.entity.DemandeStatus;
import com.example.restservice.entity.Status;
import com.example.restservice.repository.DemandeRepository;
import com.example.restservice.repository.DemandeStatusRepository;
import com.example.restservice.repository.StatusRepository;

@Service
public class DemandeService {

    @Autowired
    private DemandeRepository repo;

    @Autowired
    private StatusRepository statusRepo;

    @Autowired
     private DemandeStatusRepository demandeStatusRepo;

    public List<Demande> getAll() {
        return repo.findAll();
    }

    public Demande getById(Integer id) {
        return repo.findById(id).orElse(null);
    }

    // public void save(Demande demande) {
    //     repo.save(demande);
    // }

    public void save(Demande demande) {
        Demande savedDemande = repo.save(demande);
        Status status = statusRepo.findByLibelle("Cree");
        DemandeStatus ds = new DemandeStatus();
        ds.setDemande(savedDemande);
        ds.setStatus(status);
        ds.setDateStatus(LocalDateTime.now());
        demandeStatusRepo.save(ds);
    }

    public void delete(Integer id) {
        repo.deleteById(id);
    }
}