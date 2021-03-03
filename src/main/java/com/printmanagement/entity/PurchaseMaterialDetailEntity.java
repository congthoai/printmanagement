package com.printmanagement.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="purchasematerialdetail")
public class PurchaseMaterialDetailEntity extends BaseEntity{
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "material_id")
    private MaterialEntity material;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "purchasematerial_id")
    private PurchaseMaterialEntity purchasematerial;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "size")
	private Float size;
	
	@Column(name = "width")
	private Float width;
	
	@Column(name = "area")
	private Float area;
	
	@Column(name = "quantity")
	private Long quantity;
	
	@Column(name = "price")
	private Long price;
	
	@Column(name = "total")
	private Long total;

	public MaterialEntity getMaterial() {
		return material;
	}

	public void setMaterial(MaterialEntity material) {
		this.material = material;
	}

	public PurchaseMaterialEntity getPurchasematerial() {
		return purchasematerial;
	}

	public void setPurchasematerial(PurchaseMaterialEntity purchasematerial) {
		this.purchasematerial = purchasematerial;
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
	
	
}
