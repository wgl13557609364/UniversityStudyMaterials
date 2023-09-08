//判断购物车中数量的逻辑语句
function add(){
    var now =parseInt(document.getElementById("num").value);
    var hav = parseInt(document.getElementById("has").innerText);
    if(now<hav){
        var sum=now+1;
        document.getElementById("num").value=sum;
    }
}

function  lowers(){
    var now =parseInt(document.getElementById("num").value);
    if(now>1){
        var su = now-1;
        document.getElementById("num").value=su;
    }
}

//添加之前判断是否登陆
function js_meth02(element){
    var log1 =document.getElementsByClassName("log1");
    for (var i=0;i<log1.length;i++){
        if(log1[i].innerText==='登陆'){
            //用户没有登陆
            alert('无法添加，请先登陆账号！');
        }else {
            //用户已经登陆，可以进行数据录入 ajax
            //商品编号
            var str01 = element.name;
            var str= str01.substring(1)+'';
           var textsum = document.getElementById('num').value;
            var xhttp;
            if (window.XMLHttpRequest) {
                xhttp = new XMLHttpRequest();
            } else {
                // code for IE6, IE5
                xhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var urlname = 'http://localhost:8080/javaWebHomeWork_war/addshopcarservlet?articleid=' + str +'&articlesum='+ textsum;
            //发送请求
            xhttp.open("GET", urlname);
            xhttp.send();

            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {

                    if(this.responseText==="has"){
                        alert("该商品在购物车中已存在，请在购物车中查看！")
                    }else if(this.responseText==="true"){
                        alert("添加成功！")

                    }else {
                        alert("数据异常，添加失败！")
                    }
                }
            };

        }
    }

}

//打开购物车判断是否已经登陆
function js_method1(){
    var log1 =document.getElementsByClassName("log1");
    for (var i=0;i<log1.length;i++){
        if(log1[i].innerText==='登陆'){
            alert('无法查看购物，请先登陆账号！');
        }else {
            window.location.replace("http://localhost:8080/javaWebHomeWork_war/shopcar");
        }
    }
}

//手动输入
function par(element){
    var x=parseInt(document.getElementById("num").value);
    var maxnum = parseInt(document.getElementById("has").innerText);
    if(x==""||isNaN(x))
    {
        alert("修改失败，输入不是数字");
        document.getElementById("num").value=shopname;
        shopname=null;
    }else {
        if(x>maxnum){
            alert("无法添加，商品超过库存！")
            document.getElementById("num").value=shopname;
            shopname=null;
        }else if(x<0){
            alert("无法添加,不不允许为负数！");
            document.getElementById("num").value=shopname;
            shopname=null;
        }
    }
}


//判断是否存在购物车
function js_addcollect(element) {

    var log1 =document.getElementsByClassName("log1");
    for (var i=0;i<log1.length;i++){
        if(log1[i].innerText==='登陆'){
            alert('无法添加，请先登陆账号！');
        }else {



            var strid = element.name + '';
            var articleid = strid.substring(1) + '';
            var xhttp;
            if (window.XMLHttpRequest) {
                xhttp = new XMLHttpRequest();
            } else {
                // code for IE6, IE5
                xhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
//selectCollect 判断是否存在请求
            var url = "http://localhost:8080/javaWebHomeWork_war/selectCollect?articleid=" + articleid + "";
            //发送请求
            xhttp.open("GET", url);
            xhttp.send();
            //获取响应
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    if (this.responseText == "true") {
                        addcollect_js_ajax(articleid);
                    } else {
                        alert("收藏中已存在商品，无需重复添加！")
                    }
                }
            };
        }
    }



}


function addcollect_js_ajax(str){
    var articleid =str+'';
    var xhttp;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    var url = "http://localhost:8080/javaWebHomeWork_war/addcollect?articleid=" + articleid + "";
    xhttp.open("GET", url);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            if (this.responseText == "true") {
                alert("添加成功！")
            } else {
                alert("添加失败！")
            }
        }
    };


}
//打开我的收藏判断是否已经登陆
function js_method_collect(){
    var log1 =document.getElementsByClassName("log1");
    for (var i=0;i<log1.length;i++){
        if(log1[i].innerText==='登陆'){
            alert('无法查看购物，请先登陆账号！');
        }else {
            window.location.replace("http://localhost:8080/javaWebHomeWork_war/tocollect");
        }
    }
}