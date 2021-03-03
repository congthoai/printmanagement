package com.printmanagement.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.printmanagement.dto.CustomerDTO;
import com.printmanagement.service.ICustomerService;
import com.printmanagement.service.ICustomerTypeService;
import com.printmanagement.util.MessageUtil;

@Controller(value="customerControllerOfAdmin")
public class CustomerController {
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private ICustomerTypeService customertypeService;
	
	@RequestMapping(value= "/quan-tri/khach-hang/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value="page", required = false) Integer page,
			@RequestParam(value="limit", required = false) Integer limit, 
			@RequestParam(value = "name", required = false) String name,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/customer/list");
		CustomerDTO model = new CustomerDTO();
		model.setPage(page != null ? page : 1);
		model.setLimit(limit != null ? limit : 10);
		model.setName((name == null || name.equals(""))? "" : name);
		Pageable pageable = new PageRequest(model.getPage()-1, model.getLimit());
		model.setListResult(customerService.findByNameContaining(model.getName(), pageable));
		model.setTotalItem(customerService.findByNameContaining(model.getName(), new PageRequest(0, 999999)).size());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if(request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/khach-hang/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editItem(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/customer/edit");
		CustomerDTO model = new CustomerDTO();
		
		if(id != null) {
			model = customerService.findOne(id);
		}
		
		if(request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("customertypes", customertypeService.findAllMapIdName());
		mav.addObject("model", model);
		return mav;
	}
}
