package com.example.restservice.entity;

import java.math.BigDecimal;
import java.util.List;

public class DevisDTO {
    private Long demandeId;
    public Long getDemandeId() {
        return demandeId;
    }

    public void setDemandeId(Long demandeId) {
        this.demandeId = demandeId;
    }

    private Long typeDevisId;
    public Long getTypeDevisId() {
        return typeDevisId;
    }

    public void setTypeDevisId(Long typeDevisId) {
        this.typeDevisId = typeDevisId;
    }

    private List<DetailDTO> details;

    public List<DetailDTO> getDetails() {
        return details;
    }

    public void setDetails(List<DetailDTO> details) {
        this.details = details;
    }

    public static class DetailDTO {
        private String libelle;
        public String getLibelle() {
            return libelle;
        }
        public void setLibelle(String libelle) {
            this.libelle = libelle;
        }
        private BigDecimal prix;
        public BigDecimal getPrix() {
            return prix;
        }
        public void setPrix(BigDecimal prix) {
            this.prix = prix;
        }
        private BigDecimal quantite;
        public BigDecimal getQuantite() {
            return quantite;
        }
        public void setQuantite(BigDecimal quantite) {
            this.quantite = quantite;
        }
    }
}
