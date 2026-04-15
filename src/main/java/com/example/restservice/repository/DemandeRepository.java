package com.example.restservice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.restservice.entity.Demande;

public interface DemandeRepository extends JpaRepository<Demande, Integer> {
     List<Demande> findByClientId(Integer idClient);
}