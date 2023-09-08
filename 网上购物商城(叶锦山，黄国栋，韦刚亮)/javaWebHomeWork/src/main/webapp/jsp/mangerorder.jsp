<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: fuchsine
  Date: 2022/10/20
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="../css/mangerorder.css">
    <style>
        td{
            text-align: center;
        }
        th{
            text-align: center;
        }
    </style>
    <script>
        function getNowDate() {
            var myDate = new Date;
            var year = myDate.getFullYear(); //获取当前年
            var mon = myDate.getMonth() + 1; //获取当前月
            var date = myDate.getDate(); //获取当前日
            var hours = myDate.getHours(); //获取当前小时
            var minutes = myDate.getMinutes(); //获取当前分钟
            var seconds = myDate.getSeconds(); //获取当前秒
            var now = year + "-" + mon + "-" + date + " " + hours + ":" + minutes + ":" + seconds;
            return now;
        }

        function datasend(element){      //请求地址sendarticle
            var id = element.id;
            //a发送时间  aa状态
            var senddtata = document.getElementById(id+'a').innerText;
            var sund = document.getElementById(id+'aa').innerText;
            if(senddtata!=null){

                var xhttp;
                if (window.XMLHttpRequest) {
                    xhttp = new XMLHttpRequest();
                } else {
                    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xhttp.open("GET", "http://localhost:8080/javaWebHomeWork_war/sendarticle?code="+ id);
                xhttp.send();


                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        if(this.responseText!="false"){

                            document.getElementById(id+'a').innerText =getNowDate()+'';
                            document.getElementById(id+'aa').innerText ='已出库';
                        }else {
                            alert("数据异常！")
                        }
                    }
                };


            }

        }
        function js_method_mangerli(element){
            var str = element.innerHTML;
            var url = "http://localhost:8080/javaWebHomeWork_war/orderitem?ordercode=" +str;
            window.location.replace(url);
        }
    </script>
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
                    <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/mangerArticle">查看所有订单</a></li>
                </c:if>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/Article">商城首页</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/shopcar" >我的购物车</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/orderselect" >我的订单</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/orderselect" >我的收藏</a></li>
                <c:if test="${user!=null}">
                    <li><a class="b2" href="${pageContext.request.contextPath}/loginout">退出登陆</a></li>
                </c:if>
            </ul>
        </div>
        <div id="body1">
            <div id="imgop">
                <img src="../images/article/newlogo.gif" title="图片加载失败！"style="margin-left: -1800px" >
            </div>
        </div>
        <div id="body2">
            <ul id="u2">
                <li><a href="#">首页</a></li>
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
                            <div id="title"><span>当前位置>>所有订单</span></div>

                            <div id="kk">


                                <table id="tabled" border="1">
                                    <thead  class="thead1">
                                    <span style="font-weight: bolder">点击订单编号查看购物详情</span>
                                    <th style="width: 250px;">订单编号</th>
                                    <th style="width: 250px">下单时间</th>
                                    <th style="width: 250px">发货时间</th>
                                    <th style="width: 200px">订单状态</th>
                                    <th style="width: 150px">订单总额</th>
                                    <th style="width: 150px">操作</th>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${AllOrderList}" var="AllOrderList">
                                    <tr style="height: 30px">
                                        <td style="height: 25px"><a href="javascript:void(0);" onclick="js_method_mangerli(this)" style="color: #222222;text-decoration: none">${AllOrderList.orderCode}</a></td>
                                        <td><fmt:formatDate value="${AllOrderList.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td id="${AllOrderList.orderCode}a"><fmt:formatDate value="${AllOrderList.sendDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td id="${AllOrderList.orderCode}aa">${AllOrderList.status}</td>
                                        <td><fmt:formatNumber type="number" value="${AllOrderList.amount}" maxFractionDigits="3"/></td>
                                        <td><input id="${AllOrderList.orderCode}" type="button" value="发货" style="font-size: 13px;width: 80px;height: 20px"  onclick="datasend(this)"></td>
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