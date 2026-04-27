package com.example.restservice.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.restservice.service.ClientService;
import com.example.restservice.service.DemandeService;
import com.example.restservice.service.DemandeStatusService;
import com.example.restservice.service.DevisService;

@Controller
@RequestMapping("/statistique")
public class StatController {

    private final ClientService clientService;
    private final DevisService devisService;
    private final DemandeStatusService demandeStatusService;
     private final DemandeService demandeService;

    public StatController(ClientService clientService, DevisService devisService,
            DemandeStatusService demandeStatusService ,DemandeService demandeService) {
        this.clientService = clientService;
        this.devisService = devisService;
        this.demandeStatusService = demandeStatusService;
        this.demandeService = demandeService;
    }

    @GetMapping
    public String affaire(Model model) {

        Long totalClient = clientService.getSommeClient();

        Long nbForage = devisService.countByType("Forage");
        Long nbEtude = devisService.countByType("Etude");

        Long totalDevis = nbForage + nbEtude;
        List<Object[]> statsStatus = demandeStatusService.getStatistiqueParStatus();
        double chiffre = devisService.chiffreAffaire();
        model.addAttribute("chiffre", chiffre);
        model.addAttribute("totalClient", totalClient);
        model.addAttribute("nbForage", nbForage);
        model.addAttribute("nbEtude", nbEtude);
        model.addAttribute("totalDevis", totalDevis);
        model.addAttribute("statsStatus", statsStatus);

        return "statistique/statistique";
    }

    @GetMapping("/statut/{libelle}")
    public String demandesParStatut(@PathVariable String libelle, Model model) {

        model.addAttribute("demandes", demandeService.getByStatus(libelle));
        model.addAttribute("statut", libelle);

        return "statistique/statut-details";
    }
}