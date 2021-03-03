package com.printmanagement.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.printmanagement.dto.OrdersDTO;
import com.printmanagement.entity.OrdersEntity;

@Component
public class OrdersConverter {
	@Autowired
	private CustomerConverter customerConverter;
	@Autowired
	private ItemConverter itemConverter;
	
	public OrdersDTO toDto(OrdersEntity entity) {
		OrdersDTO dto = new OrdersDTO();
		dto.setId(entity.getId());
		dto.setCode(entity.getCode());
		dto.setContent(entity.getContent());
		dto.setWidth(entity.getWidth());
		dto.setHeight(entity.getHeight());
		dto.setQuantity(entity.getQuantity());
		dto.setArea(entity.getArea());
		dto.setPrice(entity.getPrice());
		dto.setTotal(entity.getTotal());
		dto.setPaid(entity.getPaid());
		dto.setDebt(entity.getDebt());
		dto.setItemid(entity.getItem().getId());
		dto.setCustomerid(entity.getCustomer().getId());
		dto.setItem(itemConverter.toDto(entity.getItem()));
		dto.setCustomer(customerConverter.toDto(entity.getCustomer()));
		dto.setCreatedBy(entity.getCreatedBy());
		dto.setCreatedDate(entity.getCreatedDate());
		dto.setModifiedDate(entity.getModifiedDate());
		dto.setModifiedBy(entity.getModifiedBy());
		dto.setPaymentDate(entity.getPaymentDate());
		dto.setOrderDate(entity.getOrderDate());
		dto.setDescription(entity.getDescription());
		dto.setStatus(entity.getStatus());
		String statusAlert = "label-warning";
		if(entity.getStatus() != null) {
			statusAlert = entity.getStatus().equals("paid") ? "label-success" :  entity.getStatus().equals("unpaid") ? "label-warning" : "label-info";
			dto.setStatus(entity.getStatus());
		}
		
		dto.setStatusAlert(statusAlert);
		return dto;
	}
	
	public OrdersEntity toEntity(OrdersDTO dto) {
		OrdersEntity entity = new OrdersEntity();
		entity.setCode(dto.getCode());
		entity.setContent(dto.getContent());
		entity.setWidth(dto.getWidth());
		entity.setHeight(dto.getHeight());
		entity.setQuantity(dto.getQuantity());
		entity.setArea(dto.getArea());
		entity.setPrice(dto.getPrice());
		entity.setTotal(dto.getTotal());
		entity.setStatus(dto.getStatus());
		entity.setPaid(dto.getPaid());
		entity.setDebt(dto.getDebt());
		
		return entity;
	}
	
	public OrdersEntity toEntity(OrdersEntity entity, OrdersDTO dto) {
		entity.setCode(dto.getCode());
		entity.setContent(dto.getContent());
		entity.setWidth(dto.getWidth());
		entity.setHeight(dto.getHeight());
		entity.setQuantity(dto.getQuantity());
		entity.setArea(dto.getArea());
		entity.setPrice(dto.getPrice());
		entity.setTotal(dto.getTotal());
		entity.setStatus(dto.getStatus());
		entity.setPaid(dto.getPaid());
		entity.setDebt(dto.getDebt());
		
		return entity;
	}
}
