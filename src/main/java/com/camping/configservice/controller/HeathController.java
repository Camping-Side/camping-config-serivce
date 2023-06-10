package com.camping.configservice.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class HeathController {
    @GetMapping("/health-check")
    public String healthCheck() {
        log.info("Config Server health-check");
        return "Config Server is Ok";
    }

}
