package com.printmanagement.module.zalo.domain;

public class ZaloTokenItem {

    public final long id;
    public final String appId;
    public final String refreshToken;
    public final long renewAt;
    public final long renewExpiredAt;
    
	public ZaloTokenItem(long id, long appId, String refreshToken, long renewAt, long renewExpiredAt) {
		this.id=id;
		this.appId = String.valueOf(appId);
		this.refreshToken = refreshToken;
		this.renewAt = renewAt;
		this.renewExpiredAt = renewExpiredAt;
	}
}