package com.example.restservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.restservice.entity.Demande;

public interface DemandeRepository extends JpaRepository<Demande, Integer> {
}