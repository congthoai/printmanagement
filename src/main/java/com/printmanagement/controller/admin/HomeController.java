package com.printmanagement.controller.admin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.printmanagement.dto.OrdersDTO;
import com.printmanagement.repository.OrdersRepository;
import com.printmanagement.service.IOrdersService;

@Controller(value= "homeControllerOfAdmin")
public class HomeController {
	@Autowired
	private IOrdersService orderService;
	@Autowired
	private OrdersRepository orderRepository;
	
	@RequestMapping(value= "/quan-tri/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("admin/home");
		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		//System.out.println("XXXXXXXXXXXXXXXXX"+dateFormat.format(date));
		Sort sort = new Sort(Sort.Direction.DESC,"createddate");
		Pageable pageable = new PageRequest(0, 999999999, sort);
		List<OrdersDTO> orderInDay = orderService.findByFilter(null, null, null, dateFormat.format(date), dateFormat.format(date) + " 23:59:59", null, null, pageable);
		List<OrdersDTO> revenueInDay = orderService.findByFilter(null, "paid", null, null, null, dateFormat.format(date), dateFormat.format(date) + " 23:59:59", pageable);
		mav.addObject("orderInDay", orderInDay);
		mav.addObject("revenueInDay", revenueInDay);
		mav.addObject("revenueInWeek", DataObjectToJson(orderRepository.reportRevenueInWeek()));
		//mav.addObject("revenueInMonth", DataObjectToJson(orderRepository.reportRevenueInMonth()));
		//mav.addObject("saleAmountInMonth", DataObjectToJson(orderRepository.reportSaleAmountInMonth()));
		mav.addObject("orderCountByStatus", DataObjectToJson(orderRepository.reportOrderCountByStatusInWeek()));
		mav.addObject("today", dateFormat.format(date));
		return mav;
	}
	
	@RequestMapping(value= "/quan-tri/user/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage2() {
		ModelAndView mav = new ModelAndView("admin/home2");

		return mav;
	}
	
	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	
	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/dang-nhap?accessDenied");
	}
	
	public String DataObjectToJson(List<Object[]> objData) {
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = "";

		try {
			jsonString = mapper.writeValueAsString(objData);
			return jsonString;
		} catch (JsonProcessingException e) {
			return "";
		}
	}
}
