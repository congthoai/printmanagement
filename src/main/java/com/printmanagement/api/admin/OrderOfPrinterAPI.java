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

import com.printmanagement.dto.OrderOfPrinterDTO;
import com.printmanagement.service.IOrderOfPrinterService;

@RestController(value="orderprinterApiOfAdmin")
public class OrderOfPrinterAPI {
    @Autowired
    private IOrderOfPrinterService orderOfPrinterService;
    
    @PostMapping("/api/order-printer")
    public OrderOfPrinterDTO createOrderPrinter(@RequestBody OrderOfPrinterDTO OrderOfPrinterDTO) {       
        return orderOfPrinterService.save(OrderOfPrinterDTO);
    }
    
    @PutMapping("/api/order-printer")
    public OrderOfPrinterDTO updateOrderPrinter(@RequestBody OrderOfPrinterDTO OrderOfPrinterDTO) {   
        return orderOfPrinterService.save(OrderOfPrinterDTO);
    }
    
    @DeleteMapping("/api/order-printer")
    public void deletePrinter(@RequestBody long[] ids) {
        orderOfPrinterService.delete(ids);
    }
    
    @GetMapping(value= {"/api/order-printer", "/api/order-printer/{id}"})
    public List<OrderOfPrinterDTO> getOrderPrinter(@PathVariable(required = false) Long id) { 
        List<OrderOfPrinterDTO> list = new ArrayList<>();
        if(id == null) {
            return  orderOfPrinterService.findAll();
        }
        list.add(orderOfPrinterService.findOne(id));
        return list;
    }
}
