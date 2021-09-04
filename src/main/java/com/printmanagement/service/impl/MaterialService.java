package com.printmanagement.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.MaterialConverter;
import com.printmanagement.dto.MaterialDTO;
import com.printmanagement.entity.MaterialEntity;
import com.printmanagement.entity.MaterialTypeEntity;
import com.printmanagement.repository.MaterialRepository;
import com.printmanagement.repository.MaterialTypeRepository;
import com.printmanagement.service.IMaterialService;

@Service
public class MaterialService implements IMaterialService {
	@Autowired
	private MaterialRepository materialRepository;
	@Autowired
	private MaterialConverter materialConverter;
	@Autowired
	private MaterialTypeRepository materialTypeRepository;

	@Override
	public MaterialDTO save(MaterialDTO dto) {
		MaterialEntity materialEntity = new MaterialEntity();
		MaterialTypeEntity materialType = materialTypeRepository.findOne(dto.getMaterialtypeid());

		if (dto.getId() != null) {
			MaterialEntity old = materialRepository.findOne(dto.getId());
			materialEntity = materialConverter.toEntity(old, dto);
		} else {
			materialEntity = materialConverter.toEntity(dto);
		}
		
		materialEntity.setMaterialtype(materialType);
		return materialConverter.toDto(materialRepository.save(materialEntity));
	}

	@Override
	public List<MaterialDTO> findAll() {
		List<MaterialDTO> rs = new ArrayList<>();
		List<MaterialEntity> entites = materialRepository.findAll(); 
		for (MaterialEntity entity : entites) {
			rs.add(materialConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public List<MaterialDTO> findAll(Pageable pageable) {
		List<MaterialDTO> rs = new ArrayList<>();
		List<MaterialEntity> entites = materialRepository.findAll(pageable).getContent(); 
		for (MaterialEntity entity : entites) {
			rs.add(materialConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public MaterialDTO findOne(Long id) {
		return materialConverter.toDto(materialRepository.findOne(id));
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			materialRepository.delete(id);
		}
		
	}

	@Override
	public int getTotalItem() {
		return (int) materialRepository.count();
	}

	@Override
	public Map<Long, String> findAllMapIdName() {
		Sort sort = new Sort(Sort.Direction.ASC,"name");
		List<MaterialEntity> entities = materialRepository.findAll(sort);
		Map<Long, String> rs = new LinkedHashMap<>();
		
		for (MaterialEntity entity : entities) {
			rs.put(entity.getId(), entity.getName());
		}
		return rs;
	}

}
