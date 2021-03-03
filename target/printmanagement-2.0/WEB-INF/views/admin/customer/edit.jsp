<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="customerURL" value="/quan-tri/khach-hang/danh-sach" />
<c:url var="editcustomerURL" value="/quan-tri/khach-hang/chinh-sua" />
<c:url var="customerAPI" value="/api/customer" />
<html>
<head>
<title>Chỉnh sửa bài viết</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value='/quan-tri/trang-chu'/>">Trang quản trị</a>
					</li>

					<li><a href="${customerURL}?">Danh sách</a></li>
					<li class="active">Chi tiết</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
						<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Mã khách hàng</label>
								<div class="col-sm-9">
									<form:input path="code" cssClass="col-xs-10 col-sm-5" readonly="true"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Họ tên</label>
								<div class="col-sm-9">
									<form:input path="name" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								  <label for="typeId" class="col-sm-3 control-label no-padding-right">Loại khách hàng</label>
								  <div class="col-sm-9">
								  	 <form:select path="customertypeid" id="customertypeid" cssClass="col-xs-10 col-sm-5">
								  	 	<form:option value="" label="-- Chọn loại --"/>
								  	 	<form:options items="${customertypes}"/>
								  	 </form:select>
								  </div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Email</label>
								<div class="col-sm-9">
									<form:input path="email" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Điện thoại</label>
								<div class="col-sm-9">
									<form:input path="phone" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Địa chỉ/ghi chú</label>
								<div class="col-sm-9">
									<form:input path="address" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							<form:hidden path="id" id="newId" />
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty model.id}">
										<button class="btn btn-info" type="button"
											id="btnAddOrUpdateNew">
											<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật
										</button>
									</c:if>
									<c:if test="${empty model.id}">
										<button class="btn btn-info" type="button"
											id="btnAddOrUpdateNew">
											<i class="ace-icon fa fa-check bigger-110"></i> Thêm mới
										</button>
									</c:if>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="ace-icon fa fa-undo bigger-110"></i> Hủy
									</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('#btnAddOrUpdateNew').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			var id = $('#newId').val();
			if (id == "") {
				addNew(data);
			} else {
				updateNew(data);
			}
		});

		function addNew(data) {
			$.ajax({
						url : '${customerAPI}',
						type : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(data),
						dataType : 'json',
						success : function(result) {
							window.location.href = "${editcustomerURL}?id="
									+ result.id + "&message=insert_success";
						},
						error : function(error) {
							window.location.href = "${customerURL}?message=error_system";
						}
					});
		}

		function updateNew(data) {
			$.ajax({
				url : '${customerAPI}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${editcustomerURL}?id=" + result.id
							+ "&message=update_success";
				},
				error : function(error) {
					window.location.href =  "${customerURL}?message=error_system";
				}
			});
		}
		$(".danh-muc").addClass("open");
	</script>
</body>
</html>
