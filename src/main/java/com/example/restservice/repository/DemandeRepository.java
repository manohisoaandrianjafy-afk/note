package com.example.restservice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.restservice.entity.Demande;

public interface DemandeRepository extends JpaRepository<Demande, Integer> {
     List<Demande> findByClientId(Integer idClient);

     @Query("""
                   SELECT d FROM Demande d
                   JOIN d.client c
                   JOIN DemandeStatus ds ON ds.demande = d
                   JOIN ds.status s
                   WHERE s.libelle = :status
               """)
     List<Demande> findByStatus(@Param("status") String status);
}