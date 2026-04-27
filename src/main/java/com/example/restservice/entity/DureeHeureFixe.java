package com.example.restservice.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "t_duree_changement_statut_heure_fixe")
public class DureeHeureFixe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer idDevisUn;
    public Integer getIdDevisUn() {
        return idDevisUn;
    }
    public void setIdDevisUn(Integer idDevisUn) {
        this.idDevisUn = idDevisUn;
    }
    private Integer idDevisDeux;
    public Integer getIdDevisDeux() {
        return idDevisDeux;
    }
    public void setIdDevisDeux(Integer idDevisDeux) {
        this.idDevisDeux = idDevisDeux;
    }
    private Integer duree;
    public Integer getDuree() {
        return duree;
    }
    public void setDuree(Integer duree) {
        this.duree = duree;
    }
}