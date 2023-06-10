package com.camping.configservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HeathController {
    @GetMapping("/health-check")
    public String healthCheck() {
        return "Config Server is Ok";
    }

}
