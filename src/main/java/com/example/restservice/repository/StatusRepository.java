package com.example.restservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import com.example.restservice.entity.Status;

public interface StatusRepository extends JpaRepository<Status, Integer> {
     Status findByLibelle(String libelle);
    
}