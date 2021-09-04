package com.printmanagement.converter;

import org.springframework.stereotype.Component;

import com.printmanagement.dto.ItemTypeDTO;
import com.printmanagement.entity.ItemTypeEntity;

@Component
public class ItemTypeConverter {
	
    public ItemTypeDTO toDto(ItemTypeEntity entity) {
        ItemTypeDTO dto = new ItemTypeDTO();
        dto.setId(entity.getId());
        dto.setName(entity.getName());
        dto.setCode(entity.getCode());
        
        return dto;
    }
    
    public ItemTypeEntity toEntity(ItemTypeDTO dto) {
        ItemTypeEntity entity = new ItemTypeEntity();
        entity.setName(dto.getName());
        entity.setCode(dto.getCode());
        
        return entity;
    }
    
    public ItemTypeEntity toEntity(ItemTypeEntity entity, ItemTypeDTO dto) {
        entity.setName(dto.getName());
        entity.setCode(dto.getCode());
        
        return entity;
    }
}
