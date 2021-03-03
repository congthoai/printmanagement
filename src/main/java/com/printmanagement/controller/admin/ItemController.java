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

import com.printmanagement.dto.ItemDTO;
import com.printmanagement.service.IItemService;
import com.printmanagement.service.IPriceListService;
import com.printmanagement.util.MessageUtil;

@Controller(value="itemControllerOfAdmin")
public class ItemController {
	@Autowired
	private IItemService itemService;
	@Autowired
	private IPriceListService priceListService;
	
	@RequestMapping(value= "/quan-tri/san-pham/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value="page", required = false) Integer page,
			@RequestParam(value="limit", required = false) Integer limit, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/item/list");
		ItemDTO model = new ItemDTO();
		model.setPage(page != null ? page : 1);
		model.setLimit(limit != null ? limit : 10);
		Pageable pageable = new PageRequest(model.getPage()-1, model.getLimit());
		model.setListResult(itemService.findAll(pageable));
		model.setTotalItem(itemService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if(request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/san-pham/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editItem(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/item/edit");
		ItemDTO model = new ItemDTO();
		
		if(id != null) {
			model = itemService.findOne(id);
		}
		
		if(request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/san-pham/bang-gia", method = RequestMethod.GET)
	public ModelAndView showPriceListDetail(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/item/pricelistdetail");
		ItemDTO model = new ItemDTO();
		
		if(id == null) {
			return showList(null, null, request);
		}
		
		model = itemService.findOne(id);
		model.setPricelists(priceListService.findListAllCustomerByItem(id));
		
		if(request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("model", model);
		return mav;
	}
}
