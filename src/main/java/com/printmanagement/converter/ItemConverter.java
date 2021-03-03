package com.printmanagement.converter;

import com.printmanagement.entity.ItemEntity;

import com.printmanagement.dto.ItemDTO;

import org.springframework.stereotype.Component;

@Component
public class ItemConverter {
	public ItemDTO toDto(ItemEntity entity) {
		ItemDTO dto = new ItemDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setCode(entity.getCode());
		
		return dto;
	}
	
	public ItemEntity toEntity(ItemDTO dto) {
		ItemEntity entity = new ItemEntity();
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		
		return entity;
	}
	
	public ItemEntity toEntity(ItemEntity entity, ItemDTO dto) {
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		
		return entity;
	}
}
