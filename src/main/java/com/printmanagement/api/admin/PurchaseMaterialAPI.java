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

import com.printmanagement.dto.PurchaseMaterialDTO;
import com.printmanagement.service.IPurchaseMaterialService;

@RestController(value="purchaseMaterialApiOfAdmin")
public class PurchaseMaterialAPI {
	@Autowired
	private IPurchaseMaterialService purchaseMaterialService;
	
	@PostMapping("/api/purchasematerial")
	public PurchaseMaterialDTO createPurchaseMaterial(@RequestBody PurchaseMaterialDTO PurchaseMaterialDTO) {		
		return purchaseMaterialService.save(PurchaseMaterialDTO);
	}
	
	@PutMapping("/api/purchasematerial")
	public PurchaseMaterialDTO updatePurchaseMaterial(@RequestBody PurchaseMaterialDTO PurchaseMaterialDTO) {	
		return purchaseMaterialService.save(PurchaseMaterialDTO);
	}
	
	@DeleteMapping("/api/purchasematerial")
	public void deletePurchaseMaterial(@RequestBody long[] ids) {
		purchaseMaterialService.delete(ids);
	}
	
	@GetMapping(value= {"/api/purchasematerial", "/api/purchasematerial/{id}"})
	public List<PurchaseMaterialDTO> getPurchaseMaterial(@PathVariable(required = false) Long id) {	
		List<PurchaseMaterialDTO> list = new ArrayList<>();
		if(id == null) {
			return  purchaseMaterialService.findAllByOrderByIdDesc();
		}
		list.add(purchaseMaterialService.findOne(id));
		return list;
	}
}
