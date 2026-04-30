package com.example.restservice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.restservice.entity.Indicateur;
import com.example.restservice.entity.Status;

public interface IndicateurRepository extends JpaRepository<Indicateur, Integer> {

    List<Indicateur> findByStatus1_IdAndStatus2_Id(Integer idStatus1, Integer idStatus2);

    @Query("SELECT i FROM Indicateur i")
    List<Indicateur> findAllIndicateurs();
}