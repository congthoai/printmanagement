package com.printmanagement.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="materialtype")
public class MaterialTypeEntity extends BaseEntity {
	
	@OneToMany(mappedBy = "materialtype")
	private List<MaterialEntity> materials = new ArrayList<>();
	
	@Column(name = "name")
	private String name;

	@Column(name = "code")
	private String code;

	public List<MaterialEntity> getMaterials() {
		return materials;
	}

	public void setMaterials(List<MaterialEntity> materials) {
		this.materials = materials;
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
