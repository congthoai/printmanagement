<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url var="customerAPI" value="/api/customer"/>
<c:url var="customerURL" value="/quan-tri/khach-hang/danh-sach"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách khách hàng</title>
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
								<div class="table-filter"></hr>

								</div>
								
								<div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-left tableTools-container"><br>
											<div class="col-xs-4">
												<form:input type="text" path="name" placeholder="Tên khách hàng ..."  />
											</div>
											
											<div class="col-md-3 pull-right">
												<button id="btnFillter" type="submit" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold">
													 <span> <i class="fa fa-search pink"></i> </span>
												</button>
											</div>
										</div>
										<div class="pull-right tableTools-container"><br>
											<div class="dt-buttons btn-overlap btn-group">
												<c:url var="createcustomerURL" value="/quan-tri/khach-hang/chinh-sua"/>
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm bài viết' href='${createcustomerURL}'>
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
														<th>Mã khách hàng</th>
														<th>Họ tên</th>
														<th>Loại khách</th>
														<th>Email</th>
														<th>Điện thoại</th>
														<th>Địa chỉ/ ghi chú</th>
														<th>Thao tác</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model.listResult}">
														<tr>
															<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>													
															<td>${item.code}</td>
															<td>${item.name}</td>
															<td>${item.customertype.name}</td>
															<td>${item.email}</td>
															<td>${item.phone}</td>
															<td>${item.address}</td>
															<td>
																<c:url var="updatecustomerURL" value="/quan-tri/khach-hang/chinh-sua">
																	<c:param name="id" value="${item.id}"/>															
																</c:url>																
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href='${updatecustomerURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
															</td>
														</tr>
													</c:forEach>
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
							if (isConfirm.value) {
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
							url : '${customerAPI}',
							type : 'DELETE',
							contentType : 'application/json',
							data : JSON.stringify(data),
							success : function(result) {
								window.location.href = "${customerURL}?message=delete_success";
							},
							error : function(error) {
								window.location.href = "${customerURL}?message=error_system";
							}
						});
			}
			$(".danh-muc").addClass("open");
		</script>
	</body>
	</html>