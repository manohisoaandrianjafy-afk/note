package com.example.restservice.entity;

public class DevisListDTO {

    private Integer id;
    private String client;
    private String status;
    private double montantTotal;

    public DevisListDTO(Integer id, String client, String status, double montantTotal) {
        this.id = id;
        this.client = client;
        this.status = status;
        this.montantTotal = montantTotal;
    }

    public Integer getId() { return id; }
    public String getClient() { return client; }
    public String getStatus() { return status; }
    public double getMontantTotal() { return montantTotal; }
}