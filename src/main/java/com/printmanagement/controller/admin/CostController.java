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

import com.printmanagement.dto.CostDTO;
import com.printmanagement.service.ICostService;
import com.printmanagement.util.MessageUtil;

@Controller(value="costControllerOfAdmin")
public class CostController {
	@Autowired
	private ICostService costService;
	
	@RequestMapping(value= "/quan-tri/chi-phi/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value="page", required = false) Integer page,
			@RequestParam(value="limit", required = false) Integer limit, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/cost/list");
		CostDTO model = new CostDTO();
		model.setPage(page != null ? page : 1);
		model.setLimit(limit != null ? limit : 10);
		Pageable pageable = new PageRequest(model.getPage()-1, model.getLimit());
		model.setListResult(costService.findAll(pageable));
		model.setTotalItem(costService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if(request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/chi-phi/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editCost(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/cost/edit");
		CostDTO model = new CostDTO();
		
		if(id != null) {
			model = costService.findOne(id);
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
