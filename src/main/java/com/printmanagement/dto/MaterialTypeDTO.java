package com.printmanagement.dto;

import java.util.List;

public class MaterialTypeDTO extends AbstractDTO<MaterialTypeDTO> {

	private String name;
	private String code;
	private List<MaterialDTO> materials;
	
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
	public List<MaterialDTO> getMaterials() {
		return materials;
	}
	public void setMaterials(List<MaterialDTO> materials) {
		this.materials = materials;
	}
	
	
}
