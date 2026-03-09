package com.example.restservice.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccueilController {
      @GetMapping("/")
    public String home() {
        return "index";
    }

}
