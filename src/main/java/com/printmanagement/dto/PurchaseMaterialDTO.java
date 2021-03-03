package com.printmanagement.dto;

import java.util.Date;
import java.util.List;

public class PurchaseMaterialDTO extends AbstractDTO<PurchaseMaterialDTO>{

	private String name;
	private String code;
	private Long total;
	private Date purchaseDate;
	private List<PurchaseMaterialDetailDTO> purchasematerialdetails;
	
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


	
	
}
