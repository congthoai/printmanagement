package com.printmanagement.converter;

import org.springframework.stereotype.Component;

import com.printmanagement.dto.CostDTO;
import com.printmanagement.entity.CostEntity;

@Component
public class CostConverter {
	public CostDTO toDto(CostEntity entity) {
		CostDTO dto = new CostDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setCode(entity.getCode());
		dto.setTotal(entity.getTotal());
		dto.setCostDate(entity.getCostdate());
		dto.setUnit(entity.getUnit());
		dto.setQuantity(entity.getQuantity());
		dto.setPrice(entity.getPrice());
		dto.setType(entity.getType());
		return dto;
	}
	
	public CostEntity toEntity(CostDTO dto) {
		CostEntity entity = new CostEntity();
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setTotal(dto.getTotal());
		entity.setCostdate(dto.getCostDate());
		entity.setUnit(dto.getUnit());
		entity.setQuantity(dto.getQuantity());
		entity.setPrice(dto.getPrice());
		entity.setType(dto.getType());
		return entity;
	}
	
	public CostEntity toEntity(CostEntity entity, CostDTO dto) {
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setTotal(dto.getTotal());
		entity.setCostdate(dto.getCostDate());
		entity.setUnit(dto.getUnit());
		entity.setQuantity(dto.getQuantity());
		entity.setPrice(dto.getPrice());
		entity.setType(dto.getType());
		return entity;
	}
}
