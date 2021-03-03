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

import com.printmanagement.dto.MaterialDTO;
import com.printmanagement.service.IMaterialService;

@RestController(value="materialApiOfAdmin")
public class MaterialAPI {
	@Autowired
	private IMaterialService materialService;
	
	@PostMapping("/api/material")
	public MaterialDTO createMaterial(@RequestBody MaterialDTO MaterialDTO) {		
		return materialService.save(MaterialDTO);
	}
	
	@PutMapping("/api/material")
	public MaterialDTO updateMaterial(@RequestBody MaterialDTO MaterialDTO) {	
		return materialService.save(MaterialDTO);
	}
	
	@DeleteMapping("/api/material")
	public void deleteMaterial(@RequestBody long[] ids) {
		materialService.delete(ids);
	}
	
	@GetMapping(value= {"/api/material", "/api/material/{id}"})
	public List<MaterialDTO> getMaterial(@PathVariable(required = false) Long id) {	
		List<MaterialDTO> list = new ArrayList<>();
		if(id == null) {
			return  materialService.findAll();
		}
		list.add(materialService.findOne(id));
		return list;
	}
}
