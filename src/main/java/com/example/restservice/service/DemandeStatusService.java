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
}
