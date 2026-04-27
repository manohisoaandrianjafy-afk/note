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
import com.example.restservice.entity.DureeHeureFixe;
import com.example.restservice.entity.DureeHeureFixeDTO;
import com.example.restservice.entity.DureeStatusDTO;
import com.example.restservice.entity.Status;
import com.example.restservice.entity.T_DureeChangementStatut;
import com.example.restservice.repository.DemandeRepository;
import com.example.restservice.repository.DemandeStatusRepository;
import com.example.restservice.repository.DureeHeureFixeRepository;
import com.example.restservice.repository.DureeRepository;
import com.example.restservice.repository.StatusRepository;

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

    @Autowired
    private DureeHeureFixeRepository dureeHeureFixeRepo;

    public void addStatus(Integer idDemande, Integer idStatus, String observation, String dateStatus) {

        Demande demande = demandeRepo.findById(idDemande).orElse(null);
        Status status = statusRepo.findById(idStatus).orElse(null);

        DemandeStatus ds = new DemandeStatus();
        ds.setDemande(demande);
        ds.setStatus(status);
        ds.setObservation(observation);
        if (dateStatus != null && !dateStatus.isEmpty()) {
            ds.setDateStatus(LocalDateTime.parse(dateStatus));
        } else {
            ds.setDateStatus(LocalDateTime.now());
        }

        demandeStatusRepo.save(ds);

        saveDerniereDuree(idDemande);
        saveDerniereDureeHeureFixe(idDemande);
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

    public void saveDerniereDureeHeureFixe(Integer idDemande) {

        List<DemandeStatus> list = demandeStatusRepo
                .findByDemandeOrderByDateStatusAsc(idDemande);

        if (list.size() < 2)
            return;

        DemandeStatus un = list.get(list.size() - 2);
        DemandeStatus deux = list.get(list.size() - 1);

        long minutes = calculTravailHeureFixe(
                un.getDateStatus(),
                deux.getDateStatus());

        DureeHeureFixe d = new DureeHeureFixe();
        d.setIdDevisUn(un.getId());
        d.setIdDevisDeux(deux.getId());
        d.setDuree((int) minutes);

        System.out.println("INSERT DUREE HEURE FIXE = " + minutes);

        dureeHeureFixeRepo.save(d);
    }

    public long calculTravailHeureFixe(LocalDateTime start, LocalDateTime end) {

        long total = 0;

        LocalDate current = start.toLocalDate();
        LocalDate last = end.toLocalDate();

        while (!current.isAfter(last)) {

            LocalDateTime realStart = max(start, current.atTime(8, 0));
            LocalDateTime realEnd = min(end, current.atTime(17, 0));

            if (realStart.isBefore(realEnd)) {

                total += overlap(realStart, realEnd,
                        current.atTime(8, 0),
                        current.atTime(12, 0));

                total += overlap(realStart, realEnd,
                        current.atTime(14, 0),
                        current.atTime(17, 0));
            }

            current = current.plusDays(1);
        }

        return total;
    }

    private long overlap(LocalDateTime s, LocalDateTime e,
            LocalDateTime b1, LocalDateTime b2) {

        LocalDateTime start = s.isAfter(b1) ? s : b1;
        LocalDateTime end = e.isBefore(b2) ? e : b2;

        if (start.isBefore(end)) {
            return Duration.between(start, end).toMinutes();
        }
        return 0;
    }

    private LocalDateTime max(LocalDateTime a, LocalDateTime b) {
        return a.isAfter(b) ? a : b;
    }

    private LocalDateTime min(LocalDateTime a, LocalDateTime b) {
        return a.isBefore(b) ? a : b;
    }

    public List<DureeHeureFixeDTO> getDureeHeureFixeList(Integer idDemande) {

        List<DemandeStatus> list = demandeStatusRepo
                .findByDemandeOrderByDateStatusAsc(idDemande);

        List<DureeHeureFixeDTO> result = new ArrayList<>();

        for (int i = 0; i < list.size() - 1; i++) {

            DemandeStatus start = list.get(i);
            DemandeStatus end = list.get(i + 1);

            long minutes = calculTravailHeureFixe(
                    start.getDateStatus(),
                    end.getDateStatus());

            DureeHeureFixeDTO dto = new DureeHeureFixeDTO();
            dto.setFromStatus(start.getStatus().getLibelle());
            dto.setToStatus(end.getStatus().getLibelle());
            dto.setDuree((int) minutes);

            result.add(dto);
        }

        return result;
    }
}
