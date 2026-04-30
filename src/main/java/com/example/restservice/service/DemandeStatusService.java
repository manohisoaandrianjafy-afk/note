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
import com.example.restservice.entity.Indicateur;
import com.example.restservice.entity.Status;
import com.example.restservice.entity.T_DureeChangementStatut;
import com.example.restservice.repository.DemandeRepository;
import com.example.restservice.repository.DemandeStatusRepository;
import com.example.restservice.repository.DureeHeureFixeRepository;
import com.example.restservice.repository.DureeRepository;
import com.example.restservice.repository.IndicateurRepository;
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

    @Autowired
    private IndicateurRepository indicateurRepo;

    @Autowired
    private IndicateurService indicateurService;

    public void addStatus(Integer idDemande, Integer idStatus, String observation, String dateStatus) {

        Demande demande = demandeRepo.findById(idDemande).orElse(null);
        Status status = statusRepo.findById(idStatus).orElse(null);

        DemandeStatus ds = new DemandeStatus();
        ds.setDemande(demande);
        ds.setStatus(status);
        ds.setObservation(observation);
        LocalDateTime now;
        if (dateStatus != null && !dateStatus.isEmpty()) {
            now = LocalDateTime.parse(dateStatus);
        } else {
            now = LocalDateTime.now();
        }
        ds.setDateStatus(now);
        List<DemandeStatus> list = demandeStatusRepo
                .findByDemandeOrderByDateStatusAsc(idDemande);

        if (!list.isEmpty()) {

            DemandeStatus last = list.get(list.size() - 1);

            long totalMinutes = Duration.between(
                    last.getDateStatus(),
                    now).toMinutes();

            int heuresTotal = arrondirHeure(totalMinutes);

            long minutesTravail = calculTravailHeureFixe(
                    last.getDateStatus(),
                    now);

            int heuresTravail = arrondirHeure(minutesTravail);

            ds.setDureeTotal(heuresTotal);
            ds.setDureeTravaille(heuresTravail);

        } else {

            ds.setDureeTotal(0);
            ds.setDureeTravaille(0);
        }

        demandeStatusRepo.save(ds);
    }

    private int arrondirHeure(long totalMinutes) {

        int heures = (int) (totalMinutes / 60);
        int minutes = (int) (totalMinutes % 60);

        if (minutes >= 30) {
            heures = heures + 1;
        } else {
            heures = heures;
        }

        return heures;
    }

    // public void updateObservationAndDate(Integer idDemande, String observation,
    // String date) {

    // List<DemandeStatus> list =
    // demandeStatusRepo.findByDemandeOrderByIdDesc(idDemande);

    // if (!list.isEmpty()) {
    // DemandeStatus ds = list.get(0);

    // ds.setObservation(observation);

    // if (date != null && !date.isEmpty()) {
    // System.out.println("DATE REÇUE = " + date);
    // System.out.println("DATE CONVERTIE = " + ds.getDateStatus());
    // ds.setDateStatus(LocalDateTime.parse(date));
    // }

    // demandeStatusRepo.save(ds);
    // }
    // }

    public void updateObservationAndDate(Integer idStatusDemande, String observation, String date) {

        DemandeStatus ds = demandeStatusRepo.findById(idStatusDemande).orElse(null);

        if (ds != null) {

            ds.setObservation(observation);

            if (date != null && !date.isEmpty()) {
                ds.setDateStatus(LocalDateTime.parse(date));
            }

            demandeStatusRepo.save(ds);
            recalculerDurees(ds.getDemande().getId());
        }
    }

    private void recalculerDurees(Integer idDemande) {

        List<DemandeStatus> list = demandeStatusRepo
                .findByDemandeOrderByDateStatusAsc(idDemande);

        for (int i = 0; i < list.size(); i++) {

            DemandeStatus current = list.get(i);

            if (i == 0) {
                current.setDureeTotal(0);
                current.setDureeTravaille(0);
            } else {

                DemandeStatus prev = list.get(i - 1);

                // durée totale
                long totalMinutes = Duration.between(
                        prev.getDateStatus(),
                        current.getDateStatus()).toMinutes();

                int heuresTotal = arrondirHeure(totalMinutes);

                // durée travaillée
                long minutesTravail = calculTravailHeureFixe(
                        prev.getDateStatus(),
                        current.getDateStatus());

                int heuresTravail = arrondirHeure(minutesTravail);

                current.setDureeTotal(heuresTotal);
                current.setDureeTravaille(heuresTravail);
            }

            demandeStatusRepo.save(current);
        }
    }

    public List<Object[]> getStatistiqueParStatus() {
        return demandeStatusRepo.countByStatus();
    }

    // public List<DureeStatusDTO> getDureesEntreStatus(Integer idDemande) {

    // List<DemandeStatus> list = demandeStatusRepo
    // .findByDemandeOrderByDateStatusAsc(idDemande);

    // List<DureeStatusDTO> result = new ArrayList<>();

    // for (int i = 0; i < list.size() - 1; i++) {

    // DemandeStatus current = list.get(i);
    // DemandeStatus next = list.get(i + 1);

    // Duration duration = Duration.between(
    // current.getDateStatus(),
    // next.getDateStatus());

    // long totalMinutes = duration.toMinutes();
    // int heures = arrondirHeure(totalMinutes);

    // DureeStatusDTO dto = new DureeStatusDTO();
    // dto.setFromStatus(current.getStatus().getLibelle());
    // dto.setToStatus(next.getStatus().getLibelle());
    // dto.setFromDate(current.getDateStatus());
    // dto.setToDate(next.getDateStatus());
    // dto.setDuree(heures + " h");

    // result.add(dto);
    // }

    // return result;
    // }
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

            long totalMinutes = duration.toMinutes();
            int heures = arrondirHeure(totalMinutes);

            // 🔥 chercher indicateur
            List<Indicateur> indicateurs = indicateurRepo.findByStatus1_IdAndStatus2_Id(
                    current.getStatus().getId(),
                    next.getStatus().getId());

            String level = "";

            for (Indicateur ind : indicateurs) {

                if (heures >= ind.getIntervalle1()
                        && heures < ind.getIntervalle2()) {
                    level = ind.getLevel().getLevel();
                }
            }

            DureeStatusDTO dto = new DureeStatusDTO();
            dto.setFromStatus(current.getStatus().getLibelle());
            dto.setToStatus(next.getStatus().getLibelle());
            dto.setFromDate(current.getDateStatus().toString());
            dto.setToDate(next.getDateStatus().toString());
            dto.setDuree(heures + " h");
            dto.setLevel(level);

            result.add(dto);
        }

        return result;
    }
    // public long calculTravailHeureFixe(LocalDateTime start, LocalDateTime end) {

    // long total = 0;

    // LocalDate current = start.toLocalDate();
    // LocalDate last = end.toLocalDate();

    // while (!current.isAfter(last)) {

    // LocalDateTime realStart = max(start, current.atTime(8, 0));
    // LocalDateTime realEnd = min(end, current.atTime(17, 0));

    // if (realStart.isBefore(realEnd)) {

    // total += overlap(realStart, realEnd,
    // current.atTime(8, 0),
    // current.atTime(12, 0));

    // total += overlap(realStart, realEnd,
    // current.atTime(14, 0),
    // current.atTime(17, 0));
    // }

    // current = current.plusDays(1);
    // }

    // return total;
    // }

    public long calculTravailHeureFixe(LocalDateTime start, LocalDateTime end) {

        long total = 0;

        LocalDate current = start.toLocalDate();
        LocalDate last = end.toLocalDate();

        while (!current.isAfter(last)) {

            if (current.getDayOfWeek().getValue() <= 5) {

                LocalDateTime realStart = max(start, current.atTime(8, 0));
                LocalDateTime realEnd = min(end, current.atTime(17, 0));

                if (realStart.isBefore(realEnd)) {

                    total += overlap(realStart, realEnd,
                            current.atTime(8, 0),
                            current.atTime(12, 0));

                    total += overlap(realStart, realEnd,
                            current.atTime(13, 0),
                            current.atTime(17, 0));
                }
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

    // public List<DureeHeureFixeDTO> getDureeHeureFixeList(Integer idDemande) {

    // List<DemandeStatus> list = demandeStatusRepo
    // .findByDemandeOrderByDateStatusAsc(idDemande);

    // List<DureeHeureFixeDTO> result = new ArrayList<>();

    // for (int i = 0; i < list.size() - 1; i++) {

    // DemandeStatus start = list.get(i);
    // DemandeStatus end = list.get(i + 1);

    // long minutes = calculTravailHeureFixe(
    // start.getDateStatus(),
    // end.getDateStatus());

    // DureeHeureFixeDTO dto = new DureeHeureFixeDTO();
    // dto.setFromStatus(start.getStatus().getLibelle());
    // dto.setToStatus(end.getStatus().getLibelle());
    // int heures = arrondirHeure(minutes);
    // dto.setDuree(heures);

    // result.add(dto);
    // }

    // return result;
    // }

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

            int heures = arrondirHeure(minutes);

            String couleur = indicateurService.getLevelCouleur(
                    start.getStatus().getLibelle(),
                    end.getStatus().getLibelle(),
                    heures);

            DureeHeureFixeDTO dto = new DureeHeureFixeDTO();
            dto.setFromStatus(start.getStatus().getLibelle());
            dto.setToStatus(end.getStatus().getLibelle());
            dto.setDuree(heures);
            dto.setCouleur(couleur);

            result.add(dto);
        }

        return result;
    }

    public List<DemandeStatus> getByDemande(Integer idDemande) {
        return demandeStatusRepo.findByDemandeOrderByDateStatusAsc(idDemande);
    }

    public DemandeStatus getById(Integer id) {
        return demandeStatusRepo.findById(id).orElse(null);
    }

    public int getTotalDureeTotal(Integer idDemande) {

        List<DemandeStatus> list = demandeStatusRepo.findByDemandeOrderByDateStatusAsc(idDemande);

        int total = 0;

        for (DemandeStatus ds : list) {
            if (ds.getDureeTotal() != null) {
                total = total + ds.getDureeTotal();
            }
        }

        return total;
    }

    public int getTotalDureeTravaille(Integer idDemande) {

        List<DemandeStatus> list = demandeStatusRepo.findByDemandeOrderByDateStatusAsc(idDemande);

        int total = 0;

        for (DemandeStatus ds : list) {
            if (ds.getDureeTravaille() != null) {
                total = total + ds.getDureeTravaille();
            }
        }

        return total;
    }

}
