function js_method(element){
    var str = element.innerHTML;
    var url = "http://localhost:8080/javaWebHomeWork_war/orderitem?ordercode=" +str;
    window.location.replace(url);
}