package com.example.restservice.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "t_notefinale")
public class NoteFinale {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_candidat", nullable = false)
    private Candidat candidat;

    @ManyToOne
    @JoinColumn(name = "id_matiere", nullable = false)
    private Matiere matiere;

    @Column(name = "note_finale", nullable = false, precision = 5, scale = 2)
    private BigDecimal noteFinale;

    public NoteFinale() {}

    public Long getId() {
        return id;
    }

    public Candidat getCandidat() {
        return candidat;
    }

    public Matiere getMatiere() {
        return matiere;
    }

    public BigDecimal getNoteFinale() {
        return noteFinale;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setCandidat(Candidat candidat) {
        this.candidat = candidat;
    }

    public void setMatiere(Matiere matiere) {
        this.matiere = matiere;
    }

    // public void setNoteFinale(double resultat) {
    //     this.noteFinale = resultat;
    // }

    public void setNoteFinale(BigDecimal noteFinale) {
    this.noteFinale = noteFinale;
}
}