package com.example.restservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.restservice.entity.Indicateur;
import com.example.restservice.repository.IndicateurRepository;

@Service
public class IndicateurService {

    @Autowired
    private IndicateurRepository repo;

    public String getLevelCouleur(String statusFrom, String statusTo, int dureeHeure) {

        List<Indicateur> list = repo.findAllIndicateurs();

        for (Indicateur i : list) {

            if (i.getStatus1().getLibelle().equals(statusFrom)
                    && i.getStatus2().getLibelle().equals(statusTo)) {

                if (dureeHeure >= i.getIntervalle1()
                        && dureeHeure <= i.getIntervalle2()) {

                    return i.getLevel().getLevel();
                }
            }
        }

        return "";
    }
}
