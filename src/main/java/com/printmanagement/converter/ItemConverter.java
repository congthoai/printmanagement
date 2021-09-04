package com.printmanagement.converter;

import com.printmanagement.entity.ItemEntity;

import com.printmanagement.dto.ItemDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ItemConverter {
	
	@Autowired
	ItemTypeConverter itemTypeConverter;
	
	public ItemDTO toDto(ItemEntity entity) {
		ItemDTO dto = new ItemDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setCode(entity.getCode());
		dto.setItemtypeid(entity.getItemtype().getId());
		dto.setItemtype(itemTypeConverter.toDto(entity.getItemtype()));
		
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
