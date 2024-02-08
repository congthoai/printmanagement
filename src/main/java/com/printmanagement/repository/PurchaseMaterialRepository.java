package com.printmanagement.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.printmanagement.entity.PurchaseMaterialEntity;

public interface PurchaseMaterialRepository extends JpaRepository<PurchaseMaterialEntity, Long> {
	List<PurchaseMaterialEntity> findAllByOrderByIdDesc();
	
	List<PurchaseMaterialEntity> findByPurchasedateBetween(Date startDate, Date endDate, Pageable pageable);
	
	@Query(value = "SELECT SUM(total) FROM purchasematerial WHERE True AND purchasedate >= ?1 AND purchasedate <= ?2", nativeQuery = true)
	Long sumTotalByPurchasedateBetween(Date startDate, Date endDate);
	
	@Query(value = "SELECT SUM(area) FROM purchasematerial p JOIN purchasematerialdetail pd on p.id = pd.purchasematerial_id "
			+ " WHERE TRUE AND (?1 is null or ?1 = '' or purchasedate >= ?1) " 
			+ " AND (?2 is null or ?2 = '' or purchasedate <= ?2) ", nativeQuery = true)
	Double sumAreaByPurchasedateBetween(Date startDate, Date endDate);
}
