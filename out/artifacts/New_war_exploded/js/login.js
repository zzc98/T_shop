var code; //在全局定义验证码
function createCode() {
    code = "";
    var codeLength = 4; //验证码的长度
    var checkCode = document.getElementById("yan");
    var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
        'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //随机数
    for (var i = 0; i < codeLength; i++) { //循环操作
        var index = Math.floor(Math.random() * 36); //取得随机数的索引（0~35）
        code += random[index]; //根据索引取得随机数加到code上
    }
    checkCode.value = code; //把code值赋给验证码
}

//校验验证码
function validate() {
    var inputCode = document.getElementById("re").value.toUpperCase();
    var name = document.getElementById("name").value;
    var pw = document.getElementById("pw").value;
    if (name.length == 0) {
        document.getElementById("name").style.border = "2px solid red";
        return;
    }
    if (pw.length == 0) {
        document.getElementById("pw").style.border = "2px solid red";
        return;
    }
    if (inputCode.length <= 0) { //若输入的验证码长度为0
        document.getElementById("re").style.border = "2px solid red";
        return;
    }
    if (inputCode != code) { //若输入的验证码与产生的验证码不一致时
        alert("验证码输入错误!"); //则弹出验证码输入错误
        createCode(); //刷新验证码
        document.getElementById("re").value = "";//清空文本框
    }
    else
    // //输入正确时
    // alert("正在登陆"); //弹出
        document.form.submit();
}

function nameout() {
    var name = document.getElementById("name").value;
    if (name.length == 0) {
        document.getElementById("name").style.border = "2px solid red";
    }
    else
        document.getElementById("name").style.border = "1px solid black";
}

function pwout() {
    var name = document.getElementById("pw").value;
    if (name.length == 0) {
        document.getElementById("pw").style.border = "2px solid red";
    }
    else
        document.getElementById("pw").style.border = "1px solid black";
}

function reout() {
    var name = document.getElementById("re").value;
    if (name.length == 0) {
        document.getElementById("re").style.border = "2px solid red";
    }
    else
        document.getElementById("re").style.border = "1px solid black";
}
