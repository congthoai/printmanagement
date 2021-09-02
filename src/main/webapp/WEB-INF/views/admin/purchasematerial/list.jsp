<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url var="purchasematerialAPI" value="/api/purchasematerial"/>
<c:url var="purchasematerialURL" value="/quan-tri/nhap-vat-tu/danh-sach"/>
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
								<div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-left tableTools-container"><br>
											<div class="col-xs-10">
												<form:input id="isFilter" type="hidden" path="isFilter"/>
												<form:input id="startDate" type="text" path="startDate" placeholder="  Từ ngày ..." cssClass="datepk" style="width: 45%;"/>
												&nbsp - &nbsp
												<form:input id="endDate" type="text" path="endDate" placeholder="  Đến ngày ..." cssClass="datepk" style="width: 45%;"/>
											</div>
											<div class="col-md-2 pull-right">
												<button id="btnFillter" type="submit" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold">
													 <span> <i class="fa fa-search pink"></i> </span>
												</button>
											</div>
										</div>
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<c:url var="createpurchasematerialURL" value="/quan-tri/nhap-vat-tu/chinh-sua"/>
												<a flag="info" href="${createpurchasematerialURL}"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm moi' href='#'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa bài viết'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th><input type="checkbox" id="checkAll"></th>
														<th>Số phiếu</th>
														<th>Nội dung</th>
														<th>Ngày</th>
														<th>Cập nhật lần cuối</th>
														<th>Tổng tiền</th>
														<th>Chức năng</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model.listResult}">
														<tr>
															<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
															<td>${item.code}</td>
															<td>${item.description}</td>
															<td><fmt:formatDate pattern = "dd/MM/yyyy hh:mm:ss" value = "${item.purchaseDate}" /></td>
															<td><fmt:formatDate pattern = "dd/MM/yyyy hh:mm:ss" value = "${item.modifiedDate}" /></td>
															<td><fmt:formatNumber type="number" groupingUsed="true" value="${item.total}"/> ₫</td>
															<td>
																<c:url var="updatepurchasematerialURL" value="/quan-tri/nhap-vat-tu/chinh-sua">
																	<c:param name="id" value="${item.id}"/>															
																</c:url>																
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật" href='${updatepurchasematerialURL }'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
																<button value="${item.id}" class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash-o bigger-120"></i>
																</button>
															</td>
														</tr>
													</c:forEach>
														<tr style="border:0; background:yellow">
															<td colspan = 5 style="border:0">Tổng tất cả:</td>
															<td colspan = 2><fmt:formatNumber type="number" groupingUsed="true" value="${model.totalAll}"/> ₫</td>
														</tr>
												</tbody>
											</table>
											<ul class="pagination" id="pagination"></ul>
											<input type="hidden" value="" id="page" name="page"/>
											<input type="hidden" value="${limit }" id="limit" name="limit"/>									
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
							if (isConfirm) {
								var ids = $('tbody input[type=checkbox]:checked').map(function() {
											return $(this).val();
											}).get();
								deleteNew(ids);
							}
						});
			}

			function deleteNew(data) {
				$
						.ajax({
							url : '${purchasematerialAPI}',
							type : 'DELETE',
							contentType : 'application/json',
							data : JSON.stringify(data),
							success : function(result) {
								window.location.href = "${purchasematerialURL}?message=delete_success";
							},
							error : function(error) {
								window.location.href = "${purchasematerialURL}?message=error_system";
							}
						});
			}
			
			$('.datepk').datepicker({
			    dateFormat: "dd/mm/yy"
			});
			
			if($("#startDate").val() != "") {
				$("#startDate").datepicker("setDate", new Date($("#startDate").val()));
			} 
			
			if($("#endDate").val() != "") {
				$("#endDate").datepicker("setDate", new Date($("#endDate").val()));
			} 
			
 			$('#formSubmit').submit(function () {
				let startDate = $("#startDate").val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
				let endDate = $("#endDate").val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
				$("#startDate").val(startDate);
				$("#endDate").val(endDate);
			}); 
			
			$("#btnFillter").click(function () {
				$("#isFilter").val(1);
				$('#formSubmit').submit();
			});
			
			$(".cong-no").addClass("open");
		</script>
	</body>
	</html>