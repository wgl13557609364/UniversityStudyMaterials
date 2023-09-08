function getjson(){
    var xhttp;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    //发送请求
    xhttp.open("GET", "http://localhost:8080/javaWebHomeWork_war/getjson");
    xhttp.send();
    //获取响应
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {

            console.log(JSON.parse(this.responseText));
        }
    };
}