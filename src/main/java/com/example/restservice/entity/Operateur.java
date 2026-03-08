package com.example.restservice.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "t_operateur")
public class Operateur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Integer operateur;

    public Operateur() {}

    public Long getId() {
        return id;
    }

    public Integer getOperateur() {
        return operateur;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setOperateur(Integer operateur) {
        this.operateur = operateur;
    }
}