package com.example.restservice.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.restservice.entity.Candidat;
import com.example.restservice.entity.Matiere;
import com.example.restservice.entity.Note;
import com.example.restservice.entity.NoteFinale;
import com.example.restservice.entity.Parametre;
import com.example.restservice.repository.NoteRepository;
import com.example.restservice.repository.CandidatRepository;
import com.example.restservice.repository.MatiereRepository;
import com.example.restservice.repository.NoteFinaleRepository;
import com.example.restservice.repository.ParametreRepository;

import org.springframework.transaction.annotation.Transactional;

@Service
public class NoteFinaleService {

    @Autowired
    private NoteRepository noteRepository;

    @Autowired
    private ParametreRepository parametreRepository;

    @Autowired
    private NoteFinaleRepository noteFinaleRepository;

    @Autowired
    private CandidatRepository candidatRepository;

    @Autowired
    private MatiereRepository matiereRepository;

    @Transactional
    public double calculerNoteFinale(Long idCandidat, Long idMatiere) {

        List<Note> notes = noteRepository.findByCandidatIdAndMatiereId(idCandidat, idMatiere);

        List<Double> valeurs = new ArrayList<>();
        for (Note n : notes) {
            valeurs.add(n.getNote().doubleValue());
        }

        double sommeDiff = 0;
        for (int i = 0; i < valeurs.size(); i++) {
            for (int j = i + 1; j < valeurs.size(); j++) {
                sommeDiff += Math.abs(valeurs.get(j) - valeurs.get(i));
            }
        }

        List<Parametre> params = parametreRepository.findByMatiereId(idMatiere);

        double resultat = moyenne(valeurs);

        Parametre paramChoisi = trouverParametreLePlusProche(params, sommeDiff);

        if (paramChoisi != null) {

            double diffParam = paramChoisi.getDiff().doubleValue();
            int operateur = paramChoisi.getOperateur().getOperateur();

            if (operateur == 1 && sommeDiff < diffParam) {
                resultat = appliquerResolution(valeurs, paramChoisi.getResolution().getNom());
            }

            if (operateur == 2 && sommeDiff <= diffParam) {
                resultat = appliquerResolution(valeurs, paramChoisi.getResolution().getNom());
            }

            if (operateur == 3 && sommeDiff > diffParam) {
                resultat = appliquerResolution(valeurs, paramChoisi.getResolution().getNom());
            }

            if (operateur == 4 && sommeDiff >= diffParam) {
                resultat = appliquerResolution(valeurs, paramChoisi.getResolution().getNom());
            }
        }

        // if (!params.isEmpty() && sommeDiff == params.get(0).getDiff().doubleValue()) {
        //     resultat = moyenne(valeurs);
        // }

        Candidat candidat = candidatRepository.findById(idCandidat).get();
        Matiere matiere = matiereRepository.findById(idMatiere).get();

        NoteFinale nf = new NoteFinale();
        nf.setCandidat(candidat);
        nf.setMatiere(matiere);
        nf.setNoteFinale(BigDecimal.valueOf(resultat));

        noteFinaleRepository.save(nf);
        noteFinaleRepository.flush();

        return resultat;
    }

    private double appliquerResolution(List<Double> notes, String resolution) {
        if (resolution.equals("plus_petit")) {
            return Collections.min(notes);
        }
        if (resolution.equals("plus_grand")) {
            return Collections.max(notes);
        }
        return moyenne(notes);
    }

    private double moyenne(List<Double> notes) {
        if (notes.isEmpty())
            return 0;

        double somme = 0;
        for (double n : notes) {
            somme += n;
        }

        return somme / notes.size();
    }

    private Parametre trouverParametreLePlusProche(List<Parametre> params, double sommeDiff) {

        Parametre meilleur = null;
        double distanceMin = Double.MAX_VALUE;

        for (Parametre p : params) {
            double diff = p.getDiff().doubleValue();
            double distance = Math.abs(diff - sommeDiff);

            if (distance < distanceMin) {
                distanceMin = distance;
                meilleur = p;
            } else if (distance == distanceMin) {

                if (diff < meilleur.getDiff().doubleValue()) {
                    meilleur = p;
                }
            }
        }

        return meilleur;
    }

}