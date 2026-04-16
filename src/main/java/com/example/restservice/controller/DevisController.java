package com.example.restservice.controller;

import com.example.restservice.entity.Devis;
import com.example.restservice.entity.DevisDTO;
import com.example.restservice.entity.DevisListDTO;
import com.example.restservice.service.DevisService;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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

    @GetMapping
    public String list(Model model) {
        model.addAttribute("devis", devisService.getAll());
        return "devis/list";
    }

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
}