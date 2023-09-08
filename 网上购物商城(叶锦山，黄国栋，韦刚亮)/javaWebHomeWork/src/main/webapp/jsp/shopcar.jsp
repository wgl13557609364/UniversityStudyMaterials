<%--
  Created by IntelliJ IDEA.
  User: fuchsine
  Date: 2022/10/11
  Time: 1:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link href="../css/shopcar.css" rel="stylesheet" type="text/css">
    <script src="../js/shopcar.js"></script>
</head>
<body>
<div id="wrap">
    <div id="hear">
        <div class="header-contain">
            <ul id="u1">
                <c:if test="${user==null}">
                    <li><a class="b1" href="http://localhost:8080/javaWebHomeWork_war/index.jsp">登陆</a></li>
                </c:if>
                <c:if test="${user!=null}">
                    <li>欢迎您：${user.loginName}</li>
                </c:if>
                <c:if test="${user.role==2}">
                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/mangerArticle">管理员界面</a></li>
                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/getallservlet">查看所有订单</a></li>
                </c:if>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/Article">商城首页</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/orderselect">我的订单</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/tocollect">我的收藏</a></li>
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
                <div id="anything">
                    <div id="main1">
                        <table id="table1" border="2">
                            <span>当前位置>>购物车</span>
                            <div id="titledo">
                                <span id="s1"><input  id="allcheckbox" type="checkbox" onclick="checkAll()" /></span>
                                <span id="s2">全选</span>
                                <span id="s3">商品名称</span>
                                <span id="s4">积分</span>
                                <span id="s5">商品原价</span>
                                <span id="s6">优惠价</span>
                                <span id="s7">数量</span>
                                <span id="s8">操作</span>
                            </div>


                            <c:forEach items="${shopCarList}" var="shopCarList">
                            <tr id="s${shopCarList.articleId}tr">
                                <td class="t1">
                                    <span class="ss1"><input id="s${shopCarList.articleId}nu" onclick="addsum1()" name="checkname[]" type="checkbox" /></span>
                                    <span class="ss2"><img src="../images/article/${shopCarList.article.image}" width="80px"></span>
                                    <div class="divtit1"><span class="sstit"><a id="${shopCarList.article.id}" href="javascript:void(0);" onclick="js_method_shopcar(this)">${shopCarList.article.title} </a></span></div>
                                </td>
                                <td class="t2"><span >0</span></td>
                                <td class="t3"><span class="rs">￥${shopCarList.article.price}</span>&nbsp;&nbsp;<span class="rs">(${shopCarList.article.discount})折</span></td>
                                <td class="t4"><span>￥</span><span id="s${shopCarList.articleId}num" name="oneprice[]"><fmt:formatNumber type="number" value="${shopCarList.article.price*shopCarList.article.discount}" maxFractionDigits="3"/></span></td>
                                <td class="t5">
                                    <input type="text" id="s${shopCarList.articleId}nummm" class="num" value="${shopCarList.buyNum}" max="${shopCarList.article.storage}" onblur="par(this)" onfocus="fous(this)">
                                    <input name="s${shopCarList.articleId}" type="button" class="b1" value="+" onclick='add(this)'>
                                    <input name="s${shopCarList.articleId}" type="button" class="bb2" value="-" onclick="lowers(this)" >
                                </td>
                                <td class="t6">
                                    <input  name="s${shopCarList.articleId}t" type="button" class="debb1" value="加入收藏" onclick="" >
                                    <input  name="s${shopCarList.articleId}t" type="button" class="debb" value="删除" onclick="delete1(this)" ></td>
                            </tr>
                           </c:forEach>


                        </table>
                        <div id="sf">
                            <div ><span id="hopfrom1">数量总计：<span id="shopallnum" class="sf1">0</span>（件）</span></div>
                            <div id="sfd"> <span id="hopfrom12">金额总计：￥<span id="allprice" class="sf1">0</span>（折后价）</span></div>
                        </div>
                    </div>
                    <div id="js">
                        <input id="jx"  type="button" value="继续购物" onclick="js_shopcar01()">  <input id="jsb" type="button" value="结算" onclick="js_methon()">
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
