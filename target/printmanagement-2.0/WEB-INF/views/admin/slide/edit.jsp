<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="slideURL" value="/quan-tri/slide/danh-sach" />
<c:url var="editslideURL" value="/quan-tri/slide/chinh-sua" />
<c:url var="slideAPI" value="/api/slide" />
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

					<li><a href="${slideURL}?page=1&limit=2">Danh sách</a></li>
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
						<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model" enctype="multipart/form-data">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Thứ thự hiển thị</label>
								<div class="col-sm-9">
									<form:input type="number" path="sort" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Tên</label>
								<div class="col-sm-9">
									<form:input path="name" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Hình ảnh</label>
								<div class="col-sm-9">
									<img id='slideimage' width="150" height="150" alt="150x150" src="<c:url value='${model.link }' />">
										<div class="text">
											<input type="file" class="col-xs-10 col-sm-5" id="file" name="file" />
										</div>
								</div>
							</div>
							
							<form:hidden path="link" id="link" />
							<form:hidden path="id" id="slideId" />
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty model.id}">
										<input class="btn btn-info" type="submit" value="Cập nhật"/input>
									</c:if>
									<c:if test="${empty model.id}">
										<input class="btn btn-info" type="submit" value="Thêm mới"/input>
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
</body>
</html>
