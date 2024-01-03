package com.printmanagement.service.impl;

import java.sql.Timestamp;
import java.time.Clock;
import java.util.Date;
import java.util.concurrent.ScheduledThreadPoolExecutor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.printmanagement.component.executor.CronTaskExecutor;
import com.printmanagement.component.json.JsonInternal;
import com.printmanagement.entity.ZaloTokenEntity;
import com.printmanagement.repository.ZaloRepository;
import com.printmanagement.test.domain.ZaloRenewResult;
import com.printmanagement.test.domain.ZaloTokenItem;

@Service
public class ZaloTokenService {
	
	private final long BeforeRenewInMiliseconds = 3600*1000;
	private final String ZaloTokenEndpoint = "https://oauth.zaloapp.com/v4/oa/access_token";
	private final String SecretKey = "kmI0R8dM4p54XbTZkPEL";
	
	@Autowired
	ZaloRepository repository;
	
	@Autowired
	Clock clock;
	
	@Autowired
    JsonInternal json;

    ScheduledThreadPoolExecutor scheduledExecutor;
    CronTaskExecutor cronTaskExecutor;

    @Autowired
	public ZaloTokenService(ScheduledThreadPoolExecutor scheduledExecutor, CronTaskExecutor cronTaskExecutor) {
		this.scheduledExecutor = scheduledExecutor;
		this.cronTaskExecutor = cronTaskExecutor;
	
        cronTaskExecutor.schedule(this::renew, "0 /5 * * * ?");
	}
    
    public ZaloTokenItem getZaloItem() {
    	ZaloTokenEntity entity = repository.findTopByOrderByIdDesc();
    	if(entity == null) {
    		return null;
    	}
    	
    	return new ZaloTokenItem(entity.getId(), entity.getAppId(), entity.getRefreshToken(), entity.getRenewAt(), entity.getRenewExpiredAt());
    }
    
    public void renew() {
    	System.out.println("ZALO_SERVICE_CHECKING_TO_RENEW_TOKEN: cronTaskExecutor.schedule - " + new Date());
    	
    	try {
    		ZaloTokenItem item = getZaloItem();
        	if(item == null) {
        		return;
        	}
        	
        	if(item.renewAt - BeforeRenewInMiliseconds < clock.millis()) {
        		updateToken(item);
        	}
    	} catch (final Exception e) {
		    System.err.println(e.getMessage());
		    System.err.println("ZALO_SERVICE_RENEW_TOKEN_ERROR");
	    }
    }
    
    void updateToken(ZaloTokenItem item) {
    	try {
 		    final MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
 		    map.add("app_id", item.appId);
 		    map.add("refresh_token", item.refreshToken);
 		    map.add("grant_type", "refresh_token");
 		
 		    final RestTemplate restTemplate = new RestTemplate();
 		    final HttpHeaders headers = new HttpHeaders();
 		    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
 		    headers.set("secret_key", SecretKey);
 		
 		    final HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity<>(map, headers);
 		    final ResponseEntity<String> response = restTemplate.postForEntity(ZaloTokenEndpoint, request, String.class); 		
		    final ZaloRenewResult result = json.fromJson(response.getBody(), ZaloRenewResult.class);
		    
		    if(result.accessToken == null) {
			    System.err.println("ZALO_SERVICE_RENEW_TOKEN: Something wrong!");
			    // TODO: notify to zalo admin
		    	return;
		    }
		    
		    ZaloTokenEntity entity = repository.findOne(item.id);
		    long expiredAt = clock.millis() + result.getExpiredsInMiliseconds();
		    entity.setRefreshToken(result.refreshToken);
		    entity.setAccessToken(result.accessToken);
		    entity.setExpiredAt(expiredAt);
		    entity.setRenewAt(expiredAt - (60 * 5 * 1000));
		    
		    repository.save(entity);
		    
		    System.out.println("ZALO_SERVICE_RENEW_TOKEN_SUCCESSFULLY: " + new Date());
		    
	    } catch (final Exception e) {
		    System.err.println(e.getMessage());
		    System.err.println("ZALO_SERVICE_UPDATE_TOKEN_ERROR");
	    }
    }
}
