<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="pricelistURL" value="/quan-tri/don-gia/danh-sach" />
<c:url var="editpricelistURL" value="/quan-tri/don-gia/chinh-sua" />
<c:url var="pricelistAPI" value="/api/pricelist" />
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

					<li><a href="${pricelistURL}?">Danh sách</a></li>
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
								  <label for="typeId" class="col-sm-3 control-label no-padding-right">Sản phẩm</label>
								  <div class="col-sm-9">
								  	 <form:select path="itemid" id="itemid" cssClass="col-xs-10 col-sm-5">
								  	 	<form:option value="" label="-- Chọn loại --"/>
								  	 	<form:options items="${items}"/>
								  	 </form:select>
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
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Đơn giá cũ</label>
								<div class="col-sm-9">
									<form:input type="number" min="1000" path="price" cssClass="col-xs-10 col-sm-5 modelprice" disabled="true"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Đơn giá</label>
								<div class="col-sm-9">
									<form:input type="text" path="payoutPriceStr" cssClass="col-xs-10 col-sm-5 modelpayoutprice" placeholder="Area1:Price1;Area2:Price2;...;Area3:Price3"/>
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
			if($('.modelprice').val() == "") {
				$('.modelprice').focus();
				return;
			}
			let regex = /^\d+(\.\d+)?:\d+(\.\d+)?(;\d+(\.\d+)?:\d+(\.\d+)?)*$/g;
			if(!regex.test($('.modelpayoutprice').val())) {
				$('.modelpayoutprice').focus();
				return;
			}
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
						url : '${pricelistAPI}',
						type : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(data),
						dataType : 'json',
						success : function(result) {
							window.location.href = "${editpricelistURL}?id="
									+ result.id + "&message=insert_success";
						},
						error : function(error) {
							window.location.href = "${pricelistURL}?message=error_system";
						}
					});
		}

		function updateNew(data) {
			$.ajax({
				url : '${pricelistAPI}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${editpricelistURL}?id=" + result.id
							+ "&message=update_success";
				},
				error : function(error) {
					window.location.href =  "${pricelistURL}?message=error_system";
				}
			});
		}
		$(".danh-muc").addClass("open"); 
		$('select').select2();
		$('.select2-container').css("padding", "initial")
	</script>
</body>
</html>
