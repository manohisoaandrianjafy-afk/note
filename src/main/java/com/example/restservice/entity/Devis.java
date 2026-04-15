package com.example.restservice.entity;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "t_devis")
public class Devis {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @ManyToOne
    @JoinColumn(name = "id_type")
    private TypeDevis typeDevis;

    public TypeDevis getTypeDevis() {
        return typeDevis;
    }

    public void setTypeDevis(TypeDevis typeDevis) {
        this.typeDevis = typeDevis;
    }

    @ManyToOne
    @JoinColumn(name = "id_demande")
    private Demande demande;

    public Demande getDemande() {
        return demande;
    }

    public void setDemande(Demande demande) {
        this.demande = demande;
    }

    private double montantTotal;

    public double getMontantTotal() {
        return montantTotal;
    }

    public void setMontantTotal(double montantTotal) {
        this.montantTotal = montantTotal;
    }

    @OneToMany(mappedBy = "devis", cascade = CascadeType.ALL)
    private List<DetailsDevis> details  = new ArrayList<>();;

    public List<DetailsDevis> getDetails() {
        return details;
    }

    public void setDetails(List<DetailsDevis> details) {
        this.details = details;
    }

   
}


