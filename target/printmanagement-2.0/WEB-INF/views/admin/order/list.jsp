<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url var="orderAPI" value="/api/order"/>
<c:url var="pricelistAPI" value="/api/pricelist"/>
<c:url var="orderURL" value="/quan-tri/don-hang/danh-sach"/>
<c:url var="orderEditURL" value="/quan-tri/don-hang/chinh-sua"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách sản phẩm</title>
	</head>

	<body>
		<div class="main-content">
		<form:form id="formSubmit" method="get" modelAttribute="model">
			
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="<c:url value='/quan-tri/trang-chu'/>">Trang quản trị</a>
							</li>
							<li><a href="${orderURL}">Danh sách</a></li>
						</ul>
						<ul class="breadcrumb" style="float: right;">
							<li>Sắp xếp:
									<form:select path="sortBy">
								  	 	<form:options items="${orderbys}"/>
									</form:select>
							</li>
							<li>Số dòng:<form:input path="limit" type="number" style="width: 50px" /></li>
							
						</ul>
					<!-- /.breadcrumb -->
					</div>
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<c:if test="${not empty message}">
									<div class="alert alert-${alert}">
			  							${message}
									</div>
								</c:if>
								<div class="table-filter"></hr>
									<div class="table-btn-controls">
										<div class="col-md-11">
											<div class="row" style="max-width: 1300px;padding: 2px;">
												<div class="col-xs-5" >
													&nbsp&nbspNgày đơn hàng: 												
													<form:input type="text" path="startDate" id="startDate" cssClass="datepk" readonly="true" style="width: 30%;"/>
													<input type="hidden" id="startDateHide"  />
													 &nbsp&nbsp -  &nbsp&nbsp
													<form:input type="text" path="endDate" id="endDate" cssClass="datepk" readonly="true" style="width: 30%;"/>
													<input type="hidden" id="endDateHide"  />
												</div>
												<div class="col-md-2 col-lg-2">
													<form:select path="status" id="status" cssClass="col-md-12">
												  	 	<form:option value="" label="------- Trạng thái All ----"/>
												  	 	<form:options items="${statusList}"/>
												  	 </form:select>
												</div>
												<div class="col-xs-2">
													
													<form:select path="customerid" id="customerid" cssClass="col-md-12">
											  	 		<form:option value="" label="----- Khách hàng All ---"/>
												  	 	<form:options items="${customers}"/>
												  	 </form:select>
												</div>
												
												<div class="col-md-3 pull-right">
													<button id="btnResetFillter" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold">
														 Reset &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span> 
														 <i class="fa fa-refresh pink"></i> </span>
													</button>
												</div>
												
											</div>
											
											<div class="row" style="max-width: 1300px;padding: 2px;">
												<div class="col-xs-5" >
													Ngày thanh toán: 												
													<form:input type="text" path="startPaymentDate" id="startPaymentDate" cssClass="datepk" readonly="true" style="width: 30%;" />
													 &nbsp&nbsp -  &nbsp&nbsp
													<form:input type="text" path="endPaymentDate" id="endPaymentDate" cssClass="datepk" readonly="true" style="width: 30%;"/>
												</div>
												<div class="col-xs-4">
													<form:input id="content" path="content" placeholder="Nội dung lọc ..."  style="width:100%"/>
												</div>
												
												<div class="col-md-3 pull-right">
													<button id="btnFillter" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold">
														 Lọc đơn hàng<span> <i class="fa fa-search pink"></i> </span>
													</button>
												</div>
											</div>
										</div>
										<div class="col-md-1">
											<div class="dt-buttons btn-overlap btn-group pull-right tableTools-container">
												<button id="btnMassUpdateStatus" type="button" onclick="warningCalculateTotalPriceOrders()" 
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Tổng thành tiền các đơn hàng'>
																<span> <i class="fa fa-dollar bigger-110"></i> </span>
												</button>
												<button id="btnMassUpdateStatus" type="button" onclick="massUpdatePaidStatus()"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Cập nhật đã thanh toán hàng loạt'>
																<span> <i class="fa fa-shopping-cart bigger-110"></i> </span>
												</button>
											</div>
										</div>
										<div class="col-md-1">
											<div class="dt-buttons btn-overlap btn-group pull-right tableTools-container">
												<c:url var="createorderURL" value="/quan-tri/don-hang/chinh-sua"/>
												<a flag="info" class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm Đơn Hàng' href='${createorderURL}'>
															<span> <i class="fa fa-plus-circle bigger-110 purple"></i> </span>
												</a> 
												<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa hàng loạt'>
																<span> <i class="fa fa-trash-o bigger-110 pink"></i> </span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12 col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<div class="table-responsive">
											<table class="table table-bordered table-order">
												<thead>
													<tr>
														<th><input type="checkbox" id="checkAll"></th>
														<!-- <th>Mã đơn hàng</th> -->
														<th>Ngày đơn hàng</th>
														<th style="width: 210px">Khách hàng</th>
														<th style="width: 210px">Sản phẩm</th>
														<th style="width: 260px">Nội dung</th>
														<th style="width: 70px">Chiều dài</th>
														<th style="width: 70px">Chiều rộng</th>
														<th style="width: 70px">Diện tích</th>
														<th style="width: 70px">Số lượng</th>
														<th>Đơn giá</th>
														<th>Thành tiền</th>
														<th>Trạng thái</th>
														<th>Ngày thanh toán</th>
														<th>Thanh toán</th>
														<th>Tổng nợ</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model.listResult}">
														<tr id = "orderid${item.id}" class="orderrow" data-orderid="${item.id}">
															<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
															<td class="hide" id="code${item.id}">${item.code}</td>
															<td><a href="${orderEditURL}?id=${item.id}"><fmt:formatDate pattern = "dd/MM/yyyy hh:mm:ss" value = "${item.orderDate}" /></a></td>
															
															<td>
															  	 <select id="customerid${item.id}" style="width: 100%" class="modelcustomerid">
																    <c:forEach var="customer" items="${customers}">
																        <option value="${customer.key}" ${customer.key == item.customer.id  ? 'selected="selected"' : ''}>${customer.value}</option>
																    </c:forEach>
																</select>
															</td>
															
															<td>
																<select id="itemid${item.id}" style="width: 100%" class="modelitem">
																    <c:forEach var="product" items="${itemList}">
																        <option value="${product.key}" ${product.key == item.item.id  ? 'selected="selected"' : ''}>${product.value}</option>
																    </c:forEach>
																</select>
															</td>
															
															<td> 
																<input type="text" id="content${item.id}" value="${item.content}" style="width: 100%;border: 1px solid white;"/>
															</td>
															
															<td>
																<input id="width${item.id}" type="number" class="modelwidth" step="0.01" value="${item.width}" style="width:100%;border: 1px solid white;"/>
															</td>
															
															<td>
																<input id="height${item.id}" type="number" class="modelheight" step="0.01" value="${item.height}" style="width:100%;border: 1px solid white;"/>
															</td>
															
															<td id="area${item.id}">${item.area}</td>
															
															<td>
																<input id="quantity${item.id}" class="modelquantity" type="number" value="${item.quantity}" style="width:100%;border: 1px solid white;"/>
															</td>
															
															<td id="price${item.id}"><fmt:formatNumber type="number" groupingUsed="true" value="${item.price}"/> ₫</td>	
															
															<td id="total${item.id}"><fmt:formatNumber type="number" groupingUsed="true" value="${item.total}"/> ₫</td>														
															
															<td><span id="status${item.id}" class="label label-sm ${ item.statusAlert}">${item.status}</span></td>
															
															<td><fmt:formatDate pattern = "dd/MM/yyyy hh:mm:ss" value = "${item.paymentDate}" /></td>
															
															<td>
															  <input id="paid${item.id}" class="modelpaid" data-type="currency" type="text"
															  	value="${item.paid }"  style="width: 100px;border: none;">			
															</td>
															
															<td id="debt${item.id}" class="modeldebt">
																<fmt:formatNumber type="number" groupingUsed="true" value="${item.debt}"/> ₫
															</td>
															
															<td>
																<c:url var="updateorderURL" value="/quan-tri/don-hang/chinh-sua">
																	<c:param name="id" value="${item.id}"/>															
																</c:url>
																<c:if test="${item.status != 'paid' }">
																	<button id="btnQuickEdit${item.id}" value="${item.id}" title="Sửa nhanh" class="btnQuickEdit btn-xs btn-primary">
																	<i class="ace-icon fa fa-check"></i> </button>
																</c:if>			
																													
																<a class="btn btn-xs btn-success btn-edit hide" data-toggle="tooltip"
																   title="Sửa chi tiết" href='${updateorderURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
																<button value="${item.id}" class="btn-xs btn-danger hide"><i class="ace-icon fa fa-trash-o"></i>
																</button>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<ul class="pagination" id="pagination"></ul>
											<input type="hidden" value="" id="page" name="page"/>
																			
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form:form>
		</div>
		<!-- /.main-content -->
		
		<script src="<c:url value='/template/admin/js/order/order.js' />"></script>
		
		<script>
			var totalPages = ${model.totalPage > 0 ? model.totalPage : 1};
			var currentPage = ${model.page};
			$(function () {
		        window.pagObj = $('#pagination').twbsPagination({
		            totalPages: totalPages,
		            visiblePages: 10,
		            startPage: currentPage,
		            onPageClick: function (event, page) {
		            	if (currentPage != page) {
							$('#page').val(page);
							$('#formSubmit').submit();
						}
		            }
		        });
		    });
		    
			$("#btnFillter").click(function () {
				/* let startDate = $("#startDate").val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
				let endDate = $("#endDate").val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
				$("#startDate").val(startDate);
				$("#endDate").val(endDate); */
				$('#formSubmit').submit();
			});
			
			$('#formSubmit').submit(function () {
				let startDate = $("#startDate").val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
				let endDate = $("#endDate").val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
				$("#startDate").val(startDate);
				$("#endDate").val(endDate);
				
				let startPaymentDate = $("#startPaymentDate").val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
				let endPaymentDate = $("#endPaymentDate").val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
				$("#startPaymentDate").val(startPaymentDate);
				$("#endPaymentDate").val(endPaymentDate);
			});
			
			$("#btnResetFillter").click(function () {
				$("#startDate").val("");
				$("#endDate").val("");
				$("#startPaymentDate").val("");
				$("#endPaymentDate").val("");
				$("#content").val("");
				$("#limit").val(10);
				$("#customerid").val("").change();
				$("#status").val("").change();
				$("#sortBy").val("orderdateDESC").change();
			});
			
		    function warningBeforeDelete() {
				swal({
					title : "Xác nhận xóa",
					text : "Bạn có chắc chắn muốn xóa các hàng đã chọn hay không?",
					type : "warning",
					showCancelButton : true,
					confirmButtonClass : "btn-success",
					cancelButtonClass : "btn-danger",
					confirmButtonText : "Xác nhận",
					cancelButtonText : "Hủy bỏ",
				}).then(
						function(isConfirm) {
							if (isConfirm) {
								var ids = $('tbody input[type=checkbox]:checked').map(function() {
											return $(this).val();
											}).get();
								deleteNew(ids);
							}
						});
			}

			function massUpdatePaidStatus() {
				swal({
					title : "Xác nhận update",
					text : "Bạn có chắc chắn muôn cập nhật trạng thái 'Đã thanh toán' cho các đơn hàng đã chọn hay không?",
					type : "warning",
					showCancelButton : true,
					confirmButtonClass : "btn-success",
					cancelButtonClass : "btn-danger",
					confirmButtonText : "Xác nhận",
					cancelButtonText : "Hủy bỏ",
				}).then(
						function(isConfirm) {console.log(isConfirm);
							if (isConfirm.value) {
								var ids = $('tbody input[type=checkbox]:checked').map(function() {
											return $(this).val();
											}).get();
								//console.log(ids);
								updatePaidStatus(ids);
							}
						});
			}
			
			  function warningCalculateTotalPriceOrders() {
					swal({
						title : "Tổng tiền",
						text : "Tính tổng thành tiền cho các đơn hàng đã chọn?",
						type : "warning",
						showCancelButton : true,
						confirmButtonClass : "btn-success",
						cancelButtonClass : "btn-danger",
						confirmButtonText : "Tính",
						cancelButtonText : "Hủy bỏ",
					}).then(
							function(isConfirm) {
								if (isConfirm) {
									var ids = $('tbody input[type=checkbox]:checked').map(function() {
												return $(this).val();
												}).get();
									let str = "0";
									let total = 0;
									$.each(ids, function(i, v) {
										str += "+" + parseInt(formatCurrencyToNumer($("#total" + v).text()));
										total += parseInt(formatCurrencyToNumer($("#total" + v).text()));
									});
									alert(str + " \n = " + formatNumber(total+"₫") + " ₫" );

								}
							});
				}

			function deleteNew(data) {
				$
						.ajax({
							url : '${orderAPI}',
							type : 'DELETE',
							contentType : 'application/json',
							data : JSON.stringify(data),
							success : function(result) {
								window.location.href = "${orderURL}?message=delete_success";
							},
							error : function(error) {
								window.location.href = "${orderURL}?message=error_system";
							}
						});
			}
			
			function updatePaidStatus(data) {
				$
						.ajax({
							url : '${orderAPI}/status',
							type : 'PUT',
							contentType : 'application/json',
							data : JSON.stringify(data),
							success : function(result) {
								if(window.location.search == "") {
						    		window.location.href = window.location.href + "?message=update_success";
						    	} else {
						    		window.location.href = window.location.href.replace(/message(\D)*/g, "") + "&message=update_success";
						    	}
							},
							error : function(error) {
								if(window.location.search == "") {
						    		window.location.href = window.location.href + "?message=error_system";
						    	} else {
						    		window.location.href = window.location.href.replace(/message(\D)*/g, "") + "&message=error_system";
						    	}
							}
						});
			}
			
			function updateNew(data) {
			    $.ajax({
			      url : '${orderAPI}',
			      type : 'PUT',
			      contentType : 'application/json',
			      data : JSON.stringify(data),
			      dataType : 'json',
			      success : function(result) {
			    	if(window.location.search == "") {
			    		window.location.href = window.location.href + "?message=update_success";
			    	} else {
			    		window.location.href = window.location.href.replace(/message(\D)*/g, "") + "&message=update_success";
			    	}
			        
			      },
			      error : function(error) {
			    	if(window.location.search == "") {
			    		window.location.href = window.location.href + "?message=error_system";
			    	} else {
			    		window.location.href = window.location.href.replace(/message(\D)*/g, "") + "&message=error_system";
			    	}
			      }
			    });
			  }
			
			$("input[data-type='currency']").on({
			    keyup: function() {
			      formatCurrency($(this));
			    }
			});
			$("input[data-type='currency']").keyup();
			$(".cong-no").addClass("open");
			$('.datepk').datepicker({
			    dateFormat: 'dd/mm/yy'
			});
			
			if($("#startDate").val() != "") {
				$("#startDate").datepicker("setDate", new Date($("#startDate").val()));
			} 
			
			if($("#endDate").val() != "") {
				$("#endDate").datepicker("setDate", new Date($("#endDate").val()));
			} 
			
			if($("#startPaymentDate").val() != "") {
				$("#startPaymentDate").datepicker("setDate", new Date($("#startPaymentDate").val()));
			} 
			
			if($("#endPaymentDate").val() != "") {
				$("#endPaymentDate").datepicker("setDate", new Date($("#endPaymentDate").val()));
			} 
			
			$('select').select2();
			$('.select2-container').css("padding", "initial");
			$('.table-order .select2-container .select2-choice').css("border", "none");
			
			$(".modelitem").change(function () {
				let element = $(this);
				changeItemCustomer(element);
			});
			
			$(".modelcustomerid").change(function () {
				let element = $(this);
				changeItemCustomer(element);
			});
			
			function changeItemCustomer(element) {
				orderid = element.parent().parent().attr('data-orderid');
				customerid = $("#customerid" + orderid).val();
				itemid = $("#itemid" + orderid).val();
				
				$.ajax({
					url : '${pricelistAPI}/filter?itemid=' + itemid + "&customerid=" + customerid,
					type : 'GET',
					contentType : 'application/json',
					success : function(data) {
						//console.log(data);
						price = data["price"];
						$("#price" + orderid).text(formatNumber(price+"₫") + " ₫");
						$("#quantity" + orderid).change();
					},
					error : function(error) {
						alert("Không lấy được thông tin Đơn giá tương ứng");
					}
				});
			}
		</script>
		
	</body>
	</html>