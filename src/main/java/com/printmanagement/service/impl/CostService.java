package com.printmanagement.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.CostConverter;
import com.printmanagement.dto.CostDTO;
import com.printmanagement.entity.CostEntity;
import com.printmanagement.repository.CostRepository;
import com.printmanagement.service.ICostService;

@Service
public class CostService implements ICostService {
	@Autowired
	private CostRepository costRepository;
	@Autowired
	private CostConverter costConverter;

	@Override
	public CostDTO save(CostDTO dto) {
		CostEntity costEntity = new CostEntity();

		if (dto.getId() != null) {
			CostEntity old = costRepository.findOne(dto.getId());
			costEntity = costConverter.toEntity(old, dto);
		} else {
			costEntity = costConverter.toEntity(dto);
		}

		return costConverter.toDto(costRepository.save(costEntity));
	}

	@Override
	public List<CostDTO> findAll() {
		List<CostDTO> rs = new ArrayList<>();
		List<CostEntity> entites = costRepository.findAll(); 
		for (CostEntity entity : entites) {
			rs.add(costConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public List<CostDTO> findAll(Pageable pageable) {
		List<CostDTO> rs = new ArrayList<>();
		List<CostEntity> entites = costRepository.findAll(pageable).getContent(); 
		for (CostEntity entity : entites) {
			rs.add(costConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public CostDTO findOne(Long id) {
		return costConverter.toDto(costRepository.findOne(id));
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			costRepository.delete(id);
		}
		
	}

	@Override
	public int getTotalItem() {
		return (int) costRepository.count();
	}

}
