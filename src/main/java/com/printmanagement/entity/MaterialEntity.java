package com.printmanagement.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="material")
public class MaterialEntity extends BaseEntity {
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "materialtype_id")
    private MaterialTypeEntity materialtype;
	
	@OneToMany(mappedBy = "material")
	private List<PurchaseMaterialDetailEntity> purchasematerialdetails = new ArrayList<>();
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "code")
	private String code;

	@Column(name = "size")
	private Float size;
	
	@Column(name = "width")
	private Float width;

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

	public Float getSize() {
		return size;
	}

	public void setSize(Float size) {
		this.size = size;
	}

	public Float getWidth() {
		return width;
	}

	public void setWidth(Float width) {
		this.width = width;
	}

	public MaterialTypeEntity getMaterialtype() {
		return materialtype;
	}

	public void setMaterialtype(MaterialTypeEntity materialtype) {
		this.materialtype = materialtype;
	}
	
	
}
