package com.printmanagement.controller.admin;

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

import com.printmanagement.dto.OrdersDTO;
import com.printmanagement.service.ICustomerService;
import com.printmanagement.service.IItemService;
import com.printmanagement.service.IOrdersService;
import com.printmanagement.util.MessageUtil;

@Controller(value = "orderControllerOfAdmin")
public class OrdersController {
	@Autowired
	private IOrdersService orderService;
	@Autowired
	private IItemService itemService;
	@Autowired
	private ICustomerService customerService;

	/*
	 * @RequestMapping(value= "/quan-tri/don-hang/danh-sach2", method =
	 * RequestMethod.GET) public ModelAndView showList2(@RequestParam(value="page",
	 * required = false) Integer page,
	 * 
	 * @RequestParam(value="limit", required = false) Integer limit,
	 * HttpServletRequest request) { ModelAndView mav = new
	 * ModelAndView("admin/order/list"); OrdersDTO model = new OrdersDTO();
	 * model.setPage(page != null ? page : 1); model.setLimit(limit != null ? limit
	 * : 10); Pageable pageable = new PageRequest(model.getPage()-1,
	 * model.getLimit()); model.setTableName("order");
	 * model.setListResult(orderService.findAll(pageable));
	 * model.setTotalItem(orderService.getTotalItem()); model.setTotalPage((int)
	 * Math.ceil((double) model.getTotalItem() / model.getLimit()));
	 * if(request.getParameter("message") != null) { Map<String, String> message =
	 * MessageUtil.getInstance().getMessage(request.getParameter("message"));
	 * mav.addObject("message", message.get("message")); mav.addObject("alert",
	 * message.get("alert")); }
	 * 
	 * mav.addObject("statusList", orderService.findAllMapStatus());
	 * mav.addObject("customers", customerService.findAllMapIdName());
	 * mav.addObject("model", model); return mav; }
	 */

	@RequestMapping(value = "/quan-tri/don-hang/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(HttpServletRequest request,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "sortBy", required = false) String sortBy,
			@RequestParam(value = "customerid", required = false) Long customerid,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "content", required = false) String content,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam(value = "startPaymentDate", required = false) String startPaymentDate,
			@RequestParam(value = "endPaymentDate", required = false) String endPaymentDate) {
		ModelAndView mav = new ModelAndView("admin/order/list");
		OrdersDTO model = new OrdersDTO();
		model.setStatus(status);
		model.setSortBy(sortBy != null ? sortBy : "orderdateDESC");
		model.setContent(content);
		model.setCustomerid(customerid);
		model.setStartDate(startDate);
		model.setEndDate(endDate);
		model.setStartPaymentDate(startPaymentDate);
		model.setEndPaymentDate(endPaymentDate);
		model.setPage(page != null ? page : 1);
		model.setLimit(limit != null ? limit : 10);
		model.setTableName("order");

		Sort sort = getSortBy(sortBy);
		Pageable pageable = new PageRequest(model.getPage() - 1, model.getLimit(), sort);

		if (endDate != null) {
			endDate = endDate.equals("") ? null : endDate + " 23:59:59";
		}
		if (startDate != null && startDate.equals("")) {
			startDate = null;
		}

		if (endPaymentDate != null) {
			endPaymentDate = endPaymentDate.equals("") ? null : endPaymentDate + " 23:59:59";
		}
		if (startPaymentDate != null && startPaymentDate.equals("")) {
			startPaymentDate = null;
		}
		model.setListResult(orderService.findByFilter(customerid, status, content, startDate, endDate, startPaymentDate,
				endPaymentDate, pageable));
		model.setTotalItem(orderService
				.findByFilter(customerid, status, content, startDate, endDate, startPaymentDate, endPaymentDate, null)
				.size());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if (request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("statusList", orderService.findAllMapStatus());
		mav.addObject("customers", customerService.findAllMapIdName());
		mav.addObject("itemList", itemService.findAllMapIdName());
		mav.addObject("orderbys", new HashMap<String, String>() {
			{
				put("orderdateDESC", "Ngày đơn hàng mới nhất");
				put("orderdateASC", "Ngày đơn hàng cũ nhất");
				put("createddateDESC", "Ngày tạo mới nhất");
				put("createddateASC", "Ngày tạo cũ nhất");
			}
		});
		mav.addObject("model", model);
		return mav;
	}

	@RequestMapping(value = "/quan-tri/don-hang/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editOrders(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/order/edit");
		OrdersDTO model = new OrdersDTO();
		model.setPaid(0L);

		if (id != null) {
			model = orderService.findOne(id);
		}

		if (request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		model.setTableName("order");
		mav.addObject("items", itemService.findAllMapIdName());
		mav.addObject("customers", customerService.findAllMapIdName());
		mav.addObject("model", model);
		return mav;
	}

	public Sort getSortBy(String value) {
		Sort sort = new Sort(Sort.Direction.DESC, "orderdate");
		if (value == null)
			return sort;

		if (value.equals("orderdateASC"))
			sort = new Sort(Sort.Direction.ASC, "orderdate");
		if (value.equals("createddateASC"))
			sort = new Sort(Sort.Direction.ASC, "createddate");
		if (value.equals("createddateDESC"))
			sort = new Sort(Sort.Direction.DESC, "createddate");

		return sort;
	}
}
