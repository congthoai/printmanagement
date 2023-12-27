package com.printmanagement.config;

import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadPoolExecutor.CallerRunsPolicy;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.printmanagement.component.executor.CronTaskExecutor;


@Configuration
public class ExecutorConfig {

    private final int corePoolSize = 10;

    @Bean
    public ScheduledThreadPoolExecutor scheduledThreadPoolExecutor() {
        final ScheduledThreadPoolExecutor executor = new ScheduledThreadPoolExecutor(corePoolSize,
                new CallerRunsPolicy());

        return executor;
    }

    @Bean
    public CronTaskExecutor cronTaskExecutor() {
        return new CronTaskExecutor();
    }
}