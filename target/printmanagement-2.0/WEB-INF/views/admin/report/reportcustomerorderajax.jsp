<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
	
	<table id="tableReportCustomerOrder"
		class="table table-striped table-bordered" style="width: 99%; border: 1px black solid;">
		<thead>
			<tr role="row">
				<th style="background-color: rgb(84, 141, 212);color:black" class="textcenter code">Số phiếu</th>
				<th style="background-color: rgb(84, 141, 212);color:black" class="textcenter orderdate">Ngày</th>
				<th style="background-color: rgb(84, 141, 212);color:black; width: 9em;" class="textcenter">Sản phẩm</th>
				<th style="background-color: rgb(84, 141, 212);color:black" class="textcenter content">Nội dung</th>
				<th style="background-color: rgb(84, 141, 212);color:black" class="textcenter">Dài</th>
				<th style="background-color: rgb(84, 141, 212);color:black" class="textcenter">Rộng</th>
				<th style="background-color: rgb(84, 141, 212);color:black" class="textcenter">Số lần</th>
				<th style="background-color: rgb(84, 141, 212);color:black" class="textcenter area">Diện tích</th>
				<th style="background-color: rgb(84, 141, 212);color:black" class="textcenter price">Đơn giá</th>
				<th style="background-color: rgb(84, 141, 212);color:black" class="textcenter total">Thành tiền</th>
			</tr>
		</thead>
		<tbody>
		
			<!-- <tr role="row">
				<td style="background-color: rgb(84, 141, 212);" class="textcenter">Số phiếu</td>
				<td style="background-color: rgb(84, 141, 212);" class="textcenter">Ngày</td>
				<td style="background-color: rgb(84, 141, 212);" class="textcenter">Sản phẩm</td>
				<td style="background-color: rgb(84, 141, 212);" class="textcenter">Nội dung</td>
				<td style="background-color: rgb(84, 141, 212);" class="textcenter">Dài</td>
				<td style="background-color: rgb(84, 141, 212);" class="textcenter">Rộng</td>
				<td style="background-color: rgb(84, 141, 212);" class="textcenter">Số lần</td>
				<td style="background-color: rgb(84, 141, 212);" class="textcenter">Diện tích</td>
				<td style="background-color: rgb(84, 141, 212);" class="textcenter">Đơn giá</td>
				<td style="background-color: rgb(84, 141, 212);" class="textcenter">Thành tiền</td>
			</tr> -->
			<c:set var="totalbycustomer" value="0" scope="page" />
			<c:set var="total" value="0" scope="page" />
			<c:set var="count" value="0" scope="page" />
			<c:set var="totalCountCustomer" value="0" scope="page" />
			<c:set var="totalarea" value="0" scope="page" />
			<c:set var="areabycustomer" value="0" scope="page" />
			<c:set var="countbycustomer" value="0" scope="page" />
			<c:set var="currentCustomerId" value="0" scope="page" />

			<c:forEach var="model" items="${models}">
				
				<c:if test="${model.customer.id != currentCustomerId}">
					
					<c:if test="${count == 0}">
						<tr style="background-color: rgb(184, 204, 228);">
							<td colspan="2" class="textcenter" style="text-align: center"><b>${model.customer.code }</b></td>
							<td colspan="2" class="textcenter" style="text-align: center"><b>${model.customer.name }</b></td>
							<td colspan="6"></td>
						</tr>
					</c:if>
					
					<c:if test="${count != 0}">
						<tr>
							<td colspan="4"></td>
							<td colspan="2" style="background-color:yellow">Tổng theo khách hàng</td>
							<td colspan="1" style="background-color:yellow">Số đơn: ${countbycustomer }</td>
							<td colspan="1" style="background-color:yellow; text-align: right" class="textright">
								Diện tích: <fmt:formatNumber type="number" maxFractionDigits="2" value="${areabycustomer}" /></td>
							
							<td colspan="2" style="background-color:yellow;text-align: right" class="textright">Số tiền: <fmt:formatNumber type="number" groupingUsed="true" value="${totalbycustomer}"/> </td>
						</tr>
						<tr style="background-color: rgb(184, 204, 228);">
							<td colspan="2" class="textcenter" style="text-align: center"><b>${model.customer.code }</b></td>
							<td colspan="2" class="textcenter" style="text-align: center"><b>${model.customer.name }</b></td>
							<td colspan="6"></td>
						</tr>
					</c:if>
					
					<c:set var="totalCountCustomer" value="${totalCountCustomer + 1 }" scope="page"/>
					<c:set var="totalbycustomer" value="0" scope="page"/>
					<c:set var="areabycustomer" value="0" scope="page"/>
					<c:set var="countbycustomer" value="0" scope="page"/>
					<c:set var="currentCustomerId" value="${model.customer.id}" scope="page"/>
				</c:if>
				
				<c:if test="${model.customer.id == currentCustomerId}">
					<tr role="row" class="odd">
						<td class="textcenter" style="text-align: center">${model.code}</td>
						<td class="textcenter" style="text-align: center"><fmt:formatDate pattern = "dd/MM/yyyy hh:mm:ss" value = "${model.orderDate}" /></td>
						<td class="textleft">${model.item.name }</td>
						<td class="textleft">${model.content }</td>
						<td class="textright" style="text-align: right">${model.width }</td>
						<td class="textright" style="text-align: right">${model.height }</td>
						<td class="textright" style="text-align: right">${model.quantity }</td>
						<td class="textright" style="text-align: right">${model.area }</td>
						<td class="textright" style="text-align: right"><fmt:formatNumber type="number" groupingUsed="true" value="${model.price}"/></td>
						<td class="textright" style="text-align: right"><fmt:formatNumber type="number" groupingUsed="true" value="${model.total}"/></td>
					</tr>
				</c:if>
				
				<c:set var="totalbycustomer" value="${totalbycustomer + model.total }" scope="page"/>
				<c:set var="areabycustomer" value="${areabycustomer + model.area }" scope="page"/>
				<c:set var="countbycustomer" value="${countbycustomer + 1 }" scope="page"/>
				<c:set var="count" value="${count+1}" scope="page"/>
				<c:set var="totalarea" value="${totalarea + model.area }" scope="page"/>
				<c:set var="total" value="${total + model.total }" scope="page"/>
				
				<c:if test="${count == models.size() && totalCountCustomer > 1}">
					<tr>
						<td colspan="4"></td>
						<td colspan="2" style="background-color:yellow">Tổng theo khách hàng</td>
						<td colspan="1" style="background-color:yellow">Số đơn: ${countbycustomer }</td>
						<td colspan="1" style="background-color:yellow;text-align: right" class="textright">
							Diện tích: <fmt:formatNumber type="number" maxFractionDigits="2" value="${areabycustomer}" /></td>
						
						<td colspan="2" style="background-color:yellow;text-align: right" class="textright" >Số tiền: <fmt:formatNumber type="number" groupingUsed="true" value="${totalbycustomer}"/> </td>
					</tr>
				</c:if>
				
			</c:forEach>
			
				<tr style="background-color:aquamarine">
					<td colspan="2">Tổng cộng</td>
					<td colspan="4">Số khách: ${totalCountCustomer }</td>
					<td colspan="1">Số đơn: ${count }</td>
					<td colspan="1" class="textright" style="text-align: right">
						Diện tích: <fmt:formatNumber type="number" maxFractionDigits="2" value="${totalarea}" /></td>
					
					<td colspan="2" class="textright" style="text-align: right">Số tiền: <fmt:formatNumber type="number" groupingUsed="true" value="${total}"/> </td>
				</tr>
		</tbody>
	</table>

