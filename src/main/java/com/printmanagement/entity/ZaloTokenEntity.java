package com.printmanagement.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.printmanagement.util.JdbcConverter;

@Entity
@Table(name="zalo_token")
public class ZaloTokenEntity  extends BaseEntity {
	
	@Column(name = "app_id")
	private long appId;

	@Column(name = "access_token", columnDefinition = "TEXT")
	private String accessToken;
	
	@Column(name = "refresh_token", columnDefinition = "TEXT")
	private String refreshToken;
	
	@Column(name = "expired_at")
	private Date expiredAt;
	
	@Column(name = "renew_at")
	private Date renewAt;
	
	@Column(name = "renew_expired_at")
	private Date renewExpiredAt;
	
//	public ZaloTokenEntity(long appId, String accessToken, String refreshToken, Date expiredAt, Date renewAt,
//			Date renewExpiredAt) {
//		super();
//		this.appId = appId;
//		this.accessToken = accessToken;
//		this.refreshToken = refreshToken;
//		this.expiredAt = expiredAt;
//		this.renewAt = renewAt;
//		this.renewExpiredAt = renewExpiredAt;
//	}
//	
//	public ZaloTokenEntity(long appId, String accessToken, String refreshToken, Date expiredAt, long renewAt,
//			long renewExpiredAt) {
//		super();
//		this.appId = appId;
//		this.accessToken = accessToken;
//		this.refreshToken = refreshToken;
//		this.expiredAt = expiredAt;
//		this.renewAt = JdbcConverter.toTimestamp(renewAt);
//		this.renewExpiredAt = JdbcConverter.toTimestamp(renewExpiredAt);
//	}

	public long getAppId() {
		return appId;
	}

	public void setAppId(long appId) {
		this.appId = appId;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

	public long getExpiredAt() {
		return expiredAt.getTime();
	}

	public void setExpiredAt(Date expiredAt) {
		this.expiredAt = expiredAt;
	}
	
	public void setExpiredAt(long expiredAt) {
		this.expiredAt = JdbcConverter.toTimestamp(expiredAt);
	}
	
	public long getRenewAt() {
		return renewAt.getTime();
	}

	public void setRenewAt(Date renewAt) {
		this.renewAt = renewAt;
	}
	
	public void setRenewAt(long renewAt) {
		this.renewAt = JdbcConverter.toTimestamp(renewAt);
	}

	public long getRenewExpiredAt() {
		return renewExpiredAt.getTime();
	}

	public void setRenewExpiredAt(Date renewExpiredAt) {
		this.renewExpiredAt = renewExpiredAt;
	}	
}
