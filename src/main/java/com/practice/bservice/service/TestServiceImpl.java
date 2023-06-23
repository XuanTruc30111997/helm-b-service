package com.practice.bservice.service;

import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {
    @Override
    public String callTest() {
        return "This is B - with Rolling version";
    }
}
