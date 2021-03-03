package com.printmanagement.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.CustomerEntity;

public interface CustomerRepository extends JpaRepository<CustomerEntity, Long> {
	//List<CustomerEntity> findAllOrderByCreateddateDesc(Pageable pageable);
	List<CustomerEntity> findByNameContaining(String name, Pageable pageable);
}
