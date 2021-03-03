package com.printmanagement.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.PurchaseMaterialDetailDTO;

public interface IPurchaseMaterialDetailService {
	PurchaseMaterialDetailDTO save(PurchaseMaterialDetailDTO dto);
	List<PurchaseMaterialDetailDTO> findAll();
	List<PurchaseMaterialDetailDTO> findAll(Pageable pageable);
	PurchaseMaterialDetailDTO findOne(Long id);
	void delete(long[] ids);
	int getTotalItem();
}
