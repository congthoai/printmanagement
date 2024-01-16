package com.printmanagement.module.zalo.domain;

import java.text.NumberFormat;
import java.util.Locale;

public class ZaloTemplateData {
	
	public final static NumberFormat CurrencyVN = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));

	public final String order_code;
	public final String order_date;
	public final String customer_name;
	public final String customer_code;
	public final String total_bill;
	
	public ZaloTemplateData(String orderCode, String orderDate, String customerName, String customerCode,
			String totalBill) {
		this.order_code = orderCode;
		this.order_date = orderDate;
		this.customer_name = customerName;
		this.customer_code = customerCode;
		this.total_bill = CurrencyVN.format(Long.parseLong(totalBill));
	}
}
