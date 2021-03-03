package com.printmanagement.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.PurchaseMaterialDetailConverter;
import com.printmanagement.dto.PurchaseMaterialDetailDTO;
import com.printmanagement.entity.MaterialEntity;
import com.printmanagement.entity.PurchaseMaterialDetailEntity;
import com.printmanagement.entity.PurchaseMaterialEntity;
import com.printmanagement.repository.MaterialRepository;
import com.printmanagement.repository.PurchaseMaterialDetailRepository;
import com.printmanagement.repository.PurchaseMaterialRepository;
import com.printmanagement.service.IPurchaseMaterialDetailService;

@Service
public class PurchaseMaterialDetailService implements IPurchaseMaterialDetailService {
	@Autowired
	private PurchaseMaterialDetailRepository purchaseMaterialDetailRepository;
	@Autowired
	private PurchaseMaterialDetailConverter purchaseMaterialDetailConverter;
	@Autowired
	private PurchaseMaterialRepository purchaseMaterialRepository;
	@Autowired
	private MaterialRepository materialRepository;

	@Override
	public PurchaseMaterialDetailDTO save(PurchaseMaterialDetailDTO dto) {
		PurchaseMaterialDetailEntity purchaseMaterialDetailEntity = new PurchaseMaterialDetailEntity();
		PurchaseMaterialEntity purchaseMaterialEntity = purchaseMaterialRepository.findOne(dto.getPurchasematerialid());
		MaterialEntity materialEntity = materialRepository.findOne(dto.getMaterialid());

		if (dto.getId() != null) {
			PurchaseMaterialDetailEntity old = purchaseMaterialDetailRepository.findOne(dto.getId());
			purchaseMaterialDetailEntity = purchaseMaterialDetailConverter.toEntity(old, dto);
		} else {
			purchaseMaterialDetailEntity = purchaseMaterialDetailConverter.toEntity(dto);
		}
		
		purchaseMaterialDetailEntity.setSize(materialEntity.getSize());
		purchaseMaterialDetailEntity.setWidth(materialEntity.getWidth());
		purchaseMaterialDetailEntity.setArea(materialEntity.getSize() * materialEntity.getWidth() * dto.getQuantity());
		purchaseMaterialDetailEntity.setTotal(0L + Math.round(purchaseMaterialDetailEntity.getArea() * dto.getPrice()));
		purchaseMaterialDetailEntity.setMaterial(materialEntity);
		purchaseMaterialDetailEntity.setPurchasematerial(purchaseMaterialEntity);
		return purchaseMaterialDetailConverter.toDto(purchaseMaterialDetailRepository.save(purchaseMaterialDetailEntity));
	}

	@Override
	public List<PurchaseMaterialDetailDTO> findAll() {
		List<PurchaseMaterialDetailDTO> rs = new ArrayList<>();
		List<PurchaseMaterialDetailEntity> entites = purchaseMaterialDetailRepository.findAll(); 
		for (PurchaseMaterialDetailEntity entity : entites) {
			rs.add(purchaseMaterialDetailConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public List<PurchaseMaterialDetailDTO> findAll(Pageable pageable) {
		List<PurchaseMaterialDetailDTO> rs = new ArrayList<>();
		List<PurchaseMaterialDetailEntity> entites = purchaseMaterialDetailRepository.findAll(pageable).getContent(); 
		for (PurchaseMaterialDetailEntity entity : entites) {
			rs.add(purchaseMaterialDetailConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public PurchaseMaterialDetailDTO findOne(Long id) {
		return purchaseMaterialDetailConverter.toDto(purchaseMaterialDetailRepository.findOne(id));
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			purchaseMaterialDetailRepository.delete(id);
		}
		
	}

	@Override
	public int getTotalItem() {
		return (int) purchaseMaterialDetailRepository.count();
	}

}
