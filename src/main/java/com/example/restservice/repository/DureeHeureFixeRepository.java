package com.example.restservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.restservice.entity.DureeHeureFixe;

public interface DureeHeureFixeRepository extends JpaRepository<DureeHeureFixe, Integer> {
}