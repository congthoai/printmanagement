package com.printmanagement.dto;

public class OrderOfPrinterDTO extends AbstractDTO<OrderOfPrinterDTO> {
	private String name;
	private String code;
	private String content;
	private String filename;
	private String folderpath;
	private PrinterDTO printer;
	private Long printerId;
	private UserDTO printStaff;
	private Long printStaffId;
	private UserDTO designStaff;
	private Long designStaffId;
	private OrdersDTO orderr;
	private Long orderId;
	private String status;
	private String statusAlert;
	private String startDate;
	private String endDate;
	
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
	public String getStatusAlert() {
		return statusAlert;
	}
	public void setStatusAlert(String statusAlert) {
		this.statusAlert = statusAlert;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public PrinterDTO getPrinter() {
		return printer;
	}
	public void setPrinter(PrinterDTO printer) {
		this.printer = printer;
	}
	public Long getPrinterId() {
		return printerId;
	}
	public void setPrinterId(Long printerId) {
		this.printerId = printerId;
	}

	public UserDTO getPrintStaff() {
		return printStaff;
	}
	public void setPrintStaff(UserDTO printStaff) {
		this.printStaff = printStaff;
	}
	public Long getPrintStaffId() {
		return printStaffId;
	}
	public void setPrintStaffId(Long printStaffId) {
		this.printStaffId = printStaffId;
	}
	public UserDTO getDesignStaff() {
		return designStaff;
	}
	public void setDesignStaff(UserDTO designStaff) {
		this.designStaff = designStaff;
	}
	public Long getDesignStaffId() {
		return designStaffId;
	}
	public void setDesignStaffId(Long designStaffId) {
		this.designStaffId = designStaffId;
	}
	public OrdersDTO getOrderr() {
		return orderr;
	}
	public void setOrderr(OrdersDTO orderr) {
		this.orderr = orderr;
	}
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFolderpath() {
		return folderpath;
	}
	public void setFolderpath(String folderpath) {
		this.folderpath = folderpath;
	}
	
	
	
}
