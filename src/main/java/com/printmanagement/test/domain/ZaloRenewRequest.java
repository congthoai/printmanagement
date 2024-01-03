package com.printmanagement.test.domain;

public class ZaloRenewRequest {

    public final long appId;
    public final String refreshToken;
    public final String grantType;

    public ZaloRenewRequest(final long appId, final String refreshToken, final String grantType) {
        this.appId = appId;
        this.refreshToken = refreshToken;
        this.grantType = grantType;
    }
    
    public ZaloRenewRequest(final long appId, final String refreshToken) {
        this.appId = appId;
        this.refreshToken = refreshToken;
        this.grantType = "authorization_code";
    }
}