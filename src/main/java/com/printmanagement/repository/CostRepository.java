package com.printmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.CostEntity;

public interface CostRepository extends JpaRepository<CostEntity, Long> {

}
