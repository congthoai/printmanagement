package com.printmanagement.api.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.printmanagement.dto.CostDTO;
import com.printmanagement.dto.UserDTO;
import com.printmanagement.service.IUserService;

@RestController(value="userApiOfAdmin")
public class UserAPI {
	@Autowired
	private IUserService userService;
	
	@PostMapping("/api/user")
	public UserDTO createUser(@RequestBody UserDTO UserDTO) {		
		return userService.save(UserDTO);
	}
	
	@PutMapping("/api/user")
	public UserDTO updateuser(@RequestBody UserDTO UserDTO) {	
		return userService.save(UserDTO);
	}
	
	@DeleteMapping("/api/user")
	public void deleteuser(@RequestBody long[] ids) {
		userService.delete(ids);
	}
	
	@GetMapping(value= {"/api/user", "/api/user/{id}"})
	public List<UserDTO> getUser(@PathVariable(required = false) Long id) {	
		List<UserDTO> list = new ArrayList<>();
		if(id == null) {
			return  userService.findAll();
		}
		return list;
	}
}
