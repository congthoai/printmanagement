package com.printmanagement.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="customertype")
public class CustomerTypeEntity extends BaseEntity {
	@Column(name = "name")
	private String name;
	
	@Column(name = "code")
	private String code;
	
	@OneToMany(mappedBy = "customertypee")
	private List<PriceListEntity> pricelists = new ArrayList<>();
	
	@OneToMany(mappedBy = "customertype")
	private List<CustomerEntity> customers = new ArrayList<>();

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

	public List<PriceListEntity> getPricelists() {
		return pricelists;
	}

	public void setPricelists(List<PriceListEntity> pricelists) {
		this.pricelists = pricelists;
	}

	public List<CustomerEntity> getCustomers() {
		return customers;
	}

	public void setCustomers(List<CustomerEntity> customers) {
		this.customers = customers;
	}

	
	
	
}
