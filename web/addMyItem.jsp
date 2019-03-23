<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/addMyItem.js"></script>
<link href="css/addMyItem.css" rel="stylesheet" type="text/css" media="all"/>

<%--<div id="wodeshangpinkuang">--%>
    <button id="shangchuantupiandeanniu">选择上传图片</button>
    <form id="addmyitemform" name="addmyitemform" action="${pageContext.request.contextPath}/addProduct" method="post"
          enctype="multipart/form-data">
        <img src="img/u179.png" id="consignerRdSign">
        <input type="file" id="btn_file3" name="pimage" accept="image/jpg,image/jpeg,image/gif,image/png"
               onchange="imgChange(event,'consignerRdSign')">
        <span id="note">注：只能上传图片文件，上传的图片会被压缩成200*200</span>
        <br>
        <span id="title_1"> 商品名称：</span>
        <input id="lianxifangshi" name="pname" value="" type="text" placeholder="" required/>
        <br>
        <span id="title_2"> 是否热门：</span>
        <select name="is_hot" id="is_hot">
            <option value="0">否</option>
            <option value="1" disabled="disabled">是</option>
        </select>
        <span id="title_12"><span class="star">*</span>对不起，您没有权限选择</span>
        <br>
        <span id="title_3"> 商品描述：</span>
        <input required id="shangpinmingzi" name="pdesc" type="text" placeholder=""/>
        <br>
        <span id="title_4"> &nbsp &nbsp市场价：</span>
        <input required id="shichangjia" type="number" min="0" name="market_price" value="" placeholder=""/>
        <span id="title_5">元 	&nbsp 	&nbsp 	&nbsp 	&nbsp</span>
        <span id="title_6">  	&nbsp 	&nbsp 	&nbsp 	&nbsp<span class="star">*</span>此为市场的一般价格，供用户作为参考</span>
        <br>
        <span id="title_7"> &nbsp &nbsp商城价：</span>
        <input required id="shangchengjia" name="shop_price" type="number" min="0" placeholder="">
        <span id="title_8">元 	&nbsp 	&nbsp 	&nbsp 	&nbsp</span>
        <span id="title_9">  	&nbsp 	&nbsp 	&nbsp 	&nbsp<span class="star">*</span>此为您即将出售的商品的价格</span>
        <br>
        <span id="title_10"> 请选择商品分类：</span>
        <select required id="fenlei" name="cid">
        </select>
        <span id="title_11"> 商品数量：</span>
        <input required id="shangpinshuliang" name="shangpinshuliang" type="number" min="1" placeholder="">
        <br>
        <button id="tijiao">提交商品</button>
    </form>
<%--</div>--%>
<script>
    $(function () {
        $.getJSON("${pageContext.request.contextPath}/product",
            {"method": "categoryList"},
            function (result) {
                $(result).each(function (index, element) {
                    $("#fenlei").append("<option value='" + element.cid + "'>" + element.cname + "</option>")
                })
            });
    });
</script>