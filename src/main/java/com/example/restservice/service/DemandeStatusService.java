package com.example.restservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.restservice.entity.Demande;
import com.example.restservice.entity.DemandeStatus;
import com.example.restservice.entity.Status;
import com.example.restservice.repository.DemandeRepository;
import com.example.restservice.repository.DemandeStatusRepository;
import com.example.restservice.repository.StatusRepository;

@Service
public class DemandeStatusService {
     @Autowired
    private DemandeRepository  demandeRepo;

    @Autowired
    private StatusRepository statusRepo;

    @Autowired
    private DemandeStatusRepository demandeStatusRepo;
    
    public void addStatus(Integer idDemande, Integer idStatus, String observation) {

    Demande demande = demandeRepo.findById(idDemande).orElse(null);
    Status status = statusRepo.findById(idStatus).orElse(null);

    DemandeStatus ds = new DemandeStatus();
    ds.setDemande(demande);
    ds.setStatus(status);
    ds.setObservation(observation);


    demandeStatusRepo.save(ds);
}
}
