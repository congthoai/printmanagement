<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="roleIs" value="${SecurityUtils.getPrincipal().getUser().getRoleCode()}" scope="page" />


<div id="sidebar" class="sidebar                  responsive">
  <script type="text/javascript">
    try {
      ace.settings.check('sidebar', 'fixed')
    } catch (e) {}
  </script>
  <div class="sidebar-shortcuts" id="sidebar-shortcuts">
    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
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
    <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
      <span class="btn btn-success"></span>
      <span class="btn btn-info"></span>
      <span class="btn btn-warning"></span>
      <span class="btn btn-danger"></span>
    </div>
  </div>
  <ul class="nav nav-list">
    <li class="">
      <a href="
				<c:url value='/quan-tri/trang-chu'/>">
        <i class="menu-icon fa fa-tachometer"></i>
        <span class="menu-text"> Dashboard </span>
      </a>
      <b class="arrow"></b>
    </li>
    <c:if test="${roleIs == 'ADMIN' || roleIs == 'USER'}">
    <li class="">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-cube"></i>
        <span class="menu-text">DANH MỤC</span>
        <b class="arrow fa fa-angle-down"></b>
      </a>
      <b class="arrow"></b> 
      <ul class="submenu">
        <li class="">
          <a href="
						<c:url value='/quan-tri/san-pham/danh-sach'/>">
            <i class="menu-icon fa fa-caret-right"></i>Sản Phẩm In </a>
          <b class="arrow"></b>
        </li>
        <li class="">
          <a href="
						<c:url value='/quan-tri/loai-san-pham/danh-sach'/>">
            <i class="menu-icon fa fa-caret-right"></i>Loại Sản Phẩm </a>
          <b class="arrow"></b>
        </li>
        <li class="">
          <a href="
						<c:url value='/quan-tri/vat-tu/danh-sach'/>">
            <i class="menu-icon fa fa-caret-right"></i> Vật Tư </a>
          <b class="arrow"></b>
        </li>
        <li class="">
          <a href="
						<c:url value='/quan-tri/loai-vat-tu/danh-sach'/>">
            <i class="menu-icon fa fa-caret-right"></i> Loại Vật Tư </a>
          <b class="arrow"></b>
        </li>
        <li class="">
          <a href="
						<c:url value='/quan-tri/khach-hang/danh-sach'/>">
            <i class="menu-icon fa fa-caret-right"></i> Khách Hàng </a>
          <b class="arrow"></b>
        </li>
        <li class="">
          <a href="
						<c:url value='/quan-tri/loai-khach-hang/danh-sach'/>">
            <i class="menu-icon fa fa-caret-right"></i> Loại Khách Hàng </a>
          <b class="arrow"></b>
        </li>
        <li class="">
          <a href="
						<c:url value='/quan-tri/don-gia/danh-sach'/>">
            <i class="menu-icon fa fa-caret-right"></i> Đơn Giá </a>
          <b class="arrow"></b>
        </li>
      </ul>
    </li>
   </c:if>
      <li class="cong-no">
        <a href="#" class="dropdown-toggle">
          <i class="menu-icon fa fa-pencil-square-o"></i>
          <span class="menu-text">CHI PHÍ-ĐƠN HÀNG</span>
          <b class="arrow fa fa-angle-down"></b>
        </a>
        <b class="arrow"></b>
        <ul class="submenu">
          <li class="">
            <a href="
							<c:url value='/quan-tri/don-hang/danh-sach'/>">
              <i class="menu-icon fa fa-caret-right"></i> Đơn Hàng </a>
            <b class="arrow"></b>
          </li>
          <li class="">
            <a href="
							<c:url value='/quan-tri/quan-ly-in/danh-sach'/>">
              <i class="menu-icon fa fa-caret-right"></i> Quản Lý In </a>
            <b class="arrow"></b>
          </li>
          <c:if test="${roleIs == 'ADMIN'}">
          <li class="">
            <a href="
							<c:url value='/quan-tri/chi-phi/danh-sach'/>">
              <i class="menu-icon fa fa-caret-right"></i> Chi Phí </a>
            <b class="arrow"></b>
          </li>
          <li class="">
            <a href="
							<c:url value='/quan-tri/nhap-vat-tu/danh-sach'/>">
              <i class="menu-icon fa fa-caret-right"></i> Nhập Vật Tư </a>
            <b class="arrow"></b>
          </li>
          </c:if>
        </ul>
      </li>

   <c:if test="${roleIs == 'ADMIN'}">
      <li class="bao-cao">
        <a href="#" class="dropdown-toggle">
          <i class="menu-icon fa fa-pie-chart"></i>
          <span class="menu-text">BÁO CÁO</span>
          <b class="arrow fa fa-angle-down"></b>
        </a>
        <b class="arrow"></b>
        <ul class="submenu">
          <li class="">
            <a href="
							<c:url value='/quan-tri/bao-cao/home'/>">
              <i class="menu-icon fa fa-caret-right"></i>Công Nợ </a>
            <b class="arrow"></b>
          </li>
          <li class="">
            <a href="
							<c:url value='/quan-tri/bao-cao/hieu-qua-kinh-doanh'/>">
              <i class="menu-icon fa fa-caret-right"></i>KQ Kinh Doanh </a>
            <b class="arrow"></b>
          </li>
        </ul>
      </li>

   
      <li class="tai-khoan">
        <a href="#" class="dropdown-toggle">
          <i class="menu-icon fa fa-user"></i>
          <span class="menu-text">TÀI KHOẢN</span>
          <b class="arrow fa fa-angle-down"></b>
        </a>
        <b class="arrow"></b>
        <ul class="submenu">
          <li class="">
            <a href="
							<c:url value='/quan-tri/tai-khoan/danh-sach?page=1&limit=5'/>">
              <i class="menu-icon fa fa-caret-right"></i>Quản Trị Viên </a>
            <b class="arrow"></b>
          </li>
          <li class="">
            <a href="
							<c:url value='/quan-tri/tai-khoan/danh-sach?page=1&limit=5'/>">
              <i class="menu-icon fa fa-caret-right"></i>Người Dùng </a>
            <b class="arrow"></b>
          </li>
        </ul>
      </li>
	</c:if>
   
      <li>
        <a href="#" class="dropdown-toggle">
          <i class="menu-icon fa fa-list"></i>
          <span class="menu-text">NỘI DUNG</span>
          <b class="arrow fa fa-angle-down"></b>
        </a>
        <b class="arrow"></b>
        <ul class="submenu">
          <li>
            <a>
              <i class="menu-icon fa fa-caret-right"></i>Banner </a>
            <b class="arrow"></b>
          </li>
          <li>
            <a>
              <i class="menu-icon fa fa-caret-right"></i>Tin tức </a>
            <b class="arrow"></b>
          </li>
        </ul>
      </li>

   
      <li>
        <a href="#" class="dropdown-toggle">
          <i class="menu-icon fa fa-phone"></i>
          <span class="menu-text">Support</span>
          <b class="arrow fa fa-angle-down"></b>
        </a>
        <b class="arrow"></b>
        <ul class="submenu">
          <li>
            <a>
              <i class="menu-icon fa fa-caret-right"></i>Hỗ trợ </a>
            <b class="arrow"></b>
          </li>
          <li>
            <a>
              <i class="menu-icon fa fa-caret-right"></i>Liên hệ </a>
            <b class="arrow"></b>
          </li>
        </ul>
      </li>

  </ul>
  <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
    <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
  </div>
  <script type="text/javascript">
    try {
      ace.settings.check('sidebar', 'collapsed')
    } catch (e) {}
  </script>
  
 
 						<div class="ace-settings-container" id="ace-settings-container" style="position: fixed; top: 20%">
							<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
								<i class="ace-icon fa fa-cog bigger-130"></i>
							</div>

							<div class="ace-settings-box clearfix" id="ace-settings-box">
								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<div class="pull-left">
											<select id="skin-colorpicker" class="hide">
												<option data-skin="no-skin" value="#438EB9">#438EB9</option>
												<option data-skin="skin-1" value="#222A2D">#222A2D</option>
												<option data-skin="skin-2" value="#C6487E">#C6487E</option>
												<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
											</select>
										</div>
										<span>&nbsp; Choose Skin</span>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
										<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
										<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
										<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
										<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
										<label class="lbl" for="ace-settings-add-container">
											Inside
											<b>.container</b>
										</label>
									</div>
								</div><!-- /.pull-left -->

								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" />
										<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" />
										<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" />
										<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
									</div>
								</div><!-- /.pull-left -->
							</div><!-- /.ace-settings-box -->
						</div><!-- /.ace-settings-container --> 
 
</div>