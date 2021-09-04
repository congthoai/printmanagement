package com.printmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.MaterialTypeEntity;

public interface MaterialTypeRepository extends JpaRepository<MaterialTypeEntity, Long> {

}
