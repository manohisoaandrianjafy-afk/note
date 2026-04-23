package com.example.restservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.restservice.entity.Client;
import com.example.restservice.service.ClientService;

@Controller
@RequestMapping("/client")
public class ClientController {

    @Autowired
    private ClientService service;

    private final ClientService clientService;

    public ClientController(ClientService clientService) {
        this.clientService = clientService;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("clients", service.getAll());
        return "client/list";
    }

    @GetMapping("/form")
    public String form(Model model) {
        model.addAttribute("client", new Client());
        return "client/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Client client) {
        service.save(client);
        return "redirect:/client";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Integer id, Model model) {
        Client client = service.getById(id);
        model.addAttribute("client", client);
        return "client/form";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.delete(id);
        return "redirect:/client";
    }

    @GetMapping("/list")
    public String listClients(Model model) {
        model.addAttribute("clients", clientService.getAll());
        return "client/list";
    }
}
