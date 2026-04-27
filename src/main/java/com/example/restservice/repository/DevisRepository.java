package com.example.restservice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.restservice.entity.Devis;
import com.example.restservice.entity.DevisDetailDTO;

public interface DevisRepository extends JpaRepository<Devis, Integer> {
    @Query("SELECT DISTINCT d FROM Devis d " +
            "LEFT JOIN FETCH d.details " +
            "LEFT JOIN FETCH d.demande dem " +
            "LEFT JOIN FETCH dem.client")
    List<Devis> findAllWithDetails();

    @Query("""
                SELECT d FROM Devis d
                JOIN FETCH d.demande dem
                JOIN FETCH dem.client
                JOIN FETCH d.typeDevis
            """)
    List<Devis> findAllWithDemandeAndClient();

    @Query("SELECT SUM(d.montantTotal) FROM Devis d")
    Double getChiffreAffaire();

    @Query("SELECT d FROM Devis d " +
            "LEFT JOIN FETCH d.details " +
            "LEFT JOIN FETCH d.demande dem " +
            "LEFT JOIN FETCH dem.client " +
            "WHERE d.id = :id")
    Devis findByIdWithDetails(@Param("id") int id);

    @Query("SELECT COUNT(d) FROM Devis d WHERE LOWER(d.typeDevis.libelle) = LOWER(:type)")
    Long countByType(@Param("type") String type);

    @Query("SELECT COUNT(d) FROM Devis d")
    Long countTotal();

    @Query("""
                SELECT new com.example.restservice.entity.DevisDetailDTO(
                    d.id,
                    dd.libelle,
                    dd.prix,
                    dd.quantite,
                    d.typeDevis.libelle
                )
                FROM Devis d
                JOIN d.details dd
            """)
    List<DevisDetailDTO> findAllDetails();

    @Query("""
                SELECT d FROM Devis d
                JOIN FETCH d.demande dem
                JOIN FETCH dem.client c
                JOIN FETCH d.typeDevis
                WHERE c.id = :idClient
            """)
    List<Devis> findByClientId(@Param("idClient") Integer idClient);
}