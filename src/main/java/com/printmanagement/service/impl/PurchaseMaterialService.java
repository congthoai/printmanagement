package com.printmanagement.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.PurchaseMaterialConverter;
import com.printmanagement.dto.PurchaseMaterialDTO;
import com.printmanagement.entity.PurchaseMaterialDetailEntity;
import com.printmanagement.entity.PurchaseMaterialEntity;
import com.printmanagement.repository.PurchaseMaterialRepository;
import com.printmanagement.service.IPurchaseMaterialService;

@Service
public class PurchaseMaterialService implements IPurchaseMaterialService {
	@Autowired
	private PurchaseMaterialRepository purchaseMaterialRepository;
	@Autowired
	private PurchaseMaterialConverter purchaseMaterialConverter;

	@Override
	public PurchaseMaterialDTO save(PurchaseMaterialDTO dto) {
		PurchaseMaterialEntity purchaseMaterialEntity = new PurchaseMaterialEntity();

		if (dto.getId() != null) {
			PurchaseMaterialEntity old = purchaseMaterialRepository.findOne(dto.getId());
			purchaseMaterialEntity = purchaseMaterialConverter.toEntity(old, dto);
			List<PurchaseMaterialDetailEntity> list = purchaseMaterialEntity.getPurchasematerialdetails();
			Long total = 0L;
			
			for (PurchaseMaterialDetailEntity purchaseMaterialDetailEntity : list) {
				total += purchaseMaterialDetailEntity.getTotal();
			}
			
			purchaseMaterialEntity.setTotal(total);
			
		} else {
			purchaseMaterialEntity = purchaseMaterialConverter.toEntity(dto);
		}

		return purchaseMaterialConverter.toDto(purchaseMaterialRepository.save(purchaseMaterialEntity));
	}

	@Override
	public List<PurchaseMaterialDTO> findAll() {
		List<PurchaseMaterialDTO> rs = new ArrayList<>();
		List<PurchaseMaterialEntity> entites = purchaseMaterialRepository.findAll(); 
		for (PurchaseMaterialEntity entity : entites) {
			rs.add(purchaseMaterialConverter.toDto(entity));
		}
		return rs;
	}
	
	@Override
	public List<PurchaseMaterialDTO> findAllByOrderByIdDesc() {
		List<PurchaseMaterialDTO> rs = new ArrayList<>();
		List<PurchaseMaterialEntity> entites = purchaseMaterialRepository.findAllByOrderByIdDesc(); 
		for (PurchaseMaterialEntity entity : entites) {
			rs.add(purchaseMaterialConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public List<PurchaseMaterialDTO> findAll(Pageable pageable) {
		List<PurchaseMaterialDTO> rs = new ArrayList<>();
		List<PurchaseMaterialEntity> entites = purchaseMaterialRepository.findAll(pageable).getContent(); 
		for (PurchaseMaterialEntity entity : entites) {
			rs.add(purchaseMaterialConverter.toDto(entity));
		}
		return rs;
	}
	
	@Override
	public List<PurchaseMaterialDTO> findByPurchasedateBetween(Date startDate, Date endDate, Pageable pageable) {
		List<PurchaseMaterialDTO> rs = new ArrayList<>();
		List<PurchaseMaterialEntity> entites = purchaseMaterialRepository.findByPurchasedateBetween(startDate, endDate, pageable);
		for (PurchaseMaterialEntity entity : entites) {
			rs.add(purchaseMaterialConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public PurchaseMaterialDTO findOne(Long id) {
		return purchaseMaterialConverter.toDto(purchaseMaterialRepository.findOne(id));
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			purchaseMaterialRepository.delete(id);
		}
		
	}

	@Override
	public int getTotalItem() {
		return (int) purchaseMaterialRepository.count();
	}

	@Override
	public Long sumTotalByPurchasedateBetween(Date startDate, Date endDate) {
		return purchaseMaterialRepository.sumTotalByPurchasedateBetween(startDate, endDate) == null ? 0L : purchaseMaterialRepository.sumTotalByPurchasedateBetween(startDate, endDate);
	}
	
	@Override
	public Double sumAreaByPurchasedateBetween(Date startDate, Date endDate) {
		return purchaseMaterialRepository.sumAreaByPurchasedateBetween(startDate, endDate) == null ? 0 :purchaseMaterialRepository.sumAreaByPurchasedateBetween(startDate, endDate);
	}
}
