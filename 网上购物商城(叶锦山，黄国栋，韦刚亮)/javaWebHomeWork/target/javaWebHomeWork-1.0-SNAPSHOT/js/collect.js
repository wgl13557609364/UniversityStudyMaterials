function js_method_orderitem(element){
    var str = element.id;
    var url = "http://localhost:8080/javaWebHomeWork_war/mainshop?id=" +str;
    window.location.replace(url);
}

function deletecollect(element){
    var id =  element.id+'';
    var articleid = id.substring(1) +'';
    var xhttp;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    } else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.open("GET", "http://localhost:8080/javaWebHomeWork_war/deletecollect?articleid="+ articleid);
    xhttp.send();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.responseText=="true"){
                var father = element.parentElement.parentElement.parentElement;
                var child = element.parentElement.parentElement;
                father.removeChild(child);
                alert("删除成功！");
            }else {
                alert("数据异常，删除失败！")
            }
        }
    };
}