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

import com.printmanagement.dto.ItemTypeDTO;
import com.printmanagement.service.IItemTypeService;

@RestController(value="itemtypeApiOfAdmin")
public class ItemTypeAPI {
    @Autowired
    private IItemTypeService itemtypeService;
    
    @PostMapping("/api/itemtype")
    public ItemTypeDTO createItemType(@RequestBody ItemTypeDTO ItemTypeDTO) {       
        return itemtypeService.save(ItemTypeDTO);
    }
    
    @PutMapping("/api/itemtype")
    public ItemTypeDTO updateItemType(@RequestBody ItemTypeDTO ItemTypeDTO) {   
        return itemtypeService.save(ItemTypeDTO);
    }
    
    @DeleteMapping("/api/itemtype")
    public void deleteItemType(@RequestBody long[] ids) {
        itemtypeService.delete(ids);
    }
    
    @GetMapping(value= {"/api/itemtype", "/api/itemtype/{id}"})
    public List<ItemTypeDTO> getItemType(@PathVariable(required = false) Long id) { 
        List<ItemTypeDTO> list = new ArrayList<>();
        if(id == null) {
            return  itemtypeService.findAll();
        }
        list.add(itemtypeService.findOne(id));
        return list;
    }
}
