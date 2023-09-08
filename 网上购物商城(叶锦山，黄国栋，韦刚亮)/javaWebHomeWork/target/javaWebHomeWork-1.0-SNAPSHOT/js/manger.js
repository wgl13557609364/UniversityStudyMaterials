function js_method_manger(){
    window.location.replace("http://localhost:8080/javaWebHomeWork_war/shopcar");
}

//跳转商品详情页
function js_method_manger01(element){
    var str = element.id;
    var url = "http://localhost:8080/javaWebHomeWork_war/mainshop?id=" +str;
    window.location.replace(url);
}

//商品删除
function delearticle(element){
    var str = element.id+'';
    //商品id
    var id = element.id.substring(1);
    var urlsre = "http://localhost:8080/javaWebHomeWork_war/articledisable?articleid="+ id+"";
    var xhttp;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    //发送请求
    xhttp.open("GET", urlsre);
    xhttp.send();
    //获取响应
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {

            if(this.responseText=="true"){
                //获取本行元素
                var child = document.getElementById(str).parentElement.parentElement;
                var father = child.parentElement;
                father.removeChild(child);
                alert("删除成功！")
            }else {
                alert("删除失败！")
            }
        }
    };
}


//修改数据
function Updatamanger(element){
    var str = element.id+'';

    var id = element.id.substring(2);
    var price =parseFloat(document.getElementById('aaa'+id).value);
    var discount = parseFloat(document.getElementById('aaaa'+id).value);
    var storage = parseInt(document.getElementById("aaaaa"+ id).value);
    if(storage<0 || storage%1!==0 || 0>discount || 1<discount || price<0){
        alert("输入参数有误！")
    }else {

        var urlsre = "http://localhost:8080/javaWebHomeWork_war/Articleupdata?id="+ id+"&price=" + price +"&discount="+discount+"&storage="+storage +'';
        var xhttp;
        if (window.XMLHttpRequest) {
            xhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //发送请求
        xhttp.open("GET", urlsre);
        xhttp.send();
        //获取响应
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {

                if(this.responseText=="ture"){
                    //获取本行元素
                    alert("修改成功！");
                }else {
                    alert("修改失败！");
                }
            }
        };
    }
}

//清除元素函数
function clearelement(){
    var ulcalss = document.getElementById("tbody");
    while (ulcalss.hasChildNodes()) //当ulcalss下还存在子节点时 循环继续
    {
        ulcalss.removeChild(ulcalss.firstChild);
    }
//    GetdeleteArticleServlet
    var xhttp;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    } else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.open("GET", "http://localhost:8080/javaWebHomeWork_war/GetdeleteArticleServlet");
    xhttp.send();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(JSON.parse(this.responseText));
            var tbody = document.getElementById("tbody");
            while (tbody.hasChildNodes()) //当ulcalss下还存在子节点时 循环继续
            {
                tbody.removeChild(tbody.firstChild);
            }
            var objlist = JSON.parse(this.responseText);
            for(let i=0;i<objlist.length;i++){
                var newtr = document.createElement("tr");
                var articleid = objlist[i].id+'';
                var price=parseInt(objlist[i].price);
                var storage = parseInt(objlist[i].storage);
                var srcimg =objlist[i].image + '';
                var discount = parseFloat(objlist[i].discount);
                var title= objlist[i].title;
                var strq='';

                strq+='<tr id="aa'+ articleid  +'">'
                strq+='<td>'+ articleid+'</td>'
                strq+='<td><a id="'+articleid+'" href="javascript:void(0);"'
                strq+='onClick="js_method_manger01(this)">'+   title+'</a></td>'
                strq+='<td><input id="aaa'+articleid+ '"class="msg" value="'+price+'"></td>'
                strq+='<td><input id="aaaa'+articleid+'"class="msg" type="text" value="'+discount+'"></td>'
                strq+='<td><input id="aaaaa'+articleid+' "class="msg" type="text" value="'+storage+'"></td>'
                strq+='<td><img src="../images/article/'+  srcimg+ '"></td>'
                strq+='<td style="text-align: center;color: #222222">'
                strq+='<a id="a'+articleid+'" style="margin-top: 5px"'
                strq+='class="layui-btn layui-btn-primary layui-btn layui-btn-sm" onClick="Recover(this)">恢复</a>'
                strq+= '</tr>'
                newtr.innerHTML = strq;
                tbody.append(newtr);
            }
        }
    };
}



//恢复
function Recover(element){
    var str = element.id+'';
    var id = str.substring(1);
    var xhttp;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    } else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.open("GET", "http://localhost:8080/javaWebHomeWork_war/RecoverArticle?id="+id);
    xhttp.send();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {

            if(this.responseText=="ture"){
                //获取本行元素
                var child = document.getElementById(str).parentElement.parentElement;
                var father = child.parentElement;
                father.removeChild(child);

                alert("恢复成功！");
            }else {
                alert("恢复失败！");
            }
        }
    };

}








//收索商品和商品的更替
function js_findthing_manger() {
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
                var tbody = document.getElementById("tbody");
                while (tbody.hasChildNodes()) //当ulcalss下还存在子节点时 循环继续
                {
                    tbody.removeChild(tbody.firstChild);
                }
                var objlist = JSON.parse(this.responseText);
                for(let i=0;i<objlist.length;i++){
                    var newtr = document.createElement("tr");
                    var articleid = objlist[i].id+'';
                    var price=parseInt(objlist[i].price);
                    var storage = parseInt(objlist[i].storage);
                    var srcimg =objlist[i].image + '';
                    var discount = parseFloat(objlist[i].discount);
                    var title= objlist[i].title;
                    var strq='';
                    strq+='<tr id="aa'+ articleid  +'">'
                    strq+='<td>'+ articleid+'</td>'
                    strq+='<td><a id="'+articleid+'" href="javascript:void(0);"'
                    strq+='onClick="js_method_manger01(this)">'+   title+'</a></td>'
                    strq+='<td><input id="aaa'+articleid+ '"class="msg" value="'+price+'"></td>'
                    strq+='<td><input id="aaaa'+articleid+'"class="msg" type="text" value="'+discount+'"></td>'
                    strq+='<td><input id="aaaaa'+articleid+'"class="msg" type="text" value="'+storage+'"></td>'
                    strq+='<td><img src="../images/article/'+  srcimg+ '"></td>'
                    strq+='<td style="text-align: center;color: #222222">';
                    strq+='<a id="as'+articleid+'" class="layui-btn layui-btn-primary layui-btn layui-btn-sm"'
                    strq+=' onClick="Updatamanger(this)">修改</a>'
                    strq+=' <br/>'
                    strq+='<a id="a'+articleid+'" style="margin-top: 5px"'
                    strq+='class="layui-btn layui-btn-primary layui-btn layui-btn-sm" onClick="delearticle(this)">删除</a>'
                    strq+= '</tr>'
                  newtr.innerHTML = strq;
                  tbody.append(newtr);
                }
            }
        };
    }
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
            var tbody = document.getElementById("tbody");
            while (tbody.hasChildNodes()) //当ulcalss下还存在子节点时 循环继续
            {
                tbody.removeChild(tbody.firstChild);
            }
            var objlist = JSON.parse(this.responseText);
            for(let i=0;i<objlist.length;i++){
                var newtr = document.createElement("tr");
                var articleid = objlist[i].id+'';
                var price=parseInt(objlist[i].price);
                var storage = parseInt(objlist[i].storage);
                var srcimg =objlist[i].image + '';
                var discount = parseFloat(objlist[i].discount);
                   var strq='';
                strq+='<tr id="aa'+ articleid  +'">'
                strq+='<td>'+ articleid+'</td>'
                strq+='<td><a id="'+articleid+'" href="javascript:void(0);"'
                strq+='onClick="js_method_manger01(this)">'+   title+'</a></td>'
                strq+='<td><input id="aaa'+articleid+ '"class="msg" value="'+price+'"></td>'
                strq+='<td><input id="aaaa'+articleid+'"class="msg" type="text" value="'+discount+'"></td>'
                strq+='<td><input id="aaaaa'+articleid+'"class="msg" type="text" value="'+storage+'"></td>'
                strq+='<td><img src="../images/article/'+  srcimg+ '"></td>'
                strq+='<td style="text-align: center;color: #222222">';
                strq+='<a id="as'+articleid+'" class="layui-btn layui-btn-primary layui-btn layui-btn-sm"'
                strq+=' onClick="Updatamanger(this)">修改</a>'
                strq+=' <br/>'
                strq+='<a id="a'+articleid+'" style="margin-top: 5px"'
                strq+='class="layui-btn layui-btn-primary layui-btn layui-btn-sm" onClick="delearticle(this)">删除</a>'
                strq+= '</tr>'
                newtr.innerHTML = strq;
                tbody.append(newtr);
            }
        }
    };


}
