package com.printmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.ItemTypeEntity;

public interface ItemTypeRepository extends JpaRepository<ItemTypeEntity, Long> {

}