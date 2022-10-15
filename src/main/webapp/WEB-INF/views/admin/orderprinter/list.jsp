<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.printmanagement.util.SecurityUtils"%>
<c:url var="orderprinterAPI" value="/api/order-printer" />
<c:url var="orderprinterURL" value="/quan-tri/quan-ly-in/danh-sach" />
<c:url var="adminURL" value="/quan-tri/"/>
<c:set var="roleIs" value="${SecurityUtils.getPrincipal().getUser().getRoleCode()}" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách in</title>
</head>

<body>
	<div class="main-content">
		<form:form id="formSubmit" method="get" modelAttribute="model">

			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a
							href="<c:url value='/quan-tri/trang-chu'/>">Trang quản trị</a></li>
							<li><a href="${orderprinterURL}">Quản lý in</a></li>
							<li>Danh sách</li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${not empty message}">
								<div class="alert alert-${alert}">${message}</div>
							</c:if>
							<div class="table-filter">
								</hr>

							</div>

							<div class="table-filter">
								<c:if test="${roleIs == 'ADMIN'}">
								<div class="table-btn-controls">
									<div class="col-md-11">
										<div class="row" style="max-width: 1300px;padding: 2px;">
												<div class="col-xs-5" >
													&nbsp&nbspNgày đơn hàng: 												
													<form:input type="text" path="startDate" id="startDate" cssClass="datepk"  style="width: 30%;"/>
													<input type="hidden" id="startDateHide"  />
													 &nbsp&nbsp -  &nbsp&nbsp
													<form:input type="text" path="endDate" id="endDate" cssClass="datepk" style="width: 30%;"/>
													<input type="hidden" id="endDateHide"  />
												</div>
												<div class="col-md-2 col-lg-2">
													<form:select path="status" id="status" cssClass="col-md-12">
												  	 	<form:option value="" label="------- Trạng thái All ----"/>
												  	 	<form:options items="${statusList}"/>
												  	 </form:select>
												</div>
												<div class="col-xs-2">
													<form:select path="printStaffId" id="printStaffId" cssClass="col-md-12">
														<form:option value="" label="------- Nhân viên All ----"/>
												  	 	<form:options items="${staffs}"/>
												  	 </form:select>
												</div>	
												<div class="col-md-3 pull-right">
													<button id="btnFillter" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold">
														 Search<span> <i class="fa fa-search pink"></i> </span>
													</button>
													<button id="btnResetFillter" type="button" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold">
														 <span> 
														 <i class="fa fa-refresh pink"></i> </span>
													</button>
												</div>
										</div>
										
									</div>
									<div class="pull-right tableTools-container">
										<br>
										<div class="dt-buttons btn-overlap btn-group">
											<c:url var="createorderprinterURL"
												value="/quan-tri/quan-ly-in/chinh-sua" />
											<a flag="info"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Thêm bài viết'
												href='${createorderprinterURL}'> <span> <i
													class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
											<button id="btnDelete" type="button"
												onclick="warningBeforeDelete()"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Xóa bài viết'>
												<span> <i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
											</button>
										</div>
									</div>
								</div>
								</c:if>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th><input type="checkbox" id="checkAll"></th>
													<th style="width: 185px">Đơn hàng</th>
													<th >Khách hàng</th>
													<th style="width: 200px">Sản phẩm</th>
													<th style="width: 260px">Nội dung in</th>
													<th>Desinger</th>
													<th>Phụ trách in</th>
													<th>Máy in</th>
													<th>Trạng thái</th>
													<th style="width: 200px">Ghi chú</th>
													<th style="width: 100px">Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr id = "printid${item.id}" class="printrow" data-printid="${item.id}">
														<td><input type="checkbox" id="checkbox_${item.id}"
															value="${item.id}"></td>
														<td>
															<input type="hidden" id="order${item.id}" value="${item.orderr.id}"/>
															<a title='Xem chi tiết' target="blank" href='${adminURL}/don-hang/chinh-sua?id=${item.orderr.id}'>${item.orderr.code}</a>
														</td>
														<td><a title='Xem chi tiết' target="blank" href='${adminURL}/khach-hang/chinh-sua?id=${item.orderr.customer.id}'>${item.orderr.customer.name}</a></td>
														<td>${item.orderr.item.name}</td>
														<td>${item.orderr.content}</td>
														<td>
														  	 <select id="designer${item.id}" style="width: 100%" class="modelstaffid" <c:if test="${roleIs != 'ADMIN'}"> disabled </c:if> >
															    <option value=""> </option>
															    <c:forEach var="designer" items="${designers}">
															        <option value="${designer.key}" ${designer.key == item.designStaffId  ? 'selected="selected"' : ''}>${designer.value}</option>
															    </c:forEach>
															</select>
														</td>
														<td>
														  	 <select id="staff${item.id}" style="width: 100%" class="modelstaffid" <c:if test="${roleIs != 'ADMIN'}"> disabled </c:if> >
														  		 <option value=""> </option>
															    <c:forEach var="staff" items="${staffs}">
															        <option value="${staff.key}" ${staff.key == item.printStaffId  ? 'selected="selected"' : ''}>${staff.value}</option>
															    </c:forEach>
															</select>
														</td>
														<td>
														  	 <select id="printer${item.id}" style="width: 100%" class="modelstaffid">
															    <c:forEach var="printer" items="${printers}">
															        <option value="${printer.key}" ${printer.key == item.printerId  ? 'selected="selected"' : ''}>${printer.value}</option>
															    </c:forEach>
															</select>
														</td>
														<td><span id="status${item.id}" class="label label-sm ${ item.statusAlert}">${item.status}</span></td>
														<td>
															<input type="text" id="description${item.id}" value="${item.description}" style="width: 100%;border: 1px solid white;"/>
														</td>
														<td>
															<%-- <c:url var="updateorderprinterURL"
																value="/quan-tri/quan-ly-in/chinh-sua">
																<c:param name="id" value="${item.id}" />
															</c:url> <a class="btn btn-sm btn-primary btn-edit"
															data-toggle="tooltip" title="Cập nhật bài viết"
															href='${updateorderprinterURL}'><i
																class="fa fa-pencil-square-o" aria-hidden="true"></i> </a> --%>
																
															<c:if test="${item.status != 'PRINTED'}">
																<button id="btnQuickEdit${item.id}" value="${item.id}" title="Sửa nhanh" class="btnQuickEdit btn-xs btn-primary">
																<i class="ace-icon fa fa-check"></i> </button>
															</c:if>		
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="${page}" id="page" name="page" /> 
										<input type="hidden" value="${limit }" id="limit" name="limit" />
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
	<script>
		$('select').select2();
		$('.select2-container').css("padding", "initial");
		$('.select2-container .select2-choice').css("border", "none");
		
		$('.datepk').datepicker({
			dateFormat: "dd/mm/yy"
		});
		
		if($("#startDate").val() != "") {
			$("#startDate").datepicker("setDate", new Date($("#startDate").val()));
		} 
		
		if($("#endDate").val() != "") {
			$("#endDate").datepicker("setDate", new Date($("#endDate").val()));
		} 
		
		var totalPages = ${model.totalPage > 0 ? model.totalPage : 1};
		var currentPage = ${model.page};
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 10,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});

		$("#btnFillter").click(function () {
			$('#formSubmit').submit();
		});
		
		$('#formSubmit').submit(function () {
			let startDate = $("#startDate").val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
			let endDate = $("#endDate").val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
			$("#startDate").val(startDate);
			$("#endDate").val(endDate);
		});
		$("#btnResetFillter").click(function () {
			$("#startDate").val("");
			$("#endDate").val("");
			$("#limit").val(10);
			$("#printStaffId").val("").change();
			$("#status").val("").change();
		});
		
		function warningBeforeDelete() {
			swal({
				title : "Xác nhận xóa",
				text : "Bạn có chắc chắn muốn xóa hay không",
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-success",
				cancelButtonClass : "btn-danger",
				confirmButtonText : "Xác nhận",
				cancelButtonText : "Hủy bỏ",
			}).then(
					function(isConfirm) {
						if (isConfirm.value) {
							var ids = $('tbody input[type=checkbox]:checked')
									.map(function() {
										return $(this).val();
									}).get();
							deleteNew(ids);
						}
					});
		}

		function deleteNew(data) {
			$
					.ajax({
						url : '${orderprinterAPI}',
						type : 'DELETE',
						contentType : 'application/json',
						data : JSON.stringify(data),
						success : function(result) {
							window.location.href = "${orderprinterURL}?message=delete_success";
						},
						error : function(error) {
							window.location.href = "${orderprinterURL}?message=error_system";
						}
					});
		}
		
		function updateNew(data) {
		    $.ajax({
		      url : '${orderprinterAPI}',
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
		
		function getRowData(printid) {
		    var data = {};
		    data["id"] = printid;
		    data["orderId"] = $("#order" + printid).val();
		    data["designStaffId"] = $("#designer" + printid).val();
		    data["printStaffId"] = $("#staff" + printid).val();
		    data["printerId"] = $("#printer" + printid).val();
		    data["description"] = $("#description" + printid).val();
		    
		    console.log(data);
		    return data;
		}
		
		$(".btnQuickEdit").click(function(e) {
			e.preventDefault();
			let printid = $(this).val();
			
			let data = getRowData(printid);
			updateNew(data);
		});
		
		$(".danh-muc").addClass("open");
	</script>
</body>
</html>