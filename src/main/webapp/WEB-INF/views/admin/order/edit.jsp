<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="orderURL" value="/quan-tri/don-hang/danh-sach" />
<c:url var="editorderURL" value="/quan-tri/don-hang/chinh-sua" />
<c:url var="orderAPI" value="/api/order" />
<c:url var="pricelistAPI" value="/api/pricelist"/>
<html>
<head>
<title>Chỉnh sửa đơn hàng</title>
</head>
<body>
  <div class="main-content">
    <div class="main-content-inner">
      <div class="breadcrumbs" id="breadcrumbs">

        <ul class="breadcrumb">
          <li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value='/quan-tri/trang-chu'/>">Trang quản trị</a>
          </li>

          <li><a href="${orderURL}">Danh sách</a></li>
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
                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Mã đơn hàng</label>
                <div class="col-sm-3">
                  <form:input path="code" cssClass="col-xs-10 col-sm-10" readonly="true"/>
                </div>
                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Ngày đơn hàng</label>
                <div class="col-sm-3">
                  <input type="text" name="orderDateStr" id="orderDate" class="col-xs-10 col-sm-10 datepk" readonly="true" disabled="true"
                  	value="<fmt:formatDate pattern = 'dd/MM/yyyy hh:mm:ss' value = '${model.orderDate}' />"/>
                </div>
              </div>
              
               <div class="form-group">
                  <label for="typeId" class="col-sm-2 control-label no-padding-right">Khách hàng</label>
                  <div class="col-sm-3">
                     <form:select path="customerid" cssClass="col-xs-10 col-sm-10 modelcustomerid">
                      <form:option value="" label="-- Chọn loại --"/>
                      <form:options items="${customers}"/>
                     </form:select>
                  </div>
                  
                  <label for="typeId" class="col-sm-2 control-label no-padding-right">Sản phẩm</label>
                  <div class="col-sm-3">
                     <form:select path="itemid" cssClass="col-xs-10 col-sm-10 modelitemid">
                      <form:option value="" label="-- Chọn loại --"/>
                      <form:options items="${items}"/>
                     </form:select>
                  </div>
              </div>
              
              <div class="form-group">
	                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Số lượng</label>
	                <div class="col-sm-3">
	                  <form:input type="number" path="quantity" cssClass="col-xs-10 col-sm-10 modelquantity" />
	                </div>
	                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Chiều dài</label>
	                <div class="col-sm-3">
	                  <form:input type="number" path="width" cssClass="col-xs-10 col-sm-10 modelwidth" step="0.01"/>
	                </div>
              </div>
              <div class="form-group">
	                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Đơn giá</label>
	                <div class="col-sm-3">
	                  <form:input type="number" path="price" readonly="true" cssClass="col-xs-10 col-sm-10 modelprice" />
	                </div>
	                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Chiều rộng</label>
	                <div class="col-sm-3">
	                  <form:input type="number" path="height" cssClass="col-xs-10 col-sm-10 modelheight" step="0.01"/>
	                </div>
              </div>
              <div class="form-group">
	                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Thành tiền</label>
	                <div class="col-sm-3">
	                  <form:input path="total" readonly="true" type="number" cssClass="col-xs-10 col-sm-10 modeltotal" />
	                </div>
	                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Diện tích</label>
	                <div class="col-sm-3">
	                  <form:input type="number" readonly="true" path="area" cssClass="col-xs-10 col-sm-10 modelarea" />
	                </div>
              </div>
              <div class="form-group">
	                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Trạng thái</label>
	                <div class="col-sm-3">
	                  <form:input path="status" readonly="true" cssClass="col-xs-10 col-sm-10 modelstatus" style="color: darkblue;"/>
	                </div>
	                
	                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Ngày thanh toán</label>
	                <div class="col-sm-3">
	                  <input type="text" class="col-xs-10 col-sm-10" readonly="true" 
	                  		value="<fmt:formatDate pattern = 'dd/MM/yyyy hh:mm:ss' value = '${model.paymentDate}' />"/>
	                </div>
              </div>             
              
              <div class="form-group">
                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Thanh toán</label>
                <div class="col-sm-3">
                  <form:input path="paid" type="number" cssClass="col-xs-10 col-sm-10 modelpaid" />
                </div>
                
                 <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Ngày sửa</label>
	                <div class="col-sm-3">
	                  <input type="text" class="col-xs-10 col-sm-10" readonly="true" 
	                  	value="<fmt:formatDate pattern = 'dd/MM/yyyy hh:mm:ss' value = '${model.modifiedDate}' />"/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Tổng nợ</label>
                <div class="col-sm-3">
                  <form:input type="number" readonly="true" path="debt" cssClass="col-xs-10 col-sm-10 modeldebt" />
                </div>
                 <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Sửa bởi</label>
	                <div class="col-sm-3">
	                  <input type="text" class="col-xs-10 col-sm-10" readonly="true" value="${model.modifiedBy}"/>
                </div>
              </div>
              <div class="form-group">
	               <%--  <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Tạo bởi</label>
		                <div class="col-sm-3">
		                  <input type="text" class="col-xs-10 col-sm-10" readonly="true" value="${model.createdBy}"/>
	                </div> --%>
	                 <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Hẹn giao</label>
	                <div class="col-sm-3">
	                  <input type="text" name="deliveryDate" id="deliveryDate" class="col-xs-10 col-sm-10 datepk"
	                  	value="<fmt:formatDate pattern = 'dd/MM/yyyy hh:mm:ss' value = '${model.deliveryDate}' />"/>
	                </div>
	                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">Nội dung</label>
					<div class="col-sm-3">
						<form:input path="content" cssClass="col-xs-10 col-sm-10" />
					</div>
                
              </div>
              
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right" for="form-field-1">Ghi chú</label>
	                <div class="col-sm-9">
	                  <textarea readonly="true" rows="3" class="col-xs-10 col-sm-10">${model.description}</textarea>
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
      if($('#quantity').val() == "" || $('#width').val() == "" || $('#height').val() == "" || $('#itemid').val() == "" || $('#customerid').val() == "") {
        alert("Điền đầy đủ thông tin!");
        return;
      }
      var data = {};
      $('.modelitemid').removeAttr("disabled");
      $('.modelcustomerid').removeAttr("disabled");
      var formData = $('#formSubmit').serializeArray();
      $.each(formData, function(i, v) {
        data["" + v.name + ""] = v.value;
      });
      $('.modelitemid').attr("disabled", true);
      $('.modelcustomerid').attr("disabled", true);
      
      data["deliveryDate"] = $("#deliveryDate").datepicker('getDate');
      
      var id = $('#newId').val();
      if (id == "") {
        // alert("Khong cho phep tao moi don hang tu Web!!");
         addNew(data);
      } else {
        updateNew(data);
      }
    });

    function addNew(data) {
      $.ajax({
            url : '${orderAPI}',
            type : 'POST',
            contentType : 'application/json',
            data : JSON.stringify(data),
            dataType : 'json',
            success : function(result) {
              window.location.href = "${editorderURL}?id="
                  + result.id + "&message=insert_success";
            },
            error : function(error) {
              window.location.href = "${orderURL}?message=error_system";
            }
          });
    }

    function updateNew(data) {
      $.ajax({
        url : '${orderAPI}',
        type : 'PUT',
        contentType : 'application/json',
        data : JSON.stringify(data),
        dataType : 'json',
        success : function(result) {
          window.location.href = "${editorderURL}?id=" + result.id
              + "&message=update_success";
        },
        error : function(error) {
          window.location.href =  "${orderURL}?message=error_system";
        }
      });
    }
    
    $('.modelheight').change(function() {
    	calculateData();
    });
    
    $('.modelwidth').change(function() {
    	calculateData();
    });
    
    $('.modelquantity').change(function() {
    	calculateData();
    });
    
    $('.modelpaid').change(function() {
        let total = parseInt($('.modeltotal').val());
        let paid = parseInt($(this).val());
        let unpaid = total - paid;
        $('.modeldebt').val(unpaid);
        $('.modeldebt').change();
      });
    
    $('.modeldebt').change(function() {
      let debt = parseInt($(this).val());
      if(debt <= "0") {
        $('.modelstatus').val("paid");
      }
      else {
        if(debt < $('.modeltotal').val()) {
          $('.modelstatus').val("partpaid");
          return;
        }
        $('.modelstatus').val("unpaid");
      }
    });
    
    $(".cong-no").addClass("open");
    $('select').select2();
	$('.select2-container').css("padding", "initial");
	
	$(".modelitemid").change(function () {
		calculateData();
	});
	
	$(".modelcustomerid").change(function() {
		calculateData();
	});
	
	function calculateData() {
		if($('#quantity').val() == "" || $('#width').val() == "" || $('#height').val() == "") {
	        return;
	    }
		
		let height = parseFloat($('.modelheight').val());
        let width = parseFloat($('.modelwidth').val());
        let quantity = parseInt($('.modelquantity').val());
        let area = parseFloat(width * height * quantity).toFixed(2);
        $('.modelarea').val(area);
        
        let customerid = $("#customerid").val();
		let itemid = $("#itemid").val();
		$.ajax({
			url : '${pricelistAPI}/filter?itemid=' + itemid + "&customerid=" + customerid,
			type : 'GET',
			contentType : 'application/json',
			success : function(data) {
				console.log(data);
				let payoutPrice = data.payoutPrice;
				let price = payoutPrice[payoutPrice.length-1].price;
				if(area.length > 0) {
					area = parseFloat(area);
					price = payoutPrice.find(p => p.area <= area).price;
				}
				$(".modelprice").val(price);
				$('.modeltotal').val(parseInt(price * area));
		        $('.modelpaid').change();
			},
			error : function(error) {
				alert("Không lấy được thông tin Đơn giá tương ứng");
			}
		});
	}
	
	$('.datepk').datepicker({
		dateFormat: "dd/mm/yy"
	});
	
	if($('#newId').val() == "") {
		$("#orderDate").datepicker("setDate", new Date());
		$("#orderDate").attr("disabled", false);
	}
	
  </script>
</body>
</html>
