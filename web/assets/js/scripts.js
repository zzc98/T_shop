
jQuery(document).ready(function() {

    /*
        Background slideshow
    */
    $.backstretch([
      "images/u=3514085721,2182005643&fm=26&gp=0.jpg",
      "images/QQ20180907000141.jpg",
      "images/QQ20180907000146.jpg"
    ], {duration: 3000, fade: 750});

    /*
        Tooltips
    */
    $('.links a.home').tooltip();
    $('.links a.blog').tooltip();

    /*
        Form validation
    */
    $('.register form').submit(function(){
        $(this).find("label[for='username']").html('用户名');
        $(this).find("label[for='password']").html('密码');
        $(this).find("label[for='name']").html('姓名');
        $(this).find("label[for='email']").html('电子邮箱');
        ////
        var username = $(this).find('input#username').val();
        var password = $(this).find('input#password').val();
        var email = $(this).find('input#email').val();
        var name = $(this).find('input#name').val();
        if(username == '') {
            $(this).find("label[for='username']").append("<span style='display:none' class='red'> - 请输入用户名.</span>");
            $(this).find("label[for='username'] span").fadeIn('medium');
            return false;
        }
        if(password == '') {
            $(this).find("label[for='password']").append("<span style='display:none' class='red'> - 请输入密码.</span>");
            $(this).find("label[for='password'] span").fadeIn('medium');
            return false;
        }
        if(name == '') {
            $(this).find("label[for='name']").append("<span style='display:none' class='red'> - 请输入姓名.</span>");
            $(this).find("label[for='name'] span").fadeIn('medium');
            return false;
        }
        if(email == '') {
            $(this).find("label[for='email']").append("<span style='display:none' class='red'> - 请输入电子邮箱.</span>");
            $(this).find("label[for='email'] span").fadeIn('medium');
            return false;
        }
    });


});


