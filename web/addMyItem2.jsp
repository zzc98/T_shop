<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    //当页面加载完毕之后，发起一个异步的请求，获取所有分类的json，不在servlet中查询出分类，而是在页面中查询，不用同步用异步
    $(function() {
        $.getJSON("${pageContext.request.contextPath}/product",
            {"method":"categoryList"},
            function(result){
                //得到所有分类的json数据之后，遍历这个json数组
                $(result).each(function(index,element) {
                    //index表示每次遍历的下标，element表示每次遍历出来的json对象{"cid":"sadsafda","cname":"炒饭炒粉"}
                    $("#fenlei").append("<option value='"+element.cid+"'>"+element.cname+"</option>")
                })
            })
    })
</script>
<style type="text/css">
    /*body{overflow-y:hidden;}*/
    #subminbtn{
        background-image: url('img/u241.png');
        position: relative;
        left: 300px;
        top:300px;
        font-family: 微软雅黑;
        width: 240px;
        height: 40px;
        border-radius: 3px;
        color: white;
    }
    select{
        appearance:none;
        -moz-appearance:none;
        -webkit-appearance:none;
        background: url("img/u239.png") no-repeat scroll right center transparent;
        padding-right: 15px;
    }
    option:hover{
        background-color: #3498DB;
        font-size: 14px;
        font-family: 微软雅黑;
        color: white;
    }
</style>
<script type="text/javascript">
    function F_Open_dialog(id) {
        document.getElementById(id).click();
    }
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
</script>
<div id="wodeshangpinkuang" style="border-radius: 3px;width:1280px;height:900px">
    <button style="position: relative;left:300px;top:200px;height:40px;width:153px;border: 1px solid #D7DDE4;border-radius: 3px;
    text-align: center;font-family: 微软雅黑;font-size: 14px;color:#999999;" onclick="F_Open_dialog('btn_file3')">
        选择上传图片
    </button>
    <form id="addmyitemform" name="addmyitemform" action="${pageContext.request.contextPath}/addProduct" method="post" enctype="multipart/form-data">
        <%--<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/addProduct" method="post" enctype="multipart/form-data">--%>
        <%--<input type="hidden" name="method" value=""--%>
        <img src="img/u179.png" style="position: relative;top:50px;left:50px;height:200px;width: 200px" id="consignerRdSign">
        <input type="file" id="btn_file3" name="pimage"  accept="image/jpg,image/jpeg,image/g
        <hiddeif,image/png"
               style="display:none"
               onchange="imgChange(event,'consignerRdSign')">
        <%--<button style="position: relative;left:100px;top:20px;height:40px;width:153px;border: 1px solid #D7DDE4;border-radius: 3px;--%>
        <%--text-align: center;font-family: 微软雅黑;font-size: 14px;color:#999999;" onclick="F_Open_dialog('btn_file3')">--%>
        <%--选择上传图片--%>
        <%--</button>--%>
        <span style="font-family: 微软雅黑;font-size: 12px;color:#999999;position: relative;top:25px;left:100px;">注：只能上传图片文件，上传的图片会被压缩成200*200</span>
        <br>
        <span style="position: relative;left: 150px;top:50px;font-family: 微软雅黑;font-size: 14px;color:#666666"> 商品名称：</span>
        <input  required id="lianxifangshi" name="pname" value="" type="text" style="position: relative;left: 150px;top:50px;height: 30px;width: 323px;border-radius: 3px;border: 1px solid #CCCCCC;color:#333333;font-size: 13px;font-family: 微软雅黑">
        <br>
        <span style="position: relative;left: 150px;top:80px;font-family: 微软雅黑;font-size: 14px;color:#666666"> 是否热门：</span>
        <select name="is_hot" style="position: relative;left:150px;top:80px">

            <option value="0">否</option>
            <option value="1" disabled="disabled">是</option>

        </select>
        <br>
        <span style="position: relative;left: 150px;top:110px;font-family: 微软雅黑;font-size: 14px;color:#666666"> 商品描述：</span>
        <input required id="shangpinmingzi" name="pdesc" type="text" style="position: relative;left: 150px;top:110px;height: 30px;width: 323px;border-radius: 3px;border: 1px solid #CCCCCC;color:#333333;font-size: 13px;font-family: 微软雅黑">
        <br>
        <span style="position: relative;left: 150px;top:140px;font-family: 微软雅黑;font-size: 14px;color:#666666"> &nbsp &nbsp市场价：</span>
        <input required id="shichangjia"  type="number" min="0" name="market_price" value="" style="position: relative;top:140px;;left: 150px;height: 23px;width: 57px;border-radius: 3px;border: 1px solid #CCCCCC;color:#333333;font-size: 13px;font-family: 微软雅黑">
        <span style="font-family: 微软雅黑;font-size: 14px;position: relative;top:140px;left: 150px;color: #666666">元 	&nbsp 	&nbsp 	&nbsp 	&nbsp</span>
        <span style="font-family: 微软雅黑;font-size: 14px;position: relative;top:140px;left: 200px;color: #666666">  	&nbsp 	&nbsp 	&nbsp 	&nbsp*此为市场的一般价格，供用户作为参考</span>
        <br>
        <span style="position: relative;left: 150px;top:170px;font-family: 微软雅黑;font-size: 14px;color:#666666"> &nbsp &nbsp商城价：</span>
        <input required name="shangchengjia" name="shop_price" type="number" min="0" style="position: relative;top:170px;;left: 150px;height: 23px;width: 57px;border-radius: 3px;border: 1px solid #CCCCCC;color:#333333;font-size: 13px;font-family: 微软雅黑">
        <span style="font-family: 微软雅黑;font-size: 14px;position: relative;top:170px;left: 150px;color: #666666">元 	&nbsp 	&nbsp 	&nbsp 	&nbsp</span>
        <span style="font-family: 微软雅黑;font-size: 14px;position: relative;top:170px;left: 200px;color: #666666">  	&nbsp 	&nbsp 	&nbsp 	&nbsp*此为您即将出售的商品的价格</span>
        <br>
        <span style="position: relative;left: 150px;top:200px;font-family: 微软雅黑;font-size: 14px;color:#666666"> 请选择商品分类：</span>
        <select required id="fenlei" name="cid" style="position: relative;left: 150px;top:200px;height: 40px;width: 220px;font-family: 微软雅黑;font-size: 13px;border: 1px solid #CCCCCC">

        </select>
        <span style="font-family: 微软雅黑;position: relative;left: 200px;top:200px;font-size: 14px;color:#666666"> 商品数量：</span>
        <input required id="shangpinshuliang" name="shangpinshuliang" type="number" min="1" style="height: 23px;width: 57px;position:relative;top:200px;left:200px;border-radius: 3px;border: 1px solid #CCCCCC;color:#333333;font-size: 13px;font-family: 微软雅黑">
        <br>
        <button id="tijiao" onclick="a()" style="position: relative;top:250px;left:300px;height:50px;width:200px;background-color: #0a6cd6">提交商品</button>

    </form>
</div>
<script type="text/javascript">
    function a(){
        document.addmyitemform.submit();
    }
</script>
