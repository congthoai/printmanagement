package com.printmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.ItemEntity;



public interface ItemRepository extends JpaRepository<ItemEntity, Long> {

}
