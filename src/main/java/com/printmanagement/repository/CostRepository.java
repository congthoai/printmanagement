package com.printmanagement.repository;


import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.printmanagement.entity.CostEntity;

public interface CostRepository extends JpaRepository<CostEntity, Long> {
	List<CostEntity> findByCostdateBetween(Date startDate, Date endDate, Pageable pageable);
	@Query(value = "SELECT SUM(total) FROM cost WHERE True AND costdate >= ?1 AND costdate <= ?2", nativeQuery = true)
	Long sumTotalByByCostdateBetween(Date startDate, Date endDate);
}
