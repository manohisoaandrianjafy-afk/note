package com.example.restservice.service;

import com.example.restservice.entity.Candidat;
import com.example.restservice.repository.CandidatRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CandidatService {

    private final CandidatRepository candidatRepository;

    public CandidatService(CandidatRepository candidatRepository) {
        this.candidatRepository = candidatRepository;
    }

    public List<Candidat> getAll() {
        return candidatRepository.findAll();
    }

    public Candidat save(Candidat candidat) {
        return candidatRepository.save(candidat);
    }

    public Candidat getById(Long id) {
        return candidatRepository.findById(id).orElse(null);
    }

    public void delete(Long id) {
        candidatRepository.deleteById(id);
    }
}