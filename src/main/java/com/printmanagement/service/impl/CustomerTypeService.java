package com.printmanagement.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.CustomerTypeConverter;
import com.printmanagement.dto.CustomerTypeDTO;
import com.printmanagement.entity.CustomerTypeEntity;
import com.printmanagement.repository.CustomerTypeRepository;
import com.printmanagement.service.ICustomerTypeService;


@Service
public class CustomerTypeService implements ICustomerTypeService {
	@Autowired
	private CustomerTypeRepository customertypeRepository;
	@Autowired
	private CustomerTypeConverter customertypeConverter;
	
	@Override
	public CustomerTypeDTO save(CustomerTypeDTO dto) {
		CustomerTypeEntity customertypeEntity = new CustomerTypeEntity();
		if (dto.getId() != null) {
			CustomerTypeEntity old = customertypeRepository.findOne(dto.getId());
			customertypeEntity = customertypeConverter.toEntity(old, dto);
		} else {
			customertypeEntity = customertypeConverter.toEntity(dto);
		}
		return customertypeConverter.toDto(customertypeRepository.save(customertypeEntity));
	}
	
	@Override
	public List<CustomerTypeDTO> findAll(Pageable pageable) {
		List<CustomerTypeDTO> rs = new ArrayList<>();
		List<CustomerTypeEntity> entites = customertypeRepository.findAll(pageable).getContent(); 
		for (CustomerTypeEntity entity : entites) {
			rs.add(customertypeConverter.toDto(entity));
		}
		return rs;
	}
	
	@Override
	public List<CustomerTypeDTO> findAll() {
		List<CustomerTypeDTO> rs = new ArrayList<>();
		List<CustomerTypeEntity> entites = customertypeRepository.findAll(); 
		for (CustomerTypeEntity entity : entites) {
			rs.add(customertypeConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			customertypeRepository.delete(id);
		}
	}

	@Override
	public CustomerTypeDTO findOne(Long id) {
		return customertypeConverter.toDto(customertypeRepository.findOne(id));
	}

	@Override
	public int getTotalItem() {
		return (int) customertypeRepository.count();
	}

	@Override
	public Map<Long, String> findAllMapIdName() {
		List<CustomerTypeEntity> entities = customertypeRepository.findAll();
		Map<Long, String> rs = new HashMap<>();
		
		for (CustomerTypeEntity entity : entities) {
			rs.put(entity.getId(), entity.getName());
		}
		return rs;
	}

}
