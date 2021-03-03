package com.printmanagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.CustomerTypeDTO;

public interface ICustomerTypeService {
	CustomerTypeDTO save(CustomerTypeDTO dto);
	List<CustomerTypeDTO> findAll();
	List<CustomerTypeDTO> findAll(Pageable pageable);
	CustomerTypeDTO findOne(Long id);
	void delete(long[] ids);
	int getTotalItem();
	Map<Long, String> findAllMapIdName();
}
