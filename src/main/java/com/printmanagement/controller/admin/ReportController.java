package com.printmanagement.controller.admin;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.printmanagement.dto.OrdersDTO;
import com.printmanagement.dto.ReportBusinessPerformanceDTO;
import com.printmanagement.service.ICostService;
import com.printmanagement.service.ICustomerService;
import com.printmanagement.service.IOrdersService;
import com.printmanagement.service.IPurchaseMaterialService;
import com.printmanagement.service.IReportService;
import com.printmanagement.util.WaterMarkToWordUtil;

@Controller(value = "reportControllerOfAdmin")
public class ReportController {
	@Autowired
	private IOrdersService orderService;
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private WaterMarkToWordUtil waterMarkUtil;
	@Autowired
	private IReportService reportService;
	@Autowired
	private ICostService costService;
	@Autowired
	private IPurchaseMaterialService purchaseService;

	@RequestMapping(value = "/quan-tri/bao-cao/hieu-qua-kinh-doanh", method = RequestMethod.GET)
	public ModelAndView reportBusinessPerformance() {
		ModelAndView mav = new ModelAndView("admin/report/reportbusinessperformance");
		
		return mav;
	}
	
	@RequestMapping(value = "/ajax/report/reportbusinessperformanceajax", method = RequestMethod.GET)
	public ModelAndView reportCustomerOrderAjax2(HttpServletRequest request,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam(value = "showTitle", required = false) Integer showTitle) {
		ModelAndView mav = new ModelAndView("admin/report/reportbusinessperformanceajax");
		
		String title = "Từ ngày thành lập";
		if(startDate != null && !startDate.equals("")) title = "Từ ngày " + startDate;
				
		if(startDate == null || startDate.equals("")) {
			startDate = "1997/01/01";
		}
		
		if(endDate != null) {
			title += endDate.equals("") ? " đến nay " : " đến ngày "+endDate;	
			if(endDate.equals("")) {
				endDate = "2099/01/01";
			}	
		} else {
			title += " đến nay ";
			endDate = "2099/01/01";		
		}
		
		Date sDate = stringToDateTime(startDate, null);
		Date eDate = stringToDateTime(endDate, "23:59:59");
		
		ReportBusinessPerformanceDTO model = orderService.reportBusinessPerformanceOrder(sDate, eDate);
		model.setTotalCost(costService.sumTotalByByCostdateBetween(sDate, eDate));
		model.setTotalPurchaseMaterial(purchaseService.sumTotalByPurchasedateBetween(sDate, eDate));
		model.setTotalMaterialArea(purchaseService.sumAreaByPurchasedateBetween(sDate, eDate));
		Long revenue = model.getTotalSaleOrder() - model.getTotalCost() - model.getTotalPurchaseMaterial();
		model.setTotalRevenue(revenue >= 0 ? revenue : 0L);
		model.setTotalLossMoney(revenue < 0 ? revenue : 0L);
		mav.addObject("model", model);
		mav.addObject("title", title);
		mav.addObject("showTitle", showTitle);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/bao-cao/home", method = RequestMethod.GET)
	public ModelAndView reportCustomerOrder() {
		ModelAndView mav = new ModelAndView("admin/report/reportcustomerorder");
		
		mav.addObject("statusList", orderService.findAllMapStatus());
		mav.addObject("customers", customerService.findAllMapIdName());
		return mav;
	}
	
	@RequestMapping(value = "/ajax/report/reportcustomerorderajax", method = RequestMethod.GET)
	public ModelAndView reportCustomerOrderAjax(HttpServletRequest request,
			@RequestParam(value = "customerid", required = false) Long customerid,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate) {
		ModelAndView mav = new ModelAndView("admin/report/reportcustomerorderajax");
		
		String title = "Từ ngày thành lập";
		if(startDate != null && !startDate.equals("")) title = "Từ ngày " + startDate;
				
		if(startDate != null && startDate.equals("")) {
			startDate = null;
		}
		
		if(endDate != null) {
			title += endDate.equals("") ? " đến nay " : " đến ngày "+endDate;	
			endDate = endDate.equals("") ? null : endDate + " 23:59:59";			
		} else {
			title += " đến nay ";
		}
		
		List<OrdersDTO> models =  orderService.findByFilter2(customerid, status, null, startDate, endDate, null, null, 1, 999999999);
		mav.addObject("models", models);
		mav.addObject("title", title);
		return mav;
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/quan-tri/bao-cao/home/exportword", method = RequestMethod.POST)
	@ResponseBody
	public String exportWord(HttpServletRequest request,
			@RequestParam(value = "customerid", required = false) Long customerid,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam(value = "headerStr", required = false) String headerStr,
			@RequestParam(value = "footerStr", required = false) String footerStr,
			@RequestParam(value = "reportName", required = false) String reportName) throws ParseException {
		
		DateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy");  
		String title = "Từ ngày thành lập";
		String statusTitle = "";
		if(startDate != null && !startDate.equals("")) title = "Từ ngày " + dateFormat.format(new SimpleDateFormat("yyyy/mm/dd").parse(startDate));
				
		if(startDate != null && startDate.equals("")) {
			startDate = null;
		}
		
		if(endDate != null) {
			title += endDate.equals("") ? " đến nay " : " đến ngày " + dateFormat.format(new SimpleDateFormat("yyyy/mm/dd").parse(endDate));
			endDate = endDate.equals("") ? null : endDate + " 23:59:59";			
		} else {
			title += " đến nay ";
		}
		
		if(status != null) {
			if(status.equals("paid")) 
				statusTitle = " ĐÃ THANH TOÁN";
			else {
				if(status.equals("unpaid"))
					statusTitle = " CHƯA THANH TOÁN";
				else
					statusTitle = " ĐÃ THANH TOÁN MỘT PHẦN";
			}
		}
		
		try {
			List<OrdersDTO> models =  orderService.findByFilter2(customerid, status, null, startDate, endDate, null, null, 1, 999999999);
			String rootFilePath = request.getRealPath("resources/");
			System.out.println(rootFilePath);
			reportService.exportReportCustomerOrderWord(models, rootFilePath, headerStr, null, title, statusTitle, reportName);
			
			return  reportName +".docx";
		} catch (Exception e) {
			return null;
		}
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/quan-tri/bao-cao/home/exportpdf", method = RequestMethod.POST)
	@ResponseBody
	public String exportPdf(HttpServletRequest request,
			@RequestParam(value = "customerid", required = false) Long customerid,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam(value = "headerStr", required = false) String headerStr,
			@RequestParam(value = "footerStr", required = false) String footerStr,
			@RequestParam(value = "reportName", required = false) String reportName) throws ParseException {
		
		DateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy");  
		String title = "Từ ngày thành lập";
		String statusTitle = "";
		if(startDate != null && !startDate.equals("")) title = "Từ ngày " + dateFormat.format(new SimpleDateFormat("yyyy/mm/dd").parse(startDate));
				
		if(startDate != null && startDate.equals("")) {
			startDate = null;
		}
		
		if(endDate != null) {
			title += endDate.equals("") ? " đến nay " : " đến ngày " + dateFormat.format(new SimpleDateFormat("yyyy/mm/dd").parse(endDate));
			endDate = endDate.equals("") ? null : endDate + " 23:59:59";			
		} else {
			title += " đến nay ";
		}
		
		if(status != null) {
			if(status.equals("paid")) 
				statusTitle = " ĐÃ THANH TOÁN";
			else {
				if(status.equals("unpaid"))
					statusTitle = " CHƯA THANH TOÁN";
				else
					statusTitle = " ĐÃ THANH TOÁN MỘT PHẦN";
			}
		}
		
		try {
			List<OrdersDTO> models =  orderService.findByFilter2(customerid, status, null, startDate, endDate, null, null, 1, 999999999);
			String rootFilePath = request.getRealPath("resources/");
			reportService.exportReportCustomerOrderWord(models, rootFilePath, headerStr, null, title, statusTitle, reportName);		
			return waterMarkUtil.WordToPdf(rootFilePath+"/docs/"+reportName+".docx", rootFilePath);
		} catch (Exception e) {
			return null;
		}
	}
	
	@ResponseBody
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/quan-tri/bao-cao/home/getpathresources", method = RequestMethod.GET)
	public String getPathResources(HttpServletRequest request) {
		String rootFilePath = request.getRealPath("resources/");
		System.out.println(rootFilePath);
		return rootFilePath;
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
