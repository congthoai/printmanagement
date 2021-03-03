package com.printmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.CustomerTypeEntity;

public interface CustomerTypeRepository extends JpaRepository<CustomerTypeEntity, Long> {

}
