package com.printmanagement.api.admin;

import java.util.Date;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.printmanagement.component.executor.CronTaskExecutor;
import com.printmanagement.component.json.JsonInternal;
import com.printmanagement.module.zalo.domain.ZaloRenewResult;

@RestController(value="testApi")

public class TestApi {

    @Autowired
    ScheduledThreadPoolExecutor scheduledExecutor;

    @Autowired
    CronTaskExecutor cronTaskExecutor;
    
    @Autowired
    JsonInternal json;
	
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
	
    
    @GetMapping("/token/renew")
    public ResponseEntity<?> renewToken2() {
	    try {
		    final String renewUrl = "https://oauth.zaloapp.com/v4/oa/access_token";
		    final String appId = "1758652931562150269";
		    final String secretKey = "kmI0R8dM4p54XbTZkPEL";
		    final String refreshToken = "v7fl5ehX4J7ZUseIZUuGCUDzQXM1y6PKapjBDPBkBdtm00f2xSG6Ey4F15lzyoCSt1P6QDV2DX-_E0qxjiCkRjLI4ohjasbfqbmI6jlDE63r91OqryngJDqxJZtrh7H0vI9F0E7qIdZu8amcbSXpGVjTGmBZYZvrq1mKByd9EsgZAH8dpkriT-8eR5AF-Wa4hXKjIPE6DmcQS1Xfa9Wd2gf215oxeW4TXra7MB-qFmMWOYr4bPjSCwKDOaoqoK0kdYDuMP3pO6Q97n4pvEqnVeTx4ZErj0XZXNWQ0e6XD2RgJGXb_8K6H_LLU27UkryAw79p8CMqRGJlRtrvWO1yCP9XP6czks4ofNDd5f-w5Ycb81bXik1dEjqPIsBtw4r3-7zM5lcoK6R3SbD1rPX97yDPUtnjMwD84elt5ZC";
		
		    final MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		    map.add("app_id", appId);
		    map.add("grant_type", "refresh_token");
		    map.add("refresh_token", refreshToken);
		
		    final RestTemplate restTemplate = new RestTemplate();
		    final HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		    headers.set("secret_key", secretKey);
		
		    final HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity<>(map, headers);
		
		    final ResponseEntity<String> response = restTemplate.postForEntity(renewUrl, request, String.class);
		    System.err.println(response);
		
		    final ZaloRenewResult result = json.fromJson(response.getBody(), ZaloRenewResult.class);
		
		    return ResponseEntity.status(HttpStatus.OK)
		    .body(result);
	    } catch (final Exception e) {
		    return ResponseEntity.status(HttpStatus.BAD_REQUEST)
		    .body(e.getMessage());
	    }
    }
}
