package com.printmanagement.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.printmanagement.entity.PriceListEntity;
import com.printmanagement.repository.CustomerTypeRepository;
import com.printmanagement.repository.ItemRepository;
import com.printmanagement.dto.PriceListDTO;

@Component
public class PriceListConverter {
	@Autowired
	CustomerTypeRepository customertypeRepository;
	@Autowired
	ItemRepository itemRepository;
	
	public PriceListDTO toDto(PriceListEntity entity) {
		PriceListDTO dto = new PriceListDTO();
		dto.setId(entity.getId());
		dto.setCustomertypeid(entity.getCustomertypee().getId());
		dto.setItemid(entity.getItemm().getId());
		dto.setPrice(entity.getPrice());
		dto.setPayoutPrice(entity.getPayoutPrice());
		dto.setItemName(entity.getItemm().getName());
		dto.setCustomertypeName(entity.getCustomertypee().getName());
		dto.setCreatedBy(entity.getCreatedBy());
		dto.setCreatedDate(entity.getCreatedDate());
		dto.setModifiedDate(entity.getModifiedDate());
		dto.setModifiedBy(entity.getModifiedBy());
		
		return dto;
	}
	
	public PriceListEntity toEntity(PriceListDTO dto) {
		PriceListEntity entity = new PriceListEntity();
		entity.setCustomertypee(customertypeRepository.findOne(dto.getCustomertypeid()));
		entity.setItemm(itemRepository.findOne(dto.getItemid()));
		entity.setPrice(dto.getPrice());
		entity.setPayoutPrice(dto.getPayoutPriceStr());
		
		return entity;
	}
	
	public PriceListEntity toEntity(PriceListEntity entity, PriceListDTO dto) {
		entity.setCustomertypee(customertypeRepository.findOne(dto.getCustomertypeid()));
		entity.setItemm(itemRepository.findOne(dto.getItemid()));
		entity.setPrice(dto.getPrice());
		entity.setPayoutPrice(dto.getPayoutPriceStr());
		
		return entity;
	}
}
