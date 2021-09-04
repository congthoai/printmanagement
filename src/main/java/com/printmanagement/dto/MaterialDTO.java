package com.printmanagement.dto;

import java.util.List;

public class MaterialDTO extends AbstractDTO<MaterialDTO> {
	private String code;
	private String name;
	private Float size;
	private Float width; 
	private List<PurchaseMaterialDetailDTO> purchasematerialdetails;
	private Long materialtypeid;
	private MaterialTypeDTO materialtype;
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public List<PurchaseMaterialDetailDTO> getPurchasematerialdetails() {
		return purchasematerialdetails;
	}
	public void setPurchasematerialdetails(List<PurchaseMaterialDetailDTO> purchasematerialdetails) {
		this.purchasematerialdetails = purchasematerialdetails;
	}
	public Long getMaterialtypeid() {
		return materialtypeid;
	}
	public void setMaterialtypeid(Long materialtypeid) {
		this.materialtypeid = materialtypeid;
	}
	public MaterialTypeDTO getMaterialtype() {
		return materialtype;
	}
	public void setMaterialtype(MaterialTypeDTO materialtype) {
		this.materialtype = materialtype;
	}

	
	
	
}
