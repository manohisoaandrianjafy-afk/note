package com.example.restservice.controller;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.restservice.service.CandidatService;
import com.example.restservice.service.MatiereService;
import com.example.restservice.service.NoteFinaleService;

@Controller
@RequestMapping("/notefinale")
public class NoteFinaleController {

    @Autowired
    private NoteFinaleService noteFinaleService;

    @Autowired
    private CandidatService candidatService;

    @Autowired
    private MatiereService matiereService;

    @GetMapping("/form")
    public String form(Model model) {

        model.addAttribute("candidats", candidatService.getAll());

        model.addAttribute("matieres", matiereService.getAll());

        return "notefinale/form";
    }

    @PostMapping("/calculer")
    public String calculer(
            @RequestParam Long idCandidat,
            @RequestParam Long idMatiere,
            Model model) {

        double resultat =
                noteFinaleService.calculerNoteFinale(idCandidat, idMatiere);

        model.addAttribute("resultat", resultat);

        return "notefinale/result";
    }
}