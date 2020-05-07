<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>我的订单</title>
        <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link href="css/style-order.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/tab.js"></script>
    </head>
    <body>


        <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <div
				style=" width: 1336px; margin-bottom: 10px; margin: 0 auto; padding: 10px; margin-bottom: 10px;">
				<a href="${pageContext.request.contextPath }/default.jsp" style="color:black"><b>首页</b>&nbsp;&nbsp;&gt;</a> <a href="${pageContext.request.contextPath }/beanServlet" style="color:black"><b>我要租房</b>&nbsp;&nbsp;&gt;</a><a style="color:black"><b>我的房屋</b></a>
			</div>
            </header>
            <section class="aui-scrollView">
                <div class="aui-tab" data-ydui-tab>
                    <ul class="tab-nav">
                        <li class="tab-nav-item tab-active">
                            <a href="javascript:;">我的发布</a>
                        </li>
                        <li class="tab-nav-item">
                            <a href="javascript:;">我的预定</a>
                        </li>
                    </ul>
                   
                    <div class="divHeight"></div>
                    
                 <div class="tab-panel">    <!-- 整体的容器 -->
                    
                        <div class="tab-panel-item tab-active">   <!-- 我的发布 -->

						<c:forEach items="${houseList2 }" var="house2">
                        
                        <div class="tab-item">
                                <a href="${pageContext.request.contextPath }/houseInfo?hid=${house2.hid}" class="aui-well-item aui-well-item-clear">
                                    <div class="aui-well-item-hd">
                                        <img src="images/icon-logo.png" alt="">
                                    </div>
                                    <div class="aui-well-item-bd">
                                        <h3>${house2.hname }</h3>
                                    </div>
                                </a>
                                <div class="aui-mail-product">
                                    <a href="${pageContext.request.contextPath }/houseInfo?hid=${house2.hid}" class="aui-mail-product-item">
                                        <div class="aui-mail-product-item-hd">
                                            <img src="${pageContext.request.contextPath }/${house2.himage }" alt="">
                                        </div>
                                        <div class="aui-mail-product-item-bd">
                                            <p>${house2.haddress }</p>
                                        </div>
                                    </a>
                                </div>
                                <a href="javascript:;" class="aui-mail-payment">
                                    <p>
                      <c:if test="${house2.hflag == 0 }">状态：<em>未租出</em></c:if>
                      <c:if test="${house2.hflag == 1 }">状态：<em>已租出</em></c:if>   
                                               标价: ￥<i>${house2.hprice }</i>
                                    </p>
                                </a>
                                <div class="aui-mail-button">
                                    <c:if test="${house2.hflag == 0 }"><a href="${pageContext.request.contextPath }/deleteHouse?hid=${house2.hid}" onClick="return confirm('您确定要取消房屋发布吗？');">取消发布</a></c:if>
                                    <c:if test="${house2.hflag == 1 }"><a href="javascript:void(0)" onClick="return confirm('请等待用户退房后再取消发布！');">取消发布</a></c:if>
                                </div>
                            </div>


						</c:forEach>




						<div class="divHeight"></div>   <!-- 两个订单之间的间隙 -->
                            
                        </div>
                        
                        <div class="tab-panel-item">    <!-- 我的预定 -->
                        
                        <c:forEach items="${houseList1 }" var="house1">
                        
                            <div class="tab-item">
                                <a href="${pageContext.request.contextPath }/houseInfo?hid=${house1.hid}" class="aui-well-item aui-well-item-clear">
                                    <div class="aui-well-item-hd">
                                        <img src="images/icon-logo.png" alt="">
                                    </div>
                                    <div class="aui-well-item-bd">
                                        <h3>${house1.hname }</h3>
                                    </div>
                                    <span class="aui-well-wait">状态：已预订</span>
                                </a>
                                <div class="aui-mail-product">
                                    <a href="${pageContext.request.contextPath }/houseInfo?hid=${house1.hid}" class="aui-mail-product-item">
                                        <div class="aui-mail-product-item-hd">
                                            <img src="${pageContext.request.contextPath }/${house1.himage }" alt="">
                                        </div>
                                        <div class="aui-mail-product-item-bd">
                                            <p>${house1.haddress }</p>
                                        </div>
                                    </a>
                                </div>
                                <a href="javascript:;" class="aui-mail-payment">
                                    <p>
                                        ${house1.hprice_name }: ￥<i>${house1.hprice }/天</i>
                                    </p>
                                </a>
                                <div class="aui-mail-button">
                                    <a href="${pageContext.request.contextPath }/returnHouse?hid=${house1.hid}" onClick="return confirm('您确认要退房吗？')">退房</a>
                                </div>
                            </div>    <!-- 预定项结束 -->
                            
                            </c:forEach>


						

					</div>
                        
                    </div>
                    
                    
                </div>
            </section>
        </section>
    </body>
</html>
