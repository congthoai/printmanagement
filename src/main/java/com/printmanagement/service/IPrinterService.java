package com.printmanagement.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.printmanagement.dto.PrinterDTO;

public interface IPrinterService {
	PrinterDTO save(PrinterDTO dto);
	List<PrinterDTO> findAll();
	List<PrinterDTO> findAll(Pageable pageable);
	PrinterDTO findOne(Long id);
	void delete(long[] ids);
	int getTotalItem();
	Map<Long, String> findAllMapIdName();
}
