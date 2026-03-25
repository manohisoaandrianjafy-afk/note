package com.example.restservice.controller;

import com.example.restservice.entity.Devis;
import com.example.restservice.entity.DevisDTO;
import com.example.restservice.service.DevisService;
import org.springframework.web.bind.annotation.*;

@RestController
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
}