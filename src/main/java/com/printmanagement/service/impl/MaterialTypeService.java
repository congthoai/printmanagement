package com.printmanagement.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.MaterialTypeConverter;
import com.printmanagement.dto.MaterialTypeDTO;
import com.printmanagement.entity.MaterialTypeEntity;
import com.printmanagement.repository.MaterialTypeRepository;
import com.printmanagement.service.IMaterialTypeService;



@Service
public class MaterialTypeService implements IMaterialTypeService {
    @Autowired
    private MaterialTypeRepository materialTypeRepository;
    @Autowired
    private MaterialTypeConverter materialtypeConverter;
    
    @Override
    public MaterialTypeDTO save(MaterialTypeDTO dto) {
        MaterialTypeEntity MaterialTypeEntity = new MaterialTypeEntity();
        if (dto.getId() != null) {
            MaterialTypeEntity old = materialTypeRepository.findOne(dto.getId());
            MaterialTypeEntity = materialtypeConverter.toEntity(old, dto);
        } else {
            MaterialTypeEntity = materialtypeConverter.toEntity(dto);
        }
        return materialtypeConverter.toDto(materialTypeRepository.save(MaterialTypeEntity));
    }
    
    @Override
    public List<MaterialTypeDTO> findAll(Pageable pageable) {
        List<MaterialTypeDTO> rs = new ArrayList<>();
        List<MaterialTypeEntity> entites = materialTypeRepository.findAll(pageable).getContent(); 
        for (MaterialTypeEntity entity : entites) {
            rs.add(materialtypeConverter.toDto(entity));
        }
        return rs;
    }
    
    @Override
    public List<MaterialTypeDTO> findAll() {
        List<MaterialTypeDTO> rs = new ArrayList<>();
        List<MaterialTypeEntity> entites = materialTypeRepository.findAll(); 
        for (MaterialTypeEntity entity : entites) {
            rs.add(materialtypeConverter.toDto(entity));
        }
        return rs;
    }

    @Override
    public void delete(long[] ids) {
        for (long id : ids) {
            materialTypeRepository.delete(id);
        }
    }

    @Override
    public MaterialTypeDTO findOne(Long id) {
        return materialtypeConverter.toDto(materialTypeRepository.findOne(id));
    }

    @Override
    public int getTotalItem() {
        return (int) materialTypeRepository.count();
    }

    @Override
    public Map<Long, String> findAllMapIdName() {
    	Sort sort = new Sort(Sort.Direction.ASC,"name");
        List<MaterialTypeEntity> entities = materialTypeRepository.findAll(sort);
        Map<Long, String> rs = new LinkedHashMap<>();
        
        for (MaterialTypeEntity entity : entities) {
            rs.put(entity.getId(), entity.getName());
        }
        return rs;
    }

}
