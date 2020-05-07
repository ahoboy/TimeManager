<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>房源详细</title>
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#container {
	height: 100%
}

</style>
<script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script>

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
</head>

<body>

	<!-- 引入header.jsp -->
	<jsp:include page="./header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row">
			<div
				style="border: 1px solid #e4e4e4; width: 930px; margin-bottom: 10px; margin: 0 auto; padding: 10px; margin-bottom: 10px;">
				<a href="${pageContext.request.contextPath }/default.jsp">首页&nbsp;&nbsp;&gt;</a> <a href="${pageContext.request.contextPath }/beanServlet">我要租房&nbsp;&nbsp;&gt;</a><a>房源详情</a>
			</div>

			<div style="margin: 0 auto; width: 950px;">

				<div class="col-md-6">
					<div style="font-size:30px">${pro.hname }</div>

					<div style="margin: 10px 0 10px 0; font-size:18px">
						${pro.hprice_name }: <strong style="color: #ef0101;">￥：${pro.hprice }起</strong>
					</div>
					<div
						style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 20px 0 20px 0;">
						<div id="addresss" style="font-size:15px">地址：${pro.haddress }</div>
					</div>
					<div style="font-size:20px"><strong>房主信息:</strong></div>
					<div
						style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 20px 0 20px 0;">
						<div style="font-size:15px">姓名：${pro.user.name }</div>
					</div>
					<div
						style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 20px 0 20px 0;">
						<div style="font-size:15px">联系电话：${pro.user.telephone }</div>
					</div>
					<div
						style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 20px 0 20px 0;">
						<div style="font-size:15px">邮箱：${pro.user.email }</div>
					</div>
					

					<c:if test="${pro.hflag == 0 }">
						<div
							style="background: url('./images/yuding.png');height:50px;width:300px;text-align:center;">
							<a href="${pageContext.request.contextPath }/toInfo?hid=${pro.hid}"><strong style="color:white;font-size:25px;">立即预定</strong></a>
						</div>
					</c:if>
					<c:if test="${pro.hflag == 1 }">
						<div
							style="background: url('./images/yudingshibai.png');height:50px;width:300px;text-align:center;">
							<strong style="color:white;font-size:25px;">已被预订</strong>
						</div>
					</c:if>



				</div>

				<div class="col-md-6">
					<img style="opacity: 1; width: 400px; height: 350px;" title=""
						class="medium"
						src="${pro.himage }">
				</div>
				
			</div>
			<div class="clear"></div>
			
			<div style="width: 950px; margin: 0 auto;">
				<div
					style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
					<strong>房源周边</strong>
				</div>

				<div id="container" style="width:930px;height:500px;"></div>
				
				<script type="text/javascript">
				
				   var address = document.getElementById("addresss").innerText;
				
					var map = new BMap.Map("container"); //在container容器中创建一个地图,参数container为div的id属性;
					var point = new BMap.Point(114.306756, 30.510157); //创建点坐标
					map.centerAndZoom(point, 18); //初始化地图，设置中心点坐标和地图级别
					map.addControl(new BMap.NavigationControl()); //添加控件：缩放地图的控件，默认在左上角；
					map.addControl(new BMap.MapTypeControl()); //添加控件：地图类型控件，默认在右上方；
					map.addControl(new BMap.ScaleControl()); //添加控件：地图显示比例的控件，默认在左下方；
					map.addControl(new BMap.OverviewMapControl()); //添加控件：地图的缩略图的控件，默认在右下方； TrafficControl
					
					var search = new BMap.LocalSearch("中国", {
                    onSearchComplete: function(result){
                        if (search.getStatus() == BMAP_STATUS_SUCCESS){
                        var res = result.getPoi(0);
                        var point = res.point;
                map.centerAndZoom(point, 17);
            }
        },renderOptions: {  //结果呈现设置
            map: map,
            autoViewport: true,
            selectFirstResult: true
        } ,onInfoHtmlSet:function(poi,html){
         
        }
    });
    window.onload = function setCity(){
        search.search(address);
    }
    search.search(address);
					
				</script>

				<div
					style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
					<strong>房屋参数</strong>
				</div>
				<div style="margin-top: 10px; width: 900px;">
					<table class="table table-bordered">
						<tbody>
							<tr class="active">
								<th colspan="2">基本参数</th>
							</tr>
							<tr>
								<th width="10%">户型</th>
								<td width="30%">${pro.hsize }</td>
							</tr>
							<tr>
								<th width="10%">简介</th>
								<td>${pro.hdesc }</td>
							</tr>
						</tbody>
					</table>
				</div>

		</div>
	</div>


	<!-- 引入footer.jsp -->
	<jsp:include page="./footer.jsp"></jsp:include>

</body>

</html>