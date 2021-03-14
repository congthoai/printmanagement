package com.printmanagement.dto;

public class ReportBusinessPerformanceDTO  {
	private String startDate;
	private String endDate;
	private Long totalPurchaseMaterial;
	private Long totalCost;
	private Long totalSaleOrder;
	private Long totalDebt;
	private Long totalPaid;
	private Long totalRevenue;
	private Long totalLossMoney;
	private Double totalMaterialArea;
	private Double totalPrintArea;
	private Long count;
	
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Long getTotalPurchaseMaterial() {
		return totalPurchaseMaterial;
	}
	public void setTotalPurchaseMaterial(Long totalPurchaseMaterial) {
		this.totalPurchaseMaterial = totalPurchaseMaterial;
	}
	public Long getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(Long totalCost) {
		this.totalCost = totalCost;
	}
	public Long getTotalSaleOrder() {
		return totalSaleOrder;
	}
	public void setTotalSaleOrder(Long totalSaleOrder) {
		this.totalSaleOrder = totalSaleOrder;
	}
	public Long getTotalDebt() {
		return totalDebt;
	}
	public void setTotalDebt(Long totalDebt) {
		this.totalDebt = totalDebt;
	}
	public Long getTotalPaid() {
		return totalPaid;
	}
	public void setTotalPaid(Long totalPaid) {
		this.totalPaid = totalPaid;
	}
	public Long getTotalRevenue() {
		return totalRevenue;
	}
	public void setTotalRevenue(Long totalRevenue) {
		this.totalRevenue = totalRevenue;
	}
	public Long getTotalLossMoney() {
		return totalLossMoney;
	}
	public void setTotalLossMoney(Long totalLossMoney) {
		this.totalLossMoney = totalLossMoney;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public Double getTotalMaterialArea() {
		return totalMaterialArea;
	}
	public void setTotalMaterialArea(Double totalMaterialArea) {
		this.totalMaterialArea = totalMaterialArea;
	}
	public Double getTotalPrintArea() {
		return totalPrintArea;
	}
	public void setTotalPrintArea(Double totalPrintArea) {
		this.totalPrintArea = totalPrintArea;
	}
	
	
}
