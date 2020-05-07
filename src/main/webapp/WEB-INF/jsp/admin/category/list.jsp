<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/js/public.js"></script>
<script type="text/javascript">
			function addCategory(){
				window.location.href = "${pageContext.request.contextPath}/admin/category/add.jsp";
			}
		</script>
</HEAD>
<body>
	<br>
	<table cellSpacing="1" cellPadding="0" width="100%" align="center"
		bgColor="#f5fafe" border="0">
		<TBODY>
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3"><strong>房源列表</strong>
				</TD>
			</tr>
			
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					<table cellspacing="0" cellpadding="1" rules="all"
						bordercolor="gray" border="1" id="DataGrid1"
						style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
						<tr
							style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

							<td align="center" width="16%">编号</td>
							<td align="center" width="15%">名称</td>
							<td align="center" width="7%">价格</td>
							<td align="center" width="7%">状态</td>
							<td width="7%" align="center">删除</td>
						</tr>
						<c:forEach items="${pro }" var="allHouse">
							<tr onmouseover="this.style.backgroundColor = 'white'"
								onmouseout="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="16%">${allHouse.hid }</td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="15%">${allHouse.hname }</td>
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="7%">${allHouse.hprice }￥</td>	
								<c:if test="${allHouse.hflag == 1 }">
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="7%">已出租</td>
								</c:if>
								<c:if test="${allHouse.hflag == 0}">
								<td style="CURSOR: hand; HEIGHT: 22px" align="center"
									width="7%">未出租</td>
								</c:if>

								<td align="center" style="HEIGHT: 22px">
								<c:if test="${allHouse.hflag == 0 }">
								<a href="${pageContext.request.contextPath}/adminDeleteHouse?hid=${allHouse.hid }">
										<img src="${pageContext.request.contextPath}/images/i_del.gif"
										width="16" height="16" border="0" style="CURSOR: hand" onClick="return confirm('您确定要删除吗？');">
								</a>
								</c:if>
								<c:if test="${allHouse.hflag == 1 }">
								<a href="javaScript:void(0)" onClick="return confirm('请先删除订单后再进行操作');">
										<img src="${pageContext.request.contextPath}/images/i_del.gif"
										width="16" height="16" border="0" style="CURSOR: hand">
								</a>
								</c:if>
								
								</td>

							</tr>
							</c:forEach>
					</table>
				</td>
			</tr>
		</TBODY>
	</table>
</body>
</HTML>

