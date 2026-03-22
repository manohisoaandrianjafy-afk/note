package com.example.restservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.example.restservice.entity.Client;
import com.example.restservice.repository.ClientRepository;

@Service
public class ClientService {

    @Autowired
    private ClientRepository repo;

    public List<Client> getAll() {
        return repo.findAll();
    }

    public void save(Client c) {
        repo.save(c);
    }

    public Client getById(Integer id) {
        return repo.findById(id).orElse(null);
    }

    public void delete(Integer id) {
        repo.deleteById(id);
    }
}