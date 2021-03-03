package com.printmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.RoleEntity;

public interface RoleRepository extends JpaRepository<RoleEntity, Long> {
	RoleEntity findOneByCode(String code);
}
