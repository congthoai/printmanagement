package com.printmanagement.api.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.printmanagement.repository.CostRepository;
import com.printmanagement.service.ICostService;

@RestController(value="costApiOfAdmin")
public class CostAPI {
	@Autowired
	private ICostService costService;
	@Autowired
	private CostRepository costRepository;
	
	@PostMapping("/api/cost")
	public CostDTO createCost(@RequestBody CostDTO CostDTO) {		
		return costService.save(CostDTO);
	}
	
	@PutMapping("/api/cost")
	public CostDTO updateCost(@RequestBody CostDTO CostDTO) {	
		return costService.save(CostDTO);
	}
	
	@DeleteMapping("/api/cost")
	public void deleteCost(@RequestBody long[] ids) {
		costService.delete(ids);
	}
	
	@GetMapping(value= {"/api/cost", "/api/cost/{id}"})
	public List<CostDTO> getCost(@PathVariable(required = false) Long id) {	
		List<CostDTO> list = new ArrayList<>();
		if(id == null) {
			return  costService.findAll();
		}
		list.add(costService.findOne(id));
		return list;
	}
	
	@GetMapping(value = { "ajax/api/cost/reportcostinmonthbyname/{dateStr}" })
	public List<Object[]> reportCostInMonthByName(@PathVariable(required = false) String dateStr) throws ParseException {
		Date date = new Date();
		if(dateStr != null) {
			date = new SimpleDateFormat("yyyy-MM").parse(dateStr);
		}
		return costRepository.reportCostInMonthByName(date);
	}
}
