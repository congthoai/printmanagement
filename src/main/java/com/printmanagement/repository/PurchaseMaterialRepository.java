package com.printmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.PurchaseMaterialEntity;

public interface PurchaseMaterialRepository extends JpaRepository<PurchaseMaterialEntity, Long> {

}
