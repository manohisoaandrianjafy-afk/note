package com.example.restservice.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.restservice.entity.Parametre;

public interface ParametreRepository extends JpaRepository<Parametre, Long> {

    List<Parametre> findByMatiereId(Long matiereId);

}