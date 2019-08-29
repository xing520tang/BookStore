<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- 得到当前工程路径 -->
<% pageContext.setAttribute("APP_PATH", request.getContextPath()) ;%> 
<% pageContext.setAttribute("SourcePath",request.getContextPath()+"/static"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <meta name="description" content="bookstore">
  <meta name="author" content="tinyspot">
  <link rel="icon" href="${SourcePath }/imgs/favicon.ico">
  <title>商品详情页</title>
  <link rel="stylesheet" href="${SourcePath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <link href="${SourcePath }/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
  <link href="${SourcePath }/assets/css/navbar-fixed-top.css" rel="stylesheet">
  <link rel="stylesheet" href="${SourcePath }/font-awesom470/css/font-awesome.min.css">
  <%--导入消息提示需要的css --%>
  <link href="${SourcePath }/toastr/toastr.min.css" rel="stylesheet">
  <script src="${SourcePath }/assets/js/ie-emulation-modes-warning.js"></script>
  <style>
      .nav > li:hover .dropdown-menu{display: block;}
  </style>
</head>
<body>
    <div id="main-div" class="float-container" bId="${bId }">
        <!-- 导航栏开始 -->
            <nav class="navbar navbar-inverse navbar-fixed-top" style="box-shadow:0px 1px 8px 5px #ccc;">
              <div class="container">
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="${APP_PATH }/main"><span class="glyphicon glyphicon-grain">BookStore</span></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                  <ul class="nav navbar-nav">
                    <li class="active"><a href="${APP_PATH }/main">主页</a></li>
                    <li><a href="https://github.com/xing520tang/BookStore" target="_blank">关于</a></li>
                    <li><a href="JavaScript:void(0);" data-toggle="tooltip" data-placement="bottom" title="QQ:1845790416">联系我们</a></li>
                    <li class="goodsDetail"></i><a href="${APP_PATH }/shoppingCart" class="fa fa-shopping-cart"> 购物车</a></li>
                  </ul>

                  <ul class="nav navbar-nav navbar-right">
                    <c:if test="${role.identity==0 }"><%--匿名用户 --%>
                  		<li><a href="${APP_PATH }/login">登录</a></li>
                    	<li><a href="${APP_PATH }/register">注册<span class="sr-only">(current)</span></a></li>
                  	</c:if>
                    <c:if test="${role.identity==1}"> <%--普通用户 --%>
                    	<li class="dropdown">
		                      <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
		                      	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
		                      	${uNickName } <span class="caret"></span></a>
		                      <ul class="dropdown-menu">
		                          <li><a href="${APP_PATH }/profile"><span class="glyphicon glyphicon-user" aria-hidden="true"> 个人中心</span></a></li>
		                          <li><a href="${APP_PATH }/myOrder"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"> 我的订单</span></a></li>
		                          <li role="separator" class="divider"></li>
		                          <li><a href="${APP_PATH }/exit"><span class="glyphicon glyphicon-log-out" aria-hidden="true"> 退出</span></a></li>
		                      </ul>
		                    </li>
                    </c:if>
                    <c:if test="${role.identity==2 }"><%--商家--%>
                    	<li class="dropdown">
		                      <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
		                      	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
		                      	${uNickName } <span class="caret"></span></a>
		                      <ul class="dropdown-menu">
		                          <li><a href="${APP_PATH }/shopManage"><span class="glyphicon glyphicon-th" aria-hidden="true"> 店铺管理</span></a></li>
		                          <li role="separator" class="divider"></li>
		                          <li><a href="${APP_PATH }/exit"><span class="glyphicon glyphicon-log-out" aria-hidden="true"> 退出</span></a></li>
		                      </ul>
		                    </li>
                    </c:if>
                    <c:if test="${role.identity==3 }"><%--超级管理员--%>
                    	<li class="dropdown">
		                      <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
		                      	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
		                      	${uNickName } <span class="caret"></span></a>
		                      <ul class="dropdown-menu">
		                          <li><a href="${APP_PATH }/manage"><span class="glyphicon glyphicon-th" aria-hidden="true"> 后台管理</span></a></li>
		                          <li role="separator" class="divider"></li>
		                          <li><a href="${APP_PATH }/exit"><span class="glyphicon glyphicon-log-out" aria-hidden="true"> 退出</span></a></li>
		                      </ul>
		                    </li>
                    </c:if>
                  </ul>
                </div>
              </div>
            </nav>
        <!-- 导航栏结束 -->
        <!-- 主内容 -->
        <div id="main-container" class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 img-responsive">
                  <a href="JavaScript:void(0);" class="thumbnail">
                    <img id="bPicture" alt="...">
                  </a>
                </div>
                  <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
                    <div class="panel panel-info">
                        <div class="panel-heading"><h4 id="bName"></h4></div>
                        <div class="panel-body row">
                            <%--<div><span>啪啦啪啦把商品描述一番</span></div> --%>
                            <%--<div class="row" style="margin-top:15px;"> --%>
                            <h5 class="col-xs-12 col-sm-6 col-md-4 col-lg-4">作者：<span id="bAuthor"></span></h5>
                            <h5 class="col-xs-12 col-sm-6 col-md-4 col-lg-4">出版社：<span id="bPress"></span></h5>
                            <h5 class="col-xs-12 col-sm-6 col-md-4 col-lg-4">出版时间：<span id="bPubDate"></span></h5>
							<%--价格板块 --%>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 price_info">
                                <span>
                                	<span class=" now_price col-md-5">￥</span>
                                	<span class="pre_price col-md-3">定价:￥ <span></span>&nbsp;</span>
                                	<span class="stock col-md-3" >库存:<span></span>&nbsp;</span>
                                </span>
                            </div>
							<%--价格板块完 --%>
                            <%--购买板块 --%>
                                <div style="margin-top: 10px;" class="col-xs-offset-3 col-xs-6 col-sm-offset-3 col-sm-6 col-md-offset-2 col-md-4 col-lg-offset-2 col-lg-3">
                                    <div class="input-group">
                                      <span class="input-group-btn">
                                        <button class="btn btn-default" type="button" id="numSub" onclick="sub()" disabled>-</button>
                                      </span>
                                      <input type="text" id="bookNum" class="form-control" value="1" onkeyup="inputChange()" style="text-align:center;" disabled>
                                      <span class="input-group-btn">
                                        <button class="btn btn-default" type="button" id="numAdd" onclick="add()">+</button>
                                      </span>
                                    </div>
                               </div>
                               <div style="margin-top: 10px;" class="col-xs-offset-2 col-xs-10 col-sm-offset-2 col-sm-10 col-md-offset-0 col-md-6 col-lg-offset-0 col-lg-6">
                                   <div class="input-group">
                                   		<button class="btn btn-danger">立即购买</button>
                                       <button class="btn btn-info" style="margin-left:5px;" id="addCartBtn"><li class="fa fa-shopping-cart"></li> 加购物车</button>
                                   </div>
                               </div>
							<%--购买板块完 --%>
                        </div>

                    </div>
                </div>
            </div>

            <br><hr>
        </div>
        <!-- 主内容结束 -->
    </div>

    <hr />

    <!-- 脚注 -->
    <div class="container">
        <footer class="footer">
            <ul>
                <li><a href='${APP_PATH }/tos'>服务条款</a></li> <span class="sep">|</span>
                <li><a href='${APP_PATH }/privacy'>隐私政策</a></li><span class="sep">|</span>
                <li><a href='https://blog.csdn.net/qq_41550842' target="_blank">Author：TinySpot</a></li><span class="sep">|</span>
                <li><a href='${APP_PATH }/faq'>FAQ</a></li><span class="sep">|</span>
                <li><a href="JavaScript:void(0);" data-toggle="tooltip" data-placement="bottom" title="QQ:1845790416">联系我们</a></li>
            </ul>
        <div class="text-center">
            <small id="copyright">Copyright Since 2019 &copy;<a href="${APP_PATH }/main">BookStore Inc.</a> All rights reserved.</small>
        </div>
        </footer>
    </div>

        <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="localhost:8080/bookstore/static/js/jquery.min.js"><\/script>')</script>
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
        	if (typeof jQuery === 'undefined') {
        	  throw new Error('requires jQuery');
        	}
        	if (typeof jQuery.fn.modal === 'undefined') {
        		document.write('<script src="localhost:8080/bookstore/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"><\/script>')
        	}
        </script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="${SourcePath }/assets/js/ie10-viewport-bug-workaround.js"></script>
        <script>
    	    $(function () { $("[data-toggle='tooltip']").tooltip(); });
        </script>
        <%--导入消息提示需要的css --%>
        <script src="${SourcePath }/toastr/toastr.min.js"></script>
        <script>
                  function add(){
                      var num = document.getElementById("bookNum");
                      if(num.value == $(".stock").attr("stock")){
                    	  toastr["info"]("最多只有"+$(".stock").attr("stock")+"本书可购买哦~");
                    	  return;
                      }
                      num.value++;
                      if(num.value > 1){
                          num.disabled=false;
                          document.getElementById("numSub").disabled=false;
                      }
                      
                  };
                  function sub(){
                      var num = document.getElementById("bookNum");
                      num.value--;
                      if(num.value <= 1){
                          num.disabled='disabled';
                          document.getElementById("numSub").disabled='disabled';
                          num.value=1;
                      }
                  }
                  function inputChange(){
                      var num = document.getElementById("bookNum");
                      <%--若输入的数是个负数--%>
                      if(num.value < 1)
                          sub();
                      <%--若输入的数大于库存数--%>
                      if(Number(num.value) > Number($(".stock").attr("stock"))){
                    	  document.getElementById("bookNum").value = $(".stock").attr("stock");
                    	  toastr["info"]("最多只有"+$(".stock").attr("stock")+"本书可购买哦~");
                      }
                  }
          </script>
            <%--加载完页面之后--%>
          <script type="text/javascript">
         	 $(function(){
         		go();<%--发送请求数据的请求--%>
         		<%--提示信息初始化--%>
    			toastr.options = {
    					  "closeButton": true,
    					  "debug": false,
    					  "newestOnTop": true,
    					  "progressBar": false,
    					  "positionClass": "toast-top-right",
    					  "preventDuplicates": true,
    					  "onclick": null,
    					  "showDuration": "300",
    					  "hideDuration": "1000",
    					  "timeOut": "5000",
    					  "extendedTimeOut": "1000",
    					  "showEasing": "swing",
    					  "hideEasing": "linear",
    					  "showMethod": "fadeIn",
    					  "hideMethod": "fadeOut"
    					}
    			$("#addCartBtn").click(function () {
    				addCart($("#main-div").attr("bId"), $("#bookNum").val());
				});
         	 });
          		function go() {
          			$.ajax({
        				url:"${APP_PATH}/bookDetail",
        				data:"bId="+$("#main-div").attr("bId"),
        				type:"GET",
        				success:function(result){
        					console.log(result);
        					<%--1.解析书本图片--%>
        					$("#bName").append(result.extend.bookInfo.bName)
        					$("#bPicture").attr("src",'${SourcePath }'+result.extend.bookInfo.bPicture);
        					<%--//2.解析书本详情--%>
        					build_bookDetail(result);
        				}
        			});
				}
          		<%--//2.解析书本详情--%>
          		function build_bookDetail(data) {
					var book = data.extend.bookInfo;<%--先得到书本详情--%>
					$("#bAuthor").append(book.bAuthor);
					$("#bPress").append(book.bPress);
					$("#bPubDate").append(new Date(book.bPubDate).toLocaleDateString());
					$(".now_price").append((book.bPrice*book.bDiscount/10).toFixed(2)).append("<span class='bDiscount'>&nbsp;&nbsp;&nbsp;&nbsp;</span>");
					$(".bDiscount").append(book.bDiscount==10 ? "" : ("&nbsp;("+book.bDiscount+"折)"));
					$(".pre_price").append((book.bPrice).toFixed(2));
					$(".stock").append(book.bStock);
					$(".stock").attr("stock", book.bStock);
				}
          		<%--加入购物车函数--%>
        		function addCart(bId,bNum) {
        			$.ajax({
        				url:"${APP_PATH}/addCart",
        				data:{bId:bId,bNum:bNum},
        				type:"GET",
        				success:function(result){
        					if(result.code == 100)
        						toastr["success"](result.msg);
        					else toastr["info"](result.msg);
        					console.log(result);
        				}
        			});
    			}
          </script>
</body>
</html>
