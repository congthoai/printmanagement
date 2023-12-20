package com.printmanagement.dto;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class PriceListDTO extends AbstractDTO<PriceListDTO> {
	private Long price;
	private Long itemid;
	private String itemName;
	private Long customertypeid;
	private String customertypeName;
	private List<PayoutPrice> payoutPrice;
	private String payoutPriceStr;

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

	public List<PayoutPrice> getPayoutPrice() {
		return payoutPrice;
	}

	public void setPayoutPrice(String payoutPrice) {
		if (payoutPrice == null) {
			payoutPrice = "";
		}
		this.payoutPriceStr = payoutPrice;
		this.payoutPrice = Arrays.asList(payoutPrice.split(";")).stream()
				.filter(price -> !price.isEmpty() && price.contains(":")).map(price -> {
					String[] elements = price.split(":");
					return new PayoutPrice(elements[0], elements[1]);
				}).collect(Collectors.toList());
	}

	public String getPayoutPriceStr() {
		return payoutPriceStr;
	}

	public boolean validatePayoutPrice(final String data) {
		if (data == null || data.isEmpty()
				|| !data.matches("^\\d+(\\.\\d+)?:\\d+(\\.\\d+)?(;\\d+(\\.\\d+)?:\\d+(\\.\\d+)?)*$")) {
			return false;
		}

		final List<PayoutPrice> rateList = Arrays.asList(data.split(";")).stream().map(item -> {
			final String[] elem = item.split(":");
			final int area = Integer.parseInt(elem[0]);
			final int price = Integer.parseInt(elem[1]);

			return new PayoutPrice(area, price);
		}).collect(Collectors.toList());

		PayoutPrice prev = null;
		for (final PayoutPrice elem : rateList) {
			if (prev != null && (elem.area >= prev.area || elem.price <= prev.price)) {
				return false;
			}

			prev = elem;
		}

		/** The last win area must be 0 */
		return rateList.get(rateList.size() - 1).area == 0;
	}
}
