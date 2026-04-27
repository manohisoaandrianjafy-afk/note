package com.example.restservice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.restservice.entity.Demande;
import com.example.restservice.entity.DemandeStatus;

public interface DemandeStatusRepository extends JpaRepository<DemandeStatus, Integer> {
     DemandeStatus findTopByDemandeOrderByDateStatusDesc(Demande demande);

     @Query("SELECT ds FROM DemandeStatus ds WHERE ds.demande.id = :idDemande ORDER BY ds.id DESC")
     List<DemandeStatus> findByDemandeOrderByIdDesc(@Param("idDemande") Integer idDemande);

     @Query("""
                   SELECT s.libelle, COUNT(ds)
                   FROM DemandeStatus ds
                   JOIN ds.status s
                   GROUP BY s.libelle
               """)
     List<Object[]> countByStatus();

     @Query("""
                   SELECT ds FROM DemandeStatus ds
                   WHERE ds.demande.id = :idDemande
                   ORDER BY ds.dateStatus ASC
               """)
     List<DemandeStatus> findByDemandeOrderByDateStatusAsc(@Param("idDemande") Integer idDemande);
}
