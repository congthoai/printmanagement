package com.printmanagement.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.PurchaseMaterialDTO;

public interface IPurchaseMaterialService {
	PurchaseMaterialDTO save(PurchaseMaterialDTO dto);
	List<PurchaseMaterialDTO> findAll();
	List<PurchaseMaterialDTO> findAll(Pageable pageable);
	PurchaseMaterialDTO findOne(Long id);
	void delete(long[] ids);
	int getTotalItem();
	List<PurchaseMaterialDTO> findByPurchasedateBetween(Date startDate, Date endDate, Pageable pageable);
	Long sumTotalByPurchasedateBetween(Date startDate, Date endDate);
	Double sumAreaByPurchasedateBetween(Date startDate, Date endDate);
}
