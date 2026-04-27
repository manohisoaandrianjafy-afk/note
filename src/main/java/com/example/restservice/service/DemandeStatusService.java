package com.example.restservice.service;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.restservice.entity.Demande;
import com.example.restservice.entity.DemandeStatus;
import com.example.restservice.entity.DureeStatusDTO;
import com.example.restservice.entity.Status;
import com.example.restservice.entity.T_DureeChangementStatut;
import com.example.restservice.repository.DemandeRepository;
import com.example.restservice.repository.DemandeStatusRepository;
import com.example.restservice.repository.DureeRepository;
import com.example.restservice.repository.StatusRepository;

import java.sql.Time;
import java.time.Duration;

@Service
public class DemandeStatusService {
    @Autowired
    private DemandeRepository demandeRepo;

    @Autowired
    private StatusRepository statusRepo;

    @Autowired
    private DemandeStatusRepository demandeStatusRepo;

    @Autowired
    private DureeRepository dureeRepo;

    public void addStatus(Integer idDemande, Integer idStatus, String observation, String dateStatus) {

        Demande demande = demandeRepo.findById(idDemande).orElse(null);
        Status status = statusRepo.findById(idStatus).orElse(null);

        DemandeStatus ds = new DemandeStatus();
        ds.setDemande(demande);
        ds.setStatus(status);
        ds.setObservation(observation);

        // conversion datetime-local -> LocalDateTime
        if (dateStatus != null && !dateStatus.isEmpty()) {
            ds.setDateStatus(LocalDateTime.parse(dateStatus));
        } else {
            ds.setDateStatus(LocalDateTime.now());
        }

        demandeStatusRepo.save(ds);

        saveDerniereDuree(idDemande);
    }

    public void updateObservationAndDate(Integer idDemande, String observation, String date) {

        List<DemandeStatus> list = demandeStatusRepo.findByDemandeOrderByIdDesc(idDemande);

        if (!list.isEmpty()) {
            DemandeStatus ds = list.get(0);

            ds.setObservation(observation);

            if (date != null && !date.isEmpty()) {
                System.out.println("DATE REÇUE = " + date);
                System.out.println("DATE CONVERTIE = " + ds.getDateStatus());
                ds.setDateStatus(LocalDateTime.parse(date));
            }

            demandeStatusRepo.save(ds);
        }
    }

    public List<Object[]> getStatistiqueParStatus() {
        return demandeStatusRepo.countByStatus();
    }

    public List<DureeStatusDTO> getDureesEntreStatus(Integer idDemande) {

        List<DemandeStatus> list = demandeStatusRepo
                .findByDemandeOrderByDateStatusAsc(idDemande);

        List<DureeStatusDTO> result = new ArrayList<>();

        for (int i = 0; i < list.size() - 1; i++) {

            DemandeStatus current = list.get(i);
            DemandeStatus next = list.get(i + 1);

            Duration duration = Duration.between(
                    current.getDateStatus(),
                    next.getDateStatus());

            long hours = duration.toHours();
            long minutes = duration.toMinutesPart();

            DureeStatusDTO dto = new DureeStatusDTO();
            dto.setFromStatus(current.getStatus().getLibelle());
            dto.setToStatus(next.getStatus().getLibelle());
            dto.setFromDate(current.getDateStatus());
            dto.setToDate(next.getDateStatus());
            dto.setDuree(hours + "h " + minutes + "min");

            result.add(dto);
        }

        return result;
    }

    public void saveDerniereDuree(Integer idDemande) {

        List<DemandeStatus> list = demandeStatusRepo
                .findByDemandeOrderByDateStatusAsc(idDemande);
        if (list.size() < 2)
            return;

        DemandeStatus avantDernier = list.get(list.size() - 2);
        DemandeStatus dernier = list.get(list.size() - 1);

        Duration duration = Duration.between(
                avantDernier.getDateStatus(),
                dernier.getDateStatus());
        long minutesTotal = duration.toMinutes();

        T_DureeChangementStatut d = new T_DureeChangementStatut();
        d.setIdDevisUn(avantDernier.getId());
        d.setIdDevisDeux(dernier.getId());
        d.setDuree(minutesTotal);

        dureeRepo.save(d);
    }
}
