package com.example.restservice.entity;

import jakarta.persistence.*;
import java.util.Date;

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

    @Temporal(TemporalType.TIMESTAMP)
    private Date dateStatus = new Date();

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Demande getDemande() { return demande; }
    public void setDemande(Demande demande) { this.demande = demande; }

    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }

    public Date getDateStatus() { return dateStatus; }
    public void setDateStatus(Date dateStatus) { this.dateStatus = dateStatus; }
}