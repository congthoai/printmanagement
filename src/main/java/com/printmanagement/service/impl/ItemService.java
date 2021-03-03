package com.printmanagement.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.ItemConverter;
import com.printmanagement.dto.ItemDTO;
import com.printmanagement.entity.ItemEntity;
import com.printmanagement.repository.ItemRepository;
import com.printmanagement.service.IItemService;

@Service
public class ItemService implements IItemService {
	@Autowired
	private ItemRepository itemRepository;
	@Autowired
	private ItemConverter itemConverter;
	
	@Override
	public ItemDTO save(ItemDTO dto) {
		ItemEntity itemEntity = new ItemEntity();

		if (dto.getId() != null) {
			ItemEntity old = itemRepository.findOne(dto.getId());
			itemEntity = itemConverter.toEntity(old, dto);
		} else {
			itemEntity = itemConverter.toEntity(dto);
		}

		return itemConverter.toDto(itemRepository.save(itemEntity));
	}
	
	@Override
	public List<ItemDTO> findAll(Pageable pageable) {
		List<ItemDTO> rs = new ArrayList<>();
		List<ItemEntity> entites = itemRepository.findAll(pageable).getContent(); 
		for (ItemEntity entity : entites) {
			rs.add(itemConverter.toDto(entity));
		}
		return rs;
	}
	
	@Override
	public List<ItemDTO> findAll() {
		List<ItemDTO> rs = new ArrayList<>();
		List<ItemEntity> entites = itemRepository.findAll(); 
		for (ItemEntity entity : entites) {
			rs.add(itemConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			itemRepository.delete(id);
		}
	}

	@Override
	public ItemDTO findOne(Long id) {
		return itemConverter.toDto(itemRepository.findOne(id));
	}

	@Override
	public int getTotalItem() {
		return (int) itemRepository.count();
	}

	@Override
	public Map<Long, String> findAllMapIdName() {
		List<ItemEntity> entities = itemRepository.findAll();
		Map<Long, String> rs = new HashMap<>();
		
		for (ItemEntity entity : entities) {
			rs.put(entity.getId(), entity.getName());
		}
		return rs;
	}

}
