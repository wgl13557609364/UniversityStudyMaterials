<%--
  Created by IntelliJ IDEA.
  User: fuchsine
  Date: 2022/10/6
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品主页</title>
    <link rel="stylesheet" type="text/css" href="../css/top.css">
    <link rel="stylesheet" type="text/css" href="../css/mianshop.css">
    <script src="../js/mainshop.js"></script>
</head>
<script>
//seletnavtit
function navonclik11(element){
    var str=element.innerHTML+'';
    window.location.replace("http://localhost:8080/javaWebHomeWork_war/seletnavtit?tit="+str);

}


</script>
<body>
<div id="wrap">
    <div id="hear">
        <div class="header-contain">
            <ul id="u1">

                <c:if test="${user==null}">
                    <li class="log1"><a class="b1" href="http://localhost:8080/javaWebHomeWork_war/index.jsp">登陆</a></li>
                </c:if>
                <c:if test="${user!=null}">
                    <li class="log1">欢迎您：${user.loginName}</li>
                </c:if>
                <c:if test="${user.role==2}">
                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/mangerArticle">管理员界面</a></li>
                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/getallservlet">查看所有订单</a></li>
                </c:if>
                <li><a href="javascript:void(0);" onclick="js_method1()">我的购物车</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/Article">商城首页</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/orderselect">我的订单</a></li>
                <li><a class="b2" href="javascript:void(0);" onclick="js_method_collect()">我的收藏</a></li>
                <li><a class="b2" href="${pageContext.request.contextPath}/loginout">退出登陆</a></li>
            </ul>
        </div>
        <div id="body1">
            <div id="imgop">
                <img src="../images/article/newlogo.gif" title="图片加载失败！" style=" width: 190px;margin-left: -1800px;">
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
            <div id="navframe">
                <div id="nav11">
                    <h2 class="titlejd">&nbsp;&nbsp;&nbsp;商品分类</h2>
                    <ul id="navui">
                        <li><a class="nava" onclick="navonclik11(this)">护肤</a></li>
                        <li><a class="nava" onclick="navonclik11(this)">彩妆</a></li>
                        <li><a class="nava" onclick="navonclik11(this)">香氛</a></li>
                        <li><a class="nava" onclick="navonclik11(this)">身体护肤</a></li>
                        <li><a class="nava"  onclick="navonclik11(this)">礼盒套装</a></li>
                        <li><a class="nava"  onclick="navonclik11(this)">母婴专区</a></li>
                        <li><a class="nava"  onclick="navonclik11(this)">男士专区</a></li>
                        <li><a class="nava"  onclick="navonclik11(this)">粉底</a></li>
                        <li><a class="nava"  onclick="navonclik11(this)">粉饼</a></li>
                        <li><a class="nava"  onclick="navonclik11(this)">睫毛膏</a></li>
                        <li><a class="nava"  onclick="navonclik11(this)">唇彩</a></li>
                        <li><a class="nava"  onclick="navonclik11(this)">腮红</a></li>
                        <li><a class="nava"  onclick="navonclik11(this)">食品保健</a></li>
                        <li><a class="nava"  onclick="navonclik11(this)">瘦身类</a></li>
                        <li><a class="nava"  onclick="navonclik11(this)">美容类</a></li>
                    </ul>
                </div>
            </div>
            <div id="righthing">

                <div id="anything">
                    <div>
                        <div id="leafshop">
                            <img src="../images/article/${article.image}" alt="无法加载图片！">
                        </div>
                        <div id="righrshop">
                            <div>
                                <span id="tit">${article.title}</span><br/>

                            </div>
                            <hr/>

                            <span>供应商：</span><span>${article.supplier}</span><br/>
                            <span>出产地：</span><span>${article.locality}</span><br/><br/>
                            <span>定价：</span><span><del>￥${article.price}</del></span><br/>
                            <span class="red">疯狂价：￥<span><fmt:formatNumber type="number" value="${article.price*article.discount}" maxFractionDigits="3"/></span>&nbsp;&nbsp;(<span>${article.discount}</span>)折</span>
                            <br/>
                            <span>库存：</span><span id="has">${article.storage}</span><span>&nbsp;&nbsp;&nbsp;下单后立即发货！</span><br/><br/><br/><br/><br/><br/>
                            <br/>
                            <span>促销信息：</span><span class="red">该商品参加满减活动，购买商品每满300元，可减少100元现金</span>
                            <br/>

                            <hr>

                        </div>

                        <div id="want">
                            购买数量：<input  type="text" name="m${article.id}s" id="num" value="1"  onblur="par(this)">
                            <input type="button" id="b1" value="+" onclick="add()">
                            <input type="button" id="b2" value="-" onclick="lowers()">
                            <input name="m${article.id}"   type="button" id="b3" value="加入购物车" onclick="js_meth02(this)">
                            <input name="m${article.id}"   type="button" id="b4" value="加入收藏" onclick="js_addcollect(this)">
                        </div>

                    </div>


                </div>

            </div>
        </div>
        <div class="bottom">
            <ul class="about">
                <a href="#"> 关于我们 </a><span>|</span>
                <a href="#"> 联系我们 </a><span>|</span>
                <a href="#"> 人才招聘 </a><span>|</span>
                <a href="#"> 商家入驻 </a><span>|</span>
                <a href="#"> 广告服务 </a><span>|</span>
                <a href="#"> 手机商城 </a><span>|</span>
                <a href="#"> 友情链接 </a><span>|</span>
                <a href="#"> 销售联盟 </a><span>|</span>
                <a href="#"> 社区 </a><span>|</span>
                <a href="#"> 公益 </a><span>|</span>
                <a href="#"> English Site </a>
            </ul>
            <!-- 底部版权 -->
            <p class="copy">
                Fuchsine © 2020-2022  桂电guet.com 版权所有
            </p>
        </div>

    </div>
</div>
<script>
  var  shopname = {};

    document.getElementById("num").onfocus=function (){
        shopname = document.getElementById("num").value;

    }



</script>
</body>
</html>
