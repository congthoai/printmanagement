package com.printmanagement.config;


import java.time.Clock;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.printmanagement.component.json.JsonExternal;
import com.printmanagement.component.json.JsonInternal;

@Configuration
public class ComponentConfig {

    @Bean
    public Clock clock() {
        return Clock.systemUTC();
    }
    
    @Bean
    public JsonInternal jsonInternal() {
        return new JsonInternal();
    }

    @Bean
    public JsonExternal jsonExternal() {
        return new JsonExternal();
    }

//    @Bean
//    public HttpClientWrapper httpClientWrapper() {
//        return new HttpClientWrapper();
//    }
}