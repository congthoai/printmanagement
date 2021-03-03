package com.printmanagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.CustomerDTO;

public interface ICustomerService {
	CustomerDTO save(CustomerDTO dto);
	List<CustomerDTO> findAll();
	List<CustomerDTO> findAll(Pageable pageable);
	List<CustomerDTO> findAllOrderByCreateddateDesc(Pageable pageable);
	CustomerDTO findOne(Long id);
	void delete(long[] ids);
	int getTotalItem();
	Map<Long, String> findAllMapIdName();
	List<CustomerDTO> findByNameContaining(String name, Pageable pageable);
}
