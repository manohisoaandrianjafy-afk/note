package com.example.restservice.service;

import com.example.restservice.entity.*;
import com.example.restservice.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
public class DevisService {

    private final DevisRepository devisRepo;
    private final DemandeRepository demandeRepo;
    private final TypeDevisRepository typeDevisRepo;
    private final StatusRepository statusRepo;
    private final DemandeStatusRepository dsRepo;

    public DevisService(DevisRepository devisRepo,
            DemandeRepository demandeRepo,
            TypeDevisRepository typeDevisRepo,
            StatusRepository statusRepo,
            DemandeStatusRepository dsRepo) {
        this.devisRepo = devisRepo;
        this.demandeRepo = demandeRepo;
        this.typeDevisRepo = typeDevisRepo;
        this.statusRepo = statusRepo;
        this.dsRepo = dsRepo;
    }

    @Transactional
    public Devis creerDevis(DevisDTO dto) {

        Demande demande = demandeRepo.findById(dto.getDemandeId().intValue())
                .orElseThrow(() -> new RuntimeException("Demande introuvable"));

        TypeDevis typeDevis = typeDevisRepo.findById(dto.getTypeDevisId().intValue())
                .orElseThrow(() -> new RuntimeException("Type devis introuvable"));

        Devis devis = new Devis();
        devis.setDemande(demande);
        devis.setTypeDevis(typeDevis);

        double total = 0;
        List<DetailsDevis> detailsList = new ArrayList<>();

        for (DevisDTO.DetailDTO d : dto.getDetails()) {
            DetailsDevis detail = new DetailsDevis();
            detail.setLibelle(d.getLibelle());
            detail.setPrix(d.getPrix().doubleValue());
            detail.setQuantite(d.getQuantite().doubleValue());
            detail.setDevis(devis);

            total += detail.getPrix() * detail.getQuantite();
            detailsList.add(detail);
        }

        devis.setMontantTotal(total);
        devis.setDetails(detailsList);
        devisRepo.save(devis);
        // Status status = statusRepo.findByLibelle("Devis Cree");
        String libelleStatus;

        if (typeDevis.getLibelle().equalsIgnoreCase("Etude")) {
            libelleStatus = "Devis Etude Cree";
        } else if (typeDevis.getLibelle().equalsIgnoreCase("Forage")) {
            libelleStatus = "Devis Forage Cree";
        } else {
            throw new RuntimeException("Type de devis inconnu");
        }

        Status status = statusRepo.findByLibelle(libelleStatus);

        DemandeStatus ds = new DemandeStatus();
        ds.setDemande(demande);
        ds.setStatus(status);

        dsRepo.save(ds);

        return devis;
    }

    public List<Devis> getAll() {
        return devisRepo.findAllWithDetails();
    }

    public double chiffreAffaire() {
        return devisRepo.getChiffreAffaire();
    }

    public Devis getById(int id) {
        return devisRepo.findByIdWithDetails(id);
    }
}