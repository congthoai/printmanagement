package com.printmanagement.dto;

import java.util.List;

public class PrinterDTO extends AbstractDTO<PrinterDTO> {
	private String name;
	private String code;
	private List<OrderOfPrinterDTO> orderOfPrinterList;
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
	public List<OrderOfPrinterDTO> getOrderOfPrinterList() {
		return orderOfPrinterList;
	}
	public void setOrderOfPrinterList(List<OrderOfPrinterDTO> orderOfPrinterList) {
		this.orderOfPrinterList = orderOfPrinterList;
	}
	
	
}
