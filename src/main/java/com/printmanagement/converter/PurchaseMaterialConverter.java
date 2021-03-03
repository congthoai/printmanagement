package com.printmanagement.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.printmanagement.dto.PurchaseMaterialDTO;
import com.printmanagement.entity.PurchaseMaterialEntity;

@Component
public class PurchaseMaterialConverter {
	@Autowired
	PurchaseMaterialDetailConverter purchaseMaterialDetailConverter;

	public PurchaseMaterialDTO toDto(PurchaseMaterialEntity entity) {
		PurchaseMaterialDTO dto = new PurchaseMaterialDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setCode(entity.getCode());
		dto.setTotal(entity.getTotal());
		dto.setPurchaseDate(entity.getPurchasedate());
		dto.setModifiedDate(entity.getModifiedDate());
		dto.setDescription(entity.getDescription());
		dto.setPurchasematerialdetails(purchaseMaterialDetailConverter.toDtoList(entity.getPurchasematerialdetails()));
		
		return dto;
	}
	
	public PurchaseMaterialEntity toEntity(PurchaseMaterialDTO dto) {
		PurchaseMaterialEntity entity = new PurchaseMaterialEntity();
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setPurchasedate(dto.getPurchaseDate());
		entity.setDescription(dto.getDescription());
		return entity;
	}
	
	public PurchaseMaterialEntity toEntity(PurchaseMaterialEntity entity, PurchaseMaterialDTO dto) {
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setDescription(dto.getDescription());
		entity.setPurchasedate(dto.getPurchaseDate());
		return entity;
	}
	
	
}
