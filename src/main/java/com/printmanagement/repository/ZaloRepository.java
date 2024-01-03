package com.printmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.ZaloTokenEntity;

public interface ZaloRepository  extends JpaRepository<ZaloTokenEntity, Long>{
	ZaloTokenEntity findTopByOrderByIdDesc();
}
