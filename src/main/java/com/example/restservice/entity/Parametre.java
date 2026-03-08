package com.example.restservice.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "t_parametre")
public class Parametre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_matiere", nullable = false)
    private Matiere matiere;

    @Column(nullable = false, precision = 5, scale = 2)
    private BigDecimal diff;

    @ManyToOne
    @JoinColumn(name = "id_operateur", nullable = false)
    private Operateur operateur;

    @ManyToOne
    @JoinColumn(name = "id_resolution", nullable = false)
    private Resolution resolution;

    public Parametre() {}

    public Long getId() {
        return id;
    }

    public Matiere getMatiere() {
        return matiere;
    }

    public BigDecimal getDiff() {
        return diff;
    }

    public Operateur getOperateur() {
        return operateur;
    }

    public Resolution getResolution() {
        return resolution;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setMatiere(Matiere matiere) {
        this.matiere = matiere;
    }

    public void setDiff(BigDecimal diff) {
        this.diff = diff;
    }

    public void setOperateur(Operateur operateur) {
        this.operateur = operateur;
    }

    public void setResolution(Resolution resolution) {
        this.resolution = resolution;
    }
}