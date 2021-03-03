package com.printmanagement.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.CustomerConverter;
import com.printmanagement.dto.CustomerDTO;
import com.printmanagement.entity.CustomerEntity;
import com.printmanagement.entity.CustomerTypeEntity;
import com.printmanagement.repository.CustomerRepository;
import com.printmanagement.repository.CustomerTypeRepository;
import com.printmanagement.service.ICustomerService;

@Service
public class CustomerService implements ICustomerService {
	@Autowired
	CustomerRepository customerRepository;
	@Autowired
	CustomerConverter customerConverter;
	@Autowired
	CustomerTypeRepository customertypeRepository;
	
	@Override
	public CustomerDTO save(CustomerDTO dto) {
		CustomerEntity customerEntity = new CustomerEntity();
		CustomerTypeEntity customerType = customertypeRepository.findOne(dto.getCustomertypeid());
		if (dto.getId() != null) {
			CustomerEntity old = customerRepository.findOne(dto.getId());
			customerEntity = customerConverter.toEntity(old, dto);
		} else {
			customerEntity = customerConverter.toEntity(dto);
			customerEntity.setCode(generateCustomerCode());
		}
		customerEntity.setCustomertype(customerType);
		return customerConverter.toDto(customerRepository.save(customerEntity));
	}
	
	@Override
	public List<CustomerDTO> findAll(Pageable pageable) {
		List<CustomerDTO> rs = new ArrayList<>();
		List<CustomerEntity> entites = customerRepository.findAll(pageable).getContent(); 
		for (CustomerEntity entity : entites) {
			rs.add(customerConverter.toDto(entity));
		}
		return rs;
	}
	
	@Override
	public List<CustomerDTO> findByNameContaining(String name, Pageable pageable) {
		List<CustomerDTO> rs = new ArrayList<>();
		List<CustomerEntity> entites = customerRepository.findByNameContaining(name, pageable);
		for (CustomerEntity entity : entites) {
			rs.add(customerConverter.toDto(entity));
		}
		return rs;
	}
	
	@Override
	public List<CustomerDTO> findAll() {
		List<CustomerDTO> rs = new ArrayList<>();
		List<CustomerEntity> entites = customerRepository.findAll(); 
		for (CustomerEntity entity : entites) {
			rs.add(customerConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			customerRepository.delete(id);
		}
	}

	@Override
	public CustomerDTO findOne(Long id) {
		return customerConverter.toDto(customerRepository.findOne(id));
	}

	@Override
	public int getTotalItem() {
		return (int) customerRepository.count();
	}

	@Override
	public Map<Long, String> findAllMapIdName() {
		List<CustomerEntity> entities = customerRepository.findAll();
		Map<Long, String> rs = new HashMap<>();
		
		for (CustomerEntity entity : entities) {
			rs.put(entity.getId(), entity.getName());
		}
		return rs;
	}
	
	public String generateCustomerCode() {
        Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyMddhhmmss");  
        String strDate = "KH00" + customerRepository.count() + "-"  + dateFormat.format(date); 
        return strDate;
	}

	@Override
	public List<CustomerDTO> findAllOrderByCreateddateDesc(Pageable pageable) {
		List<CustomerDTO> rs = new ArrayList<>();
		List<CustomerEntity> entites = customerRepository.findAll(pageable).getContent();
		for (CustomerEntity entity : entites) {
			rs.add(customerConverter.toDto(entity));
		}
		return rs;
	}

}
