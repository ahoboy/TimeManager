<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>查看房源</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
	width: 100%;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>
</head>

<body>


	<!-- 引入header.jsp -->
	<jsp:include page="./header.jsp"></jsp:include>


	<div class="row" style="width: 1210px; margin: 0 auto;">
		<div class="col-md-12">
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath }/default">首页</a></li>
			</ol>
		</div>

        <c:forEach items="${pageBean.list }" var="allHouse">

		<div class="col-md-2" style="height:230px;width:400px" >
			<a href="${pageContext.request.contextPath }/houseInfo?hid=${allHouse.hid}"> 
			<%-- <img src="${pageContext.request.contextPath }/${allHouse.himage }"
				width="170" height="170" style="display: inline-block;"> --%>
			</a>
			<p style="font-size:24px">
				<a href="${pageContext.request.contextPath }/houseInfo?hid=${allHouse.hid}" style='color: green'>${allHouse.hname }</a>
			</p>
			<p style="font-size:18px">
				<a>价格：</a> <font color="#FF0000"><%-- ${allHouse.hprice_name}： --%>&yen;${allHouse.hprice }起</font>
			</p>
			<p style="font-size:18px">
				<a>地址：</a><font color="#FF0000">${allHouse.haddress}</font>
			</p>
			<p style="font-size:18px">
				<a>户型：</a><font color="#FF0000">${allHouse.hsize}</font>
			</p>
			<p style="font-size:18px">
				<a>描述：</a><font color="#FF0000">${allHouse.hdesc}</font>
			</p>
		</div>
		
		</c:forEach>

	</div>

    <!-- 分页 -->
	<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
		<ul class="pagination" style="text-align: center; margin-top: 10px;">

			<!-- 上一页 -->
			<c:if test="${pageBean.currentPage==1 }">
				<li class="disabled"><a href="javascript:void(0);"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<c:if test="${pageBean.currentPage!=1 }">
				<li><a
					href="${pageContext.request.contextPath}/beanServlet?currentPage=${pageBean.currentPage-1 }"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>


			<!-- 显示每一页 -->
			<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
				<!-- 判断是否是当前页 -->
				<c:if test="${page==pageBean.currentPage }">
					<li class="active"><a href="javascript:void(0);">${page }</a></li>
				</c:if>
				<c:if test="${page!=pageBean.currentPage }">
					<li><a
						href="${pageContext.request.contextPath}/beanServlet?currentPage=${page }">${page }</a></li>
				</c:if>
			</c:forEach>


			<!-- 下一页 -->
			<c:if test="${pageBean.currentPage==pageBean.totalPage }">
				<li class="disabled"><a href="javascript:void(0);"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
				<li><a
					href="${pageContext.request.contextPath}/beanServlet?currentPage=${pageBean.currentPage+1 }"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>

		</ul>
	</div>
	<!-- 分页结束 -->


	<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>