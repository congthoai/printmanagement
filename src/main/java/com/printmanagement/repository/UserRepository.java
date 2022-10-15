package com.printmanagement.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.printmanagement.entity.RoleEntity;
import com.printmanagement.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
	UserEntity findOneByUserNameAndStatus(String name, Long status);
	List<UserEntity> findByRolesIn(Collection<RoleEntity> roles);
}
