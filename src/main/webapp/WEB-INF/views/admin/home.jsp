<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="adminURL" value="/quan-tri/"/>
<c:url var="reportAjaxURL" value="/ajax/report/reportbusinessperformanceajax" />
<c:url var="reportApiURL" value="/ajax/api" />
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
        	<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
			</script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang quản trị</a>
                </li>
                <li>Dashboard</li>
            </ul><!-- /.breadcrumb -->
        </div>
        
        <div class="page-content">
            


<div class="" style="margin: 45px 3%">
	<div class="widget-box transparent">
		<div class="widget-header widget-header-flat">
				<h4 class="widget-title lighter">
					<a title='Xem chi tiết' target="_blank" href='${adminURL}/don-hang/danh-sach?startDate=${today}&endDate=${today}'><i class="ace-icon fa fa-star orange"></i>
					Đơn hàng trong ngày 
				</h4>
					
			<div class="widget-toolbar" >
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



<div class="" style="margin: 45px 3%">
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
      
<div class="" style="margin: 45px 3%">
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
					<input type="text" name="" id="startDate" class="datepk date-picker"  style="width:100%">
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
	dateFormat: "dd/mm/yy",
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
	$("#startMonth").datepicker("setDate", firstDay);
}

</script>     
     
	<div class="reportMonth" style="margin: 45px 3%" max-height: 1100px>
		<div class="widget-box transparent">
			<div class="widget-header widget-header-flat">
				<h4 class="widget-title lighter pull-left">
					<i class="ace-icon fa fa-star orange "></i>
					Biểu Đồ Tháng &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				</h4>
				<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
						<label class="label label-success">Tháng: </label>
					</div>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<input type="text" name="" id="startMonth" class=""  style="width:100%">
						<input type="hidden" id="startMonthHide"  />
					</div>
	
				</div>
				<div class="widget-toolbar" >
					<a href="#" data-action="collapse" class=''>
						<i class="ace-icon fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
	
			<div class="widget-body" style="display: block; ">
				<div class="widget-main no-padding">

				     <div class="" style="margin: 30px;"> 
				     	<div id="chartRevenueInMonth" style="height: 500px; "></div>     
				     </div>
				     
				    </br><hr></hr></br> 
				     
					<div class="row">
						<div class="col-sm-4" style=""> 
					     	<div id="chartItemAreaInMonth" style="min-height: 350px;"></div>     
					     </div>
					     
					     <div class="col-sm-4" style=""> 
					     	<div id="chartMaterialAreaInMonth" style="min-height: 350px;"></div>     
					     </div>
					     
					      <div class="col-sm-4" style=""> 
					     	<div id="chartCostInMonth" style="min-height: 350px;"></div>     
					     </div>
					</div>

				</div><!-- /.widget-main -->
			</div><!-- /.widget-body -->
		</div><!-- /.widget-box -->
	</div> 
	
   <br>
   
 	<div class="" style="margin: 45px 3%">
		<div class="widget-box transparent">
			<div class="widget-header widget-header-flat">
				<h4 class="widget-title lighter pull-left">
					<i class="ace-icon fa fa-star orange "></i>
					Trong tuần
				</h4>
				<div class="widget-toolbar" >
					<a href="#" data-action="collapse" class='collapse-show'>
						<i class="ace-icon fa fa-chevron-up"></i>
					</a>
				</div>
			</div>
	
			<div class="widget-body" style="display: block;">
				<div class="widget-main no-padding">

					<div class="row" style="padding: 30px">
						<div class="col-sm-7"> 
					     	<div id="chartRevenueInWeek" style="height: 400px;"></div>     
					     </div>
					     
					     <div class="col-sm-4" "> 
					     	<div id="chartOrderCountInWeek" style="height: 400px;"></div>     
					     </div>
					</div>

				</div><!-- /.widget-main -->
			</div><!-- /.widget-body -->
		</div><!-- /.widget-box -->
	</div>
     
      <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
      <script>
		      	
				var revenueInWeek = ${revenueInWeek};
				var orderCountInWeek = ${orderCountByStatus};
				     
				var dataPointRevenueInWeek = [];
				var dataPointOrderCountInWeek = [];

				$.each(revenueInWeek, function(i, v) {
					let datatmp1 = {
						label : v[0],
						y : v[1]
					};
					dataPointRevenueInWeek.push(datatmp1);
					/* let datatmp2 =  { label: v[0],  y: v[2]  };
					dataPoint2.push(datatmp2); */
				});			

				$.each(orderCountInWeek, function(i, v) {
					let datatmp4 = {
						label : v[0],
						y : v[1]
					};
					dataPointOrderCountInWeek.push(datatmp4);
				});

				var chartRevenueInWeek = new CanvasJS.Chart( "chartRevenueInWeek", {
							animationEnabled : true,
							exportEnabled : true,
							title : {
								text : "Doanh thu trong tuần",
								fontFamily : "Helvetica"
							},
							axisY : {
								minimum : 0,
							},

							data : [ //array of dataSeries     
							{ //dataSeries - first quarter
								/*** Change type "column" to "bar", "area", "line" or "pie"***/
								type : "column",
								dataPoints : dataPointRevenueInWeek
							} ]
						});

				var chart2 = new CanvasJS.Chart( "chartOrderCountInWeek",
						{
							animationEnabled : true,
							exportEnabled : true,
							title : {
								text : "Số đơn hàng theo trạng thái",
								fontFamily : "Helvetica"
							},
							data : [ {
								// Change type to "doughnut", "line", "splineArea", etc.
								type : "pie",
								dataPoints : dataPointOrderCountInWeek
							} ]
						});

				chartRevenueInWeek.render();			
				chart2.render();
			</script>
            
        </div>
    </div>
</div><!-- /.main-content -->

<script type="text/javascript">

 	$("#startMonth").datepicker({ dateFormat: 'mm/yy'});
	$("#startMonth").datepicker("setDate", new Date()); 
  	$("#startMonth").change(function () {
  		let date = $("#startMonth").val().replace( /(\d{2})\/(\d{4})/, "$2-$1")
		refreshReportInMonth(date);
	});
  	$("#startMonth").change();
  	
	async function refreshReportInMonth(date) {
		
		var revenueInMonth = null;
		var saleAmountInMonth = null;
		
		await $.get( "${reportApiURL}/order/reportsaleamountinMonth/" + date, function( data ) {
			saleAmountInMonth = data;
		});
		
		await $.get( "${reportApiURL}/order/reportrevenueinmonth/" + date, function( data ) {
			revenueInMonth = data;
		});
		
		var dataPointRevenueInMonth = [];
		var dataPointSaleAmountInMonth = [];
		var dataPointProfitInMonth = [];
		
		$.each(revenueInMonth, function(i, v) {
			let datatmp2 = {
				x : new Date(v[0]),
				y : v[1]
			};
			
			$.each(saleAmountInMonth, function(j, k) {
				if(v[0] == k[0]) {
					let datatmpProfit = {
						x : new Date(k[0]),
						y : v[1] - k[1]
					}
					dataPointProfitInMonth.push(datatmpProfit);
				}
			});		

			dataPointRevenueInMonth.push(datatmp2);
		});
		
		$.each(saleAmountInMonth, function(i, v) {
			let datatmp3 = {
				x : new Date(v[0]),
				y : v[1]
			};
			dataPointSaleAmountInMonth.push(datatmp3);
		});	
		
		var chartRevenueInMonth = new CanvasJS.Chart( "chartRevenueInMonth",
				{ 
					animationEnabled: true,
					exportEnabled: true,
					theme: "light2",
				 	title:{
						text: "Đơn hàng - Doanh thu"
					}, 
					axisX:{
						valueFormatString: "DD MMM",
						crosshair: {
							enabled: true,
							snapToDataPoint: true
						}
					},
					axisY: {
						title: "vn$",
						includeZero: true,
						crosshair: {
							enabled: true
						}
					},
					toolTip:{
						shared:true
					},  

					data: [{
						type: "column",
						showInLegend: true,
						name: "Số tiền bán",
						markerType: "square",
						xValueFormatString: "DD MMM, YYYY",
						color: "#4F81BC",
						dataPoints: dataPointSaleAmountInMonth
					},
					{
						type: "line",
						showInLegend: true,
						name: "Doanh thu",
						dataPoints: dataPointRevenueInMonth
					},
					/* {
						type: "area",
						showInLegend: true,
						name: "Chênh lệch",
						dataPoints: dataPointProfitInMonth
					} */
					]
				});
		
		chartRevenueInMonth.render();
		
		
		
		var itemAreaInMonth = null;
		var materialAreaInMonth = null;
		var costInMonth = null;
		
		await $.get( "${reportApiURL}/order/reportareainmonthbyitemtype/" + date, function( data ) {
			itemAreaInMonth = data;
		});
		
		await $.get( "${reportApiURL}/order/reportareainmonthbymaterialtype/" + date, function( data ) {
			materialAreaInMonth = data;
		});
		
		await $.get( "${reportApiURL}/cost/reportcostinmonthbyname/" + date, function( data ) {
			costInMonth = data;
		});
		
		var dataPointItemAreaInMonth = [];
		var dataPointMaterialAreaInMonth = [];
		var dataPointCostInMonth = [];
		
		$.each(itemAreaInMonth, function(i, v) {
			let datatmp3 = {
				label : v[0],
				y : v[1]
			};
			dataPointItemAreaInMonth.push(datatmp3);
		});
		
		$.each(materialAreaInMonth, function(i, v) {
			let datatmp3 = {
				label : v[0],
				y : v[1]
			};
			dataPointMaterialAreaInMonth.push(datatmp3);
		});
		
		$.each(costInMonth, function(i, v) {
			let datatmp3 = {
				label : v[0],
				y : v[1]
			};
			dataPointCostInMonth.push(datatmp3);
		});
		
		var chartItemAreaInMonth = new CanvasJS.Chart("chartItemAreaInMonth", {
			animationEnabled: true,
			exportEnabled: true,
			theme: "light1",
			title:{
				text: "Diện Tích In",
				fontFamily : "Helvetica"
			},
			data: [{
				type: "pyramid",
				yValueFormatString: "#\" m²\"",
				indexLabelFontColor: "black",
				indexLabel: "{label} - {y}",
				//reversed: true, // Reverses the pyramid
				dataPoints: dataPointItemAreaInMonth
			}]
		});
		
		var chartMaterialAreaInMonth = new CanvasJS.Chart("chartMaterialAreaInMonth", {
			animationEnabled: true,
			exportEnabled: true,
			theme: "light1",
			title:{
				text: "Diện Tích Vật Tư",
				fontFamily : "Helvetica"
			},
			data: [{
				type: "pie",
				yValueFormatString: "#\" m²\"",
				indexLabelFontColor: "black",
				indexLabelFontSize: 13,
				indexLabel: "{label} - {y}",
				//reversed: true, // Reverses the pyramid
				dataPoints: dataPointMaterialAreaInMonth
			}]
		});
		
		var chartCostInMonth = new CanvasJS.Chart("chartCostInMonth", {
			animationEnabled: true,
			exportEnabled: true,
			theme: "light1",
			title:{
				text: "Chi Phí",
				fontFamily : "Helvetica"
			},
			data: [{
				type: "doughnut",
				yValueFormatString: "$#,##0.##",
				indexLabelFontColor: "black",
				indexLabelFontSize: 13,
				indexLabel: "{label} - {y}",
				//reversed: true, // Reverses the pyramid
				dataPoints: dataPointCostInMonth
			}]
		});
		
		chartItemAreaInMonth.render();
		chartMaterialAreaInMonth.render();
		chartCostInMonth.render();
		
		if(saleAmountInMonth.length == 0 || revenueInMonth.length == 0) {
			$("#chartRevenueInMonth").parent().addClass('hide');
		} else {$("#chartRevenueInMonth").parent().removeClass('hide');}
		
		if(itemAreaInMonth.length == 0) {
			$("#chartItemAreaInMonth").parent().addClass('hide');
		} else {$("#chartItemAreaInMonth").parent().removeClass('hide');}
		
		if(materialAreaInMonth.length == 0) {
			$("#chartMaterialAreaInMonth").parent().addClass('hide');
		} else {$("#chartMaterialAreaInMonth").parent().removeClass('hide');}
		
		if(costInMonth.length == 0) {
			$("#chartCostInMonth").parent().addClass('hide');
		} else {$("#chartCostInMonth").parent().removeClass('hide');}
		
		$.each($(".canvasjs-chart-credit"), function() {
			this.text = "";
		});
	}

	$(".dashboard").addClass("active");
	window.addEventListener('load', function() {
		$('.collapse-show').click();
	});
	
	var targetOffset = $('.reportMonth').offset().top;
	$('html, body').animate({scrollTop: targetOffset - 100}, 1000);
	
</script>
</body>
</html>