package com.printmanagement.controller.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.printmanagement.dto.OrderOfPrinterDTO;
import com.printmanagement.service.IOrderOfPrinterService;
import com.printmanagement.service.IPrinterService;
import com.printmanagement.service.IUserService;
import com.printmanagement.util.MessageUtil;

@Controller(value="orderprinterControllerOfAdmin")
public class OrderOfPrinterController {
	@Autowired
	private IOrderOfPrinterService orderOfPrinterService;
	@Autowired
	private IUserService userService;
	@Autowired 
	private IPrinterService printerService;
	
	@RequestMapping(value= "/quan-tri/quan-ly-in/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value="page", required = false) Integer page,
			@RequestParam(value="limit", required = false) Integer limit, 
			@RequestParam(value = "printStaffId", required = false) Long printStaffId,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam(value = "status", required = false) String status,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/orderprinter/list");
		OrderOfPrinterDTO model = new OrderOfPrinterDTO();
		model.setPage(page != null ? page : 1);
		model.setLimit(limit != null ? limit : 10);
		model.setPrintStaffId(printStaffId);
		model.setStatus(status);
		model.setStartDate(startDate);
		model.setEndDate(endDate);
		
		if(endDate != null) {
			endDate = endDate.equals("") ? null : endDate + " 23:59:59";			
		}
		if(startDate != null && startDate.equals("")) {
			startDate = null;
		}
		
		Pageable pageable = new PageRequest(model.getPage()-1, model.getLimit(), new Sort(Sort.Direction.DESC,"id"));
		model.setListResult(orderOfPrinterService.findByFilter(printStaffId, status, startDate, endDate, pageable));
		model.setTotalItem(orderOfPrinterService.countByFilter(printStaffId, status, startDate, endDate, null));
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if(request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		
		mav.addObject("staffs", userService.findByRolesInAndMapIdName(Arrays.asList("STAFF")));
		mav.addObject("designers", userService.findByRolesInAndMapIdName(Arrays.asList("DESIGNER")));
		mav.addObject("printers", printerService.findAllMapIdName());
		mav.addObject("statusList", new HashMap<String, String>() {{
			put("CREATED", "CREATED");
			put("ASSINGED", "ASSINGED");
			put("PRINTING", "PRINTING");
			put("PRINTED", "PRINTED");
		}});
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/quan-ly-in/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editItem(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/orderprinter/edit");
		OrderOfPrinterDTO model = new OrderOfPrinterDTO();
		
		if(id != null) {
			model = orderOfPrinterService.findOne(id);
		}
		
		if(request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}
}
