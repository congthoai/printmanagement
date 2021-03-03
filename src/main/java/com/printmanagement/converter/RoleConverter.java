package com.printmanagement.converter;

import org.springframework.stereotype.Component;

import com.printmanagement.dto.RoleDTO;
import com.printmanagement.entity.RoleEntity;

@Component
public class RoleConverter {

	public RoleDTO toDto(RoleEntity entity) {
		RoleDTO result = new RoleDTO();
		result.setName(entity.getName());
		result.setCode(entity.getCode());
		return result;
	}
	
	public RoleEntity toEntity(RoleDTO dto) {
		RoleEntity result = new RoleEntity();
		result.setCode(dto.getCode());
		result.setName(dto.getName());
		return result;
	}
}
