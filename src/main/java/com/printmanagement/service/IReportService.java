package com.printmanagement.service;

import java.util.List;

import com.printmanagement.dto.OrdersDTO;

public interface IReportService {
	void exportReportCustomerOrderWord(List<OrdersDTO> models, String rootPath, String headerStr, String footerStr, String dateTitle, String statusTitle, String reportName);
}
