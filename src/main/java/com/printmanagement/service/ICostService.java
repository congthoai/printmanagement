package com.printmanagement.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.CostDTO;

public interface ICostService {
	CostDTO save(CostDTO dto);
	List<CostDTO> findAll();
	List<CostDTO> findAll(Pageable pageable);
	CostDTO findOne(Long id);
	void delete(long[] ids);
	int getTotalItem();
	List<CostDTO> findByCostdateBetween(Date startDate, Date endDate, Pageable pageable);
	Long sumTotalByByCostdateBetween(Date startDate, Date endDate);
}
