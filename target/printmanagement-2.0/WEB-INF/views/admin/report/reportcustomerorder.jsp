<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="reportAjaxURL" value="/ajax/reportcustomerorderajax" />
<c:url var="reportURL" value="/quan-tri/bao-cao" />
<c:url var="rootURL" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Báo cáo</title>
</head>
<body>

	<div class="main-content">

		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a
						href="<c:url value='/quan-tri/trang-chu'/>">Trang quản trị</a></li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">


				<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="">
					<div class="form-group">
						<legend>
							<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">Báo cáo </div>
							<input type="text" id="reportname" style="margin: 5px">
						</legend>						
					</div>
					<div class="row">
						<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
							<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
								<label class="label label-success">Từ ngày</label>
							</div>
							<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
								<input type="text" name="" id="startDate" class="datepk" readonly="true" style="width:100%">
								<input type="hidden" id="startDateHide"  />
							</div>

						</div>
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
							<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
								<label class="label label-success">Đến ngày</label>
							</div>
							<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
								<input type="text" name="" id="endDate" class="datepk" readonly="true" style="width:100%">
								<input type="hidden" id="endDateHide"  />
							</div>

						</div>
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
							<button type="submit" class="btn btn-pink getReport">Xem báo cáo</button>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
							<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
								<label class="label label-success">Khách hàng</label>
							</div>
							<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
			                     <select id="customerid" style="width: 100%" class="modelcustomerid">
			                     	<option value="">--- All ---</option>
								    <c:forEach var="customer" items="${customers}">
								        <option value="${customer.key}">${customer.value}</option>
								    </c:forEach>
								</select>
							</div>

						</div>
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
							<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
								<label class="label label-success">Trạng thái</label>
							</div>
							<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
								 <select id="status" style="width: 100%" class="modelstatus">
								 	<option value="">--- All ---</option>
								    <c:forEach var="status" items="${statusList}">
								        <option value="${status.key}">${status.value}</option>
								    </c:forEach>
								</select>
							</div>

						</div>
						<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2"> 
							<button class="btn btn-xs btn-pink exportPdf">PDF</button>
							<button class="btn btn-xs btn-pink exportWord">Word</button>
							<button class="btn btn-xs btn-pink exportExcel">Excel</button>
							<button class="btn btn-xs btn-pink exportDoc97">Doc97</button>
						</div>
					</div>

				</form:form>
				<br><hr><br>
				<div id="loadingDiv" class="loader loadercustom">
				  <div class="loader-wheel"><img class="nav-user-photo" src="<c:url value='/resources/images/pacman.gif' />" alt="Jason's Photo" style=" width: 30px;">
				  </div>
				  <div class="loader-text"></div>
				</div>
				
				<div id="tablerender" style="padding:10px">
				 	<div class="WordSection1">
						>>>> Hiển thị dữ liệu here <<<<
						...
					</div>
				</div>


			</div>
		</div>

	</div>
	<!-- /.main-content -->


<script>
	$('.datepk').datepicker({
	    dateFormat: 'dd/mm/yy'
	});
	$(".datepk").datepicker("setDate", new Date());
	
	$('select').select2();
	$('.select2-container').css("padding", "initial");
	
	$("#startDate").change(function () {
		let date = $(this).val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
		$("#startDateHide").val(date);
	});
	
	$("#endDate").change(function () {
		let date = $(this).val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
		$("#endDateHide").val(date);
	});
	
	$("#startDate").change();
	$("#endDate").change();
	
	$(".getReport").click(function (e) {
		e.preventDefault();
		let startDate = $("#startDateHide").val();
		let endDate = $("#endDateHide").val();
		let status = $("#status").val();
		let customerid = $("#customerid").val();
		let href = "${reportAjaxURL}?customerid="+customerid+"&status="+status+"&startDate="+startDate+"&endDate="+endDate;
		 $.get(href,function(data,status){
             $(".WordSection1").html(data);
         });
	});
	
	$(".exportWord").click(function(e) {
		e.preventDefault();
		if($("#tableReportCustomerOrder").length < 1) {
			alert("Lọc/Xem báo cáo trước!");
			return;
		}
		exportWordWaterMark(null, null);
	});
	
	$(".exportExcel").click(function(e) {
		e.preventDefault();
		tableToExcel('tableReportCustomerOrder', 'Phattin2Excel');
	});
	$(".exportPdf").click(function(e) {
		e.preventDefault();
		if($("#tableReportCustomerOrder").length < 1) {
			alert("Lọc/Xem báo cáo trước!");
			return;
		}
		exportPdfWaterMark(null, null);
	});
	$(".exportDoc97").click(function(e) {
		e.preventDefault();
		exportHtml2Word('tablerender', 'Phattin2Doc97');
	});
	
	$(".bao-cao").addClass("open");
</script>

<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script src="<c:url value='/template/admin/js/helper/ExportHelper.js' />"></script>

 <script >
	 var $loading = $('#loadingDiv').hide();
	  $(document)
	  .ajaxStart(function () {
	    $loading.show();
	  })
	  .ajaxStop(function () {
	    $loading.hide();
	  });
  
   function exportWordWaterMark(headerStr, footerStr){ 
	     let startDate = $("#startDateHide").val();
		 let endDate = $("#endDateHide").val();
		 let status = $("#status").val();
		 let customerid = $("#customerid").val();
		 let reportName = $("#reportname").val();
		 if(reportName == null || reportName == "") {
			 reportName = "docxbynct"
		 }
	     data = {};
	     data['headerStr'] = headerStr;
	     data['footerStr'] = footerStr;
	     data['customerid'] = customerid;
	     data['status'] = status;
	     data['startDate'] = startDate;
	     data['endDate'] = endDate;
	     data['reportName'] = reportName;
	     
			$.ajax({
				url : '${reportURL}' + "/home/exportword",
				type : 'POST',
				data : data,
				success : function(data) {
					//console.log(data + encodeURIComponent(data));
					if(data != null) window.location.href = '${rootURL}' + "resources/docs/" + encodeURIComponent(reportName) + ".docx";				
				},
				error : function(error) {
					console.log(error);
				}
			});
	    
	  }
   
   function exportPdfWaterMark(headerStr, footerStr){ 
	     let startDate = $("#startDateHide").val();
		 let endDate = $("#endDateHide").val();
		 let status = $("#status").val();
		 let customerid = $("#customerid").val();
		 let reportName = $("#reportname").val();
		 if(reportName == null || reportName == "") {
			 reportName = "docxbynct"
		 }
	     data = {};
	     data['headerStr'] = headerStr;
	     data['footerStr'] = footerStr;
	     data['customerid'] = customerid;
	     data['status'] = status;
	     data['startDate'] = startDate;
	     data['endDate'] = endDate;
	     data['reportName'] = reportName;
	     
			$.ajax({
				url : '${reportURL}' + "/home/exportpdf",
				type : 'POST',
				data : data,
				success : function(data) {
					//console.log(data);
					if(data != null) window.location.href = '${rootURL}' + "resources/docs/" + encodeURIComponent(data);						
				},
				error : function(error) {
					console.log(error);
				}
			});
	    
	  }
  </script>

</body>
</html>