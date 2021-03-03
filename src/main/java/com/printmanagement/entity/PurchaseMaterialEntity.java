package com.printmanagement.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="purchasematerial")
public class PurchaseMaterialEntity extends BaseEntity {
	
	@OneToMany(mappedBy = "purchasematerial")
	private List<PurchaseMaterialDetailEntity> purchasematerialdetails = new ArrayList<>();
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "purchasedate")
	private Date purchasedate;
	
	@Column(name = "total")
	private Long total;

	public List<PurchaseMaterialDetailEntity> getPurchasematerialdetails() {
		return purchasematerialdetails;
	}

	public void setPurchasematerialdetails(List<PurchaseMaterialDetailEntity> purchasematerialdetails) {
		this.purchasematerialdetails = purchasematerialdetails;
	}

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

	public Date getPurchasedate() {
		return purchasedate;
	}

	public void setPurchasedate(Date purchasedate) {
		this.purchasedate = purchasedate;
	}
	
	

}
