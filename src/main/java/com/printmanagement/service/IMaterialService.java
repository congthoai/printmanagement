package com.printmanagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.MaterialDTO;

public interface IMaterialService {
	MaterialDTO save(MaterialDTO dto);
	List<MaterialDTO> findAll();
	List<MaterialDTO> findAll(Pageable pageable);
	MaterialDTO findOne(Long id);
	void delete(long[] ids);
	int getTotalItem();
	Map<Long, String> findAllMapIdName();
}
