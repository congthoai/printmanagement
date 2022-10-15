package com.printmanagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.UserDTO;

public interface IUserService {
	UserDTO findOne(Long id);
	List<UserDTO> findAll();
	List<UserDTO> findByRolesIn(List<String> roles);
	Map<Long, String> findByRolesInAndMapIdName(List<String> roles);
	List<UserDTO> findAll(Pageable pageable);
	int getTotalItem();
	UserDTO save(UserDTO dto);
	void delete(long[] ids);

}
