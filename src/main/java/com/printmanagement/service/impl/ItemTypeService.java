package com.printmanagement.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.ItemTypeConverter;
import com.printmanagement.dto.ItemTypeDTO;
import com.printmanagement.entity.ItemTypeEntity;
import com.printmanagement.repository.ItemTypeRepository;
import com.printmanagement.service.IItemTypeService;



@Service
public class ItemTypeService implements IItemTypeService {
    @Autowired
    private ItemTypeRepository itemTypeRepository;
    @Autowired
    private ItemTypeConverter itemtypeConverter;
    
    @Override
    public ItemTypeDTO save(ItemTypeDTO dto) {
        ItemTypeEntity ItemTypeEntity = new ItemTypeEntity();
        if (dto.getId() != null) {
            ItemTypeEntity old = itemTypeRepository.findOne(dto.getId());
            ItemTypeEntity = itemtypeConverter.toEntity(old, dto);
        } else {
            ItemTypeEntity = itemtypeConverter.toEntity(dto);
        }
        return itemtypeConverter.toDto(itemTypeRepository.save(ItemTypeEntity));
    }
    
    @Override
    public List<ItemTypeDTO> findAll(Pageable pageable) {
        List<ItemTypeDTO> rs = new ArrayList<>();
        List<ItemTypeEntity> entites = itemTypeRepository.findAll(pageable).getContent(); 
        for (ItemTypeEntity entity : entites) {
            rs.add(itemtypeConverter.toDto(entity));
        }
        return rs;
    }
    
    @Override
    public List<ItemTypeDTO> findAll() {
        List<ItemTypeDTO> rs = new ArrayList<>();
        List<ItemTypeEntity> entites = itemTypeRepository.findAll(); 
        for (ItemTypeEntity entity : entites) {
            rs.add(itemtypeConverter.toDto(entity));
        }
        return rs;
    }

    @Override
    public void delete(long[] ids) {
        for (long id : ids) {
            itemTypeRepository.delete(id);
        }
    }

    @Override
    public ItemTypeDTO findOne(Long id) {
        return itemtypeConverter.toDto(itemTypeRepository.findOne(id));
    }

    @Override
    public int getTotalItem() {
        return (int) itemTypeRepository.count();
    }

    @Override
    public Map<Long, String> findAllMapIdName() {
    	Sort sort = new Sort(Sort.Direction.ASC,"name");
        List<ItemTypeEntity> entities = itemTypeRepository.findAll(sort);
        Map<Long, String> rs = new LinkedHashMap<>();
        
        for (ItemTypeEntity entity : entities) {
            rs.put(entity.getId(), entity.getName());
        }
        return rs;
    }

}
