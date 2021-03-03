package com.printmanagement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.printmanagement.entity.CustomerTypeEntity;
import com.printmanagement.entity.ItemEntity;
import com.printmanagement.entity.PriceListEntity;

public interface PriceListRepository extends JpaRepository<PriceListEntity, Long> {
	PriceListEntity findOneByCustomertypeeAndItemm(CustomerTypeEntity customertype, ItemEntity item);
	
	@Query(value = "SELECT pl.id, ctype.id as customer_id, ctype.name, item_id, price\r\n "
			+ " FROM customertype ctype LEFT JOIN pricelist pl \r\n "
			+ " 	ON ( ctype.id = pl.customertype_id AND item_id = ?1) \r\n "
			+ " ORDER BY ctype.id, pl.id DESC  ", nativeQuery = true)
	List<Object[]> findListAllCustomerByItem(Long itemId);
}