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

    public String getLastStatus(Integer idDemande) {
        List<DemandeStatus> list = demandeStatusRepo.findByDemandeOrderByIdDesc(idDemande);
        if (list.isEmpty())
            return "Aucun status";
        return list.get(0).getStatus().getLibelle();
    }

    public DemandeStatus getLastDemandeStatus(Integer idDemande) {
        List<DemandeStatus> list = demandeStatusRepo
                .findByDemandeOrderByIdDesc(idDemande);

        if (list.isEmpty())
            return null;

        return list.get(0);
    }

    // public List<Demande> getAllWithStatus() {
    // List<Demande> demandes = repo.findAll();

    // for (Demande d : demandes) {
    // DemandeStatus ds = getLastDemandeStatus(d.getId());

    // if (ds != null) {
    // d.setLastStatus(ds.getStatus().getLibelle());
    // if (ds.getObservation() == null || ds.getObservation().trim().isEmpty()) {
    // d.setLastObservation("Pas d'observation");

    // } else {
    // d.setLastObservation(ds.getObservation());
    // }

    // } else {
    // d.setLastStatus("Aucun status");
    // d.setLastObservation("Pas d'observation");
    // }
    // }

    // return demandes;
    // }

    public List<Demande> getAllWithStatus() {
        List<Demande> demandes = repo.findAll();

        for (Demande d : demandes) {
            DemandeStatus ds = getLastDemandeStatus(d.getId());

            if (ds != null) {
                d.setLastStatus(ds.getStatus().getLibelle());
                d.setLastObservation(ds.getObservation());

                // ✅ AJOUT ICI
                d.setLastDateStatus(ds.getDateStatus());

            } else {
                d.setLastStatus("Aucun status");
                d.setLastObservation("Pas d'observation");
                d.setLastDateStatus(null);
            }
        }

        return demandes;
    }

    public List<Demande> getDemandesByClient(Integer idClient) {
        List<Demande> demandes = repo.findByClientId(idClient);

        for (Demande d : demandes) {
            List<DemandeStatus> statuts = demandeStatusRepo
                    .findByDemandeOrderByIdDesc(d.getId());

            d.setStatuts(statuts);
        }

        return demandes;
    }

    public List<Demande> getByStatus(String status) {
        return repo.findByStatus(status);
    }

}