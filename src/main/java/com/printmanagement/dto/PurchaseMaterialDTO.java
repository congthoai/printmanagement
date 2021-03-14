package com.printmanagement.dto;

import java.util.Date;
import java.util.List;

public class PurchaseMaterialDTO extends AbstractDTO<PurchaseMaterialDTO>{

	private String name;
	private String code;
	private Long total;
	private Date purchaseDate;
	private List<PurchaseMaterialDetailDTO> purchasematerialdetails;
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
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public List<PurchaseMaterialDetailDTO> getPurchasematerialdetails() {
		return purchasematerialdetails;
	}
	public void setPurchasematerialdetails(List<PurchaseMaterialDetailDTO> purchasematerialdetails) {
		this.purchasematerialdetails = purchasematerialdetails;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
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
