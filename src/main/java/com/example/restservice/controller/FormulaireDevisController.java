package com.example.restservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import com.example.restservice.service.TypeDevisService;

@Controller
public class FormulaireDevisController {
    @Autowired
    private TypeDevisService typeDevisService;

    @GetMapping("/creationDevis")
    public String showForm(Model model) {
        model.addAttribute("typesDevis", typeDevisService.getAll());
        return "devis/form";
    }
}
