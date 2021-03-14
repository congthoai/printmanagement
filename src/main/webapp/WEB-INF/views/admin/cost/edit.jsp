<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="costURL" value="/quan-tri/chi-phi/danh-sach" />
<c:url var="editcostURL" value="/quan-tri/chi-phi/chinh-sua" />
<c:url var="costAPI" value="/api/cost" />
<html>
<head>
<title>Chi Phí</title>
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
									<form:input type="number" id="modelprice" path="price" cssClass="modelprice hide" />
									<input data-type="currency" id="modelpriceshow"  class="col-xs-10 col-sm-5 modelpriceshow" value="${model.price}" style="height:32px;"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Thành tiền</label>
								<div class="col-sm-9">
									<form:input type="number" path="total" cssClass="modeltotal hide" readonly="true"/>
									<input data-type="currency" readonly="true" id="modeltotalshow"  class="col-xs-10 col-sm-5 modeltotalshow" value="${model.total}" style="height:32px;"/>
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
			data["costDate"] =  Date.parse(data["costDate"].replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1"));
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
		    dateFormat: "dd/mm/yy",
		    timeFormat:  "hh:mm:ss"
		});
		
		$("#costDate").change(function () {
			$("#code").val($(this).val().replace(/\//g, "").replace(" ", "-").replace(/:/g, "").replace(".0", ""));
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
		    $("#modeltotalshow").val(formatNumber(total + ""));
		}
		
		$("#modelpriceshow").change(function () {
			price = formatCurrencyToNumer($(this).val());
			$(this).parent().find("#modelprice").val(price);
			$(".modelprice").change();
		});
		
		$("input[data-type='currency']").on({
		    keyup: function() {
		      formatCurrency($(this));
		    }
		});
		$("input[data-type='currency']").keyup();

		function formatNumber(n) {
			  // format number 1000000 to 1,234,567
			  return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
		}
		function formatCurrencyToNumer(variable) {
			  // format number $1,234,567₫ vnđ  to 1234567
			  return variable.replace(/,/g, "").replace("$", "").replace("vnđ", "").replace("₫", "").replace(/ /g, "");
		}
		
		function formatCurrency(input, blur) {
		  // appends $ to value, validates decimal side
		  // and puts cursor back in right position.
		  
		  // get input value
		  var input_val = input.val();
		  
		  // don't validate empty input
		  if (input_val === "") { return; }
		  
		  // original length
		  var original_len = input_val.length;

		  // initial caret position 
		  var caret_pos = input.prop("selectionStart");
		    
		  // check for decimal
		  if (input_val.indexOf(".") >= 0) {

		    // get position of first decimal
		    // this prevents multiple decimals from
		    // being entered
		    var decimal_pos = input_val.indexOf(".");

		    // split number by decimal point
		    var left_side = input_val.substring(0, decimal_pos);
		    var right_side = input_val.substring(decimal_pos);

		    // add commas to left side of number
		    left_side = formatNumber(left_side);

		    // validate right side
		    right_side = formatNumber(right_side);
		    
		    // On blur make sure 2 numbers after decimal
		    if (blur === "blur") {
		      right_side += "00";
		    }
		    
		    // Limit decimal to only 2 digits
		    right_side = right_side.substring(0, 2);

		    // join number by .
		    input_val = left_side + "." + right_side;

		  } else {
		    // no decimal entered
		    // add commas to number
		    // remove all non-digits
		    input_val = formatNumber(input_val);
		    input_val = input_val;
		    
		    // final formatting
		    if (blur === "blur") {
		      input_val += ".00";
		    }
		  }
		  
		  // send updated string to input
		  input.val(input_val);

		  // put caret back in the right position
		  var updated_len = input_val.length;
		  caret_pos = updated_len - original_len + caret_pos;
		  input[0].setSelectionRange(caret_pos, caret_pos);
		}
		
	</script>
</body>
</html>
