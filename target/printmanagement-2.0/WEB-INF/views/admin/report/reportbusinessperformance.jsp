<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="reportAjaxURL" value="/ajax/report/reportbusinessperformanceajax" />
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
							<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">Hiệu quả kinh doanh</div>
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
								<input type="text" name="" id="startDate" class="datepk"  style="width:100%">
								<input type="hidden" id="startDateHide"  />
							</div>

						</div>
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
							<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
								<label class="label label-success">Đến ngày</label>
							</div>
							<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
								<input type="text" name="" id="endDate" class="datepk"  style="width:100%">
								<input type="hidden" id="endDateHide"  />
							</div>

						</div>
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
							<button type="submit" class="btn btn-pink getReport">Xem báo cáo</button>
						</div>
<!--  						<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 hide">
							<button class="btn btn-xs btn-pink exportWord">Word</button>
						</div> -->
					</div>
					<br>

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
	
	$("#startDate").val('');
	$("#endDate").val('');
	$("#startDate").change();
	$("#endDate").change();
	
	$(".getReport").click(function (e) {
		e.preventDefault();
		let startDate = $("#startDateHide").val();
		let endDate = $("#endDateHide").val();
		let status = $("#status").val();
		let customerid = $("#customerid").val();
		let href = "${reportAjaxURL}?showTitle=1&startDate="+startDate+"&endDate="+endDate;
		 $.get(href,function(data,status){
             $(".WordSection1").html(data);
         });
	});
	
	$(".getReport").click();
	
	$("body").on('click', '.exportDoc97', function(e) {
		e.preventDefault();
		if($("#tableReportBusinessPerformance").length < 1) {
			alert("Lọc/Xem báo cáo trước!");
			return;
		}
		exportHtml2Word('tablerender', 'Phattin2Doc97');
	});
	
	$(".exportExcel").click(function(e) {
		e.preventDefault();
		tableToExcel('tableReportBusinessPerformance', 'Phattin2Excel');
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
  
  </script>

</body>
</html>