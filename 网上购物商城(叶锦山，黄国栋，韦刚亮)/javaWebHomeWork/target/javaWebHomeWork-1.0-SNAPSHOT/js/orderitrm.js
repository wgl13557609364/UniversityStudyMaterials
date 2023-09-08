function js_method_orderitem(element){
    var str = element.id;
    var url = "http://localhost:8080/javaWebHomeWork_war/mainshop?id=" +str;
    window.location.replace(url);
}