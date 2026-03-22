package com.example.restservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.restservice.entity.DemandeStatus;
import com.example.restservice.service.DemandeStatusService;
import com.example.restservice.service.DemandeService;
import com.example.restservice.service.StatusService;

@Controller
@RequestMapping("/demandeStatus")
public class DemandeStatusController {

    @Autowired
    private DemandeStatusService service;

    @Autowired
    private DemandeService demandeService;

    @Autowired
    private StatusService statusService;

    
    @GetMapping
    public String list(Model model) {
        model.addAttribute("list", service.getAll());
        return "demandeStatus/list";
    }

  
    @GetMapping("/form")
    public String form(Model model) {
        model.addAttribute("ds", new DemandeStatus());
        model.addAttribute("demandes", demandeService.getAll());
        model.addAttribute("statuses", statusService.getAll());
        return "demandeStatus/form";
    }

   
    @PostMapping("/save")
    public String save(@ModelAttribute DemandeStatus ds) {
        service.save(ds);
        return "redirect:/demandeStatus";
    }
}