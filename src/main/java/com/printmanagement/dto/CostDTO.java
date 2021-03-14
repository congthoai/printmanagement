package com.printmanagement.dto;

import java.util.Date;

/**
 * @author NCT
 *
 */
public class CostDTO extends AbstractDTO<CostDTO>{
	private String name;
	private String code;
	private Date costDate;
	private String unit;
	private Long quantity;
	private Long price;
	private Long total;
	private String startDate;
	private String endDate;
	private Long totalAll;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public Date getCostDate() {
		return costDate;
	}
	public void setCostDate(Date costDate) {
		this.costDate = costDate;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
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
	public Long getTotalAll() {
		return totalAll;
	}
	public void setTotalAll(Long totalAll) {
		this.totalAll = totalAll;
	}
	
	
	
	
}
