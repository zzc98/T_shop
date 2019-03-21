$(function () {
    $("#tijiao").bind("click", function () {
        var x1 = $("#lianxifangshi").val();
        var x2 = $("#shangpinmingzi").val();
        var x3 = $("#shichangjia").val();
        var x4 = $("#shangchengjia").val();
        var x5 = $("#cid").val();
        var x6 = $("#shangpinshuliang").val();
        if (x1.length == 0 || x2.length == 0 || x3.length == 0 || x4.length == 0 || x5.length == 0 || x6.length == 0) {
            alert("请填写完整信息");
            return;
        }
        alert("恭喜。您已成功提交该商品！");
        document.addmyitemform.submit();
    });
    $("#shangchuantupiandeanniu").bind("click", function () {
        $("#btn_file3").click();
    });
});

function imgChange(e, imageid) {
    console.info(e.target.files[0]);//图片文件
    console.log(e.target.value);//这个也是文件的路径和上面的dom.value是一样的
    var reader = new FileReader();
    reader.onload = (function (file) {
        return function (e) {
            console.info(this.result); //这个就是base64的数据了
            document.getElementById(imageid).src = this.result;
        };
    })(e.target.files[0]);
    reader.readAsDataURL(e.target.files[0]);
}