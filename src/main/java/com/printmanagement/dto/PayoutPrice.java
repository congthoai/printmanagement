package com.printmanagement.dto;

public class PayoutPrice {

	public final float area;
	public final long price;

	public PayoutPrice(float area, long price) {
		this.area = area;
		this.price = price;
	}

	public PayoutPrice(String area, String price) {
		this.area = Float.parseFloat(area);
		this.price = Long.parseLong(price);
	}
}