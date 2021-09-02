<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="adminURL" value="/quan-tri/"/>
<c:url var="reportAjaxURL" value="/ajax/report/reportbusinessperformanceajax" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <title>Trang chủ</title> -->
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang quản trị</a>
                </li>
                <li>Dashboard</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            
            
<div class="col-sm-10" style="margin: 30px">
	<div class="widget-box transparent">
		<div class="widget-header widget-header-flat">
				<h4 class="widget-title lighter">
					<a title='Xem chi tiết' target="_blank" href='${adminURL}/don-hang/danh-sach?startDate=${today}&endDate=${today}'><i class="ace-icon fa fa-star orange"></i>
					Đơn hàng trong ngày 
				</h4>
					
			<div class="widget-toolbar">
				<a href="#" data-action="collapse" >
					<i class="ace-icon fa fa-chevron-up"></i>
				</a>
			</div>
		</div>

		<div class="widget-body" style="display: block; max-height: 270px; overflow: overlay;">
			<div class="widget-main no-padding">
				<table class="table table-bordered table-striped">
					<thead class="thin-border-bottom">
						<tr>
							<th>
								<i class="ace-icon fa fa-caret-right blue"></i>Mã đơn hàng
							</th>
							
							<th>
								<i class="ace-icon fa fa-caret-right blue"></i>Khách hàng
							</th>
							
							<th>
								<i class="ace-icon fa fa-caret-right blue"></i>Nội dung
							</th>

							<th class="hidden-480">
								<i class="ace-icon fa fa-caret-right blue"></i>status
							</th>

							<th>
								<i class="ace-icon fa fa-caret-right blue"></i>Tổng cộng/ Đã thanh toán
							</th>

						</tr>
					</thead>

					<tbody>
						<c:set var="total2" value="0" scope="page" />
						<c:set var="paid2" value="0" scope="page" />
						<c:set var="count2" value="0" scope="page" />
						<c:set var="countpaid2" value="0" scope="page" />
						<c:forEach var="item" items="${orderInDay}">
						
							<tr>
								<td><a title='Xem chi tiết' target="blank" href='${adminURL}/don-hang/chinh-sua?id=${item.id}'>${item.code}</a></td>
	
								<td><a title='Xem chi tiết' target="blank" href='${adminURL}/khach-hang/chinh-sua?id=${item.customer.id}'>${item.customer.name}</a></td>

								<td style="max-width:400px">${item.content}</td>
								
								<td class="hidden-480">
									<span class="label ${item.statusAlert } arrowed-right arrowed-in">${item.status }</span>
								</td>
	
								<td>								
									<b class="green">$ <fmt:formatNumber type="number" groupingUsed="true" value="${item.total}"/></b>
									<small>
										<s class="red">$ <fmt:formatNumber type="number" groupingUsed="true" value="${item.paid}"/></s>
									</small>
								</td>
							</tr>
							
							<c:set var="count2" value="${count2 + 1}" scope="page"/>
							<c:set var="total2" value="${total2+item.total}" scope="page"/>
							<c:set var="paid2" value="${paid2+item.paid}" scope="page"/>
							<c:if test="${item.status == 'paid' }"><c:set var="countpaid2" value="${countpaid2 + 1}" scope="page"/></c:if>
						</c:forEach>
						
							<tr style="background-color: yellow"><td>Tổng tộng</td><td></td>
								<td>Đã thanh toán / tổng đơn</td><td>${countpaid2} / ${count2 }</td><td>
								<b class="green">$ <fmt:formatNumber type="number" groupingUsed="true" value="${total2}"/></b>
									<small>
										<s class="red">$ <fmt:formatNumber type="number" groupingUsed="true" value="${paid2}"/></s>
								</small></td>
							</tr>
					</tbody>
				</table>
			</div><!-- /.widget-main -->
		</div><!-- /.widget-body -->
	</div><!-- /.widget-box -->
</div>        



<div class="col-sm-10" style="margin: 30px">
	<div class="widget-box transparent">
		<div class="widget-header widget-header-flat">
			<h4 class="widget-title lighter">
				<i class="ace-icon fa fa-star orange"></i>
				Doanh thu trong ngày
			</h4>

			<div class="widget-toolbar">
				<a href="#" data-action="collapse">
					<i class="ace-icon fa fa-chevron-up"></i>
				</a>
			</div>
		</div>

		<div class="widget-body" style="display: block; max-height: 270px; overflow: overlay;">
			<div class="widget-main no-padding">
				<table class="table table-bordered table-striped">
					<thead class="thin-border-bottom">
						<tr>
							<th>
								<i class="ace-icon fa fa-caret-right blue"></i>Mã đơn hàng
							</th>
							
							<th>
								<i class="ace-icon fa fa-caret-right blue"></i>Khách hàng
							</th>
							
							<th>
								<i class="ace-icon fa fa-caret-right blue"></i>Nội dung
							</th>

							<th class="hidden-480">
								<i class="ace-icon fa fa-caret-right blue"></i>status
							</th>
							
							<th>
								<i class="ace-icon fa fa-caret-right blue"></i>Ngày thanh toán
							</th>

							<th>
								<i class="ace-icon fa fa-caret-right blue"></i>Số tiền
							</th>

						</tr>
					</thead>

					<tbody>
						<c:set var="total1" value="0" scope="page" />
						<c:forEach var="item" items="${revenueInDay}">
						
							<tr>
								<td><a title='Xem chi tiết' target="blank" href='${adminURL}/don-hang/chinh-sua?id=${item.id}'>${item.code}</a></td>
	
								<td><a title='Xem chi tiết' target="blank" href='${adminURL}/khach-hang/chinh-sua?id=${item.customer.id}'>${item.customer.name}</a></td>
								
								<td style="max-width:400px">${item.content}</td>
								
								<td class="hidden-480">
									<span class="label ${item.statusAlert } arrowed-right arrowed-in">${item.status }</span>
								</td>
								
								<td >								
									${item.paymentDate }
								</td>
	
								<td >								
									<b class="green">$ <fmt:formatNumber type="number" groupingUsed="true" value="${item.total}"/></b>
								</td>
							</tr>
							
							<c:set var="total1" value="${total1+item.total}" scope="page"/>
						</c:forEach>
						<tr style="background-color: yellow"><td>Tổng tộng</td><td></td><td></td><td></td><td></td>
							<td><b class="red">$ <fmt:formatNumber type="number" groupingUsed="true" value="${total1}"/></b></td>
						</tr>
					</tbody>
				</table>
			</div><!-- /.widget-main -->
		</div><!-- /.widget-body -->
	</div><!-- /.widget-box -->
</div>       
      
<div class="col-sm-10" style="margin: 30px">
	<div class="widget-box transparent">
		<div class="widget-header widget-header-flat">
			<h4 class="widget-title lighter pull-left">
				<i class="ace-icon fa fa-star orange "></i>
				Hiệu quả kinh doanh
			</h4>
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
			<div class="widget-toolbar" >
				<a href="#" data-action="collapse" class='collapse-show'>
					<i class="ace-icon fa fa-chevron-up"></i>
				</a>
			</div>
		</div>

		<div class="widget-body" style="display: block; max-height: 270px; overflow: overlay;">
			<div class="widget-main no-padding WordSection1">

			</div><!-- /.widget-main -->
		</div><!-- /.widget-body -->
	</div><!-- /.widget-box -->
</div> 
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
	$("#startDateHide").change();
});

$("#endDate").change(function () {
	let date = $(this).val().replace( /(\d{2})\/(\d{2})\/(\d{4})/, "$3/$2/$1");
	$("#endDateHide").val(date);
	$("#endDateHide").change();
});

setDateReport();
$("#startDate").change();
$("#endDate").change();
$("#endDate").change();

$("#endDateHide").change(function () {
	getReportBusiness();
});
$("#startDateHide").change(function () {
	getReportBusiness();
});

getReportBusiness();

function getReportBusiness() {
	let startDate = $("#startDateHide").val();
	let endDate = $("#endDateHide").val();
	let href = "${reportAjaxURL}?startDate="+startDate+"&endDate="+endDate;
	 $.get(href,function(data,status){
         $(".WordSection1").html(data);
     });
}

function setDateReport(){
	var date = new Date();
	var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
	var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
	$("#startDate").datepicker("setDate", firstDay);
	$("#endDate").datepicker("setDate", lastDay);
	
}

</script>     
     
     <div class="col-sm-7" style="margin: 30px"> 
     	<div id="chartContainer1" style="height: 400px; width: 100%;"></div>     
     </div>
     
     <div class="col-sm-3" style="margin: 30px"> 
     	<div id="chartContainer2" style="height: 400px; width: 100%;"></div>     
     </div>
     
      <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
      <script>
      		  var revenueInWeek = ${revenueInWeek};
      	      var orderCountInWeek = ${orderCountByStatus};
      		  var dataPoint1 = [];
      		  var dataPoint2 = [];
      		  $.each(revenueInWeek, function(i, v) {
      	        let datatmp1 =  { label: v[0],  y: v[1]  };
      	      	dataPoint1.push(datatmp1);
      	      	/* let datatmp2 =  { label: v[0],  y: v[2]  };
      	        dataPoint2.push(datatmp2); */
      	      });
      		  
      		 $.each(orderCountInWeek, function(i, v) {
       	        let datatmp2 =  { label: v[0],  y: v[1]  };
       	      	dataPoint2.push(datatmp2);
       	      });
      		 		      
		      var chart1 = new CanvasJS.Chart("chartContainer1", {            
		          title:{
		        	  text: "Doanh thu trong tuần",
		        	  fontFamily: "Helvetica"
		          },
		          axisY:{
		        	   minimum: 0,
	        	  },

		          data: [  //array of dataSeries     
			          { //dataSeries - first quarter
			       		/*** Change type "column" to "bar", "area", "line" or "pie"***/        
			           type: "column",
			           dataPoints: dataPoint1
			         }
		        ]
		      });
		      
	      		var chart2 = new CanvasJS.Chart("chartContainer2", {
	      			title:{
	      				text: "Số đơn hàng theo trạng thái trong tuần",
	      				fontFamily: "Helvetica"
	      			},
	      			data: [              
	      			{
	      				// Change type to "doughnut", "line", "splineArea", etc.
	      				type: "pie",
	      				dataPoints: dataPoint2
	      			}
	      			]
	      		});
		  	chart1.render();
		  	chart2.render();		  	
		  	
      </script>
            
        </div>
    </div>
</div><!-- /.main-content -->

<script type="text/javascript">
	$(".dashboard").addClass("active");
	window.addEventListener('load', function() {
		$('.collapse-show').click();
	})
</script>
</body>
</html>