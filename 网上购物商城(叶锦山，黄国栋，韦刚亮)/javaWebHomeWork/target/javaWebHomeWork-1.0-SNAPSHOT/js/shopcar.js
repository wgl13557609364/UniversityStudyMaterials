var yuanlaiNum={};

function fous(element){
    var e1 = document.getElementById(element.id);
    yuanlaiNum =  e1.value;
}

//手动输入判断
function par(element){
    var e = document.getElementById(element.id);
    var max = parseInt(e.max);
    var shuruzhi = parseInt(e.value);
    //商品编号
    var strarticle = e.id.substring(1,e.id.length-5);
    if(shuruzhi==""||isNaN(shuruzhi)){
        alert("输入的不是数字，已经恢复默认值！")
        e.value=yuanlaiNum;
    }else {
        if(shuruzhi>max){
            alert("输入数量大于库存，已恢复默认值!")
            e.value=yuanlaiNum;
        }else if(shuruzhi<0){
            alert("您输入的数值小于0，输入有误！")
            e.value=yuanlaiNum;
        }
    }
}

//数量加一
function add(element){
    var str =element.name + 'nummm';
    //文本框中内容
    var now =parseInt(document.getElementById(str).value);
    //新的数值
    var newByNum = now+1;
    document.getElementById(str).value=newByNum;
    var str2 = element.name + 'nu';
    var check = document.getElementById(str2);
    if(check.checked ===true){
        var sum1 = parseInt(document.getElementById("shopallnum").innerText);
        document.getElementById("shopallnum").innerText=sum1+1+'';

    }
    allshopprice()
    var straddname= element.name+'';
    //获取当前商品id号
    var articleid = straddname.substring(1,straddname.length);

    var stringadd = 'addshopcar?articleid='+ articleid + '&newByNum=' +newByNum;
    ajaxsen(stringadd);
}

//数量减一
function lowers(element){
    //text框中的的id
    var str =element.name + 'nummm';
    var now =parseInt(document.getElementById(str).value);
    var newByNum = now-1;
    if(now>=2){
        document.getElementById(str).value=newByNum;
        //该行中复选框中的id
        var str2 = element.name + 'nu';
        var check = document.getElementById(str2);
        if(check.checked ===true){
            //或许结算中总数值
            var sum1 = parseInt(document.getElementById("shopallnum").innerText);
            var x = sum1-1;
            //设置新数值
            document.getElementById("shopallnum").innerText=x+'';
            //进行循环遍历算总价格
            allshopprice();
        }

        var straddname= element.name+'';
        //获取当前商品id号
        var articleid = straddname.substring(1,straddname.length);

        var stringadd = 'addshopcar?articleid='+ articleid + '&newByNum=' +newByNum;
        ajaxsen(stringadd);
    }else {
        alert("商品结算数量最少不能少于1件！")
    }

}


//删除前端判断复选框是否勾选，如果勾选需要在总结算下面进行计算
function delete1(element){
    //得到tr行的id
    var delname = element.name + "r";
    var delelem = document.getElementById(delname);
    var father = delelem.parentElement;
    father.removeChild(delelem);
    let ae =document.getElementsByName('checkname[]')
    if(ae.length===0){
        document.getElementById("allprice").innerText='0';
        document.getElementById("shopallnum").innerText='0';
    }else {
        allshopprice();
        addsum1();
    }
    var delname1 = element.name +'';
    var articleid = (delname1.substring(1,delname1.length-1));
    var stringdelete = 'delete?articleid='+articleid;
    ajaxsen(stringdelete);
}


//复选框全部操作
function checkAll() {
    var all=document.getElementById('allcheckbox');//获取到点击全选的那个复选框的id
    var one=document.getElementsByName('checkname[]');//获取到复选框的名称
    if(all.checked===true){//因为获得的是数组，所以要循环 为每一个checked赋值
        for(var i=0;i<one.length;i++){
            one[i].checked=true;
        }
        addsum1();

    }else{
        for(var j=0;j<one.length;j++){
            one[j].checked=false;
            document.getElementById("allprice").innerText='0';
            document.getElementById("shopallnum").innerText='0';
        }
        addsum1();
    }
}


//计算选中的复选框中的价格和数量在最后计算总数
function addsum1(){
    var any =document.getElementsByName('checkname[]');//获取到复选框的名称
    var sumall = 0;
    for(var i=0;i<any.length;i++){
        if(any[i].checked===true){
            var str = any[i].id + 'mmm';
            var sum1 =parseInt(document.getElementById(str).value);
            sumall+=sum1;
        }
    }
    document.getElementById("shopallnum").innerText=sumall+'';
    allshopprice();
}



//操作后价格的变化
function allshopprice(){
    var chec = document.getElementsByName('checkname[]');//获取到复选框的名称
    //商品总结算价格

    var quanbuqian = 0;
    //暂时存每一个商品的总价
    var zanshicun;

    for (let j=0; j<chec.length; j++){
        if(chec[j].checked===true){
            //text框中商品的数量
            let intsun = parseInt(document.getElementById(chec[j].id + 'mmm').value);
            //获取商品单价
            let oneprice =  parseFloat(document.getElementById(chec[j].id + 'm').innerText);
            zanshicun = oneprice*intsun;
            quanbuqian+=zanshicun;
        }
    }
    //修改总价格
    document.getElementById("allprice").innerText=quanbuqian.toFixed(2) + '';
}



//ajax
function ajaxsen( stringcmd ){
    //创建核心对象
    var xhttp;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    var urlname = 'http://localhost:8080/javaWebHomeWork_war/' + stringcmd;
    //发送请求
    xhttp.open("GET", urlname);
    xhttp.send();
}
function js_shopcar01(){
    window.location.replace("http://localhost:8080/javaWebHomeWork_war/Article");
}


//提交订单
function js_methon(){
    var buythingstr='';
    //遍历得到勾选的商品id，
    var any=document.getElementsByName('checkname[]');//获取到复选框的名称
    for(var i=0;i<any.length;i++){
        if(any[i].checked===true){
            var str = any[i].id;
            var someid = str.substring(1,str.length-2);
            buythingstr = buythingstr + someid + ':';
        }
    }
    if(buythingstr.length===0){
        alert("请选择商品在进行结算！");
    }else {
        var urlname = 'http://localhost:8080/javaWebHomeWork_war/buything?buythingstr=' + buythingstr;
        window.location.replace(urlname);
    }
}
//跳转商品主页
function js_method_shopcar(element){
    var str = element.id;
    var url = "http://localhost:8080/javaWebHomeWork_war/mainshop?id=" +str;
    window.location.replace(url);
}
