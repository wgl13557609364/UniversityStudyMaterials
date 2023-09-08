<%--
  Created by IntelliJ IDEA.
  User: fuchsine
  Date: 2022/10/14
  Time: 5:11
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="../css/orderItem.css">
    <link rel="stylesheet" type="text/css" href="../css/layui/css/layui.css">
    <script src="../js/orderitrm.js"></script>
</head>
<body>
<div id="wrap">
    <div id="hear">
        <div class="header-contain">
            <ul id="u1">
            <c:if test="${user!=null}">
                <li class="log1">欢迎您：${user.loginName}</li>
            </c:if>
                <c:if test="${user.role==2}">
                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/mangerArticle">管理员界面</a></li>
                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/getallservlet">查看所有订单</a></li>
                </c:if>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/Article">商城首页</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/orderselect">我的订单</a></li>
                <li><a class="b2" href="#">设为首页</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/tocollect">我的收藏</a></li>
                <li><a class="b2" href="${pageContext.request.contextPath}/loginout">退出登陆</a></li>
            </ul>
        </div>
        <div id="body1">
            <div id="imgop">
                <img src="../images/article/newlogo.gif" title="图片加载失败！" style="margin-left: -1800px">
            </div>
        </div>
        <div id="body2">
            <ul id="u2">
                <li><a href="http://localhost:8080/javaWebHomeWork_war/Article">首页</a></li>
                <li><a  href="javascript:void(0);" onclick="navonclik(this)">护肤</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">彩妆</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">香氛</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">身体护理</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">礼盒套装</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">母婴专区</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">男士专区</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">粉底</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">睫毛膏</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">唇彩</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">腮红</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">食品保健</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">瘦身类</a></li>
                <li><a href="javascript:void(0);" onclick="navonclik(this)">美容类</a></li>
            </ul>
        </div>
    </div>
    <div id="all">
        <div>
            <div id="righthing">
                <div id="anything">
                    <div id="main1">
                        <div>
                            <div id="title"><span>当前位置>>订单详情</span></div>

                            <div id="kk">
                                <table class="layui-table" lay-even>
                                    <thead  class="thead1">
                                    <th style="width: 250px;">商品图片</th>
                                    <th style="width: 450px">标题</th>
                                    <th style="width: 100px">供应商</th>
                                    <th>价格</th>
                                    <th style="width: 100px">购买数量</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${orderList}" var="orderList">
                                        <tr style="height: 100px">
                                            <td  style="height: 80px"><img  src="../images/article/${orderList.article.image}"></td>
                                            <td><a id="${orderList.article.id}" href="javascript:void(0);" onclick="js_method_orderitem(this)">${orderList.article.title}</a></td>
                                            <td>${orderList.article.locality}</td>
                                            <td>￥<fmt:formatNumber type="number" value="${orderList.article.price * orderList.article.discount * orderList.orderNum}" maxFractionDigits="3"/></td>
                                            <td>${orderList.orderNum}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="bottom1">
            <img src="../images/step.jpg" title="无法加载！">
        </div>
    </div>
</div>
</body>
</html>
