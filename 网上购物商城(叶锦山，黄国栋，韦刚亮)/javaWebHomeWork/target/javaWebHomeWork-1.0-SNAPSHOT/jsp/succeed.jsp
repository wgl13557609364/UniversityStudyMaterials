
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="../css/top.css">
    <link rel="stylesheet" type="text/css" href="../css/succeed.css">
    <script src="../js/succeed.js"></script>
</head>
<body>
<div id="wrap">
    <div id="hear">
        <div class="header-contain">
            <ul id="u1">
                                <c:if test="${user==null}">
                                  <li class="log1"><a class="b1" href="http://localhost:8080/javaWebHomeWork_war/index.jsp">登陆</a></li>
                                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/jsp/Register.html">立即注册</a></li>
                               </c:if>
                             <c:if test="${user!=null}">
                                  <li class="log1">欢迎您：${user.loginName}</li>
                              </c:if>
                <c:if test="${user.role==2}">
                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/mangerArticle">管理员界面</a></li>
                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/getallservlet">查看所有订单</a></li>
                </c:if>
                <li><a class="b2" href="javascript:void(0);" onclick="js_method()">我的购物车</a></li>
                <li><a class="b2" href="javascript:void(0);" onclick="js_method01()">我的订单</a></li>
                <li><a class="b2" href="javascript:void(0);" onclick="js_method_collect()">我的收藏</a></li>
                <c:if test="${user!=null}">
                    <li><a class="b2" href="${pageContext.request.contextPath}/loginout">退出登陆</a></li>
                </c:if>
            </ul>
        </div>
        <div id="body1">
            <div id="imgop">
                <img  src="../images/article/newlogo.gif" title="图片加载失败！" style=" width: 190px;margin-left: -1600px;">
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
            <div id="navframe">
                <div id="nav11">
                    <h2 class="titlejd">&nbsp;&nbsp;&nbsp;商品分类</h2>
                    <ul id="navui">
                        <li><a class="nava" onclick="navonclik1(this)">护肤</a></li>
                        <li><a class="nava" onclick="navonclik1(this)">彩妆</a></li>
                        <li><a class="nava" onclick="navonclik1(this)">香氛</a></li>
                        <li><a class="nava" onclick="navonclik1(this)">身体护肤</a></li>
                        <li><a class="nava"  onclick="navonclik1(this)">礼盒套装</a></li>
                        <li><a class="nava"  onclick="navonclik1(this)">母婴专区</a></li>
                        <li><a class="nava"  onclick="navonclik1(this)">男士专区</a></li>
                        <li><a class="nava"  onclick="navonclik1(this)">粉底</a></li>
                        <li><a class="nava"  onclick="navonclik1(this)">粉饼</a></li>
                        <li><a class="nava"  onclick="navonclik1(this)">睫毛膏</a></li>
                        <li><a class="nava"  onclick="navonclik1(this)">唇彩</a></li>
                        <li><a class="nava"  onclick="navonclik1(this)">腮红</a></li>
                        <li><a class="nava"  onclick="navonclik1(this)">食品保健</a></li>
                        <li><a class="nava"  onclick="navonclik1(this)">瘦身类</a></li>
                        <li><a class="nava"  onclick="navonclik1(this)">美容类</a></li>
                    </ul>
                </div>
            </div>






















<%--            <iframe id="navframe" src="nav.jsp" ></iframe>--%>
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
                    <input type="button" id="findbutton" value="搜索" onclick="js_findthing()">
                </div>
                <div id="anything">
                    <div id="main">
                        <ul id="ulClass">
                            <c:forEach items="${Article}" var="article">
                                <li name="ui_li" onclick="thingshop('http://localhost:8080/javaWebHomeWork_war/mainshop?id=${article.id}')"><img src="../images/article/${article.image}">
                                    <div class="price">
                                        <span class="fon1">￥${article.price}</span>
                                        <span class="font2">￥<fmt:formatNumber type="number" value="${article.price*article.discount}" maxFractionDigits="3"/></span>
                                    </div>
                                    <div class="Aall">
                                        <a class="a" href="#">${article.title}</a>
                                    </div></li>
                            </c:forEach>
                        </ul>
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