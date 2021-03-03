package com.printmanagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.OrdersDTO;

public interface IOrdersService {
	OrdersDTO save(OrdersDTO dto);
	List<OrdersDTO> findAll();
	List<OrdersDTO> findAll(Pageable pageable);
	OrdersDTO findOne(Long id);
	void delete(long[] ids);
	int getTotalItem();
	boolean updatePaidStatus(Long orderid);
	void massUpdatePaidStatus(long[] ids);
	Map<String, String> findAllMapStatus();
	List<OrdersDTO> findByFilter(Long customerId, String status, String content, String startDate, String endDate, String startPaymentDate, String endPaymentDate, Pageable pageable);
	List<OrdersDTO> findByFilter2(Long customerId, String status, String content, String startDate, String endDate, String startPaymentDate, String endPaymentDate, int page, int limit);

}
