package com.example.restservice.controller;

import com.example.restservice.entity.Demande;
import com.example.restservice.service.DemandeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController 
@RequestMapping("/demandeClient")
public class CreationDevisController {

    @Autowired
    private DemandeService demandeService;

    @GetMapping("/get/{id}")
    public Demande getDemande(@PathVariable Integer id) {
        return demandeService.getById(id);
    }
}