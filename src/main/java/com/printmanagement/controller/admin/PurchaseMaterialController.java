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

import com.printmanagement.dto.PurchaseMaterialDTO;
import com.printmanagement.service.IMaterialService;
import com.printmanagement.service.IPurchaseMaterialService;
import com.printmanagement.util.MessageUtil;

@Controller(value="purchaseMaterialControllerOfAdmin")
public class PurchaseMaterialController {
	@Autowired
	private IPurchaseMaterialService purchaseMaterialService;
	@Autowired
	private IMaterialService materialService;
	
	@RequestMapping(value= "/quan-tri/nhap-vat-tu/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value="page", required = false) Integer page,
			@RequestParam(value="limit", required = false) Integer limit, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/purchasematerial/list");
		PurchaseMaterialDTO model = new PurchaseMaterialDTO();
		model.setPage(page != null ? page : 1);
		model.setLimit(limit != null ? limit : 10);
		Pageable pageable = new PageRequest(model.getPage()-1, model.getLimit());
		model.setListResult(purchaseMaterialService.findAll(pageable));
		model.setTotalItem(purchaseMaterialService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if(request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/nhap-vat-tu/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editPurchaseMaterial(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/purchasematerial/edit");
		PurchaseMaterialDTO model = new PurchaseMaterialDTO();
		
		if(id != null) {
			model = purchaseMaterialService.findOne(id);
		}
		
		if(request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("materials", materialService.findAllMapIdName());
		mav.addObject("model", model);
		return mav;
	}
}
