package com.printmanagement.converter;

import org.springframework.stereotype.Component;

import com.printmanagement.dto.CustomerTypeDTO;
import com.printmanagement.entity.CustomerTypeEntity;

@Component
public class CustomerTypeConverter {
	public CustomerTypeDTO toDto(CustomerTypeEntity entity) {
		CustomerTypeDTO dto = new CustomerTypeDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setCode(entity.getCode());
		
		return dto;
	}
	
	public CustomerTypeEntity toEntity(CustomerTypeDTO dto) {
		CustomerTypeEntity entity = new CustomerTypeEntity();
		entity.setName(dto.getName());
		entity.setCode(dto.getCode());
		
		return entity;
	}
	
	public CustomerTypeEntity toEntity(CustomerTypeEntity entity, CustomerTypeDTO dto) {
		entity.setName(dto.getName());
		entity.setCode(dto.getCode());
		
		return entity;
	}
}
