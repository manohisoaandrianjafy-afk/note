package com.example.restservice.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "t_demande_status")
public class DemandeStatus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_demande")
    private Demande demande;

    @ManyToOne
    @JoinColumn(name = "id_status")
    private Status status;

    private String observation;

    @Column(name = "date_status")
    private LocalDateTime dateStatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Demande getDemande() {
        return demande;
    }

    public void setDemande(Demande demande) {
        this.demande = demande;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public LocalDateTime getDateStatus() {
        return dateStatus;
    }

    public void setDateStatus(LocalDateTime dateStatus) {
        this.dateStatus = dateStatus;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    @Column(name = "duree_total")
    private Integer dureeTotal;

    public Integer getDureeTotal() {
        return dureeTotal;
    }

    public void setDureeTotal(Integer dureeTotal) {
        this.dureeTotal = dureeTotal;
    }

    @Column(name = "duree_travaille")
    private Integer dureeTravaille;

    public Integer getDureeTravaille() {
        return dureeTravaille;
    }

    public void setDureeTravaille(Integer dureeTravaille) {
        this.dureeTravaille = dureeTravaille;
    }


}