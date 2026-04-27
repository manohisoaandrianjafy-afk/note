package com.example.restservice.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
@Entity
@Table(name = "t_demande")
public class Demande {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_client")
    private Client client;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateDemande;

    private String lieu;
    private String district;

    @Transient
    private String lastStatus;

    @Transient
    private String lastObservation;

    @Transient
private List<DemandeStatus> statuts;

public List<DemandeStatus> getStatuts() {
    return statuts;
}

public void setStatuts(List<DemandeStatus> statuts) {
    this.statuts = statuts;
}

    public String getLastObservation() {
        return lastObservation;
    }

    public void setLastObservation(String lastObservation) {
        this.lastObservation = lastObservation;
    }

    public String getLastStatus() {
        return lastStatus;
    }

    public void setLastStatus(String lastStatus) {
        this.lastStatus = lastStatus;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Date getDateDemande() {
        return dateDemande;
    }

    public void setDateDemande(Date dateDemande) {
        this.dateDemande = dateDemande;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }
      private LocalDateTime lastDateStatus;

    public LocalDateTime getLastDateStatus() {
        return lastDateStatus;
    }

    public void setLastDateStatus(LocalDateTime lastDateStatus) {
        this.lastDateStatus = lastDateStatus;
    }
}