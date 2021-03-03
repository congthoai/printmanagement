package com.printmanagement.dto;

import java.util.Date;

/**
 * @author NCT
 *
 */
public class OrdersDTO extends AbstractDTO<OrdersDTO> {

	private String code;
	private String content;
	private Float width;
	private Float height;
	private Long quantity;
	private Float area;
	private Long price;
	private Long total;
	private String status;
	private String statusAlert;
	private Long paid;
	private Long debt;
	private Long itemid;
	private Long customerid;
	private ItemDTO item;
	private CustomerDTO customer;
	private Date paymentDate;
	private Date orderDate;
	private String orderDateStr;
	private String startDate;
	private String endDate;
	private String startPaymentDate;
	private String endPaymentDate;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Float getWidth() {
		return width;
	}
	public void setWidth(Float width) {
		this.width = width;
	}
	public Float getHeight() {
		return height;
	}
	public void setHeight(Float height) {
		this.height = height;
	}
	public Float getArea() {
		return area;
	}
	public void setArea(Float area) {
		this.area = area;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}

	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getPaid() {
		return paid;
	}
	public void setPaid(Long paid) {
		this.paid = paid;
	}
	public Long getDebt() {
		return debt;
	}
	public void setDebt(Long debt) {
		this.debt = debt;
	}
	public Long getItemid() {
		return itemid;
	}
	public void setItemid(Long itemid) {
		this.itemid = itemid;
	}
	public Long getCustomerid() {
		return customerid;
	}
	public void setCustomerid(Long customerid) {
		this.customerid = customerid;
	}
	public ItemDTO getItem() {
		return item;
	}
	public void setItem(ItemDTO item) {
		this.item = item;
	}
	public CustomerDTO getCustomer() {
		return customer;
	}
	public void setCustomer(CustomerDTO customer) {
		this.customer = customer;
	}
	public String getStatusAlert() {
		return statusAlert;
	}
	public void setStatusAlert(String statusAlert) {
		this.statusAlert = statusAlert;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartPaymentDate() {
		return startPaymentDate;
	}
	public void setStartPaymentDate(String startPaymentDate) {
		this.startPaymentDate = startPaymentDate;
	}
	public String getEndPaymentDate() {
		return endPaymentDate;
	}
	public void setEndPaymentDate(String endPaymentDate) {
		this.endPaymentDate = endPaymentDate;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderDateStr() {
		return orderDateStr;
	}
	public void setOrderDateStr(String orderDateStr) {
		this.orderDateStr = orderDateStr;
	}

	
}
