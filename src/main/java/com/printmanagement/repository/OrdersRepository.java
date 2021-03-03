package com.printmanagement.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.printmanagement.entity.OrdersEntity;

public interface OrdersRepository extends JpaRepository<OrdersEntity, Long> {
	@Query(value = "SELECT * FROM orders od WHERE True AND (?1 is null or customer_id = ?1) "
			+ " AND (?2 is null or ?2 = '' or status = ?2) "
			+ " AND (?3 is null or ?3 = '' or replace(replace(content, 'Đ', 'd'), 'đ', 'd') like CONCAT('%', CONCAT(replace(replace(?3, 'Đ', 'd'), 'đ', 'd'), '%')) ) "
			+ " AND (?4 is null or ?4 = '' or orderdate >= ?4) " + "AND (?5 is null or ?5 = '' or orderdate <= ?5) "
			+ " AND (?6 is null or ?6 = '' or paymentdate >= ?6) " + "AND (?7 is null or ?7 = '' or paymentdate <= ?7) \n#pageable\n "
			+ "  ", nativeQuery = true)
	List<OrdersEntity> findByFilter(Long customerId, String status, String content, String startDate, String endDate, String startPaymentDate, String endPaymentDate, Pageable pageable);

	@Query(value = "SELECT CONCAT('Thứ ',DAYOFWEEK(paymentdate)) as dayofweek, sum(paid) revenue,  count(*) as count from  orders "
			+ "where paymentdate >= ADDDATE(CURDATE(), 0 - WEEKDay(CURDATE())) "
			+ "	AND paymentdate < ADDDATE(CURDATE(), 7 - WEEKDay(CURDATE())) "
			+ "	AND status = 'paid' "
			+ "	GROUP BY DAYOFWEEK(paymentdate) ORDER BY dayofweek ASC  ", nativeQuery = true)
	List<Object[]> reportRevenueInWeek();
	
	@Query(value = "SELECT status, count(*) as count from  orders \r\n"
			+ "where orderdate >= ADDDATE(CURDATE(), 0 - WEEKDay(CURDATE())) \r\n"
			+ "	AND orderdate < ADDDATE(CURDATE(), 7 - WEEKDay(CURDATE())) \r\n"
			+ "	GROUP BY status  ", nativeQuery = true)
	List<Object[]> reportOrderCountByStatusInWeek();
	
	/*
	 * @Query(value =
	 * "SELECT customer.name as customername, orders.* FROM orders JOIN customer ON orders.customer_id = customer.id\r\n "
	 * + " WHERE TRUE \r\n" +
	 * "	 AND (?1 is null or ?1 = '' or orders.status = ?1)\r\n " +
	 * "	 AND (?2 is null or customer.id = ?2) " +
	 * " AND (?3 is null or ?3 = '' or DATE_FORMAT(orderdate, \"%d/%m/%Y\") >= ?3) "
	 * +
	 * "AND (?4 is null or ?4 = '' or DATE_FORMAT(orderdate, \"%d/%m/%Y\") <= ?4) "
	 * + " ORDER BY customer_id ", nativeQuery = true) List<Object[]>
	 * reportOrderCustomer();
	 */
	
	@Query(value = "SELECT * FROM orders od WHERE True AND (?1 is null or customer_id = ?1) "
			+ " AND (?2 is null or ?2 = '' or status = ?2) "
			+ " AND (?3 is null or ?3 = '' or replace(replace(content, 'Đ', 'd'), 'đ', 'd') like CONCAT('%', CONCAT(replace(replace(?3, 'Đ', 'd'), 'đ', 'd'), '%')) ) "
			+ " AND (?4 is null or ?4 = '' or orderdate >= ?4) " + "AND (?5 is null or ?5 = '' or orderdate <= ?5) "
			+ " AND (?6 is null or ?6 = '' or paymentdate >= ?6) " + "AND (?7 is null or ?7 = '' or paymentdate <= ?7) "
			+ " ORDER BY customer_id ASC, orderdate ASC Limit ?8, ?9 ", nativeQuery = true)
	List<OrdersEntity> findByFilter2(Long customerId, String status, String content, String startDate, String endDate, String startPaymentDate, String endPaymentDate, int page, int limit);


}
