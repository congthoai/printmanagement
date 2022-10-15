package com.printmanagement.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="order_printer")
public class OrderOfPrinterEntity extends BaseEntity{
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "printer_id")
    private PrinterEntity printer;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "print_staff")
    private UserEntity printStaff;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "design_staff")
    private UserEntity designStaff;
	
	@OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "order_id", referencedColumnName = "id")
    private OrdersEntity orderr; // biến orderr này sẽ trùng  với giá trị  mappedBy trong Class OrderEntity 
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "filename")
	private String filename;
	
	@Column(name = "folderpath")
	private String folderpath;
	
	@Column(name = "status")
	private String status;
	
	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public PrinterEntity getPrinter() {
		return printer;
	}

	public void setPrinter(PrinterEntity printer) {
		this.printer = printer;
	}

	public UserEntity getPrintStaff() {
		return printStaff;
	}

	public void setPrintStaff(UserEntity printStaff) {
		this.printStaff = printStaff;
	}

	public UserEntity getDesignStaff() {
		return designStaff;
	}

	public void setDesignStaff(UserEntity designStaff) {
		this.designStaff = designStaff;
	}

	public OrdersEntity getOrderr() {
		return orderr;
	}

	public void setOrderr(OrdersEntity orderr) {
		this.orderr = orderr;
	}

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
