package com.practice.bservice.controller;

import com.practice.bservice.service.TestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("")
@Slf4j
public class TestController {
    @Autowired
    TestService testService;

    @GetMapping("/")
    public ResponseEntity<String> test() {
        log.info("Start getInvoiceDetail");
        String response = testService.callTest();
        log.info("End getInvoiceDetail with response {}", response);
        return ResponseEntity.ok(response);
    }
}
