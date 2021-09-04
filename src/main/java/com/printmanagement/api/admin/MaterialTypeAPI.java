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

import com.printmanagement.dto.MaterialTypeDTO;
import com.printmanagement.service.IMaterialTypeService;

@RestController(value="materialtypeApiOfAdmin")
public class MaterialTypeAPI {
    @Autowired
    private IMaterialTypeService materialtypeService;
    
    @PostMapping("/api/materialtype")
    public MaterialTypeDTO createMaterialType(@RequestBody MaterialTypeDTO MaterialTypeDTO) {       
        return materialtypeService.save(MaterialTypeDTO);
    }
    
    @PutMapping("/api/materialtype")
    public MaterialTypeDTO updateMaterialType(@RequestBody MaterialTypeDTO MaterialTypeDTO) {   
        return materialtypeService.save(MaterialTypeDTO);
    }
    
    @DeleteMapping("/api/materialtype")
    public void deleteMaterialType(@RequestBody long[] ids) {
        materialtypeService.delete(ids);
    }
    
    @GetMapping(value= {"/api/materialtype", "/api/materialtype/{id}"})
    public List<MaterialTypeDTO> getMaterialType(@PathVariable(required = false) Long id) { 
        List<MaterialTypeDTO> list = new ArrayList<>();
        if(id == null) {
            return  materialtypeService.findAll();
        }
        list.add(materialtypeService.findOne(id));
        return list;
    }
}
