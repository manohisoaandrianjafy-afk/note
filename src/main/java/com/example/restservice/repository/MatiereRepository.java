package com.example.restservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.restservice.entity.Matiere;

public interface MatiereRepository extends JpaRepository<Matiere, Long> {
}