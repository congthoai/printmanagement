package com.printmanagement.api.admin;

import java.util.Date;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.printmanagement.component.executor.CronTaskExecutor;

@RestController(value="testApi")

public class TestApi {

    @Autowired
    ScheduledThreadPoolExecutor scheduledExecutor;

    @Autowired
    CronTaskExecutor cronTaskExecutor;
	
	@GetMapping("/executor")
    public ResponseEntity<?> testExecutor() {
        try {
            scheduledExecutor.schedule(() -> {
                System.out.println("scheduledExecutor.schedule: " + new Date());
            }, 10, TimeUnit.SECONDS);

            cronTaskExecutor.schedule(() -> {
                System.out.println("cronTaskExecutor.schedule: " + new Date());
            }, "0/5 * * * * ?");

            return ResponseEntity.status(HttpStatus.OK)
                    .body("Executor running");
        } catch (final Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(e.getMessage());
        }
    }
}
