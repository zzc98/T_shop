function overFn(obj) {
    $(obj).css("background", "#DBEAF9");
}

function outFn(obj) {
    $(obj).css("background", "#fff");
}

function clickFn(obj) {
    $("#search").val($(obj).html());
    $("#showdiv").css("display", "none");
}

function searchWord() {
    var word = $("#search").val();
    var content = "";
    $.post(
        "${pageContext.request.contextPath}/searchWord",
        {"word": word},
        function (data) {
            console.log("这是回传的数据" + data);
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    content += "<div style='padding:5px' onmouseover='overFn(this)' onmouseout='outFn(this)' onclick='clickFn(this)'>+data[i].pname+</div>";
                }
            }
            var showdiv = $("#showdiv");
            showdiv.css("display", "block");
            showdiv.html(content);
        },
        "json"
    )
}