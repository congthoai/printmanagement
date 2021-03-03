package com.printmanagement.converter;

import com.printmanagement.entity.CustomerEntity;

import com.printmanagement.dto.CustomerDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerConverter {
	@Autowired
	CustomerTypeConverter customertypeConverter;
	
	public CustomerDTO toDto(CustomerEntity entity) {
		CustomerDTO dto = new CustomerDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setCode(entity.getCode());
		dto.setPhone(entity.getPhone());
		dto.setAddress(entity.getAddress());
		dto.setEmail(entity.getEmail());
		dto.setStatus(entity.getStatus());
		dto.setCustomertypeid(entity.getCustomertype().getId());
		dto.setCustomertype(customertypeConverter.toDto(entity.getCustomertype()));
		
		return dto;
	}
	
	public CustomerEntity toEntity(CustomerDTO dto) {
		CustomerEntity entity = new CustomerEntity();
		entity.setName(dto.getName());
		entity.setCode(dto.getCode());
		entity.setPhone(dto.getPhone());
		entity.setAddress(dto.getAddress());
		entity.setEmail(dto.getEmail());
		entity.setStatus(dto.getStatus());
		//entity.setCustomertype(customertypeConverter.toEntity(dto.getCustomertype()));
		
		return entity;
	}
	
	public CustomerEntity toEntity(CustomerEntity entity, CustomerDTO dto) {
		entity.setName(dto.getName());
		entity.setCode(dto.getCode());
		entity.setPhone(dto.getPhone());
		entity.setAddress(dto.getAddress());
		entity.setEmail(dto.getEmail());
		entity.setStatus(dto.getStatus());
		//entity.setCustomertype(customertypeConverter.toEntity(dto.getCustomertype()));
		
		return entity;
	}
}
