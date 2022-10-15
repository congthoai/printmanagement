package com.printmanagement.service.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.OrderOfPrinterConverter;
import com.printmanagement.dto.OrderOfPrinterDTO;
import com.printmanagement.entity.OrderOfPrinterEntity;
import com.printmanagement.entity.OrdersEntity;
import com.printmanagement.entity.PrinterEntity;
import com.printmanagement.entity.UserEntity;
import com.printmanagement.repository.OrderOfPrinterRepository;
import com.printmanagement.repository.OrdersRepository;
import com.printmanagement.repository.PrinterRepository;
import com.printmanagement.repository.UserRepository;
import com.printmanagement.service.IOrderOfPrinterService;

@Service
public class OrderOfPrinterService implements IOrderOfPrinterService {
    @Autowired
    private OrderOfPrinterRepository orderOfPrinterRepository;
    @Autowired
    private OrderOfPrinterConverter orderOfPrinterConverter;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private OrdersRepository orderRepository;
    @Autowired
    private PrinterRepository printerRepository;
    
    @Override
    public OrderOfPrinterDTO save(OrderOfPrinterDTO dto) {
        OrderOfPrinterEntity orderOfPrinterEntity = new OrderOfPrinterEntity();
        UserEntity printStaff = dto.getPrintStaffId() != null ? userRepository.findOne(dto.getPrintStaffId()) : null;
        UserEntity designStaff = dto.getDesignStaffId() != null ? userRepository.findOne(dto.getDesignStaffId()) : null;
        PrinterEntity printer = dto.getPrinterId() != null ? printerRepository.findOne(dto.getPrinterId()) : null;
        OrdersEntity orderEntity = dto.getOrderId() != null? orderRepository.findOne(dto.getOrderId()) : null;
        
        if(orderEntity != null) {
        	dto.setCode(orderEntity.getCode().replace("DH", "IN"));
        }

        if (dto.getId() != null) {
            OrderOfPrinterEntity old = orderOfPrinterRepository.findOne(dto.getId());
            orderOfPrinterEntity = orderOfPrinterConverter.toEntity(old, dto);
            if(printStaff != null || designStaff != null) {
            	orderOfPrinterEntity.setStatus("ASSIGNED");
            }
            if(printStaff != null && designStaff != null) {
            	orderOfPrinterEntity.setStatus("PRINTING");
            }
        } else {
        	dto.setStatus("CREATED");
            orderOfPrinterEntity = orderOfPrinterConverter.toEntity(dto);
        }
        
        if(printStaff != null && designStaff != null && printer != null) {
        	orderOfPrinterEntity.setStatus("PRINTED");
        }

        orderOfPrinterEntity.setPrintStaff(printStaff);
        orderOfPrinterEntity.setDesignStaff(designStaff);
        orderOfPrinterEntity.setPrinter(printer);
        orderOfPrinterEntity.setOrderr(orderEntity);
        return orderOfPrinterConverter.toDto(orderOfPrinterRepository.save(orderOfPrinterEntity));
    }
    
    @Override
    public List<OrderOfPrinterDTO> findAll(Pageable pageable) {
        List<OrderOfPrinterDTO> rs = new ArrayList<>();
        List<OrderOfPrinterEntity> entites = orderOfPrinterRepository.findAll(pageable).getContent(); 
        for (OrderOfPrinterEntity entity : entites) {
            rs.add(orderOfPrinterConverter.toDto(entity));
        }
        return rs;
    }
    
    @Override
    public List<OrderOfPrinterDTO> findAll() {
        List<OrderOfPrinterDTO> rs = new ArrayList<>();
        List<OrderOfPrinterEntity> entites = orderOfPrinterRepository.findAll(); 
        for (OrderOfPrinterEntity entity : entites) {
            rs.add(orderOfPrinterConverter.toDto(entity));
        }
        return rs;
    }

    @Override
    public void delete(long[] ids) {
        for (long id : ids) {
            orderOfPrinterRepository.delete(id);
        }
    }

    @Override
    public OrderOfPrinterDTO findOne(Long id) {
        return orderOfPrinterConverter.toDto(orderOfPrinterRepository.findOne(id));
    }

    @Override
    public int getTotalItem() {
        return (int) orderOfPrinterRepository.count();
    }

    @Override
    public Map<Long, String> findAllMapIdName() {
        List<OrderOfPrinterEntity> entities = orderOfPrinterRepository.findAll();
        Map<Long, String> rs = new HashMap<>();
        
        for (OrderOfPrinterEntity entity : entities) {
            rs.put(entity.getId(), entity.getName());
        }
        return rs;
    }

	@Override
	public List<OrderOfPrinterDTO> findByFilter(Long printStaffId, String status, String startDate, String endDate,
			Pageable pageable) {
		List<OrderOfPrinterDTO> rs = new ArrayList<>();
		List<OrderOfPrinterEntity> entites = orderOfPrinterRepository.findByFilter(printStaffId, status, startDate, endDate, pageable);
		for (OrderOfPrinterEntity entity : entites) {
			rs.add(orderOfPrinterConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public int countByFilter(Long printStaffId, String status, String startDate, String endDate,
			Pageable pageable) {
		int rs = 0;
		List<Object[]> entites = orderOfPrinterRepository.countByFilter(printStaffId, status, startDate, endDate, pageable);
		for (Object entity : entites) {
			try {
				rs = ((BigInteger) entity).intValue();
			} catch(Exception ex) {
				System.out.println(ex.getMessage());
			}
		}
		return rs;
	}

}
