$(function () {
    $("#quan").innerText = document.getElementsByName("checkbox").length;


});

function delProFromCart(pid) {
    if (confirm("您是否确定删除该项？")) {
        location.href = "${pageContext.request.contextPath }/product?method=delProFromCart&pid=" + pid;
    }
}

function clearCart() {
    if (confirm("您是否确定清空购物车？")) {
        location.href = "${pageContext.request.contextPath }/product?method=clearCart";
    }
}

function buy() {
    // alert("买了");
}

function quanxuan(obj) {
    var names = document.getElementsByName("checkbox");
    if (obj.checked) {
        for (var i = 0; i < names.length; i++) {
            names[i].checked = true;
        }
        document.getElementById("quan").innerText = names.length;
        document.getElementById("xuan").innerText = names.length;
    }
    else {
        for (var i = 0; i < names.length; i++) {
            names[i].checked = false;
        }
        document.getElementById("quan").innerText = names.length;
        document.getElementById("xuan").innerText = 0;
    }
}

function xuan() {
    var names = document.getElementsByName("checkbox");
    var count = 0;
    for (var i = 0; i < names.length; i++) {
        if (names[i].checked) {
            count = count + 1;
        }
        else {
            document.getElementById("quanxuan").checked = false;
        }
    }
    document.getElementById("quan").innerText = names.length;
    document.getElementById("xuan").innerText = count;
}