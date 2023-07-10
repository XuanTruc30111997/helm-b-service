package com.practice.bservice.properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

@Configuration
public class TestingProperties {
    @Autowired
    private Environment env;

    private String getProperty(String property) {
        return env.getProperty(property);
    }
}
