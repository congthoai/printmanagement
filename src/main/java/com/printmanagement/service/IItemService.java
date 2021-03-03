package com.printmanagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.ItemDTO;

public interface IItemService {
	ItemDTO save(ItemDTO dto);
	List<ItemDTO> findAll();
	List<ItemDTO> findAll(Pageable pageable);
	ItemDTO findOne(Long id);
	void delete(long[] ids);
	int getTotalItem();
	Map<Long, String> findAllMapIdName();
}
