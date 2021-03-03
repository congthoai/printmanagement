package com.printmanagement.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.PriceListDTO;

public interface IPriceListService {
	PriceListDTO save(PriceListDTO dto);
	List<PriceListDTO> findAll();
	List<PriceListDTO> findAll(Pageable pageable);
	PriceListDTO findOne(Long id);
	void delete(long[] ids);
	int getTotalItem();
	PriceListDTO findOnePriceListByItemIdAndCustomertypeId(Long itemid, Long customerid);
	List<PriceListDTO> findListAllCustomerByItem(Long itemId);
//	Map<Long, String> findAllMapIdName();
}
