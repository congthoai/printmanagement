package com.printmanagement.service.impl;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.printmanagement.converter.OrdersConverter;
import com.printmanagement.dto.OrdersDTO;
import com.printmanagement.dto.ReportBusinessPerformanceDTO;
import com.printmanagement.entity.CustomerEntity;
import com.printmanagement.entity.CustomerTypeEntity;
import com.printmanagement.entity.ItemEntity;
import com.printmanagement.entity.OrdersEntity;
import com.printmanagement.entity.PriceListEntity;
import com.printmanagement.repository.CustomerRepository;
import com.printmanagement.repository.ItemRepository;
import com.printmanagement.repository.OrdersRepository;
import com.printmanagement.repository.PriceListRepository;
import com.printmanagement.service.IOrdersService;
import com.printmanagement.util.MailSenderUtil;

@Service
public class OrdersService implements IOrdersService {
	@Autowired
	private OrdersConverter orderConverter;
	@Autowired
	private OrdersRepository orderRepository;
	@Autowired
	private ItemRepository itemRepository;
	@Autowired
	private CustomerRepository customerRepository;
	@Autowired
	private PriceListRepository pricelistRepository;
	@Autowired
	MailSenderUtil mailSenderUtil;

	@Override
	public OrdersDTO save(OrdersDTO dto) {
		OrdersEntity ordersEntity = new OrdersEntity();
		ItemEntity itemEntity = itemRepository.getOne(dto.getItemid());
		CustomerEntity customerEntity = customerRepository.findOne(dto.getCustomerid());
		CustomerTypeEntity customertypeEntity = customerEntity.getCustomertype();
		PriceListEntity priceListEntity = pricelistRepository.findOneByCustomertypeeAndItemm(customertypeEntity,
				itemEntity);
		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("dd/M/yyyy HH:mm:ss");
		String strDescription = "";
		// String msgStr = "";

		if (dto.getId() != null) {
			OrdersEntity old = orderRepository.findOne(dto.getId());
			Long oldPaid = old.getPaid();
			/* Don hang da thanh toan xong khong cho update nua. */
			if (old.getStatus().equals("paid")) {
				return orderConverter.toDto(old);
			}

			dto.setWidth((float) Math.round(dto.getWidth() * 100) / 100);
			dto.setHeight((float) Math.round(dto.getHeight() * 100) / 100);
			dto.setArea((float) Math.round(dto.getWidth() * dto.getHeight() * dto.getQuantity() * 100) / 100);
			dto.setPrice(priceListEntity.getPrice());
			dto.setTotal(0L + Math.round(priceListEntity.getPrice() * dto.getArea()));

			ordersEntity = orderConverter.toEntity(old, dto);
			ordersEntity.setDebt(ordersEntity.getTotal() - ordersEntity.getPaid());
			strDescription = ordersEntity.getDescription();
			if (ordersEntity.getDebt() <= 0L) {
				ordersEntity.setStatus("paid");
				ordersEntity.setPaymentDate(date);
				strDescription += dateFormat.format(date) + " Thanh toan xong.&#13;";
				// msgStr = "Don hang: " + ordersEntity.getCode() + " da thanh toan xong!<br>
				// Tong so tien: " + dto.getTotal();
			} else {
				if (ordersEntity.getPaid() > 0L) {
					ordersEntity.setStatus("partpaid");
					if (oldPaid - ordersEntity.getPaid() != 0) {
						strDescription += dateFormat.format(date) + " Thanh toan 1 phan: "
								+ (ordersEntity.getPaid() - oldPaid) + " vnd.&#13;";
					}
				} else {
					ordersEntity.setStatus("unpaid");
				}
			}
		} else {
			dto.setStatus("unpaid");
			strDescription = dateFormat.format(date) + " Don hang duoc tao.&#13;";
			dto.setWidth((float) Math.round(dto.getWidth() * 100) / 100);
			dto.setHeight((float) Math.round(dto.getHeight() * 100) / 100);
			dto.setArea((float) Math.round(dto.getWidth() * dto.getHeight() * dto.getQuantity() * 100) / 100);
			dto.setPrice(priceListEntity.getPrice());
			dto.setTotal(0L + Math.round(priceListEntity.getPrice() * dto.getArea()));
			dto.setDebt(dto.getTotal());
			dto.setPaid(0L);
			dto.setCode(generateOrderCode());

			ordersEntity = orderConverter.toEntity(dto);
			ordersEntity.setOrderDate(stringToOrderDate(dto.getOrderDateStr()));
			// msgStr = "Quý khách có DH moi: <br>SP - " + itemEntity.getName() + " <br>Dien
			// tich - " + dto.getArea() + " <br>So tien - " + dto.getTotal();
		}

		ordersEntity.setDescription(strDescription);
		ordersEntity.setItem(itemEntity);
		ordersEntity.setCustomer(customerEntity);
		OrdersDTO ordersDTO = orderConverter.toDto(orderRepository.save(ordersEntity));

		/*
		 * if(!msgStr.equals("")) { mailSenderUtil.sendMail("admin@inphattin.com",
		 * "Test Emai Tao Don Hang", msgStr); }
		 */

		return ordersDTO;
	}

	@Override
	public List<OrdersDTO> findAll() {
		List<OrdersDTO> rs = new ArrayList<>();
		List<OrdersEntity> entites = orderRepository.findAll();
		for (OrdersEntity entity : entites) {
			rs.add(orderConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public OrdersDTO findOne(Long id) {
		return orderConverter.toDto(orderRepository.findOne(id));
	}

	@Override
	public void delete(long[] ids) {
		for (long id : ids) {
			orderRepository.delete(id);
		}
	}

	@Override
	public List<OrdersDTO> findAll(Pageable pageable) {
		List<OrdersDTO> rs = new ArrayList<>();
		List<OrdersEntity> entites = orderRepository.findAll(pageable).getContent();
		for (OrdersEntity entity : entites) {
			rs.add(orderConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public int getTotalItem() {
		return (int) orderRepository.count();
	}

	@Override
	public boolean updatePaidStatus(Long orderid) {
		try {
			Date date = Calendar.getInstance().getTime();
			DateFormat dateFormat = new SimpleDateFormat("dd/M/yyyy hh:mm:ss");
			OrdersEntity ordersEntity = orderRepository.findOne(orderid);
			/* Don hang da thanh toan xong khong cho update nua. */
			if (ordersEntity.getStatus().equals("paid")) {
				return true;
			}

			ordersEntity.setStatus("paid");
			ordersEntity.setPaymentDate(date);
			ordersEntity
					.setDescription(ordersEntity.getDescription() + dateFormat.format(date) + " Thanh toan xong.&#13;");
			ordersEntity.setPaid(ordersEntity.getTotal());
			ordersEntity.setDebt(0L);
			orderRepository.save(ordersEntity);
			return true;
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Loi Update Paid Status");
			return false;
		}
	}

	@Override
	public void massUpdatePaidStatus(long[] ids) {
		for (long id : ids) {
			updatePaidStatus(id);
		}
	}

	@Override
	public Map<String, String> findAllMapStatus() {
		Map<String, String> rs = new HashMap<>();
		rs.put("paid", "Đã thanh toán");
		rs.put("partpaid", "Thanh toán một phần");
		rs.put("unpaid", "Chưa thanh toán");
		return rs;
	}

	@Override
	public List<OrdersDTO> findByFilter(Long customerId, String status, String content, String startDate,
			String endDate, String startPaymentDate, String endPaymentDate, Pageable pageable) {
		List<OrdersDTO> rs = new ArrayList<>();
		List<OrdersEntity> entites = orderRepository.findByFilter(customerId, status, content, startDate, endDate,
				startPaymentDate, endPaymentDate, pageable);
		for (OrdersEntity entity : entites) {
			rs.add(orderConverter.toDto(entity));
		}
		return rs;
	}

	public String generateOrderCode() {
		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyMddhhmmss");
		String strDate = "DH" + orderRepository.count() + "-" + dateFormat.format(date);
		return strDate;
	}

	public Date stringToOrderDate(String strDate) {
		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("dd/M/yyyy HH:mm:ss");
		DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

		if (strDate != null && !strDate.equals("")) {
			try {
				Date orderDate = dateFormat.parse(strDate + " " + timeFormat.format(date));
				return orderDate;
			} catch (ParseException e) {
				return date;
			}

		} else {
			return date;
		}

	}

	@Override
	public List<OrdersDTO> findByFilter2(Long customerId, String status, String content, String startDate,
			String endDate, String startPaymentDate, String endPaymentDate, int page, int limit) {
		List<OrdersDTO> rs = new ArrayList<>();
		List<OrdersEntity> entites = orderRepository.findByFilter2(customerId, status, content, startDate, endDate,
				startPaymentDate, endPaymentDate, (page - 1) * limit, limit);
		for (OrdersEntity entity : entites) {
			rs.add(orderConverter.toDto(entity));
		}
		return rs;
	}

	@Override
	public ReportBusinessPerformanceDTO reportBusinessPerformanceOrder(Date startDate, Date endDate) {
		Object obj = orderRepository.reportBusinessPerformanceOrder(startDate, endDate);
		ReportBusinessPerformanceDTO dto = new ReportBusinessPerformanceDTO();
		
		 try {
			 
			 dto.setCount(((BigInteger)((Object[])obj)[0]).longValue());
			 dto.setTotalSaleOrder(((Object[]) obj)[1]== null ? null : ((BigDecimal) ((Object[]) obj)[1]).longValue());
			 dto.setTotalPaid(((Object[]) obj)[2]== null ? null : ((BigDecimal) ((Object[]) obj)[2]).longValue());
			 dto.setTotalDebt(((Object[]) obj)[3]== null ? null : ((BigDecimal) ((Object[]) obj)[3]).longValue());
			 Double totalArea =((Object[]) obj)[4]== null ? 0 : (Double)((Object[]) obj)[4];
			 dto.setTotalPrintArea(totalArea);
		} catch (Exception e) {
			System.out.println("Err cast Obj to ReportBusinessPerformanceDTO");
		}

		return dto;
	}
}
