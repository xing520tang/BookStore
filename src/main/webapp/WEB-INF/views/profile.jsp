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
  <title>用户中心</title>
  <link rel="stylesheet" href="${SourcePath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <link href="${SourcePath }/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
  <link href="${SourcePath }/assets/css/navbar-fixed-top.css" rel="stylesheet">
  <link rel="stylesheet" href="${SourcePath }/font-awesom470/css/font-awesome.min.css">
    <!-- 导入地区选择所需包 -->
  <link href="${SourcePath }/assets/city-picker/city-picker.css" rel="stylesheet" type="text/css" />
  <script src="${SourcePath }/assets/js/ie-emulation-modes-warning.js"></script>
  
  <%--导入消息提示需要的css --%>
  <link href="${SourcePath }/toastr/toastr.min.css" rel="stylesheet">
  <style>
      .nav > li:hover .dropdown-menu{display: block;}
  </style>
</head>
<body>
    <div id="main-div" class="float-container">
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
                    <li><a href="${APP_PATH }/main">主页</a></li>
                    <li><a href="https://github.com/xing520tang/BookStore" target="_blank">关于</a></li>
                    <li><a href="JavaScript:void(0);" data-toggle="tooltip" data-placement="bottom" title="QQ:1845790416">联系我们</a></li>
                    <li></i><a href="${APP_PATH }/shoppingCart" class="fa fa-shopping-cart"> 购物车</a></li>
                  </ul>

                  <ul class="nav navbar-nav navbar-right active" >
                                      	<c:if test="${role.identity==0 }"><%--匿名用户 --%>
                  		<li><a href="${APP_PATH }/login">登录</a></li>
                    	<li><a href="${APP_PATH }/register">注册<span class="sr-only">(current)</span></a></li>
                  	</c:if>
                    <c:if test="${role.identity==1}"> <%--普通用户 --%>
                    	<li class="dropdown">
		                      <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
		                      	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
		                      	<span id="uNickName">${uNickName }</span><span class="caret"></span></a>
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
		                      	<span id="uNickName">${uNickName }</span> <span class="caret"></span></a>
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
		                      	<span id="uNickName">${uNickName }</span> <span class="caret"></span></a>
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
          <div class="panel panel-success">
            <!-- Default panel contents -->
            <div class="panel-heading">个人中心</div>
            <div class="panel-body">
              <p style="text-align:center;">
                亲爱的<strong>
                  <span class="glyphicon glyphicon-user"  id="uuNickName" aria-hidden="true"></span></strong>
                ，填写真实资料有助于卖家发货哦
              </p>
            </div>
            <hr>
            <!-- 个人信息展示 -->
            <div class="row">
              <form action="javascript:save()" id="profileForm" method="post">
              	<input type="text" id="uId" class="sr-only" name="uId"  >
                <!-- 昵称 -->
                <div class="form-horizontal">
                    <div class="form-group">
                      <label class="col-md-3 control-label"></label>
                      <div class="col-md-6">
                           <div class="input-group">
                               <span class="input-group-addon">昵&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 称</span>
                               <input type="text" class="form-control input-md" id="uNickname" name="uNickname"
                               onchange="change()" placeholder="tinyspot">
                           </div>
                      </div>
                    </div>
                </div>
                <br>
                  <!-- 电话号码 -->
                  <div class="form-horizontal">
                      <div class="form-group">
                        <label class="col-md-3 control-label"></label>
                        <div class="col-md-6">
                             <div class="input-group">
                                 <span class="input-group-addon">注册手机</span>
                                 <input disabled type="text" class="form-control input-md" id="uPhone" name="uPhone" placeholder="请输入手机号码">
                             </div>
                        </div>
                      </div>
                  </div>
                  <br>
                  <!-- 性别 -->
                  <div class="form-horizontal">
                      <div class="form-group">
                          <label for="" class="col-md-3 control-label"></label>
                          <div class="col-md-6">
                              <div class="input-group">
                                <span class="input-group-addon"  id="genderr">性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别</span>
                                <div class="btn-group" data-toggle="buttons" style="margin-left:27px;">
                                    <label for="" class="btn btn-default active" disabled id="male">
                                        <input type="radio" name="gender" id="opt1" autocomplete="off" data-bv-field="gender">男生
                                    </label>
                                    <label for="" class="btn btn-default" id="female">
                                        <input type="radio" name="gender" id="opt2" autocomplete="off" >女生
                                    </label>
                                    <label for="" class="btn btn-default" disabled>
                                        <input type="radio" name="gender" id="opt3" autocomplete="off" >其他
                                    </label>
                                </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <br>
                  <!-- 注册时间 -->
                  <div class="form-horizontal">
                      <div class="form-group">
                          <label for="" class="col-md-3 control-label"></label>
                          <div class="col-md-6">
                              <div class="input-group">
                                <span class="input-group-addon"  id="genderr">注册日期</span>
                                <div class="btn-group" data-toggle="buttons" style="margin-left:27px;">
                                  <label for="" class="btn btn-default">
                                      <span id="uRegisterDate">2019-06-25</span>
                                  </label>
                                </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <br>
                  <!-- 收货地址 -->
                  <div id="distpicker" class="form-horizontal">
                    <div class="form-group">
                      <label for="" class="col-md-1 col-md-offset-3 control-label"style="font-weight:400; color:#555;">收货地址</label>
                      <div  class="col-md-3">
                            <input id="city-picker3" readonly type="text" class="form-control"
                            name="uAddress" onchange="change()" data-bv-field="storeAddr">
                      </div>
                      <div class="col-md-2">
                            <input class="form-control" id="specificAdd" placeholder="输入详细地址" 
                            name="uAddressDetail" onchange="change()" data-bv-field="storeAddrDetail"></input>
                      </div>
                    </div>
                  </div>
                  <br>
                  <br><br>
                  <div class="form-horizontal">
                      <div class="form-group">
                        <!-- <label class="col-md-5 control-label"></label> -->
                        <div class="col-md-2 col-md-offset-5">
                          <input disabled="disabled" type="submit" id="loginn" class="form-control btn-success" name="Submit" value="保 存">
                        </div>
                      </div>
                  </div>
                  <br>
              </form>
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
        <!-- 地区选择所需的js -->
        <script type="text/javascript" src="${SourcePath }/assets/city-picker/city-picker.data.js"></script>
        <script type="text/javascript" src="${SourcePath }/assets/city-picker/city-picker.js"></script>
        <script type="text/javascript" src="${SourcePath }/assets/city-picker/main.js"></script>
        
         <%--导入消息提示需要的js --%>
        <script src="${SourcePath }/toastr/toastr.min.js"></script>
        
        <script type="text/javascript">
        	$(function(){
        		getProfileDate();
        		
        		$city = $("#city-picker3");
        		
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
        	});
        	function getProfileDate() {
				$.ajax({
					url:"${APP_PATH}/getProfileDate",
					type:"GET",
					success: function (result) {
						console.log(result);
						insertDateToForm(result);
					}
				});
			}
        	<%--将用户数据插入表单--%>
        	function insertDateToForm(data) {
        		$("#uId").val(data.extend.user.uId);
				$("#uNickname").val(data.extend.user.uNickname);
				$("#uPhone").val(data.extend.user.uPhone);
				$("#uRegisterDate").empty();
				$("#uRegisterDate").append(new Date(data.extend.user.uRegisterDate).toLocaleDateString());
				if(data.extend.user.uAddress != null){
					var t = (data.extend.user.uAddress).split("/");
					$city.val(t[0]+"/"+t[1]+"/"+t[2]);
					$("#specificAdd").val(t[3]);
				}
		        $city.citypicker();
				$("#uuNickName").append(data.extend.user.uNickname);
			}
        	<%--信息被修改时，保存按钮激活--%>
        	function change(){
        		$("#loginn").removeAttr("disabled");
        	}
        	function save(){
        		$.ajax({
        			url:"${APP_PATH}/saveProfile",
        			type:"POST",
        			data:$("#profileForm").serialize(),
        			success:function(result){
        				console.log(result);
        				$("#uNickName").empty();
        				$("#uNickName").append($("#uNickname").val())//导航栏昵称要变
        				$("#uuNickName").empty();
        				$("#uuNickName").append($("#uNickname").val());
        				if(result.code == 100){
        					toastr["success"](result.msg);
        				}
        			},
        			error:function(){
        				toastr["error"]("系统错误，请重试");
        			}
        		});
        	}
        </script>
</body>
</html>
