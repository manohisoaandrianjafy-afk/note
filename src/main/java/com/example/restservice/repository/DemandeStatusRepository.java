package com.example.restservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.restservice.entity.DemandeStatus;

public interface DemandeStatusRepository extends JpaRepository<DemandeStatus, Integer> {
}