package com.printmanagement.converter;

import org.springframework.stereotype.Component;

import com.printmanagement.dto.PrinterDTO;
import com.printmanagement.entity.PrinterEntity;

@Component
public class PrinterConverter {
   
    
    public PrinterDTO toDto(PrinterEntity entity) {
        PrinterDTO dto = new PrinterDTO();
        dto.setId(entity.getId());
        dto.setName(entity.getName());
        dto.setCode(entity.getCode());
        dto.setDescription(entity.getDescription());
        
        return dto;
    }
    
    public PrinterEntity toEntity(PrinterDTO dto) {
        PrinterEntity entity = new PrinterEntity();
        entity.setCode(dto.getCode());
        entity.setName(dto.getName());
        entity.setDescription(dto.getDescription());
        
        return entity;
    }
    
    public PrinterEntity toEntity(PrinterEntity entity, PrinterDTO dto) {
        entity.setCode(dto.getCode());
        entity.setName(dto.getName());
        
        return entity;
    }
}
