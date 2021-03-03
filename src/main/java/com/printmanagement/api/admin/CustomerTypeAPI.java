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

import com.printmanagement.dto.CustomerTypeDTO;
import com.printmanagement.service.ICustomerTypeService;

@RestController(value="customertypeApiOfAdmin")
public class CustomerTypeAPI {
	@Autowired
	private ICustomerTypeService customertypeService;
	
	@PostMapping("/api/customertype")
	public CustomerTypeDTO createCustomerType(@RequestBody CustomerTypeDTO CustomerTypeDTO) {		
		return customertypeService.save(CustomerTypeDTO);
	}
	
	@PutMapping("/api/customertype")
	public CustomerTypeDTO updateCustomerType(@RequestBody CustomerTypeDTO CustomerTypeDTO) {	
		return customertypeService.save(CustomerTypeDTO);
	}
	
	@DeleteMapping("/api/customertype")
	public void deleteCustomerType(@RequestBody long[] ids) {
		customertypeService.delete(ids);
	}
	
	@GetMapping(value= {"/api/customertype", "/api/customertype/{id}"})
	public List<CustomerTypeDTO> getCustomerType(@PathVariable(required = false) Long id) {	
		List<CustomerTypeDTO> list = new ArrayList<>();
		if(id == null) {
			return  customertypeService.findAll();
		}
		list.add(customertypeService.findOne(id));
		return list;
	}
}
