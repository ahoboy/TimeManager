<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>房源预定</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>

<script type="text/javascript">
	function confirmOrder(){
		//提交表单
		$("#orderForm").submit();
	}


</script>

</head>

<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div class="container">
		<div class="botton" style="width:955px;height:410px">
		
		<div style="margin: 0 auto; width: 950px;">

			<div
				style="border: 1px solid #e4e4e4; width: 930px; margin-bottom: 10px; margin: 0 auto; padding: 10px; margin-bottom: 10px;">
				<a href="${pageContext.request.contextPath }/default.jsp">首页&nbsp;&nbsp;&gt;</a>
				<a href="${pageContext.request.contextPath }/beanServlet">我要租房&nbsp;&nbsp;&gt;</a><a href="javascript:void(0)">提交订单</a>
			</div>

			<div class="col-md-6">
				<img style="margin-left: 100px;opacity: 1; width: 400px; height: 350px;" title=""
					class="medium" src="${pro.himage }">
			</div>


			<div class="col-md-6">
			
			        <div style="margin-top: 20px;margin-bottom: 20px;margin-left:50px;font-size:25px">订单详情：</div>
			
					<div style="margin-top: 5px;margin-bottom: 5px;margin-left:105px;font-size:20px">${pro.hname }</div>

					<div style="margin-top: 12px;margin-bottom: 12px;margin-left:105px;font-size:20px">
						${pro.hprice_name }: <strong style="color: #ef0101;">￥：${pro.hprice }起</strong>
					</div>
					<div
						style="margin-top: 12px;margin-bottom: 12px;margin-left:105px;border-bottom: 1px dotted #dddddd; width: 350px;">
						<div id="addresss" style="font-size:18px">地址：${pro.haddress }</div>
					</div>
					<div
						style="margin-top: 12px;margin-bottom: 12px;margin-left:105px;border-bottom: 1px dotted #dddddd; width: 350px;">
						<div style="font-size:18px">房主：${pro.user.name }</div>
					</div>
					<div
						style="margin-top: 12px;margin-bottom: 12px;margin-left:105px;border-bottom: 1px dotted #dddddd; width: 350px;">
						<div style="font-size:18px">联系电话：${pro.user.telephone }</div>
					</div>
					<div
						style="margin-top: 12px;margin-bottom: 12px;margin-left:105px;border-bottom: 1px dotted #dddddd; width: 350px;">
						<div style="font-size:18px">联系邮箱：${pro.user.email }</div>
					</div>

				</div>
				
			</div>
		
		</div>

		<div>
			<hr />
			<form id="orderForm" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/submit"
				style="margin-top: 5px; margin-left: 150px;">
				<input type="hidden" name="method" value="confirmOrder">
				<!-- 传递订单oid -->
				<input type="hidden" name="hid" value="${pro.hid }">
				<input type="hidden" name="oid" value="${oid }">
				<input type="hidden" name="luid" value="${pro.user.uid }">
				<input type="hidden" name="buid" value="${user.uid }">
				
				<div class="form-group" style="margin-left:auto;margin-right:auto">
					<label for="inputPassword3" class="col-sm-1 control-label">姓名：</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputPassword3" name="oname"
							placeholder="请输入您的姓名" value="${user.name }">
					</div>
				</div>
				<div class="form-group"style="margin-left:auto;margin-right:auto">
					<label for="inputPassword3" class="col-sm-1 control-label">电话：</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputPassword3" name="otelephone"
							placeholder="请输入您的电话" value="${user.telephone }">
					</div>
				</div>
				<div class="form-group"style="margin-left:auto;margin-right:auto">
					<label for="confirmpwd" class="col-sm-1 control-label">时间：</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="confirmpwd" name="odate"
							placeholder="请输入您需要住几晚"  >
					</div>
				</div>
				
				<hr />

				<p style="text-align: right; margin-right: 500px;">
					<a href="javascript:;" onclick="confirmOrder()"> <img
						src="./images/submitorder.png" width="280" height="50" border="0" />
					</a>
				</p>
				
				
				<hr />
			</form>
			
		</div>

	</div>

	<jsp:include page="/footer.jsp"></jsp:include>

</body>

</html>