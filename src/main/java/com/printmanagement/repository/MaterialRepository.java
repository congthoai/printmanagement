package com.printmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.MaterialEntity;

public interface MaterialRepository extends JpaRepository<MaterialEntity, Long> {

}
