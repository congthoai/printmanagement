package com.printmanagement.dto;

public class CustomerDTO extends AbstractDTO<CustomerDTO> {
	private String name;
	private String code;
	private String address;
	private String email;
	private String phone;
	private Long status;
	private Long customertypeid;
	private CustomerTypeDTO customertype;
	


	public CustomerTypeDTO getCustomertype() {
		return customertype;
	}
	public void setCustomertype(CustomerTypeDTO customertype) {
		this.customertype = customertype;
	}
		
	public Long getCustomertypeid() {
		return customertypeid;
	}
	public void setCustomertypeid(Long customertypeid) {
		this.customertypeid = customertypeid;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	
	
	
}
