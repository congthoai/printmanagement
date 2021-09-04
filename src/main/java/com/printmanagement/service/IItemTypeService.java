package com.printmanagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.ItemTypeDTO;

public interface IItemTypeService {
    ItemTypeDTO save(ItemTypeDTO dto);
    List<ItemTypeDTO> findAll();
    List<ItemTypeDTO> findAll(Pageable pageable);
    ItemTypeDTO findOne(Long id);
    void delete(long[] ids);
    int getTotalItem();
    Map<Long, String> findAllMapIdName();
}
