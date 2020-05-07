<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>希尔顿租房</title>
		<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" />
		<script src="/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="/js/bootstrap.min.js" type="text/javascript"></script>
		<style type="text/css">
		    .col-md-2{width:300px;height:260px;}
		    .col-md-10{text-align:center;width:1319px;height:250px;}
		    .col-md-12{width:1259px;height:100px;}
		    a:link{text-decoration:none}
		</style>
	</head>
	<body>
		<div class="container-fluid">

			<!-- 引入header.jsp -->
			<jsp:include page="./header.jsp"></jsp:include>

			<!-- 轮播图 -->
			<div class="container-fluid">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- 轮播图的中的小点 -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!-- 轮播图的轮播图片 -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="/img/1.jpg">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
							</div>
						</div>
						<div class="item">
							<img src="/img/2.jpg">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
							</div>
						</div>
						<div class="item">
							<img src="/img/3.jpg">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
							</div>
						</div>
					</div>

					<!-- 上一张 下一张按钮 -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
							
		    <!-- 热门房源 -->
			<%-- <div class="container-fluid">
				<div class="col-md-12">
					<a class="font-01" href="${pageContext.request.contextPath }/hotHouse"><h2>热门房源</h2></a>
				</div>
		    <div class="col-md-10">
				<c:forEach items="${hotProductList }" var="hotPro">
					<div class="col-md-2">
						<a href="${pageContext.request.contextPath }/houseInfo?hid=${hotPro.hid}"> <img
							src="${pageContext.request.contextPath }/${hotPro.himage }"
							width="170" height="170" style="display: inline-block;">
						</a>
						<p>
							<a href="${pageContext.request.contextPath }/houseInfo?hid=${hotPro.hid}" style='color:#666'>${hotPro.hname }</a>
						</p>
						<p>
							<font color="#E4393C" style="font-size:16px">&yen;${hotPro.hprice }</font>
						</p>
					</div>
				</c:forEach>

			</div>
			</div> --%>
			
			<!-- 特惠房源 -->
			<%-- <div class="container-fluid">
				<div class="col-md-12">
					<a class="font-01" href="${pageContext.request.contextPath }/hotSale"><h2>特惠房源</h2></a>
				</div>
		    <div class="col-md-10">
				<c:forEach items="${onSaleProductList }" var="hotPro1">
					<div class="col-md-2">
						<a href="${pageContext.request.contextPath }/houseInfo?hid=${hotPro1.hid}"> <img
							src="${pageContext.request.contextPath }/${hotPro1.himage }"
							width="170" height="170" style="display: inline-block;">
						</a>
						<p>
							<a href="${pageContext.request.contextPath }/houseInfo?hid=${hotPro1.hid}" style='color:#666'>${hotPro1.hname }</a>
						</p>
						<p>
							<font color="#E4393C" style="font-size:16px">&yen;${hotPro1.hprice }</font>
						</p>
					</div>
				</c:forEach>
				</div>
				
		      

			</div> --%>
			
			<!-- 引入footer.jsp -->
			<jsp:include page="./footer.jsp"></jsp:include>
			
		</div>
	</body>

</html>