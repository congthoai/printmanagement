package com.printmanagement.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="orders")
public class OrdersEntity extends BaseEntity{
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private ItemEntity item;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    private CustomerEntity customer;
	
   @OneToOne(mappedBy = "orderr")
    private OrderOfPrinterEntity orderOfPrinter;
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "width")
	private Float width;
	
	@Column(name = "height")
	private Float height;
	
	@Column(name = "quantity")
	private Long quantity;
	
	@Column(name = "area")
	private Float area;
	
	@Column(name = "price")
	private Long price;
	
	@Column(name = "total")
	private Long total;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "paid")
	private Long paid;
	
	@Column(name = "debt")
	private Long debt;
	
	@Column(name = "orderdate")
	private Date orderDate;
	
	@Column(name = "paymentdate")
	private Date paymentDate;

	
	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public ItemEntity getItem() {
		return item;
	}

	public void setItem(ItemEntity item) {
		this.item = item;
	}

	

	public CustomerEntity getCustomer() {
		return customer;
	}

	public void setCustomer(CustomerEntity customer) {
		this.customer = customer;
	}

	public OrderOfPrinterEntity getOrderOfPrinter() {
		return orderOfPrinter;
	}

	public void setOrderOfPrinter(OrderOfPrinterEntity orderOfPrinter) {
		this.orderOfPrinter = orderOfPrinter;
	}

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

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public Float getArea() {
		return area;
	}

	public void setArea(Float area) {
		this.area = area;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
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

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
	
	
}
