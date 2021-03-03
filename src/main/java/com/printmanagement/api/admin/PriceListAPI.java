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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.printmanagement.dto.PriceListDTO;
import com.printmanagement.service.IPriceListService;

@RestController(value="pricelistApiOfAdmin")
public class PriceListAPI {
	@Autowired
	private IPriceListService pricelistService;
	
	@PostMapping("/api/pricelist")
	public PriceListDTO createPriceList(@RequestBody PriceListDTO PriceListDTO) {		
		return pricelistService.save(PriceListDTO);
	}
	
	@PutMapping("/api/pricelist")
	public PriceListDTO updatePriceList(@RequestBody PriceListDTO PriceListDTO) {	
		return pricelistService.save(PriceListDTO);
	}
	
	@DeleteMapping("/api/pricelist")
	public void deletePriceList(@RequestBody long[] ids) {
		pricelistService.delete(ids);
	}
	
	@GetMapping(value= {"/api/pricelist", "/api/pricelist/{id}"})
	public List<PriceListDTO> getPriceList(@PathVariable(required = false) Long id) {	
		List<PriceListDTO> list = new ArrayList<>();
		if(id == null) {
			return  pricelistService.findAll();
		}
		list.add(pricelistService.findOne(id));
		return list;
	}
	
	@GetMapping(value= {"/api/pricelist/filter"})
	public PriceListDTO getPriceListByItemIdAndCustomertypeId(@RequestParam("itemid") Long itemid, @RequestParam("customerid") Long customerid) {	
		
		return pricelistService.findOnePriceListByItemIdAndCustomertypeId(itemid, customerid);
	}
}
