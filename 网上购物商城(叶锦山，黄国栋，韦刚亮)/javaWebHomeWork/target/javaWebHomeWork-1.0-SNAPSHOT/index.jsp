<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<link rel="stylesheet" type="text/css" href="css/index.css">
<script src="js/index.js"></script>
<body>
<div id="wrap">

    <div id="header">
        <div class="header-contain">
            <ul id="u1">
                <li><a class="b1" href="http://localhost:8080/javaWebHomeWork_war/Article">商城首页</a></li>
                <li><a class="b2" href="http://localhost:8080/javaWebHomeWork_war/jsp/Register.html">免费注册</a></li>
                <li><a class="b2" href="javascript:void(0);" onclick="js_method_index()">我的购物车</a></li>
                <li><a class="b2"  href="javascript:void(0);" onclick="js_method_index()">我的订单</a></li>
                <li><a class="b2" href="javascript:void(0);" onclick="js_method_index01()">我的收藏</a></li>
            </ul>
        </div>
        <div id="body1">
            <div id="imgdiv">
                <img src="images/article/newlogo.gif" title="图片加载失败！" style=" margin-left: -370px;">
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
    <div id="content">
        <div>
            <img src="images/login_bg.jpg">
        </div>
        <div id="formDiv">
            <form action="login" name="Form" method="post" >
                <div class="show">
                    <div class="inputs">
                        <input type="text" name="loginName" class="user" placeholder="请输入登陆账号">
                        <input type="password" name="password" class="pwd" placeholder="请输入登陆密码">
                        <span class="user_img"><svg t="1664024865814" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5069" width="32" height="32"><path d="M592.896 589.141333c96.938667-34.816 166.570667-131.072 166.570667-244.053333 0-142.677333-110.933333-258.048-247.466667-258.048-136.533333 0-247.466667 115.712-247.466667 258.048 0 112.981333 69.632 208.896 166.570667 244.053333-162.816 40.96-284.672 202.069333-284.672 383.658667L877.226667 972.8C877.226667 791.210667 755.712 630.101333 592.896 589.141333L592.896 589.141333zM592.896 589.141333" p-id="5070" fill="#d1d1d1"></path></svg></span>
                        <span class="pwd_img"><svg t="1664024949161" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6215" width="32" height="32"><path d="M920.8 409.6H166.4c-22.4 0-40 17.6-40 40v520.8c0 22.4 17.6 40 40 40h754.4c22.4 0 40-17.6 40-40V449.6c0-22.4-18.4-40-40-40zM604 715.2v75.2c0 33.6-27.2 60.8-60.8 60.8-33.6 0-60.8-27.2-60.8-60.8v-75.2c-15.2-15.2-24.8-36.8-24.8-60.8C457.6 606.4 496 568 544 568c48 0 86.4 38.4 86.4 86.4-0.8 24-10.4 45.6-26.4 60.8z" fill="#d1d1d1" p-id="6216"></path><path d="M350.4 466.4h-64v-192C286.4 127.2 406.4 7.2 553.6 7.2s267.2 120 267.2 267.2v43.2h-64v-43.2c0-112-91.2-203.2-203.2-203.2-112 0-203.2 91.2-203.2 203.2v192z" fill="#d1d1d1" p-id="6217"></path><path d="M756 318.4a32 32 0 1 0 64 0 32 32 0 1 0-64 0Z" fill="#d1d1d1" p-id="6218"></path></svg></span>
                        <a href="#">忘记密码?</a>
                        <input type="submit" class="button" value="登&nbsp;&nbsp;&nbsp;&nbsp;录">
                        <a id="add" href="http://localhost:8080/javaWebHomeWork_war/jsp/Register.html">立即注册</a>
                    </div>
                </div>
                </table>
            </form>
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
</body>
</html>