<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.printmanagement.util.SecurityUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="navbar" class="navbar navbar-default          ace-save-state">
	<div class="navbar-container ace-save-state" id="navbar-container">
		<button type="button" class="navbar-toggle menu-toggler pull-left display" id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<div class="navbar-header pull-left">
			<a href="<c:url value='/quan-tri/trang-chu'/>" class="navbar-brand">
				<small> <i class="fa fa-home"></i> Trang quản trị
			</small>
			</a>
		</div>
		<div class="navbar-header pull-left">
			<a href="http://inphattin.com/" class="navbar-brand" target="_blank">
				<small> <i class="fa fa-leaf"></i> Home
			</small>
			</a>
		</div>
		<div
			class="navbar-buttons navbar-header pull-right collapse navbar-collapse"
			role="navigation">
			<ul class="nav ace-nav">
				<li class="light-blue dropdown-modal">
				<a data-toggle="dropdown" href="#" class="dropdown-toggle"> 
					<img class="nav-user-photo" src="<c:url value='/resources/images/logo-in-phat-tin.png'/>" alt="Jason's Photo">
					<span class="user-info">
						<small>Welcome,</small> <%=SecurityUtils.getPrincipal().getFullName()%>
					</span>
					
				</a>
				<li class="light-blue dropdown-modal"><a
					href='<c:url value='/thoat'/>'> <i
						class="ace-icon fa fa-power-off"></i> Thoát
				</a></li>
				</li>
			</ul>
		</div>
	</div>
</div>