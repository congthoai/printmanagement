package com.printmanagement.repository;


import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.printmanagement.entity.CostEntity;

public interface CostRepository extends JpaRepository<CostEntity, Long> {
	List<CostEntity> findByCostdateBetween(Date startDate, Date endDate, Pageable pageable);
	@Query(value = "SELECT SUM(total) FROM cost WHERE True AND costdate >= ?1 AND costdate <= ?2", nativeQuery = true)
	Long sumTotalByByCostdateBetween(Date startDate, Date endDate);
	
	@Query(value = "SELECT name, sum(total) FROM cost "
			+ "WHERE costdate >= (LAST_DAY(:datee - INTERVAL 1 MONTH) + INTERVAL 1 DAY) "
			+ "AND costdate <= LAST_DAY(:datee) "
			+ "GROUP BY name  ", nativeQuery = true)
	List<Object[]> reportCostInMonthByName(@Param("datee") Date datee);
}
