<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="purchasematerialURL" value="/quan-tri/nhap-vat-tu/danh-sach" />
<c:url var="editpurchasematerialURL" value="/quan-tri/nhap-vat-tu/chinh-sua" />
<c:url var="purchasematerialAPI" value="/api/purchasematerial" />
<c:url var="purchasematerialdetailAPI" value="/api/purchasematerialdetail" />
<c:url var="materialAPI" value="/api/material" />


<html>
<head>
<title>Nhập vật tư</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value='/quan-tri/trang-chu'/>">Trang quản trị</a>
					</li>

					<li><a href="${purchasematerialURL}?">Danh sách</a></li>
					<li class="active"></li>
					<li><a href="#">Nhập vật tư</a></li>
					<li class="active"></li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
						<br>
						<div class="page-header">
							<div class="row">
										<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
										<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
											<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
												<label class="label label-success">Số phiếu:</label>
											</div>
											<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
												<input type="text" id="purchasematerialcode" readonly="true" value="${model.code }" style="width:100%">
												<input type="hidden" id="purchasematerialid" value="${model.id }"/>
											</div>

										</div>
										<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
											<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
												<label class="label label-success">Ngày nhập:</label>
											</div>
											<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
												<input type="text" id="purchasedate" value="${model.purchaseDate}" class="datepk" readonly="true" style="width:100%">
											</div>

										</div>
										<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
											 <button class="btn btn-pink savePurchaseMaterial hide">Cập nhật&nbsp&nbsp&nbsp&nbsp&nbsp</button>
										</div>
							</div>
							<br>
							<div class="row">				
										<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
										<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
											<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
												<label class="label label-success">Tổng cộng:</label>
											</div>
											<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
												<input type="text" id="purchasematerialtotalshow" readonly="true" 
													value="<fmt:formatNumber type="number" groupingUsed="true" value="${model.total }"/> ₫" style="width:100%">
												<input type="hidden" id="purchasematerialtotal" readonly="true" value="${model.total }" style="width:100%">
											</div>

										</div>
										<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
											<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
												<label class="label label-success">Mô tả:</label>
											</div>
											<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
												<textarea id="purchasematerialdescript" rows="2" style="width:100%">${model.description }</textarea>
											</div>

										</div>
										<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
											<button class="btn btn-pink addPurchaseDetail">Thêm chi tiết</button>
										</div>
							</div>
						</div>
						<br>
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">Chi tiết nhập vật tư</h3>
							</div>
							<div class="panel-footer">
								<table class="table table-striped table-hover">
											<thead>
												<tr>
													<th style="width: 260px">Vật tư</th>
													<th>Khổ</th>
													<th>Chiều dài</th>
													<th>Số lần</th>
													<th>Diện tích</th>												
													<th>Đơn giá</th>
													<th>Thành tiền</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<tr id="purchasedetailformadd" class="hide" style="background-color:darkcyan">
														<td>
															<select  class="materialid" id="materialidadd" style="width: 100%">
															    <c:forEach var="material" items="${materials}">
															        <option value="${material.key}">${material.value}</option>
															    </c:forEach>
															</select>
														</td>
														<td><input style="width: 100%;" type="number" class="materialsize" id="materialsizeadd" value="${material.size}" readonly="true" style="border:none"/></td>
														<td><input style="width: 100%;" type="number" class="materialwidth" id="materialwidthadd" value="${material.width}" readonly="true" style="border:none"/></td>
														<td><input style="width: 100%;" type="number" class="materialquantity" id="materialquantityadd" value="${material.quantity}"  min="1"/></td>
														<td><input style="width: 100%;" type="number" class="materialarea" id="materialareaadd" value="${material.area}" readonly="true" style="border:none"/></td>
														<td>
															<input style="width: 100%;" type="number" class="materialprice hide" id="materialpriceadd" value="${material.price}"  min="0"/>
															<input style="width: 100%;height:32px; border:none"" data-type="currency" class="showmaterialprice" value="${material.price}" />
														</td>
														<td>
															<input style="width: 100%;" type="number" class="materialtotal hide" id="materialtotaladd" value="${material.total}" readonly="true" style="border:none"/>
															<input style="width: 100%; height:32px; border:none" class="showmaterialtotal" value="${material.total}" readonly="true"  data-type="currency"/>	
														</td>
														<td>
															<button value=""  class="btn btn-xs btn-warning savePurchaseMaterialDetail" 
																data-purchasematerialid="${model.id}" title=""> <i class="fa fa-plus-circle"></i>
															</button>
														</td>
												</tr>
												
												
												<c:forEach var="purchasedetail" items="${model.purchasematerialdetails}">
											        
											    	<tr>
														<td>
															<select class="materialid" id="materialid${purchasedetail.id}" style="width: 100%">
															    <c:forEach var="material" items="${materials}">
															    	<option value="${material.key}" ${material.key == purchasedetail.materialid  ? 'selected="selected"' : ''}>${material.value}</option>											        
															    </c:forEach>
															</select>
														</td>
														<td><input style="width: 100%;" type="number" class="materialsize" id="materialsize${purchasedetail.id}" value="${purchasedetail.size}" readonly="true" style="border:none"/></td>
														<td><input style="width: 100%;" type="number" class="materialwidth" id="materialwidth${purchasedetail.id}" value="${purchasedetail.width}" readonly="true" style="border:none"/></td>
														<td><input style="width: 100%;" type="number" class="materialquantity" id="materialquantity${purchasedetail.id}" value="${purchasedetail.quantity}"  min="1"/></td>
														<td><input style="width: 100%;" type="number" class="materialarea" id="materialarea${purchasedetail.id}" value="${purchasedetail.area}" readonly="true" style="border:none"/></td>
														<td>
															<input style="width: 100%;" type="number" class="materialprice hide" id="materialprice${purchasedetail.id}" value="${purchasedetail.price}"  min="0"/>
															<input style="width: 100%;height:32px; border:none"" data-type="currency" class="showmaterialprice" id="showmaterialprice${purchasedetail.id}" value="${purchasedetail.price}" />
														</td>
														<td>
															<input style="width: 100%;" type="number" class="materialtotal hide" id="materialtotal${purchasedetail.id}" 
																value="${purchasedetail.total}" data-oldvalue="${purchasedetail.total}" readonly="true" style="border:none"/>
															<input style="width: 100%; height:32px; border:none" class="showmaterialtotal" id="showmaterialtotal${purchasedetail.id}" 
																value="${purchasedetail.total}" data-oldvalue="${purchasedetail.total}" readonly="true"  data-type="currency"/>
														</td>
														<td>
															<button class="btn btn-xs btn-primary savePurchaseMaterialDetail"
																value="${purchasedetail.id}" data-purchasematerialid="${model.id}" >
																<i class="ace-icon fa fa-check"></i>
															</button>
															<button value="${purchasedetail.id}" class="btn btn-xs btn-danger btnDeleteDetail"><i class="ace-icon fa fa-trash-o bigger-120"></i>
															</button>
														</td>
													</tr>
											        
											    </c:forEach>
											
											</tbody>
								</table>
							</div>
							<h4 class="pull-right">Cập nhật lần cuối: <fmt:formatDate pattern = "dd/MM/yyyy hh:mm:ss" value = "${model.modifiedDate}" /></h4>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="<c:url value='/template/admin/assets/js/jquery-ui-timepicker-addon.js' />"></script>
	<script>
		
		$('select').select2();
		$('.select2-container').css("padding", "initial")
		$('.datepk').datetimepicker({
		    dateFormat: "yy-mm-dd",
		    timeFormat:  "hh:mm:ss"
		});
		$("#purchasedate").change(function () {
			$("#purchasematerialcode").val($(this).val().replace(/-/g, "").replace(" ", "-").replace(/:/g, "").replace(".0", ""));
		});
		if($("#purchasedate").val() == "") {
			$("#purchasedate").datepicker("setDate", new Date());
			$("#purchasedate").change();
		} else {
			$("#purchasedate").datepicker("setDate", new Date($("#purchasedate").val()));
		}
		
		$(".addPurchaseDetail").click(function () {
			if($( "#purchasedetailformadd" ).hasClass( "hide" )) {
				$( "#purchasedetailformadd" ).removeClass("hide");
			} else {
				$( "#purchasedetailformadd" ).addClass("hide");
			}
			
			$( "#purchasedetailformadd").find(".materialid").change();
		});

		$(".savePurchaseMaterial").click(function () {
			let data = getDataPurchaseMaterial();			
			savePurchaseMaterial(data);
		});
		
		function getDataPurchaseMaterial() {
			id = $("#purchasematerialid").val();
			code = $("#purchasematerialcode").val();
			purchasedate = $("#purchasedate").val();
			total = $("#purchasematerialtotal").val();
			descrip = $("#purchasematerialdescript").val();
					
			let data = {};
			data["id"] = id;
			data["code"] = code;
			data["total"] = total;
			data["description"] = descrip;
			data["purchaseDate"] =  Date.parse(purchasedate);
			
			return data;
		}
		
		$(".savePurchaseMaterialDetail").click(async function () {
			purchasematerialdetailid = $(this).val();
			purchasematerialid = $(this).attr("data-purchasematerialid");
			parentElement = $(this).parent().parent();
			
			materialid = parentElement.find(".materialid").parent().find("select").val();
			size = parentElement.find(".materialsize").val();
			width = parentElement.find(".materialwidth").val();
			quantity = parentElement.find(".materialquantity").val();
			area = parentElement.find(".materialarea").val();
			price = parentElement.find(".materialprice").val();
			total = parentElement.find(".materialtotal").val();
			oldtotal = parentElement.find(".materialtotal").attr("data-oldvalue") ? parentElement.find(".materialtotal").attr("data-oldvalue") : 0;
			purchaseMaterialTotal = $("#purchasematerialtotal").val() != "" ? $("#purchasematerialtotal").val() : "0";		
			purchaseMaterialTotalNew = parseInt(purchaseMaterialTotal) - parseInt(oldtotal) + parseInt(total); 
			$("#purchasematerialtotal").val(purchaseMaterialTotalNew);
			
			let detailData = {};
			detailData["id"] = purchasematerialdetailid;
			detailData["materialid"] = materialid;
			detailData["size"] = size;
			detailData["width"] = width;
			detailData["quantity"] = quantity;
			detailData["area"] = area;
			detailData["price"] = price;
			detailData["total"] = total;
			detailData["purchasematerialid"] = purchasematerialid;
			
			dataPurchaseMaterial = getDataPurchaseMaterial();	
			//savePurchase = await savePurchaseMaterial(dataPurchaseMaterial);
			
			if(purchasematerialid == "" || purchasematerialid == null) {
				savePurchase = await savePurchaseMaterial(dataPurchaseMaterial);
				if(savePurchase != null) {
					dataPurchaseMaterial["id"] = savePurchase.id;
					detailData["purchasematerialid"] = savePurchase.id;
					savePurchaseDetail = await savePurchaseMaterialDetail(detailData);
				}
			}
			else {
				savePurchaseDetail = await savePurchaseMaterialDetail(detailData);
			}
			
			if(savePurchaseDetail != null) {
				savePurchase = await savePurchaseMaterial(dataPurchaseMaterial);
				window.location.href = "${editpurchasematerialURL}?id=" + savePurchase.id + "&message=insert_success";
				return;
			}
			
			window.location.href = "${editpurchasematerialURL}?id=" + ${model.id} + "&message=error_system";
			
		});
		
		function savePurchaseMaterial(data) {
			 return new Promise(resolve => {
				$.ajax({
					url : '${purchasematerialAPI}',
					type : 'PUT',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
		                resolve(result);
					},
					error : function(error) {
						resolve(null);
					}
				});
			 });
		}
		
		function savePurchaseMaterialDetail(data) {
			return new Promise(resolve => {
				$.ajax({
					url : '${purchasematerialdetailAPI}',
					type : 'PUT',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						console.log("save purchasematerialdetail success");
						resolve(result);
					},
					error : function(error) {
						console.log("save purchasematerialdetail Err");
						resolve(null);
					}
				});
			});
		}
		
		$(".materialquantity").change(function () {
			changeQuantityPrice($(this));
		});
		
		$(".showmaterialprice").change(function () {
			changeQuantityPrice($(this));
		});
		
		function changeQuantityPrice(element) {
			parentElement = element.parent().parent();
			
			quantity = parseInt(parentElement.find(".materialquantity").val());
			size = parseFloat(parentElement.find(".materialsize").val());
			width = parseFloat(parentElement.find(".materialwidth").val());
			area = parseFloat(width * size * quantity).toFixed(2);			
			price = parentElement.find(".showmaterialprice").val();
			price = formatCurrencyToNumer(price);
		    total = parseInt(price * area);
		    
		    parentElement.find(".materialarea").val(area);
		    parentElement.find(".materialtotal").val(total);
		    parentElement.find(".materialprice").val(price);
		    parentElement.find(".showmaterialtotal").val(formatNumber(total + 'đ'));
		}
		
		function formatNumber(n) {
			  // format number 1000000 to 1,234,567
			  return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
		}
		function formatCurrencyToNumer(variable) {
			  // format number $1,234,567₫ vnđ  to 1234567
			  return variable.replace(/,/g, "").replace("$", "").replace("vnđ", "").replace("₫", "").replace(/ /g, "");
		}
		
		$(".materialid").change(function () {
			let element = $(this);
			changeMaterialId(element);
		});
		
		function changeMaterialId(element) {
			parentElement = element.parent().parent();
			materialId = element.val();
			
			$.ajax({
				url : '${materialAPI}/' + materialId,
				type : 'GET',
				contentType : 'application/json',
				success : function(data) {
					//console.log(data);
					parentElement.find(".materialsize").val(data[0]["size"]);
					parentElement.find(".materialwidth").val(data[0]["width"]);
					parentElement.find(".materialquantity").change();
				},
				error : function(error) {
					alert("Không tìm được thông tin kích thước vật tư!");
				}
			});
		}
		
		$(".btnDeleteDetail").click(function () {
			deletePurchaseMaterialDetail([$(this).val()]);
		});
		
		function deletePurchaseMaterialDetail(data) {
			$
					.ajax({
						url : '${purchasematerialdetailAPI}',
						type : 'DELETE',
						contentType : 'application/json',
						data : JSON.stringify(data),
						success : function(result) {
							window.location.href = window.location.href;
						},
						error : function(error) {
							window.location.href = window.location.href;
						}
					});
		}
	
		$("input[data-type='currency']").on({
		    keyup: function() {
		      formatCurrency($(this));
		    }
		});
		$("input[data-type='currency']").keyup();

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

		$(".cong-no").addClass("open");
	</script>
</body>
</html>
