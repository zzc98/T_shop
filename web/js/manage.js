$(function(){
    $("#b1wodeshangpin").click(function () {
        $(this).css("border","1px solid #0079FE");
        $(this).css("color","#0079FE");
        var tmp1=$("#b2shangjiashangpin");

        tmp1.css("border","1px solid #F2F2F2");
        tmp1.css("color","#999999");
        $("iframe").attr('src','myItem.jsp');
    });
    $("#b2shangjiashangpin").click(function () {
        $(this).css("border","1px solid #0079FE");
        $(this).css("color","#0079FE");
        var tmp2=$("#b1wodeshangpin");
        tmp2.css("border","1px solid #F2F2F2");
        tmp2.css("color","#999999");
        $("iframe").attr('src','addMyItem.jsp');
    });
})