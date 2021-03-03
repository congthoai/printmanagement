package com.printmanagement.api.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.printmanagement.dto.CustomerDTO;
import com.printmanagement.service.ICustomerService;

@RestController(value="customerApiOfAdmin")
public class CustomerAPI {
	@Autowired
	private ICustomerService customerService;
	
	@PostMapping("/api/customer")
	public CustomerDTO createCustomer(@RequestBody CustomerDTO CustomerDTO) {		
		return customerService.save(CustomerDTO);
	}
	
	@PutMapping("/api/customer")
	public CustomerDTO updatecustomer(@RequestBody CustomerDTO CustomerDTO) {	
		return customerService.save(CustomerDTO);
	}
	
	@DeleteMapping("/api/customer")
	public void deletecustomer(@RequestBody long[] ids) {
		customerService.delete(ids);
	}
	
	@GetMapping(value= {"/api/customer", "/api/customer/{id}"})
	public List<CustomerDTO> getCustomer(@PathVariable(required = false) Long id) {	
		List<CustomerDTO> list = new ArrayList<>();
		if(id == null) {
			return  customerService.findAll();
		}
		list.add(customerService.findOne(id));
		return list;
	}
}
