package com.example.restservice.controller;

import com.example.restservice.entity.Candidat;
import com.example.restservice.service.CandidatService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/candidat")
public class CandidatController {

    private final CandidatService candidatService;

    public CandidatController(CandidatService candidatService) {
        this.candidatService = candidatService;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("candidats", candidatService.getAll());
        return "candidat/list";
    }

    @GetMapping("/new")
    public String createForm(Model model) {
        model.addAttribute("candidat", new Candidat());
        return "candidat/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Candidat candidat) {
        candidatService.save(candidat);
        return "redirect:/candidat";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        candidatService.delete(id);
        return "redirect:/candidat";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("candidat", candidatService.getById(id));
        return "candidat/form";
    }
}