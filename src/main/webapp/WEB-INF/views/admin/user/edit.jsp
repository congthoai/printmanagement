<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="userURL" value="/quan-tri/tai-khoan/danh-sach" />
<c:url var="edituserURL" value="/quan-tri/tai-khoan/chinh-sua" />
<c:url var="userAPI" value="/api/user" />
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

					<li><a href="${userURL}?">Danh sách</a></li>
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
<%-- 							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Hình ảnh</label>
								<div class="col-sm-9">
									<img id='watchimg' width="150" height="150" alt="150x150" src="<c:url value='/resources/images/original.jpg' />">
										<div class="text">
											<input type="file" class="col-xs-10 col-sm-5" id="file" name="file" />
										</div>
								</div>
							</div> --%>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Họ tên</label>
								<div class="col-sm-9">
									<form:input path="fullName" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Email</label>
								<div class="col-sm-9">
									<form:input path="email" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Phone</label>
								<div class="col-sm-9">
									<form:input path="phone" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Username</label>
								<div class="col-sm-9">
									<form:input path="userName" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
													
							<c:if test="${not empty model.id}">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Password</label>
									<div class="col-sm-9">
										<form:input type="password" path="password" cssClass="col-xs-10 col-sm-5" required="required"/>
									</div>
								</div>
							</c:if>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">New Password</label>
								<div class="col-sm-9">
									<form:input type="password" path="newPassword" cssClass="col-xs-10 col-sm-5" placeholder="Để trống nếu không thay đổi"/>
								</div>
							</div>
																				
							<div class="form-group">
								  <label for="typeId" class="col-sm-3 control-label no-padding-right">Loại tài khoản</label>
								  <div class="col-sm-9">
								  	 <form:select path="roleCode" id="roleCode" cssClass="col-xs-10 col-sm-5">
								  	 	<form:options items="${userRoles}"/>
								  	 </form:select>
								  </div>
							</div>
							
							<div class="form-group">
								  <label for="typeId" class="col-sm-3 control-label no-padding-right">Trạng thái</label>
								  <div class="col-sm-9">
								  	 <form:select path="status" id="status" cssClass="col-xs-10 col-sm-5">
								  	 	<form:options items="${userStatus}"/>
								  	 </form:select>
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
						url : '${userAPI}',
						type : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(data),
						dataType : 'json',
						success : function(result) {
							window.location.href = "${edituserURL}?id="
									+ result.id + "&message=insert_success";
						},
						error : function(error) {
							window.location.href = "${userURL}?message=error_system";
						}
					});
		}

		function updateNew(data) {
			$.ajax({
				url : '${userAPI}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${edituserURL}?id=" + result.id
							+ "&message=update_success";
				},
				error : function(error) {
					window.location.href =  "${userURL}?message=error_system";
				}
			});
		}
		$(".danh-muc").addClass("open");
	</script>
</body>
</html>
