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

import com.printmanagement.dto.OrdersDTO;
import com.printmanagement.service.IOrdersService;

@RestController(value="orderApiOfAdmin")
public class OrdersAPI {
	
	@Autowired
	private IOrdersService orderService;
	
	@PostMapping(value= {"/api/order"})
	public OrdersDTO createOrder(@RequestBody OrdersDTO ordersDTO) {		
		return orderService.save(ordersDTO);
	}
	
	@PutMapping("/api/order")
	public OrdersDTO updateOrder(@RequestBody OrdersDTO ordersDTO) {	
		return orderService.save(ordersDTO);
	}
	
	@DeleteMapping("/api/order")
	public void deleteOrder(@RequestBody long[] ids) {
		orderService.delete(ids);
	}
	
	@GetMapping(value= {"/api/order", "/api/order/{id}"})
	public List<OrdersDTO> getOrder(@PathVariable(required = false) Long id) {	
		List<OrdersDTO> list = new ArrayList<>();
		if(id == null) {
			return  orderService.findAll();
		}
		list.add(orderService.findOne(id));
		return list;
	}
	
	@PutMapping("/api/order/status")
	public void massUpdatePaidStatus(@RequestBody long[] ids) {	
		 orderService.massUpdatePaidStatus(ids);
	}
	
	/*
	 * @GetMapping(value= {"/api/order/revenuebyweek"}) public List<Object[]>
	 * getOrderReport() {
	 * 
	 * return orderRepository.reportRevenueInWeek(); }
	 */
}
