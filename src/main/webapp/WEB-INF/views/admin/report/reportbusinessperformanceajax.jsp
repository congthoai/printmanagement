<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

	<c:if test="${showTitle == 1}">
		<div class="panel-heading textcenter" >
			<h2><b>KẾT QUẢ KINH DOANH</b></h2>
			<h3>${title}</h3>
		</div>
		<button class="DTTT_button btn btn-white btn-primary btn-bold pull-right exportDoc97" style="margin-right: 30px;">
			<span><i class="fa fa-print bigger-150 grey"></i></span>
		</button>
	</c:if>
	
	<table id="tableReportBusinessPerformance" style="width: 99%;font-size: medium;font-weight: 600;">
			<tr role="row">
				<td  style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;" class="textcenter">Tiền Mua Vật Tư</td>
				<td  style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;" class="textcenter">Chi Phí Khác</td>
				<td  style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;" class="textcenter">Tiền Bán Hàng</td>
				<td  style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;" class="textcenter">Tiền Thực Thu</td>
				<td  style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;" class="textcenter">Công Nợ</td>
				<td  colspan="2" style="border: 1px black solid;background-color: #548DD4;padding: 7px;" class="textcenter">Lợi Nhuận</td>
				<td  style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;" class="textcenter">Tổng DT Mua Vật Tư</td>
				<td  style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;" class="textcenter">Tổng DT In</td>
			</tr>
				
			<tr role="row">
				<td style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;"></td>
				<td style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;"></td>
				<td style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;"></td>
				<td style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;"></td>
				<td style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;"></td>
				<td style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;" class="textcenter"><b>Lãi</b></td>
				<td style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;" class="textcenter"><b>Lỗ</b></td>
				<td style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;"></td>
				<td style="border: 1px #548DD4 solid;background-color: #548DD4;padding: 7px;border-right: 1px black solid;"></td>
			</tr>
			<tr role="row">
				<td style="border: 1px black solid; padding:9px" class="textcenter">
					<fmt:formatNumber type="number" groupingUsed="true" value="${model.totalPurchaseMaterial}"/>
				</td>
				<td style="border: 1px black solid; padding:9px" class="textcenter">
					<fmt:formatNumber type="number" groupingUsed="true" value="${model.totalCost}"/>
				</td>
				<td style="border: 1px black solid; padding:9px" class="textcenter">
					<fmt:formatNumber type="number" groupingUsed="true" value="${model.totalSaleOrder}"/>
				</td>
				<td style="border: 1px black solid; padding:9px" class="textcenter">
					<fmt:formatNumber type="number" groupingUsed="true" value="${model.totalPaid}"/>
				</td>
				<td style="border: 1px black solid; padding:9px" class="textcenter">
					<fmt:formatNumber type="number" groupingUsed="true" value="${model.totalDebt}"/>
				</td>
				<td style="border: 1px black solid; padding:9px" class="textcenter">
					<fmt:formatNumber type="number" groupingUsed="true" value="${model.totalRevenue}"/>
				</td>
				<td style="border: 1px black solid; padding:9px" class="textcenter">
					<fmt:formatNumber type="number" groupingUsed="true" value="${model.totalLossMoney}"/>
				</td>
				<td style="border: 1px black solid; padding:9px" class="textcenter">
					<fmt:formatNumber type="number" groupingUsed="true" value="${model.totalMaterialArea}"/>
				</td>
				<td style="border: 1px black solid; padding:9px" class="textcenter">
					<fmt:formatNumber type="number" groupingUsed="true" value="${model.totalPrintArea}"/>
				</td>
				
			</tr>

	</table>


