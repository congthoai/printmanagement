package com.printmanagement.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="printer")
public class PrinterEntity extends BaseEntity {
	
	@OneToMany(mappedBy = "printer")
	private List<OrderOfPrinterEntity> orderOfPrinters = new ArrayList<>();


	@Column(name = "name")
	private String name;
	
	@Column(name = "code")
	private String code;

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

	public List<OrderOfPrinterEntity> getOrderOfPrinters() {
		return orderOfPrinters;
	}

	public void setOrderOfPrinters(List<OrderOfPrinterEntity> orderOfPrinters) {
		this.orderOfPrinters = orderOfPrinters;
	}
	
	
}
