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

    public double calculerNoteFinale(Long idCandidat, Long idMatiere) {

        List<Note> notes = noteRepository.findByCandidatIdAndMatiereId(idCandidat, idMatiere);

        // 🔹 Transformer en double pour simplifier
        List<Double> valeurs = new ArrayList<>();
        for (Note n : notes) {
            valeurs.add(n.getNote().doubleValue());
        }

        // 🔹 Calcul de la somme des différences
        double sommeDiff = 0;
        for (int i = 0; i < valeurs.size(); i++) {
            for (int j = i + 1; j < valeurs.size(); j++) {
                sommeDiff += Math.abs(valeurs.get(j) - valeurs.get(i));
            }
        }

        List<Parametre> params = parametreRepository.findByMatiereId(idMatiere);

        double resultat = moyenne(valeurs);

        // 🔹 Appliquer les règles des paramètres
        for (Parametre p : params) {

            double diffParam = p.getDiff().doubleValue();
            int operateur = p.getOperateur().getOperateur();

            // diff < sommeDiff → operateur = 1
            if (operateur == 1 && diffParam < sommeDiff) {
                resultat = appliquerResolution(valeurs, p.getResolution().getNom());
            }

            // diff > sommeDiff → operateur = 2
            if (operateur == 2 && diffParam > sommeDiff) {
                resultat = appliquerResolution(valeurs, p.getResolution().getNom());
            }
        }

        // Cas sommeDiff == diffParam
        if (!params.isEmpty() && sommeDiff == params.get(0).getDiff().doubleValue()) {
            resultat = moyenne(valeurs);
        }

        // 🔹 Récupérer candidat et matière
        Candidat candidat = candidatRepository.findById(idCandidat).get();
        Matiere matiere = matiereRepository.findById(idMatiere).get();

        // 🔹 Créer et sauvegarder la note finale
        NoteFinale nf = new NoteFinale();
        nf.setCandidat(candidat);
        nf.setMatiere(matiere);
        nf.setNoteFinale(BigDecimal.valueOf(resultat));

        noteFinaleRepository.save(nf);

        return resultat;
    }

    // 🔹 Appliquer résolution simple
    private double appliquerResolution(List<Double> notes, String resolution) {
        if (resolution.equals("plus_petit")) {
            return Collections.min(notes);
        }
        if (resolution.equals("plus_grand")) {
            return Collections.max(notes);
        }
        return moyenne(notes);
    }

    // 🔹 Calcul moyenne simple
    private double moyenne(List<Double> notes) {
        if (notes.isEmpty()) return 0;

        double somme = 0;
        for (double n : notes) {
            somme += n;
        }

        return somme / notes.size();
    }
}