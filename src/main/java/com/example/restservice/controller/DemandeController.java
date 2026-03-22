package com.example.restservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.restservice.entity.Demande;
import com.example.restservice.service.DemandeService;
import com.example.restservice.service.ClientService;

@Controller
@RequestMapping("/demandeClient")
public class DemandeController {

    @Autowired
    private DemandeService service;

    @Autowired
    private ClientService clientService;

   
    @GetMapping
    public String list(Model model) {
        model.addAttribute("demandes", service.getAll());
        return "demande/list";
    }

    
    @GetMapping("/form")
    public String form(Model model) {
        model.addAttribute("demande", new Demande());
        model.addAttribute("clients", clientService.getAll());
        return "demande/form";
    }

    
    @PostMapping("/save")
    public String save(@ModelAttribute Demande demande) {
        service.save(demande);
        return "redirect:/demandeClient";
    }

   
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Integer id, Model model) {
        model.addAttribute("demande", service.getById(id));
        model.addAttribute("clients", clientService.getAll());
        return "demande/form";
    }

  
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.delete(id);
        return "redirect:/demandeClient";
    }
}