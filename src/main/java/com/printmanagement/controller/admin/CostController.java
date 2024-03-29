package com.printmanagement.controller.admin;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
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

import com.printmanagement.dto.CostDTO;
import com.printmanagement.service.ICostService;
import com.printmanagement.util.MessageUtil;

@Controller(value="costControllerOfAdmin")
public class CostController {
	@Autowired
	private ICostService costService;
	
	@RequestMapping(value= "/quan-tri/chi-phi/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value="page", required = false) Integer page,
			@RequestParam(value="limit", required = false) Integer limit, 
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam(value = "isFilter", required = false) Integer isFilter,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/cost/list");
		CostDTO model = new CostDTO();
		model.setPage(page != null ? page : 1);
		model.setLimit(limit != null ? limit : 10);
		model.setIsFilter((isFilter != null && isFilter == 1) ? isFilter : 0);
		if(model.getIsFilter() != 1) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			//startDate = LocalDate.now().withDayOfMonth(1).format(formatter);
			startDate = "";
			endDate = LocalDate.now().withDayOfMonth(LocalDate.now().lengthOfMonth()).format(formatter);
		}
		
		model.setStartDate((startDate == null || startDate.equals(""))? "" : startDate);
		model.setEndDate((endDate == null || endDate.equals(""))? "" : endDate);	
		
		if(startDate == null || startDate.equals("")) {
			startDate = "1997/01/01";
		}
		
		if(endDate == null || endDate.equals("")) {
			endDate = "2099/01/01";
		}
		
		Date sDate = stringToDateTime(startDate, null);
		Date eDate = stringToDateTime(endDate, "23:59:59");
		Sort sort = new Sort(Sort.Direction.DESC,"id");
		
		Pageable pageable = new PageRequest(model.getPage()-1, model.getLimit(), sort);
		model.setListResult(costService.findByCostdateBetween(sDate, eDate, pageable));
		model.setTotalItem(costService.findByCostdateBetween(sDate, eDate, new PageRequest(0, 999999)).size());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		model.setTotalAll(costService.sumTotalByByCostdateBetween(sDate, eDate));
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
	
	public Date stringToDateTime(String strDate, String strTime) {
        Date date = Calendar.getInstance().getTime();  
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		//DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		
		if(strTime == null || strTime.equals("")) {
			strTime = "00:00:01";
		}
		
		if(strDate != null && !strDate.equals("")) {
			try {
				Date orderDate = dateFormat.parse(strDate + " " + strTime);
				return orderDate;
			} catch (ParseException e) {
				return date;
			} 
			
		} else {
			return date;
		}
        
	}
}
