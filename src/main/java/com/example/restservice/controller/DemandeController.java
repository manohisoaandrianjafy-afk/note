package com.example.restservice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.restservice.entity.Demande;
import com.example.restservice.service.DemandeService;
import com.example.restservice.service.DemandeStatusService;
import com.example.restservice.service.StatusService;
import com.example.restservice.service.ClientService;

@Controller
@RequestMapping("/demandeClient")
public class DemandeController {

    @Autowired
    private DemandeService service;

    @Autowired
    private ClientService clientService;

    @Autowired
    private StatusService statusService;

    @Autowired
    private DemandeStatusService demandeStatusService;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("demandes", service.getAllWithStatus());
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

    @GetMapping("/editStatus/{id}")
    public String editStatus(@PathVariable Integer id, Model model) {
        model.addAttribute("demande", service.getById(id));
        model.addAttribute("statuses", statusService.getAll());
        return "demande/edit_status";
    }

    @PostMapping("/saveStatus")
    public String saveStatus(@RequestParam Integer idDemande,
            @RequestParam Integer idStatus,
            @RequestParam String observation) {

        demandeStatusService.addStatus(idDemande, idStatus, observation);

        return "redirect:/demandeClient";
    }

    @GetMapping("/historique/{idClient}")
    public String historique(@PathVariable Integer idClient, Model model) {
        List<Demande> demandes = service.getDemandesByClient(idClient);
        model.addAttribute("demandes", demandes);
        return "demande/historique";
    }

//     @GetMapping("/historique/{idClient}")
// public String historique(@PathVariable Integer idClient, Model model) {
//     List<Demande> demandes = service.getDemandesByClient(idClient);
//     model.addAttribute("demandes", demandes);
//     return "demande/historique";
// }

    @GetMapping("/editObservation/{id}")
    public String editObservation(@PathVariable Integer id, Model model) {
        Demande demande = service.getById(id);
        model.addAttribute("demande", demande);
        return "demande/edit_observation_date";
    }

    @PostMapping("/updateObservation")
    public String updateObservation(@RequestParam Integer idDemande, @RequestParam String observation,
            @RequestParam String date) {
        demandeStatusService.updateObservationAndDate(idDemande, observation, date);
        return "redirect:/demandeClient";
    }

}