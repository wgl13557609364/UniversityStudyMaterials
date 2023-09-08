//打开购物车判断是否已经登陆
function js_method(){
    var log1 =document.getElementsByClassName("log1");
    for (var i=0;i<log1.length;i++){
        if(log1[i].innerText==='登陆'){
            alert('无法查看，请先登陆账号！');
        }else {
            window.location.replace("http://localhost:8080/javaWebHomeWork_war//shopcar");
        }
    }
}
function js_method01(){
    var log1 =document.getElementsByClassName("log1");
    for (var i=0;i<log1.length;i++){
        if(log1[i].innerText==='登陆'){
            alert('无法查看，请先登陆账号！');
        }else {
            window.location.replace("http://localhost:8080/javaWebHomeWork_war/orderselect");
        }
    }
}
//打开我的收藏判断是否已经登陆
function js_method_collect(){
    var log1 =document.getElementsByClassName("log1");
    for (var i=0;i<log1.length;i++){
        if(log1[i].innerText==='登陆'){
            alert('无法查，请先登陆账号！');
        }else {
            window.location.replace("http://localhost:8080/javaWebHomeWork_war/tocollect");
        }
    }
}
//点击li进入商品事件
function thingshop(str) {
    var url = str+'';
    window.location.replace(url);
}

//下拉框点击事件
function fun(obj){
    var index = obj.selectedIndex;
    //代表的是选中项的的值
    var val = obj.options[index].value;
    //代表的是选中项的text
    var text = obj.options[index].text;
    var xhttp;
    if(window.XMLHttpRequest){
        xhttp = new XMLHttpRequest();
    }else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.open("GET", "http://localhost:8080/javaWebHomeWork_war/selectremark?text="+text);
    xhttp.send();
    //接收到数据进行渲染
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(JSON.parse(this.responseText));
            var ulcalss = document.getElementById("ulClass");
            while (ulcalss.hasChildNodes()) //当ulcalss下还存在子节点时 循环继续
            {
                ulcalss.removeChild(ulcalss.firstChild);
            }
            var objlist = JSON.parse(this.responseText);
            for(let i=0;i<objlist.length;i++){
                var newLi = document.createElement("li");
                var articleid = objlist[i].id+'';
                var price=parseInt(objlist[i].price);
                var srcimg =objlist[i].image + '';
                var discount = parseFloat(objlist[i].discount);
                var title= objlist[i].title;
                var finyprice = (price*discount).toString().substring(0,5);
                var url = '\'http://localhost:8080/javaWebHomeWork_war/mainshop?id=' + articleid+ '\'';
                var strq='';
                strq+=' <li name="ui_li" onclick="thingshop(' + url+ ')">';

                strq+='<img src="../images/article/' +    srcimg +' ">';
                strq+=' <div class="price">';
                strq+=' <span class="fon1">￥' + price +'</span>';
                strq+=' <span class="font2">￥' + finyprice + '</span>';
                strq+=' </div>';
                strq+='<div class="Aall">';
                strq+='<a class="a" href="#">'+ title + '</a>';
                strq+='</div></li>';
                newLi.innerHTML = strq;
                ulcalss.append(newLi);
            }
        }
    };
}
//下拉框点击事件
function navonclik1(element){
    var text = element.innerHTML+'';
    var xhttp;
    if(window.XMLHttpRequest){
        xhttp = new XMLHttpRequest();
    }else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.open("GET", "http://localhost:8080/javaWebHomeWork_war/selectremark?text="+text);
    xhttp.send();
    //接收到数据进行渲染
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(JSON.parse(this.responseText));
            var ulcalss = document.getElementById("ulClass");
            while (ulcalss.hasChildNodes()) //当ulcalss下还存在子节点时 循环继续
            {
                ulcalss.removeChild(ulcalss.firstChild);
            }
            var objlist = JSON.parse(this.responseText);
            for(let i=0;i<objlist.length;i++){
                var newLi = document.createElement("li");
                var articleid = objlist[i].id+'';
                var price=parseInt(objlist[i].price);
                var srcimg =objlist[i].image + '';
                var discount = parseFloat(objlist[i].discount);
                var title= objlist[i].title;
                var finyprice = (price*discount).toString().substring(0,5);
                var url = '\'http://localhost:8080/javaWebHomeWork_war/mainshop?id=' + articleid+ '\'';
                var strq='';
                strq+=' <li name="ui_li" onclick="thingshop(' + url+ ')">';

                strq+='<img src="../images/article/' +    srcimg +' ">';
                strq+=' <div class="price">';
                strq+=' <span class="fon1">￥' + price +'</span>';
                strq+=' <span class="font2">￥' + finyprice + '</span>';
                strq+=' </div>';
                strq+='<div class="Aall">';
                strq+='<a class="a" href="#">'+ title + '</a>';
                strq+='</div></li>';
                newLi.innerHTML = strq;
                ulcalss.append(newLi);
            }
        }
    };
}








//收索商品和商品的更替
function js_findthing() {
    var findtext = document.getElementById('findtext').value;
    if(findtext!=null){
        var xhttp;
        if (window.XMLHttpRequest) {
            xhttp = new XMLHttpRequest();
        } else {
            xhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xhttp.open("GET", "http://localhost:8080/javaWebHomeWork_war/selectbytitle?title="+findtext);
        xhttp.send();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                  console.log(JSON.parse(this.responseText));
                var ulcalss = document.getElementById("ulClass");
                while (ulcalss.hasChildNodes()) //当ulcalss下还存在子节点时 循环继续
                {
                    ulcalss.removeChild(ulcalss.firstChild);
                }
                var objlist = JSON.parse(this.responseText);
                for(let i=0;i<objlist.length;i++){
                    var newLi = document.createElement("li");
                    var articleid = objlist[i].id+'';
                    var price=parseInt(objlist[i].price);
                    var srcimg =objlist[i].image + '';
                    var discount = parseFloat(objlist[i].discount);
                    var title= objlist[i].title;
                    var finyprice = (price*discount).toString().substring(0,5);
                    var url = '\'http://localhost:8080/javaWebHomeWork_war/mainshop?id=' + articleid+ '\'';
                    var strq='';
                    strq+=' <li name="ui_li" onclick="thingshop(' + url+ ')">';

                    strq+='<img src="../images/article/' +    srcimg +' ">';
                    strq+=' <div class="price">';
                    strq+=' <span class="fon1">￥' + price +'</span>';
                    strq+=' <span class="font2">￥' + finyprice + '</span>';
                    strq+=' </div>';
                    strq+='<div class="Aall">';
                    strq+='<a class="a" href="#">'+ title + '</a>';
                    strq+='</div></li>';
                    newLi.innerHTML = strq;
                    ulcalss.append(newLi);
                }
            }
        };
    }
}

//点击事件
function navonclik(element){
    var str = element.innerHTML+'';
    tools(str);
}



//导航搜索工具类
function tools(element) {
    text = element + '';
    var xhttp;
    if(window.XMLHttpRequest){
        xhttp = new XMLHttpRequest();
    }else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.open("GET", "http://localhost:8080/javaWebHomeWork_war/selectremark?text="+text);
    xhttp.send();
    //接收到数据进行渲染
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(JSON.parse(this.responseText));
            var ulcalss = document.getElementById("ulClass");
            while (ulcalss.hasChildNodes()) //当ulcalss下还存在子节点时 循环继续
            {
                ulcalss.removeChild(ulcalss.firstChild);
            }
            var objlist = JSON.parse(this.responseText);
            for(let i=0;i<objlist.length;i++){
                var newLi = document.createElement("li");
                var articleid = objlist[i].id+'';
                var price=parseInt(objlist[i].price);
                var srcimg =objlist[i].image + '';
                var discount = parseFloat(objlist[i].discount);
                var title= objlist[i].title;
                var finyprice = (price*discount).toString().substring(0,5);
                var url = '\'http://localhost:8080/javaWebHomeWork_war/mainshop?id=' + articleid+ '\'';
                var strq='';
                strq+=' <li name="ui_li" onclick="thingshop(' + url+ ')">';

                strq+='<img src="../images/article/' +    srcimg +' ">';
                strq+=' <div class="price">';
                strq+=' <span class="fon1">￥' + price +'</span>';
                strq+=' <span class="font2">￥' + finyprice + '</span>';
                strq+=' </div>';
                strq+='<div class="Aall">';
                strq+='<a class="a" href="#">'+ title + '</a>';
                strq+='</div></li>';
                newLi.innerHTML = strq;
                ulcalss.append(newLi);
            }
        }
    };


}

