package com.printmanagement.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.PrinterConverter;
import com.printmanagement.dto.PrinterDTO;
import com.printmanagement.entity.PrinterEntity;
import com.printmanagement.repository.PrinterRepository;
import com.printmanagement.service.IPrinterService;

@Service
public class PrinterService implements IPrinterService {
    @Autowired
    private PrinterRepository printerRepository;
    @Autowired
    private PrinterConverter printerConverter;
    
    @Override
    public PrinterDTO save(PrinterDTO dto) {
        PrinterEntity printerEntity = new PrinterEntity();

        if (dto.getId() != null) {
            PrinterEntity old = printerRepository.findOne(dto.getId());
            printerEntity = printerConverter.toEntity(old, dto);
        } else {
            printerEntity = printerConverter.toEntity(dto);
        }

        return printerConverter.toDto(printerRepository.save(printerEntity));
    }
    
    @Override
    public List<PrinterDTO> findAll(Pageable pageable) {
        List<PrinterDTO> rs = new ArrayList<>();
        List<PrinterEntity> entites = printerRepository.findAll(pageable).getContent(); 
        for (PrinterEntity entity : entites) {
            rs.add(printerConverter.toDto(entity));
        }
        return rs;
    }
    
    @Override
    public List<PrinterDTO> findAll() {
        List<PrinterDTO> rs = new ArrayList<>();
        List<PrinterEntity> entites = printerRepository.findAll(); 
        for (PrinterEntity entity : entites) {
            rs.add(printerConverter.toDto(entity));
        }
        return rs;
    }

    @Override
    public void delete(long[] ids) {
        for (long id : ids) {
            printerRepository.delete(id);
        }
    }

    @Override
    public PrinterDTO findOne(Long id) {
        return printerConverter.toDto(printerRepository.findOne(id));
    }

    @Override
    public int getTotalItem() {
        return (int) printerRepository.count();
    }

    @Override
    public Map<Long, String> findAllMapIdName() {
        List<PrinterEntity> entities = printerRepository.findAll();
        Map<Long, String> rs = new HashMap<>();
        
        for (PrinterEntity entity : entities) {
            rs.put(entity.getId(), entity.getName());
        }
        return rs;
    }

}
