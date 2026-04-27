package com.example.restservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.restservice.entity.T_DureeChangementStatut;

public interface DureeRepository extends JpaRepository<T_DureeChangementStatut, Integer> {
}