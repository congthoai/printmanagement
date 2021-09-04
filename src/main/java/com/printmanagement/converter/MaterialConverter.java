package com.printmanagement.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.printmanagement.dto.MaterialDTO;
import com.printmanagement.entity.MaterialEntity;

@Component
public class MaterialConverter {
	
	@Autowired
	MaterialTypeConverter materialTypeConverter;
	
	public MaterialDTO toDto(MaterialEntity entity) {
		MaterialDTO dto = new MaterialDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setCode(entity.getCode());
		dto.setSize(entity.getSize());
		dto.setWidth(entity.getWidth());
		dto.setMaterialtypeid(entity.getMaterialtype().getId());
		dto.setMaterialtype(materialTypeConverter.toDto(entity.getMaterialtype()));
		
		return dto;
	}
	
	public MaterialEntity toEntity(MaterialDTO dto) {
		MaterialEntity entity = new MaterialEntity();
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setSize(dto.getSize());
		entity.setWidth(dto.getWidth());
		return entity;
	}
	
	public MaterialEntity toEntity(MaterialEntity entity, MaterialDTO dto) {
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setSize(dto.getSize());
		entity.setWidth(dto.getWidth());
		return entity;
	}
}
