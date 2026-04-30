package com.example.restservice.entity;
import jakarta.persistence.*;


@Entity
@Table(name = "t_indicateur")
public class Indicateur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_status1")
    private Status status1;

    public Status getStatus1() {
        return status1;
    }

    public void setStatus1(Status status1) {
        this.status1 = status1;
    }

    @ManyToOne
    @JoinColumn(name = "id_status2")
    private Status status2;

    public Status getStatus2() {
        return status2;
    }

    public void setStatus2(Status status2) {
        this.status2 = status2;
    }

    private Integer intervalle1;
    public Integer getIntervalle1() {
        return intervalle1;
    }

    public void setIntervalle1(Integer intervalle1) {
        this.intervalle1 = intervalle1;
    }

    private Integer intervalle2;

    public Integer getIntervalle2() {
        return intervalle2;
    }

    public void setIntervalle2(Integer intervalle2) {
        this.intervalle2 = intervalle2;
    }

    @ManyToOne
    @JoinColumn(name = "id_level")
    private Level level;
    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    // getters setters
}