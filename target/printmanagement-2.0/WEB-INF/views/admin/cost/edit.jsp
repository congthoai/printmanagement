<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="costURL" value="/quan-tri/chi-phi/danh-sach" />
<c:url var="editcostURL" value="/quan-tri/chi-phi/chinh-sua" />
<c:url var="costAPI" value="/api/cost" />
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

					<li><a href="${costURL}?">Danh sách</a></li>
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
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Ngày</label>
								<div class="col-sm-9">
									<form:input id="costDate" type="text" path="costDate" cssClass="datepk col-xs-10 col-sm-5" readonly="true" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Mã chi phí</label>
								<div class="col-sm-9">
									<form:input id="code" path="code" cssClass="col-xs-10 col-sm-5" readonly="true"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Tên hàng</label>
								<div class="col-sm-9">
									<form:input path="name" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">ĐVT</label>
								<div class="col-sm-9">
									<form:input path="unit" cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Số lượng</label>
								<div class="col-sm-9">
									<form:input type="number" path="quantity" cssClass="col-xs-10 col-sm-5 modelquantity" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Đơn giá</label>
								<div class="col-sm-9">
									<form:input type="number" path="price" cssClass="col-xs-10 col-sm-5 modelprice" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Thành tiền</label>
								<div class="col-sm-9">
									<form:input type="number" path="total" cssClass="col-xs-10 col-sm-5 modeltotal" readonly="true"/>
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

	<script src="<c:url value='/template/admin/assets/js/jquery-ui-timepicker-addon.js' />"></script>
	<script>
		$('#btnAddOrUpdateNew').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			data["costDate"] =  Date.parse(data["costDate"]);
			var id = $('#newId').val();
			if (id == "") {
				addNew(data);
			} else {
				updateNew(data);
			}
		});

		function addNew(data) {
			$.ajax({
						url : '${costAPI}',
						type : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(data),
						dataType : 'json',
						success : function(result) {
							window.location.href = "${editcostURL}?id="
									+ result.id + "&message=insert_success";
						},
						error : function(error) {
							window.location.href = "${costURL}?message=error_system";
						}
					});
		}

		function updateNew(data) {
			$.ajax({
				url : '${costAPI}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${editcostURL}?id=" + result.id
							+ "&message=update_success";
				},
				error : function(error) {
					window.location.href =  "${costURL}?message=error_system";
				}
			});
		}
		$(".danh-muc").addClass("open");
		
		$('#costDate').datetimepicker({
		    dateFormat: "yy-mm-dd",
		    timeFormat:  "hh:mm:ss"
		});
		
		$("#costDate").change(function () {
			$("#code").val($(this).val().replace(/-/g, "").replace(" ", "-").replace(/:/g, "").replace(".0", ""));
		});
		
		if($("#costDate").val() == "") {
			$("#costDate").datepicker("setDate", new Date());
			$("#costDate").change();
		} else {
			$("#costDate").datepicker("setDate", new Date($("#costDate").val()));
		}
		
		$('.modelquantity').change(function() {
			autoFillTotal();
		  });
		$('.modelprice').change(function() {
			autoFillTotal();
		  });
	
		function autoFillTotal() {
			let qty = parseInt($('.modelquantity').val());
		    let price = parseInt($('.modelprice').val());
		    let total = qty * price;
		    $(".modeltotal").val(total);
		}
		
	</script>
</body>
</html>
