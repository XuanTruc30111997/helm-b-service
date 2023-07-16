package com.practice.bservice.service;

import com.practice.bservice.properties.TestingProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {
    @Autowired
    TestingProperties testingProperties;
    @Override
    public String callTest() {
        return "This is B " + testingProperties.getSomething() + " - with Blue version";
    }
}
