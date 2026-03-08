package com.example.restservice.controller;

import com.example.restservice.entity.Matiere;
import com.example.restservice.service.MatiereService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/matiere")
public class MatiereController {

    private final MatiereService matiereService;

    public MatiereController(MatiereService matiereService) {
        this.matiereService = matiereService;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("matieres", matiereService.getAll());
        return "matiere/list";
    }

    @GetMapping("/new")
    public String createForm(Model model) {
        model.addAttribute("matiere", new Matiere());
        return "matiere/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Matiere matiere) {
        matiereService.save(matiere);
        return "redirect:/matiere";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        matiereService.delete(id);
        return "redirect:/matiere";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("matiere", matiereService.getById(id));
        return "matiere/form";
    }
}