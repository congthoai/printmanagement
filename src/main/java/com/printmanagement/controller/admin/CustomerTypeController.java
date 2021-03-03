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

import com.printmanagement.dto.CustomerTypeDTO;
import com.printmanagement.service.ICustomerTypeService;
import com.printmanagement.util.MessageUtil;

@Controller(value="customertypeControllerOfAdmin")
public class CustomerTypeController {
	@Autowired
	private ICustomerTypeService customertypeService;
	
	@RequestMapping(value= "/quan-tri/loai-khach-hang/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value="page", required = false) Integer page,
			@RequestParam(value="limit", required = false) Integer limit, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/customertype/list");
		CustomerTypeDTO model = new CustomerTypeDTO();
		model.setPage(page != null ? page : 1);
		model.setLimit(limit != null ? limit : 10);
		Pageable pageable = new PageRequest(model.getPage()-1, model.getLimit());
		model.setListResult(customertypeService.findAll(pageable));
		model.setTotalItem(customertypeService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if(request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/loai-khach-hang/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editCustomerType(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/customertype/edit");
		CustomerTypeDTO model = new CustomerTypeDTO();
		
		if(id != null) {
			model = customertypeService.findOne(id);
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
