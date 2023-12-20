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

import com.printmanagement.dto.PriceListDTO;
import com.printmanagement.service.ICustomerTypeService;
import com.printmanagement.service.IItemService;
import com.printmanagement.service.IPriceListService;
import com.printmanagement.util.MessageUtil;

@Controller(value = "pricelistControllerOfAdmin")
public class PriceListController {
	@Autowired
	private IPriceListService pricelistService;
	@Autowired
	private ICustomerTypeService customertypeService;
	@Autowired
	private IItemService itemService;

	@RequestMapping(value = "/quan-tri/don-gia/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "limit", required = false) Integer limit, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/pricelist/list");
		PriceListDTO model = new PriceListDTO();
		model.setPage(page != null ? page : 1);
		model.setLimit(limit != null ? limit : 10);
		Pageable pageable = new PageRequest(model.getPage() - 1, model.getLimit());
		model.setListResult(pricelistService.findAll(pageable));
		model.setTotalItem(pricelistService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if (request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("model", model);
		return mav;
	}

	@RequestMapping(value = "/quan-tri/don-gia/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editPriceList(HttpServletRequest request,
			@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/pricelist/edit");
		PriceListDTO model = new PriceListDTO();

		if (id != null) {
			model = pricelistService.findOne(id);
		}

		if (request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("customertypes", customertypeService.findAllMapIdName());
		mav.addObject("items", itemService.findAllMapIdName());
		mav.addObject("model", model);
		return mav;
	}

	@RequestMapping(value = "/quan-tri/don-gia/chinh-sua-nhanh", method = RequestMethod.GET)
	public String quickEditPriceList(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id,
			@RequestParam(value = "itemid", required = false) Long itemid,
			@RequestParam(value = "customertypeid", required = false) Long customertypeid,
			@RequestParam(value = "payoutPrice", required = false) String payoutPrice) {

		PriceListDTO model = new PriceListDTO();

		if (id != null) {
			model = pricelistService.findOne(id);
		} else {
			model.setCustomertypeid(customertypeid);
			model.setItemid(itemid);
		}

		if (!model.validatePayoutPrice(payoutPrice)) {
			return null;
		}

		model.setPayoutPrice(payoutPrice);
		pricelistService.save(model);

		return "redirect:" + request.getHeader("Referer");
	}
}
