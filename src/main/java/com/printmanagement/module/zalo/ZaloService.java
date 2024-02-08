package com.printmanagement.module.zalo;

import java.time.Clock;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.stream.Collectors;

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
import com.printmanagement.module.zalo.domain.ZaloDeliveryItem;
import com.printmanagement.module.zalo.domain.ZaloMessageResult;
import com.printmanagement.module.zalo.domain.ZaloRenewResult;
import com.printmanagement.module.zalo.domain.ZaloTokenItem;
import com.printmanagement.repository.ZaloRepository;
import com.printmanagement.service.impl.OrdersService;
import com.printmanagement.util.StringUtils;


@Service
public class ZaloService {
	
	private String ZALO_TOKEN = "-odW8QWfr3ZyAEKbhoRLEFmkvIAZE855yKVbC_emY2_uFizXn6g26ey2r7MCJOKoZoUnNwLJr2If2hnFW73f0RSlf1cbKVP-aJh05gTIzLodNRelj5VWOkOcZXIrSkbmbWEW5xfFv5Il9gik-IQOHV5CgJ_WHziZ_qZgFE0WdL-qIwOTaJZnN8yoW1QBPyjjgcpz9AjvYKMU5TimdLcyJB8ExIo7RDzEbcAd6uK9uLQq2Q0TkNt0GP1qboUvUiecdHQBNPn2opkMB89Jbc74EP8VZr6LTliqom6kLVvMpJ7l7vzlwatPTiL6l1UGEVril6E6EUmhrKFUS9W3YY3-H9PDenl09VXpqcgYAziczL3DKPjH_W-iFzG3urNuKuWGy5BySUyRi3_eGFqaxJVFEBuzerfJPZW2BAa_qpe";
	private final long BeforeRenewInMiliseconds = 3600*1000;
	private final String ZaloTokenEndpoint = "https://oauth.zaloapp.com/v4/oa/access_token";
	private final String ZaloMessageEndpoint = "https://business.openapi.zalo.me/message/template";
	private final String SecretKey = "kmI0R8dM4p54XbTZkPEL";
	
	@Autowired
	ZaloRepository repository;
	
	@Autowired
	Clock clock;
	
	@Autowired
    JsonInternal json;
	
	@Autowired
	OrdersService orderService;

    ScheduledThreadPoolExecutor scheduledExecutor;
    CronTaskExecutor cronTaskExecutor;

    @Autowired
	public ZaloService(ScheduledThreadPoolExecutor scheduledExecutor, CronTaskExecutor cronTaskExecutor) {
		this.scheduledExecutor = scheduledExecutor;
		this.cronTaskExecutor = cronTaskExecutor;
	
        cronTaskExecutor.schedule(this::renew, "0 /5 * * * ?");
        cronTaskExecutor.schedule(this::testZaloToken, "* 8 * * * ?");
        cronTaskExecutor.schedule(this::sendDeliveryMessage, "0 /1 * * * ?");
	}
    
    public void testZaloToken() {
    	sendZaloNotification(new ZaloDeliveryItem(0L, "84983583845", "TestAPI", "Inphattin", "Chao buoi sang!", "Day la tin nhan tu dong", "^^"));
    	sendZaloNotification(new ZaloDeliveryItem(0L, "84947010777", "TestAPI", "Inphattin", "Chao buoi sang!", "Day la tin nhan tu dong", "^^"));
    }
    
	public void sendDeliveryMessage() {
		if(ZALO_TOKEN.equals(StringUtils.Empty)) {
			return;
		}

		List<ZaloDeliveryItem> list = orderService.getDeliveryList().stream().map(order->new ZaloDeliveryItem(order.getId(), order.getCustomer().getPhone(),
				order.getCustomer().getName(), order.getCustomer().getCode(), order.getOrderDate().toString(), 
				order.getCode(), String.valueOf(order.getTotal()))).collect(Collectors.toList());
		
		List<Long> notifiedIds = new ArrayList<>();
		list.forEach(item -> {
			if(item.phone.isEmpty() || sendZaloNotification(item)) {
				notifiedIds.add(item.orderId);
			}
		});	
		
		orderService.sendNotify(notifiedIds);
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
		    
		    ZALO_TOKEN = result.accessToken;
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
    
    boolean sendZaloNotification(ZaloDeliveryItem item) {
    	try {
 		    final RestTemplate restTemplate = new RestTemplate();
 		    final HttpHeaders headers = new HttpHeaders();
 		    headers.setContentType(MediaType.APPLICATION_JSON);
 		    headers.set("access_token", ZALO_TOKEN);
		 		    
 		    HttpEntity<ZaloDeliveryItem> request = new HttpEntity<>(item, headers);
 		    final ResponseEntity<String> response = restTemplate.postForEntity(ZaloMessageEndpoint, request, String.class); 		
		    final ZaloMessageResult result = json.fromJson(response.getBody(), ZaloMessageResult.class);
		    if(result.error == 0) {
		    	return true;
		    }		    
	    } catch (final Exception e) {
		    System.err.println(e.getMessage());
		    System.err.println("ZALO_SERVICE_SEND_MESSAGE_ERROR");
	    }
    	
    	return false;
    }
}
