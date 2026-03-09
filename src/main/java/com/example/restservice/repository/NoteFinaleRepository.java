package com.example.restservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.restservice.entity.NoteFinale;

public interface NoteFinaleRepository extends JpaRepository<NoteFinale, Long> {
}