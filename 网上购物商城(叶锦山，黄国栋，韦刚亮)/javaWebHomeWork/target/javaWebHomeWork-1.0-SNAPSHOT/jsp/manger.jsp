<%--
  Created by IntelliJ IDEA.
  User: fuchsine
  Date: 2022/10/12
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="../css/manger.css">
    <link rel="stylesheet" type="text/css" href="../css/layui/css/layui.css">
    <script src="../js/manger.js"></script>
    <script src="../js/jquery%20(1).js"></script>
</head>
<body>
<div id="wrap">
    <div id="hear">
        <div class="header-contain">
            <ul id="u1">
                <c:if test="${user!=null}">
                    <li class="log1">欢迎您：${user.loginName}</li>
                </c:if>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/Article">商城首页</a></li>
                <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/getallservlet">查看所有订单</a></li>
                <li><a class="b2" href="javascript:void(0);" onclick="js_method_manger()">我的购物车</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/orderselect">我的订单</a></li>
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
                <li><a href="javascript:void(0);" onclick="navonclik(this)">身体护肤</a></li>
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
                <div id="find">
                    <span>物品类型：</span>
                    <select id="selectvalue" onchange="fun(this)">


                        <option >全部</option>
                        <c:forEach items="${listArticleType}" var="listArticleType">
                            <option>${listArticleType.name}</option>
                        </c:forEach>
                    </select>
                    <input type="text" id="findtext">
                    <input type="button" id="findbutton" value="搜索" onclick="js_findthing_manger()">
                    <input type="button" id="findbutton1" value="已删除商品" onclick="clearelement()">
                </div>
                <div id="anything">
                    <div id="main1">
                        <div>
                            <table class="layui-table" lay-even>
                                <thead>
                                <th style="width: 40px">商品id</th>
                                <th style="width: 320px">商品标题</th>
                                <th>商品价格</th>
                                <th>商品折扣</th>
                                <th>商品库存</th>
                                <th>商品图片</th>
                                <th style="width: 80px">操作</th>
                                </thead>
                                <tbody id="tbody">
                                <c:forEach items="${Article}" var="article">
                                    <tr id="aa${article.id}">
                                        <td>${article.id}</td>
                                        <td><a id="${article.id}" href="javascript:void(0);" onclick="js_method_manger01(this)">${article.title}</a></td>
                                        <td ><input id="aaa${article.id}" class="msg" value=" ${article.price}">  </td>
                                        <td > <input id="aaaa${article.id}"  class="msg" type="text" value="${article.discount}">  </td>
                                        <td ><input id="aaaaa${article.id}" class="msg" type="text" value="${article.storage}"> </td>
                                        <td><img src="../images/article/${article.image}"></td>
                                        <td  style="text-align: center;color: #222222"><a id="as${article.id}" class="layui-btn layui-btn-primary layui-btn layui-btn-sm" onclick="Updatamanger(this)">修改</a> <br/><a id="a${article.id}" style="margin-top: 5px" class="layui-btn layui-btn-primary layui-btn layui-btn-sm"  onclick="delearticle(this)">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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
