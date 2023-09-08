<%--
  Created by IntelliJ IDEA.
  User: fuchsine
  Date: 2022/10/13
  Time: 5:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>结算页面</title>
    <link rel="stylesheet" type="text/css" href="../css/buy.css">
    <script src="../layui/layui.js"></script>
</head>
<script>

    function js_method1(){
                window.location.replace("http://localhost:8080/javaWebHomeWork_war/shopcar");
    }



    function play(){
        var name = document.getElementById("i1").value;
        var adress = document.getElementById("i2").value;
        var phone = document.getElementById("i3").value;
        var email = document.getElementById("i4").value;

        if(name.length!=0 && adress.length!=0 && phone.length!=0 &&email.length!=0){

            window.location.replace("http://localhost:8080/javaWebHomeWork_war/play");
            var index = layer.load(2, {time: 10*30000});
            alert('下单成功！')
        }else {
            alert("必填信息不能为空！")
        }



    }




    //点击设置收货人信息
    function getusermsg(){
        var xhttp;
        if (window.XMLHttpRequest) {
            xhttp = new XMLHttpRequest();
        } else {
            xhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xhttp.open("GET", "http://localhost:8080/javaWebHomeWork_war/WrtierUserServlet");
        xhttp.send();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                var obj = JSON.parse(this.responseText);
                console.log(this.responseText)
                document.getElementById("i1").value=obj.name+'';
                document.getElementById("i2").value=obj.address+'';
                document.getElementById("i3").value=obj.phone+'';
                document.getElementById("i4").value=obj.email+'';
            }
        };
}
function setusermsg(){
    var name = document.getElementById("i1").value;
    var address = document.getElementById("i2").value;
    var phone = document.getElementById("i3").value;
    var email = document.getElementById("i4").value;
   if(name.length!=0 && address.length!=0 && phone.length!=0 && email.length!=0){

       //进行数据的保存，ajax
       var xhttp;
       if (window.XMLHttpRequest) {
           xhttp = new XMLHttpRequest();
       } else {
           xhttp = new ActiveXObject("Microsoft.XMLHTTP");
       }
       xhttp.open("GET", "http://localhost:8080/javaWebHomeWork_war/updatauser?name=" + name +"&address=" + address + "&phone=" + phone + "%email=" + email);
       xhttp.send();
       xhttp.onreadystatechange = function() {
           if (this.readyState == 4 && this.status == 200) {
               if (this.responseText==="ture"){
                   alert("保存成功！")
               }else {
                   alert("保存失败！")
               }
           }
       };





   }else {
       alert("必填项不能为空！")
   }

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
                <li ><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/mangerArticle">管理员界面</a></li>
                <li><a class="b2" href="javascript:void(0);" onclick="js_method()">我的购物车</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/orderselect">我的订单</a></li>
                <li><a class="b2" href="#">加入收藏</a></li>
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
                <div id="bor">
                    <div id="title"><span>核实订单信息</span></div>
                    <div id="person">
                        <table id="table1">
                            <span>收货人信息</span>
                            <tr>
                                <td class="ltd"> <span  class="rr">收件人姓名：</span> </td>
                                <td class="rtd"><input id="i1" type="text" name="name"><span class="reds">*</span></td>
                            </tr>
                            <tr>
                                <td class="ltd"><span class="rr"> 地址：</span></td>
                                <td class="rtd"><input id="i2" type="text" name="addree" ><span class="reds">*</span></td>
                            </tr>
                            <tr>
                                <td class="ltd"><span  class="rr" > 电话号码：</span></td>
                                <td class="rtd"><input id="i3" type="text" name="name" ><span class="reds">*</span> <span>用于接收发货通知及送货确认</span></td>
                            </tr>

                            <tr>
                                <td class="ltd"> <span class="rr"> 电子邮件：</span></td>
                                <td class="rtd"><input id="i4" type="text" name="email" ><span>用来接收订单提醒邮件，便于您即使了解订单情况</span></td>
                            </tr>
                            <tr>
                                <td class="ltd"> <span class="rr">邮政编码：</span> </td>
                                <td class="rtd"><input id="i5" type="text" name="you"><span>有助于快速确认收货地址</span></td>
                            </tr>
                        </table>
                        <input id="but" type="button" value="[点击选中常用地址]" onclick="getusermsg()"><br/>
                        <input id="but1" type="button" value="保存收货人信息" onclick="setusermsg()">
                    </div>
                </div>
                <div id="half">
                    <span>&nbsp;&nbsp;&nbsp;支付及配送方式</span><br/>
                    <span class="lrmid">支付方式：在线支付</span><br/>
                    <span class="lrmid">配送方式：快递运输</span><br/>
                    <span id="lrmidd">运费：0.00元</span> <span style="color: red">(免运费)</span>  <a href="http://localhost:8080/javaWebHomeWork_war/shopcar">[返回购物车]</a>
                </div>
                <div id="head1">
                    <span>商品清单</span>
                    <table id="table2" border="1">
                        <div id="head1sondiv"> <span id="shops1">商品名称</span> <span id="shops2">原价</span> <span id="shops3">返现</span>  <span id="shops4">优惠价</span> <span id="shops6">库存</span> <span id="shops7">数量</span></div>

                          <c:forEach items="${shopCarList}" var="shopCarList">
                        <tr>
                            <td class="td1"><div class="divsapn">
                                <span>${shopCarList.article.title}</span>
                            </div></td>
                            <td class="td2"><span>￥</span><span>${shopCarList.article.price}</span><span>(${shopCarList.article.discount}折)</span></td>
                            <td class="td3"><span>￥</span><span>0</span></td>
                            <td class="td4"><span>￥</span><span><fmt:formatNumber type="number" value="${shopCarList.article.price*shopCarList.article.discount}" maxFractionDigits="3"/></span></td>
                            <td class="td5"><span>${shopCarList.article.storage}</span></td>
                            <td class="td6"><span>${shopCarList.buyNum}</span></td>
                        </tr>
                           </c:forEach>


                    </table>
                    <span style="font-size: 15px;font-weight: bold">结算信息</span>
                    <div  id="alljiesuan">
                        <span>商品金额：</span><span><fmt:formatNumber type="number" value="${turepricr}" maxFractionDigits="4"/></span><span> &nbsp;&nbsp;+&nbsp;&nbsp;运费0.00元</span><span>   -优惠券：0.00&nbsp;&nbsp;&nbsp;元返现0.00元</span>
                        <hr/>
                        <span id="allson" style="font-size: 18px; font-weight: bold">应付总金额：<span style="color: red;font-size: 18px; font-weight: bolder">￥<fmt:formatNumber type="number" value="${turepricr}" maxFractionDigits="4"/></span>元</span>
                    </div>
                    <input id="tjdd" type="button" value="提交订单" onclick="play()">
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
