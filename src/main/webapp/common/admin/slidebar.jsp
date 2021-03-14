<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="sidebar"
	class="sidebar                  responsive                    ace-save-state">

	<div class="sidebar-shortcuts">
		<div class="sidebar-shortcuts-large">
			<button class="btn btn-success">
				<i class="ace-icon fa fa-signal"></i>
			</button>

			<button class="btn btn-info">
				<i class="ace-icon fa fa-pencil"></i>
			</button>

			<button class="btn btn-warning">
				<i class="ace-icon fa fa-users"></i>
			</button>

			<button class="btn btn-danger">
				<i class="ace-icon fa fa-cogs"></i>
			</button>
		</div>
		<div class="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span> <span class="btn btn-info"></span>

			<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
		</div>
	</div>

	<ul class="nav nav-list">
		<li class="dashboard"><a href="<c:url value='/quan-tri/trang-chu'/>">
		        <i class="menu-icon fa fa-tachometer"></i>
		        <span class="menu-text"> Dashboard </span>
		    </a>
		
		    <b class="arrow"></b>
		</li>
		<li class="danh-muc"><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-cube"></i> <span class="menu-text">DANH MỤC</span>
				<b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>
			<ul class="submenu">
				<li class=""><a href="<c:url value='/quan-tri/san-pham/danh-sach'/>">
						<i class="menu-icon fa fa-caret-right"></i>Loại SP In
				</a> <b class="arrow"></b></li>
				<li class=""><a href="<c:url value='/quan-tri/vat-tu/danh-sach'/>">
						<i class="menu-icon fa fa-caret-right"></i> Vật tư
				</a> <b class="arrow"></b></li>
				<li class=""><a href="<c:url value='/quan-tri/loai-khach-hang/danh-sach'/>">
						<i class="menu-icon fa fa-caret-right"></i> Loại khách hàng
				</a> <b class="arrow"></b></li>
				<li class=""><a href="<c:url value='/quan-tri/khach-hang/danh-sach'/>">
						<i class="menu-icon fa fa-caret-right"></i> Khách hàng
				</a> <b class="arrow"></b></li>
				<li class=""><a href="<c:url value='/quan-tri/don-gia/danh-sach'/>">
						<i class="menu-icon fa fa-caret-right"></i> Đơn giá
				</a> <b class="arrow"></b></li>

			</ul></li>
	</ul>
	
	<ul class="nav nav-list">
		<li class="cong-no"><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-pencil-square-o"></i> <span class="menu-text">CHI PHÍ-ĐƠN HÀNG</span>
				<b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>
			<ul class="submenu">
				<li class=""><a href="<c:url value='/quan-tri/don-hang/danh-sach'/>">
						<i class="menu-icon fa fa-caret-right"></i> Đơn hàng
				</a> <b class="arrow"></b></li>
				<li class=""><a href="<c:url value='/quan-tri/chi-phi/danh-sach'/>">
						<i class="menu-icon fa fa-caret-right"></i> Chi phí
				</a> <b class="arrow"></b></li>
				<li class=""><a href="<c:url value='/quan-tri/nhap-vat-tu/danh-sach'/>">
						<i class="menu-icon fa fa-caret-right"></i> Nhập vật tư
				</a> <b class="arrow"></b></li>

			</ul></li>
	</ul>
	
	<ul class="nav nav-list">
		<li class="bao-cao"><a href="#" class="dropdown-toggle"> <i class="menu-icon fa fa-pie-chart"></i>
		<span class="menu-text">BÁO CÁO</span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>
			<ul class="submenu">
				<li class=""><a href="<c:url value='/quan-tri/bao-cao/home'/>">
						<i class="menu-icon fa fa-caret-right"></i>Công nợ
				</a> <b class="arrow"></b></li>
				<li class=""><a href="<c:url value='/quan-tri/bao-cao/hieu-qua-kinh-doanh'/>">
						<i class="menu-icon fa fa-caret-right"></i>KQ Kinh doanh
				</a> <b class="arrow"></b></li>
			</ul></li>
	</ul>
	
	<ul class="nav nav-list">
		<li class="tai-khoan"><a href="#" class="dropdown-toggle"> <i class="menu-icon fa fa-user"></i>
		<span class="menu-text">TÀI KHOẢN</span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>
			<ul class="submenu">
				<li class=""><a href="<c:url value='/quan-tri/tai-khoan/danh-sach?page=1&limit=5'/>">
						<i class="menu-icon fa fa-caret-right"></i>Ban quản trị
				</a> <b class="arrow"></b></li>
				<li class=""><a href="<c:url value='/quan-tri/tai-khoan/danh-sach?page=1&limit=5'/>">
						<i class="menu-icon fa fa-caret-right"></i>Người dùng
				</a> <b class="arrow"></b></li>
			</ul></li>
	</ul>

	<ul class="nav nav-list">
		<li><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-list"></i> <span class="menu-text">NỘI DUNG</span>
				<b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>
			<ul class="submenu">
				<li><a ><i class="menu-icon fa fa-caret-right"></i>Banner </a><b class="arrow"></b></li>
				<li><a ><i class="menu-icon fa fa-caret-right"></i>Tin tức </a><b class="arrow"></b></li>

			</ul></li>
	</ul>

	<ul class="nav nav-list">
		<li><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-phone"></i> <span class="menu-text">Support</span>
				<b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>
			<ul class="submenu">
				<li><a ><i class="menu-icon fa fa-caret-right"></i>Hỗ trợ </a><b class="arrow"></b></li>
				<li><a ><i class="menu-icon fa fa-caret-right"></i>Liên hệ </a><b class="arrow"></b></li>

			</ul></li>
	</ul>
	<div class="sidebar-toggle sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left ace-save-state"
			data-icon1="ace-icon fa fa-angle-double-left"
			data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>
</div>
