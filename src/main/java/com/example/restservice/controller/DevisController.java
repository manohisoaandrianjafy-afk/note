package com.example.restservice.controller;

import com.example.restservice.entity.Devis;
import com.example.restservice.entity.DevisDTO;
import com.example.restservice.entity.DevisDetailDTO;
import com.example.restservice.service.DevisService;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/devis")
public class DevisController {

    private final DevisService devisService;

    public DevisController(DevisService devisService) {
        this.devisService = devisService;
    }

    @PostMapping("/create")
    public Devis createDevis(@RequestBody DevisDTO dto) {
        return devisService.creerDevis(dto);
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("devis", devisService.getAll());
        return "devis/list";
    }

    // @GetMapping("/list")
    // public String list(Model model) {

    // model.addAttribute("devisForage", devisService.getByType("Forage"));
    // model.addAttribute("devisEtude", devisService.getByType("Etude"));

    // return "devis/list";
    // }

    @GetMapping("/chiffre-affaire")
    public String affaire(Model model) {
        double chiffre = devisService.chiffreAffaire();
        model.addAttribute("chiffre", chiffre);
        return "devis/chiffreAffaire";
    }

    @GetMapping("/{id}")
    public String details(@PathVariable int id, Model model) {
        Devis devis = devisService.getById(id);
        model.addAttribute("devis", devis);
        return "devis/details";
    }

    // @GetMapping("/detailsSimple")
    // public String detailsSimple(Model model) {
    // model.addAttribute("details", devisService.getAllDetails());
    // return "devis/details-simple";
    // }

    @GetMapping("/detailsSimple")
    public String detailsSimple(Model model) {

        List<DevisDetailDTO> details = devisService.getAllDetails();

        double totalGeneral = 0;

        for (DevisDetailDTO d : details) {
            totalGeneral += d.getTotal();
        }

        model.addAttribute("details", details);
        model.addAttribute("totalGeneral", totalGeneral);

        return "devis/details-simple";
    }

    @GetMapping("/client/{idClient}")
    public String devisByClient(@PathVariable Integer idClient, Model model) {
        model.addAttribute("devis", devisService.getByClient(idClient));
        return "devis/list_client";
    }
}