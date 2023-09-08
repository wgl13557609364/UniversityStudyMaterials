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
    <link rel="stylesheet" type="text/css" href="../css/collect.css">
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
    <script src="../js/collect.js"></script>
</head>
<style>
    td{
        text-align: center;
    }
</style>
<body>
<div id="wrap">
    <div id="hear">
        <div class="header-contain">
            <ul id="u1">
                <c:if test="${user!=null}">
                    <li>欢迎您：${user.loginName}</li>
                </c:if>
                <c:if test="${user.role==2}">
                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/mangerArticle">管理员界面</a></li>
                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/getallservlet">查看所有订单</a></li>
                </c:if>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/shopcar">我的购物车</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/Article">商城首页</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/orderselect">我的订单</a></li>
                <li><a class="b2" href="${pageContext.request.contextPath}/loginout">退出登陆</a></li>
            </ul>
        </div>
        <div id="body1">
            <div id="imgop">
                <img src="../images/article/newlogo.gif" title="图片加载失败！" style="margin-left: -1650px">
            </div>
        </div>
        <div id="body2">
            <ul id="u2">
                <li><a href="http://localhost:8080/javaWebHomeWork_war/Article">首页</a></li>
                <li><a href="#">护肤</a></li>
                <li><a href="#">彩妆</a></li>
                <li><a href="#">香氛</a></li>
                <li><a href="#">身体护肤</a></li>
                <li><a href="#">礼盒套装</a></li>
                <li><a href="#">母婴专区</a></li>
                <li><a href="#">男士专区</a></li>
                <li><a href="#">粉底</a></li>
                <li><a href="#">睫毛膏</a></li>
                <li><a href="#">唇彩</a></li>
                <li><a href="#">腮红</a></li>
                <li><a href="#">食品保健</a></li>
                <li><a href="#">瘦身类</a></li>
                <li><a href="#">美容类</a></li>
            </ul>
        </div>
    </div>
    <div id="all">
        <div>
            <div id="righthing">
                <div id="anything">
                    <div id="main1">
                        <div>
                            <div id="title"><span>当前位置>>我的收藏</span></div>

                            <div id="kk">
                                <table class="layui-table" lay-even>
                                    <thead  class="thead1">
                                    <th style="width: 60px;">商品id</th>
                                    <th style="width: 100px;">商品图片</th>
                                    <th style="width: 550px">标题</th>
                                    <th style="width: 100px">供应商</th>
                                    <th style="width: 100px">价格</th>
                                    <th style="width: 100px">操作</th>
                                    </thead>
                                    <tbody>
                                    <tr style="height: 100px">
                                        <c:forEach items="${collectList}" var="collectList">
                                        <td>${collectList.article.id}</td>
                                        <td  style="height: 80px"><img  src="../images/article/${collectList.article.image}"></td>
                                        <td>${collectList.article.title}</td>
                                        <td>${collectList.article.supplier}</td>
                                        <td>￥${collectList.article.price}</td>
                                        <td style="text-align: center;color: #222222"><a id="a${collectList.article.id}" style="margin-top: 5px" class="layui-btn layui-btn-primary layui-btn layui-btn-sm"  onclick="deletecollect(this)">删除</a></td>
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

