<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="container">
		<!-- <h1 class="form-heading">login Form</h1> -->
		<div class="login-form">
			<div class="main-div col-xs-8 col-sm-8 col-md-8 col-lg-4">
				<c:if test="${param.incorrectAccount != null}">
					<div class="alert alert-danger">	
							Username or password incorrect
					</div>
				</c:if>
				<c:if test="${param.accessDenied != null}">
					<div class="alert alert-danger">	
							Bạn không có quyền!
					</div>
				</c:if>
				<div class="">	
						<img src="<c:url value='/resources/images/logo-in-phat-tin-01.png'></c:url>" alt="Image" class="img-fluid">
				</div><hr><br>
				<form action="j_spring_security_check" id="formLogin" method="post">
					<div class="form-group">
						<input type="text" class="form-control" value="" id="userName" name="j_username" placeholder="Tên đăng nhập">
					</div>

					<div class="form-group">
						<input type="password" class="form-control" value="" id="password" name="j_password" placeholder="Mật khẩu">
					</div>
					<button type="submit" class="btn btn-primary" >Đăng nhập</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>