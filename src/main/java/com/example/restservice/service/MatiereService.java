package com.example.restservice.service;

import com.example.restservice.entity.Matiere;
import com.example.restservice.repository.MatiereRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MatiereService {

    private final MatiereRepository matiereRepository;

    public MatiereService(MatiereRepository matiereRepository) {
        this.matiereRepository = matiereRepository;
    }

    public List<Matiere> getAll() {
        return matiereRepository.findAll();
    }

    public Matiere save(Matiere matiere) {
        return matiereRepository.save(matiere);
    }

    public Matiere getById(Long id) {
        return matiereRepository.findById(id).orElse(null);
    }

    public void delete(Long id) {
        matiereRepository.deleteById(id);
    }
}