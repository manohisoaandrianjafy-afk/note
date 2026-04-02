package com.example.restservice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.restservice.entity.Devis;

public interface DevisRepository extends JpaRepository<Devis, Integer> {
    @Query("SELECT d FROM Devis d LEFT JOIN FETCH d.details")
    List<Devis> findAllWithDetails();


    @Query("""
        SELECT d FROM Devis d
        JOIN FETCH d.demande dem
        JOIN FETCH dem.client
        JOIN FETCH d.typeDevis
    """)
    List<Devis> findAllWithDemandeAndClient();

}