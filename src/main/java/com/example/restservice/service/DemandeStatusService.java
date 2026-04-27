package com.example.restservice.service;

import java.time.LocalDateTime;
import java.util.List;

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
    private DemandeRepository demandeRepo;

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

    public void updateObservationAndDate(Integer idDemande, String observation, String date) {

        List<DemandeStatus> list = demandeStatusRepo.findByDemandeOrderByIdDesc(idDemande);

        if (!list.isEmpty()) {
            DemandeStatus ds = list.get(0);

            ds.setObservation(observation);

            if (date != null && !date.isEmpty()) {
                ds.setDateStatus(LocalDateTime.parse(date + "T00:00:00"));
            }

            demandeStatusRepo.save(ds);
        }
    }

    public List<Object[]> getStatistiqueParStatus() {
        return demandeStatusRepo.countByStatus();
    }
}
