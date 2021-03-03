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

import com.printmanagement.dto.ItemDTO;
import com.printmanagement.service.IItemService;

@RestController(value="itemApiOfAdmin")
public class ItemAPI {
	@Autowired
	private IItemService itemService;
	
	@PostMapping("/api/item")
	public ItemDTO createItem(@RequestBody ItemDTO ItemDTO) {		
		return itemService.save(ItemDTO);
	}
	
	@PutMapping("/api/item")
	public ItemDTO updateItem(@RequestBody ItemDTO ItemDTO) {	
		return itemService.save(ItemDTO);
	}
	
	@DeleteMapping("/api/item")
	public void deleteItem(@RequestBody long[] ids) {
		itemService.delete(ids);
	}
	
	@GetMapping(value= {"/api/item", "/api/item/{id}"})
	public List<ItemDTO> getItem(@PathVariable(required = false) Long id) {	
		List<ItemDTO> list = new ArrayList<>();
		if(id == null) {
			return  itemService.findAll();
		}
		list.add(itemService.findOne(id));
		return list;
	}
}
