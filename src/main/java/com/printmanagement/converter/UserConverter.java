package com.printmanagement.converter;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.printmanagement.dto.RoleDTO;
import com.printmanagement.dto.UserDTO;
import com.printmanagement.entity.RoleEntity;
import com.printmanagement.entity.UserEntity;

@Component
public class UserConverter {
	
	@Autowired
	RoleConverter roleConverter;
	
	public UserDTO toDto(UserEntity entity) {
		UserDTO result = new UserDTO();
		List<RoleDTO> roles = new ArrayList<>();
		result.setId(entity.getId());
		result.setUserName(entity.getUserName());
		result.setFullName(entity.getFullName());
		result.setPassword(entity.getPassword());
		result.setPhone(entity.getPhone());
		result.setEmail(entity.getEmail());
		result.setStatus(entity.getStatus());
		try {
			result.setRoleCode(entity.getRoles().get(0).getCode());
		} catch (Exception e) {
			result.setRoleCode("");
		}
		
		for (RoleEntity role : entity.getRoles()) {
			roles.add(roleConverter.toDto(role));
		}
		
		result.setRoles(roles);
		return result;
	}
	
	public UserEntity toEntity(UserDTO dto) {
		UserEntity result = new UserEntity();
		result.setFullName(dto.getFullName());
		result.setUserName(dto.getUserName());
		//result.setPassword(dto.getPassword());
		result.setPhone(dto.getPhone());
		result.setEmail(dto.getEmail());
		result.setStatus(dto.getStatus());
		return result;
	}
	
	public UserEntity toEntity(UserEntity result, UserDTO dto) {
		result.setFullName(dto.getFullName());
		result.setUserName(dto.getUserName());
		//result.setPassword(dto.getPassword());
		result.setPhone(dto.getPhone());
		result.setEmail(dto.getEmail());
		result.setStatus(dto.getStatus());
		return result;
	}
	

}
