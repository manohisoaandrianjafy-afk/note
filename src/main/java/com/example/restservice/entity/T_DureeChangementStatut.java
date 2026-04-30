package com.example.restservice.entity;

import jakarta.persistence.*;


@Entity
@Table(name = "t_duree_changement_statut")
public class T_DureeChangementStatut {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer idDevisUn;
    private Integer idDevisDeux;

    
    private Long duree;

    // getters & setters

    public Long getDuree() {
        return duree;
    }

    public void setDuree(Long duree) {
        this.duree = duree;
    }

    public Integer getId() {
        return id;
    }

    public Integer getIdDevisUn() {
        return idDevisUn;
    }

    public void setIdDevisUn(Integer idDevisUn) {
        this.idDevisUn = idDevisUn;
    }

    public Integer getIdDevisDeux() {
        return idDevisDeux;
    }

    public void setIdDevisDeux(Integer idDevisDeux) {
        this.idDevisDeux = idDevisDeux;
    }

    

   
}