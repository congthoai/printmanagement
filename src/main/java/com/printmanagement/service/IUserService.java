package com.printmanagement.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.UserDTO;

public interface IUserService {
	UserDTO findOne(Long id);
	List<UserDTO> findAll();
	List<UserDTO> findAll(Pageable pageable);
	int getTotalItem();
	UserDTO save(UserDTO dto);

}
