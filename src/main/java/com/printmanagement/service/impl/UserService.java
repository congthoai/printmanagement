package com.printmanagement.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.UserConverter;
import com.printmanagement.dto.UserDTO;
import com.printmanagement.entity.RoleEntity;
import com.printmanagement.entity.UserEntity;
import com.printmanagement.repository.RoleRepository;
import com.printmanagement.repository.UserRepository;
import com.printmanagement.service.IUserService;

@Service
public class UserService implements IUserService {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserConverter userConverter;
	@Autowired
	private RoleRepository roleRepository;
	
	public UserDTO findOne(Long id) {
		return userConverter.toDto(userRepository.findOne(id));
	}

	@Override
	public UserDTO save(UserDTO dto) {
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder(); 
		UserEntity userEntity = new UserEntity();
		List<RoleEntity> roles = new ArrayList<>();
		
		if (dto.getId() != null) {
			UserEntity old = userRepository.findOne(dto.getId());
			userEntity = userConverter.toEntity(old, dto);

		} else {
			userEntity = userConverter.toEntity(dto);
		}
		
		if(!dto.getNewPassword().equals("")) {
			userEntity.setPassword(bcrypt.encode(dto.getNewPassword()));
		}
		
		roles.add(roleRepository.findOneByCode(dto.getRoleCode()));
		userEntity.setRoles(roles);

		return userConverter.toDto(userRepository.save(userEntity));
	}
	
	@Override
	public List<UserDTO> findAll() {
		List<UserDTO> result = new ArrayList<>();
		List<UserEntity> entities = userRepository.findAll();
		
		for (UserEntity userEntity : entities) {
			result.add(userConverter.toDto(userEntity));
		}
		return result;
	}

	@Override
	public List<UserDTO> findAll(Pageable pageable) {
		List<UserDTO> result = new ArrayList<>();
		List<UserEntity> entities = userRepository.findAll(pageable).getContent();
		for (UserEntity userEntity : entities) {
			result.add(userConverter.toDto(userEntity));
		}
		return result;
	}

	@Override
	public int getTotalItem() {
		return (int) userRepository.count();
	}

}
