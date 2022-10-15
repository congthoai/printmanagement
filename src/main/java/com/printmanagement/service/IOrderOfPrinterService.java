package com.printmanagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.OrderOfPrinterDTO;

public interface IOrderOfPrinterService {
	OrderOfPrinterDTO save(OrderOfPrinterDTO dto);
	List<OrderOfPrinterDTO> findAll();
	List<OrderOfPrinterDTO> findAll(Pageable pageable);
	List<OrderOfPrinterDTO> findByFilter(Long printStaffId, String status, String startDate, String endDate, Pageable pageable);
	int countByFilter(Long printStaffId, String status, String startDate, String endDate, Pageable pageable);
	OrderOfPrinterDTO findOne(Long id);
	void delete(long[] ids);
	int getTotalItem();
	Map<Long, String> findAllMapIdName();
}
