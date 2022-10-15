package com.printmanagement.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.printmanagement.entity.OrderOfPrinterEntity;



public interface OrderOfPrinterRepository extends JpaRepository<OrderOfPrinterEntity, Long> {

	@Query(value = "select op.*  "
			+ "	from order_printer op INNER JOIN orders od on (op.order_id = od.id) "
			+ "	where true "
			+ " AND (?1 is null or design_staff = ?1 or print_staff = ?1) "
			+ " AND (?2 is null or ?2 = '' or op.status = ?2) "
			+ " AND (?3 is null or ?3 = '' or orderdate >= ?3) AND (?4 is null or ?4 = '' or orderdate <= ?4) "
			+ " \n#pageable\n "
			+ "  ", nativeQuery = true)
	List<OrderOfPrinterEntity> findByFilter(Long printStaffId, String status, String startDate, String endDate, Pageable pageable);

	@Query(value = "select count(op.id)  "
			+ "	from order_printer op INNER JOIN orders od on (op.order_id = od.id) "
			+ "	where true "
			+ " AND (?1 is null or design_staff = ?1 or print_staff = ?1) "
			+ " AND (?2 is null or ?2 = '' or op.status = ?2) "
			+ " AND (?3 is null or ?3 = '' or orderdate >= ?3) AND (?4 is null or ?4 = '' or orderdate <= ?4) "
			+ " \n#pageable\n "
			+ "  ", nativeQuery = true)
	List<Object[]> countByFilter(Long printStaffId, String status, String startDate, String endDate, Pageable pageable);

}
