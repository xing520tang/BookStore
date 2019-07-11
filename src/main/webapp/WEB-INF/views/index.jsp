<%--
	EL表达式获取作用域对象的数据：
		${param.uname} ==>获取request中请求的单个数据的值
		${paramValues.list[0]} ==>获取request中请求数据的数组中的值
		${attr} ==>获取作用域中attr键名对应的键值
		${user} ==>获取作用域中的对象
		${list[0].user} ==>获取作用域中list数组中的对象
		${map.c} ==>获取作用域中map的键值对，健名为c
		
	EL的作用域查找顺序：
		<%
			pageContext.setAttribute("hello", "hello pageContext");
			request.setAttribute("hello", "hello request");
			session.setAttribute("hello", "hello session");
			application.setAttribute("hello", "hello application");
		%>
		作用域默认查找顺序：pageContext-->request-->session-->application(从小的范围开始找)
		如何取出作用域的数据：${健名}
		如果想在指定的作用域取数据，不使用默认的查找顺序：${pageScope.键名}-->${requestScope.键名}-->${sessionScope.键名}-->${applicationScope.键名}
		
	EL表达式的逻辑运算：
		${逻辑表达式}：&& || !
		${算术表达式}: +, -, *, /
		${关系表达式}：>, < ,>=, <=, ==, !=
		注意：+表示加法运算，不能用于字符连接，否则会报错！
	
	EL表达式空值判断
		${empty 键名}
		作用： 判断对应的对象是否存有数据
		
	EL获取请求头和Cookie数据
		请求头数据：
			${header} -->返回所有的请求头数据
			${header["键名"]} -->返回指定的“键名”的请求头数据
			${headerValues["键名"]} -->返回指定的键名（同键不同值）的值的数组
		Cookie数据：
			${cookie}
			${cookie.键名}返回指定的cookie对象
			${cookie.键名.name},$(cookie.键名.value}
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
  <!-- 得到当前工程路径 -->
<% pageContext.setAttribute("APP_PATH", request.getContextPath()) ;%> 
<% pageContext.setAttribute("SourcePath",request.getContextPath()+"/static");%>
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
  <title>BookStore</title>
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
	<%--设置消息隐藏，用于存放消息 ,value为空时表示没有提示消息，否则表示有。这个需要前端通过js显示消息提示--%>
	<c:if test="${empty message }">
		<input type="text" id="message" class="sr-only" value="">	
	</c:if>
	<c:if test="${!empty message }">
		<input type="text" id="message" class="sr-only" value="${message }">	
	</c:if>
	
    <div id="main-div" class="float-container">
        <!-- 导航栏开始 -->
            <nav class="navbar navbar-inverse navbar-fixed-top" style="box-shadow:0px 1px 8px 5px #ccc;">
              <div class="container">
                <div class="navbar-header">
                	<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false">
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
                  
                    <li></i><a href="${APP_PATH }/shoppingCart" class="fa fa-shopping-cart"> 购物车</a></li>
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
		                      	${uNickName }<span class="caret"></span></a>
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
        <div id="main-container" class="container" >
<!-- 轮播图 -->
    <div id="goods-perfomance" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#goods-perfomance" data-slide-to="0" class="active"></li>
        <li data-target="#goods-perfomance" data-slide-to="1"></li>
        <!-- <li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
      </ol>
      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox"  style="border-radius:6px;">
        <div class="item active">
          <img src="${SourcePath }/imgs/mainPage/carousel1.jpg" alt="第一张图">
          <div class="carousel-caption">
              <span class="sr-only"><h1>这里添加图片其他信息</h1></span>
          </div>
        </div>
        <div class="item">
          <img src="${SourcePath }/imgs/mainPage/carousel2.jpg" alt="第二张图">
          <div class="carousel-caption">
            <span class="sr-only"><h1>这里添加图片其他信息</h1></span>
          </div>
        </div>
      </div>
      <!-- Controls -->
      <a class="left carousel-control" href="#goods-perfomance" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#goods-perfomance" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
<!-- 轮播图结束 -->
    <hr />
<!-- 具体的商品展示 -->
        <div class="row" id="bookList">

        </div>
<!-- 商品展示结束 -->
	<hr>
	<!-- 显示分页信息分页信息  -->
		<div class="row">
		<!-- 分页信息 -->
			<div class="col-md-6" id="page_info_area">
				
			</div>
		<!-- 分页条信息 -->
 			<div class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	
				  </ul>
				</nav>
			</div> 
		</div>
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
        
        <script type="text/javascript">
      <%-- 1.页面加载完成之后，直接发送ajax请求，要到分页数据 --%>
		$(function(){
			pageTo(1);  <%--先去首页--%>
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
			
			<%--判断是否有消息，有就提示出来--%>
            var msg = $("#message").val();
            if(msg.length != 0){
            	toastr["info"](msg);
            	$("#message").val(""); <%--提示完后清空消息--%>
            }
		});
		function pageTo(pn) {
			$.ajax({
				url:"${APP_PATH}/books",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					console.log(result);
					<%--1.解析并显示书本数据--%>
					build_books_list(result);
					<%--//2.解析并显示分页--%>
					build_page_info(result);
					<%--3.解析分页条数据--%>
					build_page_nav(result);
				}
			});
			
			<%--<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                <div class="thumbnail  sha" id="1_1">
                 <img src="${SourcePath }/imgs/book_imgs/1_1.jpg" alt="c++">
                 <div class="caption">
                    <h3>C++ Primer Plus</h3>
                    <p>...</p>
                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                 </div>
             	</div>
            </div>--%>
			function build_books_list(data) {
				<%--先清空一波数据--%>
				$("#bookList").empty();
				<%--得到json数据--%>
				var books = data.extend.pageInfo.list;
				<%--循环解析--%>
				$.each(books, function(index, item){
					var div1 = $("<div></div>").addClass("col-xs-6 col-sm-4 col-md-3 col-lg-3");
					var div2 = $("<div></div>").addClass("thumbnail  sha").attr("bId",item.bId);
					div2.click(function () { <%--给div2绑定点击事件--%>
						goodDetail(item.bId);
					})
					var img = '<img src="${SourcePath }'+item.bPicture+'">';
					var addBtn = $("<button></button>").addClass("btn btn-danger add_cart_btn").attr("bId",item.bId)
					.append($("<i></i>").addClass("fa fa-shopping-cart")).append(" 加购物车");
					addBtn.click(function (e) {
						//alert("加入购物车被点击");
						e.stopPropagation();<%--阻止事件冒泡即可--%>
						addCart(item.bId,1); <%--加入购物车，传入bId--%>
					})
					var price = $("<span></span>").append($("<span>￥</span>").append((item.bPrice*item.bDiscount/10).toFixed(2)).addClass("search_now_price"))  
					.append($("<span>定价:￥ </span>").addClass("search_discount").append($("<span></span>").append((item.bPrice).toFixed(2)).addClass("search_pre_price")).append(item.bDiscount==10 ? "" : ("&nbsp;("+item.bDiscount+"折)")));
					<%--data-toggle="tooltip" data-placement="bottom" title="QQ:1845790416"--%>
					var div3 = $("<div></div>").addClass("caption")
					.append($("<h4 class='ellipsis'></h4>").append(item.bName).attr("data-toggle","tooltip").attr("data-placement","right").attr("title",item.bName)) <%--"&nbsp;("+(item.bDiscount==10?"不打":item.bDiscount)+"折)"--%>
					.append(price);
					div3 = div3.append($("<p></p>").append(addBtn));
					div2 = div2.append(img).append(div3);
					div1 = div1.append(div2);
					$("#bookList").append(div1);
				})
			}
		}
        	function goodDetail(id) {
        		window.location.href="${APP_PATH}/goodsDetail/"+id;
			} 
        	
        	<%--//解析分页信息--%>
    		function build_page_info(result) {
    			$("#page_info_area").empty();
    			var temp = result.extend.pageInfo;
    			$("#page_info_area").append("当前第 <kbd>"+ temp.pageNum +"</kbd> 页，共 <kbd>"+ temp.pages +"</kbd> 页，共 <kbd>"+ temp.total+"</kbd> 记录数");
    		}
    		
    		<%--//解析分页条--%>
    		function build_page_nav(result){
    			$(".pagination").empty();
    			var temp = result.extend.pageInfo;
    			var firstPage = $("<li></li>").append("<a href='#'>首页</a>");
    			var previousPage = $("<li></li>").append("<span aria-hidden='true'>&laquo;</span>");
    			if(temp.hasPreviousPage == false){
    				firstPage.addClass("disabled");
    				previousPage.addClass("disabled");
    			}else{
    				firstPage.click(function () {
    					pageTo(1);
    				});
    				previousPage.click(function () {
    					pageTo(temp.pageNum-1);
    				})
    			}
    			
    			$(".pagination").append(firstPage).append(previousPage);
    			
    			var pageBody = '';
    			$.each(temp.navigatepageNums,function(index, item){
    				var numLi = $("<li></li>").append($("<a></a>").append(item));
    				if(item==temp.pageNum){//若当前页码是显示的页码，导航页高亮
    					numLi.addClass("active");
    				}
    				numLi.click(function () {
    					pageTo(item);
    				});
    				$(".pagination").append(numLi);
    			});
    			
    			var lastPage = $("<li></li>").append("<a href='#'>末页</a>");
    			var nextPage = $("<li></li>").append("<span aria-hidden='true'>&raquo;</span>");
    			if(temp.hasNextPage == false){
    				lastPage.addClass("disabled");
    				nextPage.addClass("disabled")
    			}else {
    				lastPage.click(function () {
    					pageTo(temp.total);
    				})
    				nextPage.click(function () {
    					pageTo(temp.pageNum+1);
    				})
    			}
    			
    			$(".pagination").append(nextPage).append(lastPage);
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
