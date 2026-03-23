package com.example.restservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import com.example.restservice.entity.Status;
import com.example.restservice.repository.StatusRepository;

@Service
public class StatusService {

    @Autowired
    private StatusRepository repo;

    public List<Status> getAll() {
        return repo.findAll();
    }
}