package com.example.restservice.entity;

public class DevisDetailDTO {

    private Integer devisId;
    public Integer getDevisId() {
        return devisId;
    }

    public void setDevisId(Integer devisId) {
        this.devisId = devisId;
    }

    private String libelle;
    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    private double prix;
    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    private double quantite;
    public double getQuantite() {
        return quantite;
    }

    public void setQuantite(double quantite) {
        this.quantite = quantite;
    }

    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public DevisDetailDTO(Integer devisId, String libelle, double prix, double quantite, String type) {
        this.devisId = devisId;
        this.libelle = libelle;
        this.prix = prix;
        this.quantite = quantite;
        this.type = type;
    }

    public double getTotal() {
        return prix * quantite;
    }

}
