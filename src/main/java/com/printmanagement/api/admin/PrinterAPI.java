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

import com.printmanagement.dto.PrinterDTO;
import com.printmanagement.service.IPrinterService;

@RestController(value="printerApiOfAdmin")
public class PrinterAPI {
    @Autowired
    private IPrinterService printerService;
    
    @PostMapping("/api/printer")
    public PrinterDTO createPrinter(@RequestBody PrinterDTO PrinterDTO) {       
        return printerService.save(PrinterDTO);
    }
    
    @PutMapping("/api/printer")
    public PrinterDTO updatePrinter(@RequestBody PrinterDTO PrinterDTO) {   
        return printerService.save(PrinterDTO);
    }
    
    @DeleteMapping("/api/printer")
    public void deletePrinter(@RequestBody long[] ids) {
        printerService.delete(ids);
    }
    
    @GetMapping(value= {"/api/printer", "/api/printer/{id}"})
    public List<PrinterDTO> getPrinter(@PathVariable(required = false) Long id) { 
        List<PrinterDTO> list = new ArrayList<>();
        if(id == null) {
            return  printerService.findAll();
        }
        list.add(printerService.findOne(id));
        return list;
    }
}
