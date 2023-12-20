package com.printmanagement.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="pricelist")
public class PriceListEntity extends BaseEntity {
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customertype_id")
    private CustomerTypeEntity customertypee;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private ItemEntity itemm;
	
	@Column(name = "price")
	private Long price;
	
	@Column(name = "payout_price")
	private String payoutPrice;

	
	public CustomerTypeEntity getCustomertypee() {
		return customertypee;
	}

	public void setCustomertypee(CustomerTypeEntity customertypee) {
		this.customertypee = customertypee;
	}

	public ItemEntity getItemm() {
		return itemm;
	}

	public void setItemm(ItemEntity itemm) {
		this.itemm = itemm;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public String getPayoutPrice() {
		return payoutPrice;
	}

	public void setPayoutPrice(String payoutPrice) {
		this.payoutPrice = payoutPrice;
	}
}
