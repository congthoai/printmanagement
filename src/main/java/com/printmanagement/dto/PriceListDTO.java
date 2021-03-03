package com.printmanagement.dto;

public class PriceListDTO extends AbstractDTO<PriceListDTO> {
	private Long price;
	private Long itemid;
	private String itemName;
	private Long customertypeid;
	private String customertypeName;
	
	
	
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getCustomertypeName() {
		return customertypeName;
	}
	public void setCustomertypeName(String customertypeName) {
		this.customertypeName = customertypeName;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Long getItemid() {
		return itemid;
	}
	public void setItemid(Long itemid) {
		this.itemid = itemid;
	}
	public Long getCustomertypeid() {
		return customertypeid;
	}
	public void setCustomertypeid(Long customertypeid) {
		this.customertypeid = customertypeid;
	}
}
