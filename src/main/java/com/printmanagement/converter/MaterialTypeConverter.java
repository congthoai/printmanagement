package com.printmanagement.converter;

import org.springframework.stereotype.Component;

import com.printmanagement.dto.MaterialTypeDTO;
import com.printmanagement.entity.MaterialTypeEntity;

@Component
public class MaterialTypeConverter {

    public MaterialTypeDTO toDto(MaterialTypeEntity entity) {
        MaterialTypeDTO dto = new MaterialTypeDTO();
        dto.setId(entity.getId());
        dto.setName(entity.getName());
        dto.setCode(entity.getCode());
        
        return dto;
    }
    
    public MaterialTypeEntity toEntity(MaterialTypeDTO dto) {
        MaterialTypeEntity entity = new MaterialTypeEntity();
        entity.setName(dto.getName());
        entity.setCode(dto.getCode());
        
        return entity;
    }
    
    public MaterialTypeEntity toEntity(MaterialTypeEntity entity, MaterialTypeDTO dto) {
        entity.setName(dto.getName());
        entity.setCode(dto.getCode());
        
        return entity;
    }
}
