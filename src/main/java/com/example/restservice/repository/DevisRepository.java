package com.example.restservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.restservice.entity.Devis;

public interface DevisRepository extends JpaRepository<Devis, Integer> {}