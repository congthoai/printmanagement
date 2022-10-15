package com.printmanagement.converter;

import com.printmanagement.entity.OrderOfPrinterEntity;

import com.printmanagement.dto.OrderOfPrinterDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OrderOfPrinterConverter {
    
    @Autowired
    PrinterConverter printerConverter;
    @Autowired
    UserConverter userConverter;
    @Autowired
    OrdersConverter orderConverter;
    
    public OrderOfPrinterDTO toDto(OrderOfPrinterEntity entity) {
        OrderOfPrinterDTO dto = new OrderOfPrinterDTO();
        dto.setId(entity.getId());
        dto.setName(entity.getName());
        dto.setCode(entity.getCode());
        dto.setFilename(entity.getFilename());
        dto.setFolderpath(entity.getFolderpath());
        dto.setContent(entity.getContent());
        dto.setDescription(entity.getDescription());
        String statusAlert = "label-warning";
		if(entity.getStatus() != null) {
			statusAlert = entity.getStatus().equals("CREATED") ? "label-success" :  entity.getStatus().equals("PRINTED") ? "label-info" : "label-warning";
			dto.setStatus(entity.getStatus());
			dto.setStatusAlert(statusAlert);
		}
        
        if(entity.getPrinter() != null) {
        	dto.setPrinterId(entity.getPrinter().getId());
            dto.setPrinter(printerConverter.toDto(entity.getPrinter()));
        }
        if(entity.getPrintStaff() != null) {
        	dto.setPrintStaffId(entity.getPrintStaff().getId());
            dto.setPrintStaff(userConverter.toDto(entity.getPrintStaff()));
        }
        if(entity.getDesignStaff() != null) {
        	dto.setDesignStaffId(entity.getDesignStaff().getId());
            dto.setDesignStaff(userConverter.toDto(entity.getDesignStaff()));
        }
        if(entity.getOrderr() != null) {
        	dto.setOrderId(entity.getOrderr().getId());
            dto.setOrderr(orderConverter.toDto(entity.getOrderr()));
        }
        
        return dto;
    }
    
    public OrderOfPrinterEntity toEntity(OrderOfPrinterDTO dto) {
        OrderOfPrinterEntity entity = new OrderOfPrinterEntity();
        entity.setCode(dto.getCode());
        entity.setName(dto.getName());
        entity.setFilename(dto.getFilename());
        entity.setFolderpath(dto.getFolderpath());
        entity.setContent(dto.getContent());
        entity.setDescription(dto.getDescription());
        entity.setStatus(dto.getStatus());
        
        return entity;
    }
    
    public OrderOfPrinterEntity toEntity(OrderOfPrinterEntity entity, OrderOfPrinterDTO dto) {
        entity.setDescription(dto.getDescription());
        entity.setContent(dto.getContent());
        return entity;
    }
}
