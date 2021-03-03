<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="itemURL" value="/quan-tri/san-pham/danh-sach" />
<c:url var="editPriceURL" value="/quan-tri/don-gia/chinh-sua-nhanh" />
<c:url var="pricelistAPI" value="/api/pricelist" />
<html>
<head>
<title>Bảng giá sản phẩm</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value='/quan-tri/trang-chu'/>">Trang quản trị</a>
					</li>

					<li><a href="${itemURL}?">Danh sách Sản phẩm</a></li>
					<li class="active"></li>
					<li><a href="#">Chi tiết bảng giá</a></li>
					<li class="active"></li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
						<br>
						<div class="page-header">
							<div class="row">
										<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2"></div>
										<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
											<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
												<label class="label label-success">Mã SP:</label>
											</div>
											<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
												<input type="text" readonly="true" value="${model.code }" style="width:100%">
											</div>

										</div>
										<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
											<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
												<label class="label label-success">Tên SP:</label>
											</div>
											<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
												<input type="text" readonly="true" value="${model.name }" style="width:100%">
											</div>

										</div>
										<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
											
										</div>
							</div>
						</div>
						<br>
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">Bảng giá sản phẩm</h3>
							</div>
							<div class="panel-footer">
								<table class="table table-striped table-hover">
											<thead>
												<tr>
													<th>STT</th>
													<th>Sản phẩm</th>
													<th>Loại khách</th>
													<th style="width: 20%">Đơn giá</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="count" value="1" scope="page" /> 
												<c:forEach var="pricelist" items="${model.pricelists}">
													<tr id="pricelistid${pricelist.id}" data-id="${pricelist.id }" class="pricerow">
														<td>${count}</td>
														<td>${model.name }</td>
														<td>${pricelist.customertypeName }</td>
														<td>
															<input type="number" class="price-value-edit" value="${pricelist.price}"/>
														</td>
														<td>
															<button class="btn btn-xs btn-primary btnSavePriceList"
																value="?id=${pricelist.id}&itemid=${model.id}&customertypeid=${pricelist.customertypeid}" >
																<i class="ace-icon fa fa-check"></i>
															</button>
														</td>
													</tr>
													
													<c:set var="count" value="${count+1}" scope="page"/>
												</c:forEach>
											</tbody>
								</table>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		
		$('.pricerow').each(function() {
			if($(this).attr("data-id") == "") {
				$(this).css("background-color", "red");
			}
		});
		
		$(".btnSavePriceList").click(function () {
			let price = $(this).parent().parent().find('.price-value-edit').val();
			let href = '${editPriceURL}' + $(this).val() +"&price=" + price;

			$.get(href, function(data,status){
	    		 location.reload();
	    	});
		});
	
		$(".danh-muc").addClass("open");
	</script>
</body>
</html>
