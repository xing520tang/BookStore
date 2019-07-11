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
  <title>登录</title>
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

                  <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="${APP_PATH }/login">登录</a></li>
                    <li><a href="${APP_PATH }/register">注册<span class="sr-only">(current)</span></a></li>
                  </ul>
                </div>
              </div>
            </nav>
        <!-- 导航栏结束 -->
        <!-- 主内容 -->
        <div id="main-container" class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h2>登录BookStore</h2>
                    <hr />
                    <br>
                    <!-- <form action="javascript:submit();" id="loginForm" method="post"> -->
                    <form action="${APP_PATH }/login" id="loginForm" method="post" >
                        <!-- 电话号码 -->
                        <div class="form-horizontal">
                            <div class="form-group">
                              <label class="col-md-3 control-label"></label>
                              <div class="col-md-6">
                                   <div class="input-group">
                                       <span class="input-group-addon requiredAfter">手机号码</span>
                                       <input type="text" class="form-control input-md" name="phoneNumber" placeholder="请输入手机号码"
                                       data-bv-field="phoneNumber">
                                   </div>
                              </div>
                              <small class="col-md-offset-8 col-md-2" style="color:#e74c3c; margin-top:5px;">请用手机号登录</small>
                            </div>
                        </div>
                        <br>
                        <!-- 登录密码 -->
                        <div class="form-horizontal">
                            <div class="form-group">
                              <label class="col-md-3 control-label"></label>
                              <div class="col-md-6">
                                   <div class="input-group">
                                       <span class="input-group-addon requiredAfter">登录密码</span>
                                       <input type="password" class="form-control input-md" id="userPass" name="password" placeholder="请输入登录密码">
                                   </div>
                              </div>
                            </div>
                        </div>
                        <br><br>
                        <!-- captcha -->
                        <div class="form-horizontal">
                            <div class="form-group">
                              <label class="col-md-3 control-label"></label>
                              <div class="col-md-6">
                                   <div class="input-group">
                                       <span class="input-group-addon requiredAfter" id="captchaOpt"></span>
                                       <input type="text" class="form-control" id="captcha" name="captcha" data-bv-field="captcha">
                                   </div>
                              </div>
                            </div>
                        </div>
                        <br><br>
                        <div class="form-horizontal">
                            <div class="form-group">
                              <!-- <label class="col-md-5 control-label"></label> -->
                              <div class="col-md-2 col-md-offset-5">
                                <input type="submit" id="loginn" class="form-control btn-success" name="Submit" value="登 录">
                              </div>
                            </div>
                        </div>
                        <br>
                    </form>
                    <div class="row">
                        <div class="col-md-2 col-md-offset-8">
                            <a href="./register.html" class="btn btn-link">立即注册</a>
                        </div>
                    </div>
                    <br>
                </div>
            </div>

            <hr>
            <div class="row">
                <div class="col-md-2">
                    <button class="btn btn-link">忘记密码？</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <button class="btn btn-link">忘记手机号？</button>
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
        <script src="${SourcePath }/bootstrapvalidator054/dist/js/bootstrapValidator.min.js"></script>
        <%--导入消息提示需要的js --%>
        <script src="${SourcePath }/toastr/toastr.min.js"></script>
        <%--导入计算md5所需的js --%>
        <script src="${SourcePath }/js/md5.min.js"></script>
        <script>
            $(document).ready(function(){
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
                
                generateCaptcha();
                $(loginForm).bootstrapValidator({
                    message: 'This value is not valid!',
                    feedbackIcons:{
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields:{
                        phoneNumber:{
                            message: '手机号无效',
                            validators:{
                            	notEmpty:{
                                    message: '手机号不能为空'
                                },
                                stringLength:{
                                    min: 11,
                                    max: 11,
                                    message: '手机号码格式不正确（11位）'
                                },
                                regexp:{
                                    regexp: /^1[34578]\d{9}$/,
                                    message: '输入的手机号码有误'
                                }
                            }
                        },
                        password:{
                            validators:{
                                notEmpty:{
                                    message:'密码不能为空'
                                },
                                stringLength:{
                                	min:6,
                                	max:16,
                                	message:'密码长度不正确'
                                }
                            }
                        },
                        captcha:{
                            validators:{
                                callback:{
                                    message:'答案错误或未输入验证码',
                                    callback: function(value,validator){
                                        var items = $('#captchaOpt').html().split(' ');
                                        if(String(items[1]) == '+')
                                            sum = parseInt(items[0]) + parseInt(items[2]);
                                        else if(String(items[1]) == '-')
                                            sum = parseInt(items[0]) - parseInt(items[2]);
                                        else sum = parseInt(items[0]) * parseInt(items[2]);
                                        return value == sum;
                                    }
                                }
                            }
                        }
                    },
                })
                .on('error.form.bv', function(e){
                    var $form = $(e.target),
                    bootstrapValidator = $form.data('bootstrapValidator');
                    if(! bootstrapValidator.isValidField('captcha')){
                        generateCaptcha();
                    }
                })<%--表单验证成功后--%>
                .on('success.form.bv', function(e) {
                	$pass = $("#userPass");
    	       		<%--将密码先计算一波md5--%>
    	       		if($pass.val().length >= 6){
    	       			$pass.val(md5($pass.val()).toUpperCase());
    	       		}
    	       		$("#loginForm").serialize()<%--序列化表单数据--%>
                })
                
                <%--判断是否有消息，有就提示出来--%>
                var msg = $("#message").val();
                if(msg.length != 0){
                	toastr["info"](msg);
                	$("#message").val(""); <%--提示完后清空消息--%>
                }
            });
            
            <%--验证码构造--%>
            function randomNumber(min, max){
                return Math.floor(Math.random()*(max-min+1) + min);
            };
            function randomOpt(){
                var n = randomNumber(1,4);
                switch (n) {
                    case 1: return '+';
                    case 2: return '-';
                    default: return '*';
                }
            }
            function generateCaptcha(){
                $('#captchaOpt').html([randomNumber(1,100), randomOpt(),
                randomNumber(1,100), '='].join(' '));
            };
            <%--验证码构造结束--%>
            
            <%--重定向到主页--%>
            function pageRedirect() {
       		 //window.history.back(-1);
       		 window.location.href="${APP_PATH}/main";
			}
        </script>
</body>
</html>
