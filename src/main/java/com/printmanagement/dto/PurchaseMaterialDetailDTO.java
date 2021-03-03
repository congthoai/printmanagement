package com.printmanagement.dto;

public class PurchaseMaterialDetailDTO  extends AbstractDTO<PurchaseMaterialDetailDTO>{

	private String name;
	private String code;
	private Float size;
	private Float width;
	private Float area;
	private Long quantity;
	private Long price;
	private Long total;
	private MaterialDTO material;
	private PurchaseMaterialDTO purchasematerial;
	private Long materialid;
	private Long purchasematerialid;
	private String materialname;
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
	public Float getArea() {
		return area;
	}
	public void setArea(Float area) {
		this.area = area;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public MaterialDTO getMaterial() {
		return material;
	}
	public void setMaterial(MaterialDTO material) {
		this.material = material;
	}
	public PurchaseMaterialDTO getPurchasematerial() {
		return purchasematerial;
	}
	public void setPurchasematerial(PurchaseMaterialDTO purchasematerial) {
		this.purchasematerial = purchasematerial;
	}
	public Long getMaterialid() {
		return materialid;
	}
	public void setMaterialid(Long materialid) {
		this.materialid = materialid;
	}
	public Long getPurchasematerialid() {
		return purchasematerialid;
	}
	public void setPurchasematerialid(Long purchasematerialid) {
		this.purchasematerialid = purchasematerialid;
	}
	public String getMaterialname() {
		return materialname;
	}
	public void setMaterialname(String materialname) {
		this.materialname = materialname;
	}
	
	
	
}
