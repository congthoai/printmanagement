package com.printmanagement.service.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.PriceListConverter;
import com.printmanagement.dto.PriceListDTO;
import com.printmanagement.entity.CustomerEntity;
import com.printmanagement.entity.CustomerTypeEntity;
import com.printmanagement.entity.ItemEntity;
import com.printmanagement.entity.PriceListEntity;
import com.printmanagement.repository.CustomerRepository;
import com.printmanagement.repository.CustomerTypeRepository;
import com.printmanagement.repository.ItemRepository;
import com.printmanagement.repository.PriceListRepository;
import com.printmanagement.service.IPriceListService;

@Service
public class PriceListService implements IPriceListService {
	@Autowired
	private PriceListRepository pricelistRepository;
	@Autowired
	private PriceListConverter pricelistConverter;
	@Autowired
	private CustomerTypeRepository customertypeRepository;
	@Autowired
	private ItemRepository itemRepository;
	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public PriceListDTO save(PriceListDTO dto) {
		PriceListEntity pricelistEntity = new PriceListEntity();
		CustomerTypeEntity customertypeEntity = customertypeRepository.findOne(dto.getCustomertypeid());
		ItemEntity itemEntity = itemRepository.findOne(dto.getItemid());

		if (dto.getId() != null) {
			PriceListEntity old = pricelistRepository.findOne(dto.getId());
			pricelistEntity = pricelistConverter.toEntity(old, dto);
		} else {
			pricelistEntity = pricelistConverter.toEntity(dto);
		}

		pricelistEntity.setCustomertypee(customertypeEntity);
		pricelistEntity.setItemm(itemEntity);
		return pricelistConverter.toDto(pricelistRepository.save(pricelistEntity));
	}

	@Override
	public List<PriceListDTO> findAll(Pageable pageable) {
		List<PriceListDTO> rs = new ArrayList<>();
		List<PriceListEntity> entites = pricelistRepository.findAll(pageable).getContent();
		for (PriceListEntity entity : entites) {
			rs.add(pricelistConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public List<PriceListDTO> findAll() {
		List<PriceListDTO> rs = new ArrayList<>();
		List<PriceListEntity> entites = pricelistRepository.findAll();
		for (PriceListEntity entity : entites) {
			rs.add(pricelistConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			pricelistRepository.delete(id);
		}
	}

	@Override
	public PriceListDTO findOne(Long id) {
		return pricelistConverter.toDto(pricelistRepository.findOne(id));
	}

	@Override
	public int getTotalItem() {
		return (int) pricelistRepository.count();
	}

	@Override
	public PriceListDTO findOnePriceListByItemIdAndCustomertypeId(Long itemid, Long customerid) {
		ItemEntity itemEntity = itemRepository.getOne(itemid);
		CustomerEntity customerEntity = customerRepository.findOne(customerid);
		CustomerTypeEntity customertypeEntity = customerEntity.getCustomertype();
		PriceListEntity priceListEntity = pricelistRepository.findOneByCustomertypeeAndItemm(customertypeEntity,
				itemEntity);

		return pricelistConverter.toDto(priceListEntity);
	}

	@Override
	public List<PriceListDTO> findListAllCustomerByItem(Long itemId) {
		List<PriceListDTO> rs = new ArrayList<>();
		List<Object[]> resultList = pricelistRepository.findListAllCustomerByItem(itemId);

		for (Object[] objects : resultList) {
			PriceListDTO dto = new PriceListDTO();
			dto.setId(objects[0] == null ? null : ((BigInteger) objects[0]).longValue());
			dto.setCustomertypeid(objects[1] == null ? null : ((BigInteger) objects[1]).longValue());
			dto.setCustomertypeName((String) objects[2]);
			dto.setItemid(objects[3] == null ? null : ((BigInteger) objects[3]).longValue());
			dto.setPrice(objects[4] == null ? null : ((BigInteger) objects[4]).longValue());
			dto.setPayoutPrice(objects[5] == null ? null : (String) objects[5]);
			rs.add(dto);
		}

		return rs;
	}

}
