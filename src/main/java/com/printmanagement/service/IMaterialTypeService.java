package com.printmanagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.MaterialTypeDTO;

public interface IMaterialTypeService {
    MaterialTypeDTO save(MaterialTypeDTO dto);
    List<MaterialTypeDTO> findAll();
    List<MaterialTypeDTO> findAll(Pageable pageable);
    MaterialTypeDTO findOne(Long id);
    void delete(long[] ids);
    int getTotalItem();
    Map<Long, String> findAllMapIdName();
}
