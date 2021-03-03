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

import com.printmanagement.dto.PurchaseMaterialDetailDTO;
import com.printmanagement.service.IPurchaseMaterialDetailService;

@RestController(value="purchaseMaterialDetailApiOfAdmin")
public class PurchaseMaterialDetailAPI {
	@Autowired
	private IPurchaseMaterialDetailService purchaseMaterialDetailService;
	
	@PostMapping("/api/purchasematerialdetail")
	public PurchaseMaterialDetailDTO createPurchaseMaterialDetail(@RequestBody PurchaseMaterialDetailDTO PurchaseMaterialDetailDTO) {		
		return purchaseMaterialDetailService.save(PurchaseMaterialDetailDTO);
	}
	
	@PutMapping("/api/purchasematerialdetail")
	public PurchaseMaterialDetailDTO updatePurchaseMaterialDetail(@RequestBody PurchaseMaterialDetailDTO PurchaseMaterialDetailDTO) {	
		return purchaseMaterialDetailService.save(PurchaseMaterialDetailDTO);
	}
	
	@DeleteMapping("/api/purchasematerialdetail")
	public void deletePurchaseMaterialDetail(@RequestBody long[] ids) {
		purchaseMaterialDetailService.delete(ids);
	}
	
	@GetMapping(value= {"/api/purchasematerialdetail", "/api/purchasematerialdetail/{id}"})
	public List<PurchaseMaterialDetailDTO> getPurchaseMaterialDetail(@PathVariable(required = false) Long id) {	
		List<PurchaseMaterialDetailDTO> list = new ArrayList<>();
		if(id == null) {
			return  purchaseMaterialDetailService.findAll();
		}
		list.add(purchaseMaterialDetailService.findOne(id));
		return list;
	}
}
