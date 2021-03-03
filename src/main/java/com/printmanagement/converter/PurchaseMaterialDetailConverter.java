package com.printmanagement.converter;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.printmanagement.dto.PurchaseMaterialDetailDTO;
import com.printmanagement.entity.PurchaseMaterialDetailEntity;

@Component
public class PurchaseMaterialDetailConverter {

	public PurchaseMaterialDetailDTO toDto(PurchaseMaterialDetailEntity entity) {
		PurchaseMaterialDetailDTO dto = new PurchaseMaterialDetailDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setCode(entity.getCode());
		dto.setSize(entity.getSize());
		dto.setWidth(entity.getWidth());
		dto.setArea(entity.getArea());
		dto.setQuantity(entity.getQuantity());
		dto.setPrice(entity.getPrice());
		dto.setMaterialid(entity.getMaterial().getId());
		dto.setMaterialname(entity.getMaterial().getName());
		dto.setPurchasematerialid(entity.getPurchasematerial().getId());
		
		dto.setTotal(entity.getTotal());
		
		return dto;
	}
	
	public PurchaseMaterialDetailEntity toEntity(PurchaseMaterialDetailDTO dto) {
		PurchaseMaterialDetailEntity entity = new PurchaseMaterialDetailEntity();
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setQuantity(dto.getQuantity());
		entity.setPrice(dto.getPrice());
		return entity;
	}
	
	public PurchaseMaterialDetailEntity toEntity(PurchaseMaterialDetailEntity entity, PurchaseMaterialDetailDTO dto) {
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setQuantity(dto.getQuantity());
		entity.setPrice(dto.getPrice());
		return entity;
	}
	
	public List<PurchaseMaterialDetailDTO> toDtoList(List<PurchaseMaterialDetailEntity> entities) {
		List<PurchaseMaterialDetailDTO> dtoList = new ArrayList<>();
		
		for (PurchaseMaterialDetailEntity entity : entities) {
			dtoList.add(toDto(entity));
		}
		
		return dtoList;
	}
}
