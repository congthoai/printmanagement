package com.printmanagement.dto;

import java.util.List;

public class ItemTypeDTO extends AbstractDTO<ItemTypeDTO> {
	
	private String name;
	private String code;
	private List<ItemDTO> items;
	
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
	public List<ItemDTO> getItems() {
		return items;
	}
	public void setItems(List<ItemDTO> items) {
		this.items = items;
	}

	
}
