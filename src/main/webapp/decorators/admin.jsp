<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title><dec:title default="Trang chủ" /></title>
	
	<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/bootstrap.min.css' />" />
	<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/select2.min.css' />" />
	<link rel="stylesheet" href="<c:url value='/template/admin/font-awesome/4.5.0/css/font-awesome.min.css' />" />
	<link rel="stylesheet" href="<c:url value='/template/admin/assets/fonts/fonts.googleapis.com.css' />" />
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/ace.min.css' />" class="ace-main-stylesheet" id="main-ace-style" />
  	<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/ace-rtl.min.css' />" />
	<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/ace-skins.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/template/admin/css/loading.css' />" />	
	<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/jquery-ui.min.css' />" />
	<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/jquery-ui.min.css' />" />

    <script src="<c:url value='/template/admin/assets/js/ace-extra.min.js' />"></script>
    <script src="<c:url value='/template/admin/assets/js/jquery.min.js' />"></script>
   	<script src="<c:url value='/template/admin/assets/js/bootstrap.min.js' />"></script>
   	<script src="<c:url value='/template/admin/assets/js/select2.min.js' />"></script>
   	<script src="<c:url value='/template/admin/assets/js/jquery-ui.min.js' />"></script>
   	
	<script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js' />"></script>
    
    <!-- sweetalert -->
    <script src="<c:url value='/template/admin/sweetalert/sweetalert2.min.js' />"></script>
    <link rel="stylesheet" href="<c:url value='/template/admin/sweetalert/sweetalert2.min.css' />" />

	<style>
		*:not(i):not(.fa), body, input, span, h{
			font-family: "Helvetica Neue",Helvetica,Arial,sans-serif !important;
		}
		.textcenter { text-align: center; }
		.textleft { text-align: left;}
		.textright { text-align: right;}
		#tableReportCustomerOrder td {
		  border: 1px gray solid;
		  padding: 4px;
		  width: 5em;
		}
	</style>
</head>
<body class="no-skin">
	<!-- header -->
    <%@ include file="/common/admin/header.jsp" %>
    <!-- header -->
	
	<div class="main-container" id="main-container">
		<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<!-- header -->
    	<%@ include file="/common/admin/slidebar.jsp" %>
    	<!-- header -->

		<dec:body/>
		
		<!-- footer -->
    	<%@ include file="/common/admin/footer.jsp" %>
    	<!-- footer -->
    	
    	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse display">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	
	<script src='/printmanagement/template/admin/assets/js/jquery.mobile.custom.min.js'></script>
	<script src="<c:url value='/template/admin/assets/js/ace-elements.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace.min.js' />"></script>
	
	
<%-- 	<script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery-ui.custom.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.ui.touch-punch.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.easypiechart.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.sparkline.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.pie.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.resize.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace-elements.min.js' />"></script>
	
	<script src="<c:url value='/template/admin/assets/js/bootstrap-datepicker.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/bootstrap-timepicker.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/daterangepicker.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/bootstrap-datetimepicker.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace.min.js' />"></script> --%>
	
<%-- 	<!-- page specific plugin scripts -->
	<script src="<c:url value='/template/admin/assets/js/jquery-ui.min.js'/>"></script> --%>
	
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		jQuery(function($) {
			$('[data-toggle="buttons"] .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				$('[id*="timeline-"]').addClass('hide');
				$('#timeline-'+which).removeClass('hide');
			});
		});
	</script>
	<script type="text/javascript">
 		$('.date-picker .datepk').datepicker({
			autoclose: true,
			todayHighlight: true
		}); 
 		$("#skin-colorpicker").val('#C6487E').change(); 
 		$("#ace-settings-compact").click();
 		if($(location).attr('href').indexOf('trang-chu') >= 0) {
 			$("#ace-settings-breadcrumbs").click();
 		}
	</script>
	
</body>
</html>