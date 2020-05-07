<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 登录 注册  -->
<div class="container-fluid">
	<div class="col-md-4" style="width:955px">
		<img src="img/logo2.png" />
	</div>
	<div class="col-md-3" style="padding-top:20px">
		<ol class="list-inline">
		
			<c:if test="${empty user }">
				<li><a href="login">登录</a></li>
				<li><a href="register">注册</a></li>
			</c:if>
			<c:if test="${!empty user }">
				<li style="color:red">欢迎您，${user.name }</li>
				<li><a href="${pageContext.request.contextPath }/myOrder?uid=${user.uid}">我的房屋</a></li>
				<li><a href="${pageContext.request.contextPath }/user?method=logout">退出</a></li>
			</c:if>
		</ol>
	</div>
</div>

<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath }/index">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath }/rentHouse">我要租房</a></li>
					<li><a href="${pageContext.request.contextPath }/publishHouse">我要出租</a></li>
					<%-- <li><a href="${pageContext.request.contextPath }/hotHouse">热门房源</a></li>
					<li><a href="${pageContext.request.contextPath }/hotSale">特价房源</a></li> --%>
				</ul>
				<form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath }/search">
					<div class="form-group">
						<input type="text" class="form-control" name="searchValue" placeholder="搜索房源">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
			</div>
		</div>
	</nav>
</div>