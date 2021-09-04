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
@Table(name="item")
public class ItemEntity extends BaseEntity {
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "itemtype_id")
    private ItemTypeEntity itemtype;
	
	@OneToMany(mappedBy = "itemm")
	private List<PriceListEntity> pricelists = new ArrayList<>();
	
	@OneToMany(mappedBy = "item")
	private List<OrdersEntity> orders = new ArrayList<>();
	
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

	public List<PriceListEntity> getPricelists() {
		return pricelists;
	}

	public void setPricelists(List<PriceListEntity> pricelists) {
		this.pricelists = pricelists;
	}

	public List<OrdersEntity> getOrders() {
		return orders;
	}

	public void setOrders(List<OrdersEntity> orders) {
		this.orders = orders;
	}

	public ItemTypeEntity getItemtype() {
		return itemtype;
	}

	public void setItemtype(ItemTypeEntity itemtype) {
		this.itemtype = itemtype;
	}
	
	
	
}
