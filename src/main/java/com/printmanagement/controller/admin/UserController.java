package com.printmanagement.controller.admin;

import java.util.HashMap;
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

import com.printmanagement.dto.UserDTO;
import com.printmanagement.service.IUserService;
import com.printmanagement.util.MessageUtil;

@Controller(value = "userControllerOfAdmin")
public class UserController {

	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/quan-tri/tai-khoan/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(HttpServletRequest request, @RequestParam(value="page", required = false) Integer page,
			@RequestParam(value="limit", required = false) Integer limit) {
		ModelAndView mav = new ModelAndView("admin/user/list");
		UserDTO model = new UserDTO();
		model.setPage(page != null ? page : 1);
		model.setLimit(limit != null ? limit : 5);
		Pageable pageable = new PageRequest(model.getPage() - 1, model.getLimit());
		model.setListResult(userService.findAll(pageable));
		model.setTotalItem(userService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));

		if (request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}

		mav.addObject("model", model);
		return mav;
	}

	@RequestMapping(value = "/quan-tri/tai-khoan/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editItem(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/user/edit");
		UserDTO model = new UserDTO();

		if (id != null) {
			model = userService.findOne(id);
		}

		if (request.getParameter("message") != null) {
			Map<String, String> message = MessageUtil.getInstance().getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("userRoles", new HashMap<String, String>() {
			{
				put("ADMIN", "ADMIN");
				put("USER", "USER");
				put("DESIGNER", "DESIGNER");
				put("STAFF", "STAFF");
			}
		});
		
		mav.addObject("userStatus", new HashMap<Long, String>() {
			{
				put(1L, "Hoạt động");
				put(0L, "Đình chỉ");
			}
		});
		mav.addObject("model", model);
		return mav;
	}
}
