package com.printmanagement.module.zalo.domain;

public class ZaloDeliveryItem {

	public final String mode = "development";
	public final String template_id = "296657";
	public final String phone;
	public final long orderId;
	public final ZaloTemplateData template_data;
	
	public ZaloDeliveryItem(long orderId, String phone, ZaloTemplateData templateData) {
		this.orderId=orderId;
		this.phone = phone;
		this.template_data = templateData;
	}
	
	public ZaloDeliveryItem(long orderId, String phone, String customerName, String customerCode, String orderDate, String orderCode, 
			String totalBill) {
		this.orderId=orderId;
		this.phone = phone;
		this.template_data = new ZaloTemplateData(orderCode, orderDate, customerName, customerCode, totalBill);
	}
}
