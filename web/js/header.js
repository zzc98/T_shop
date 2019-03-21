

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

function searchWord(obj) {
    var word = $(this).val;
    var content = "";
    $.post(
        "${pageContext.request.contextPath}/searchWord",
        {"word": word},
        function (data) {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    content += "<div style='padding:5px' onmouseover='overFn(this)' onmouseout='outFn(this)' onclick='clickFn(this)'>+data[i].pname+</div>";
                }
            }
            $("#showdiv").html(content);
        },
        "json"
    )
}