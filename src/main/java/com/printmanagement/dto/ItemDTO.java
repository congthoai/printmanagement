package com.printmanagement.dto;

import java.util.List;

public class ItemDTO extends AbstractDTO<ItemDTO> {
	private String name;
	private String code;
	private List<PriceListDTO> pricelists;
	
	
	
	public List<PriceListDTO> getPricelists() {
		return pricelists;
	}
	public void setPricelists(List<PriceListDTO> pricelists) {
		this.pricelists = pricelists;
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
}
