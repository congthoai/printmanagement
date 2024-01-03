package com.printmanagement.test.domain;

import com.google.gson.annotations.SerializedName;

public class ZaloRenewResult {

    @SerializedName("access_token")
    public final String accessToken;

    @SerializedName("refresh_token")
    public final String refreshToken;

    @SerializedName("expires_in")
    public final String expiresIn;
    
    public ZaloRenewResult(final String accessToken, final String refreshToken, final String expiresIn) {
        this.accessToken = accessToken;
        this.refreshToken = refreshToken;
        this.expiresIn = expiresIn;
    }
    
    public long getExpiredsInMiliseconds() {
    	return Long.parseLong(expiresIn) * 1000;
    }
}