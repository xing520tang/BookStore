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
  <title>用户注册</title>
  <link rel="stylesheet" href="${SourcePath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="${SourcePath }/bootstrapvalidator054/dist/css/bootstrapValidator.min.css">
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
                    <!-- <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多 <span class="caret"></span></a>
                      <ul class="dropdown-menu">
                          <li><a href="#">没有更多</a></li>
                          <li role="separator" class="divider"></li>
                          <li class="dropdown-header">一个头</li>
                          <li><a href="#">啊哈哈哈</a></li>
                      </ul>
                    </li> -->
                    <li></i><a href="${APP_PATH }/shoppingCart" class="fa fa-shopping-cart"> 购物车</a></li>
                  </ul>

                  <ul class="nav navbar-nav navbar-right">
                    <li><a href="${APP_PATH }/login">登录</a></li>
                    <li  class="active"><a href="${APP_PATH }/register">注册<span class="sr-only">(current)</span></a></li>
                  </ul>
                </div>
              </div>
            </nav>
        <!-- 导航栏结束 -->
        <!-- 主内容 -->
        <div id="main-container" class="container">

              <!-- 导航标签 -->
              <br><br>
            <ul class="nav nav-tabs" role="tablist">
             <li role="presentation" class="active"><a href="${APP_PATH }/register" aria-controls="home" role="tab" data-toggle="tab">用户注册</a></li>
             <li role="presentation"><a href="${APP_PATH }/bRegister" >商家注册</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
              <!-- 用户注册 -->
             <div role="tabpanel" class="tab-pane active" id="home">
               <div class="row">
                   <div class="col-md-12">
                       <br />
                       <p>
                           <span class="requiredBefore">
                               为必填
                           </span>
                       </p>
                       <br>
                       <form action="${APP_PATH}/register" id="registerForm" method="post">
                       		<!-- 昵称 -->
                        <div class="form-horizontal">
                            <div class="form-group">
                              <label class="col-md-3 control-label"></label>
                              <div class="col-md-6">
                                   <div class="input-group">
                                       <span class="input-group-addon">昵&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp称</span>
                                       <input type="text" class="form-control input-md" name="uNickname" placeholder="请输入好听的昵称"
                                       data-bv-field="uNickName">
                                   </div>
                              </div>
                              <small class="col-md-offset-8 col-md-2" style="color:#e74c3c; margin-top:5px;">只能是汉字，英文和_</small>
                            </div>
                        </div>
                        <br>
                           <!-- 电话号码 -->
                           <div class="form-horizontal">
                               <div class="form-group">
                                 <label class="col-md-3 control-label"></label>
                                 <div class="col-md-6">
                                      <div class="input-group">
                                          <span class="input-group-addon requiredAfter">手机号码</span>
                                          <input type="text" class="form-control input-md" name="uPhone" placeholder="请输入手机号码"
                                          data-bv-different="true" data-bv-different-field="uPassword" data-bv-different-message="手机号不能与密码相同"
                                          data-bv-field="phoneNumber">
                                      </div>
                                 </div>
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
                                          <input type="password" class="form-control input-md" name="uPassword" placeholder="请输入登录密码"
                                          data-bv-identical="true" data-bv-identical-field="passwordConfirm" data-bv-identical-message="两次输入密码不一致"
                                          data-bv-different="true" data-bv-different-field="uPhone" data-bv-different-message="密码不能和手机号相同"
                                          data-bv-field="uPassword">
                                      </div>
                                 </div>
                               </div>
                           </div>
                           <br>
                           <!-- 密码确认 -->
                           <div class="form-horizontal">
                               <div class="form-group">
                                 <label class="col-md-3 control-label"></label>
                                 <div class="col-md-6">
                                      <div class="input-group">
                                          <span class="input-group-addon requiredAfter">确认密码</span>
                                          <input type="password" class="form-control input-md" name="passwordConfirm" placeholder="请再次输入密码"
                                          data-bv-identical="true" data-bv-identical-field="uPassword" data-bv-identical-message="两次输入密码不一致"
                                          data-bv-different="true" data-bv-different-field="phoneNumber" data-bv-different-message="密码不能和手机号一样"
                                          data-bv-field="passwordConfirm">
                                      </div>
                                 </div>
                               </div>
                           </div>
                           <br>
                           <!-- 选择性别 -->
                           <div class="form-horizontal">
                               <div class="form-group">
                                   <label for="" class="col-md-3 control-label"></label>
                                   <div class="col-md-6">
                                       <div class="input-group">
                                         <span class="input-group-addon requiredAfter"  id="genderr">性 别</span>
                                         <div class="btn-group" data-toggle="buttons" style="margin-left:27px;">
                                             <label for="" class="btn btn-default">
                                                 <input type="radio" name="gender" id="opt1" autocomplete="off" data-bv-field="gender">男生
                                             </label>
                                             <label for="" class="btn btn-default">
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
                           <!-- captcha -->
                           <div class="form-horizontal">
                               <div class="form-group">
                                 <label class="col-md-3 control-label"></label>
                                 <div class="col-md-6">
                                      <div class="input-group">
                                          <span class="input-group-addon requiredAfter" id="captchaOpt"></span>
                                          <input type="text" class="form-control" name="captcha" data-bv-field="captcha">
                                      </div>
                                 </div>
                               </div>
                           </div>
                           <br><br>
                           <div class="form-horizontal">
                               <div class="form-group">
                                 <!-- <label class="col-md-5 control-label"></label> -->
                                 <div class="col-md-2 col-md-offset-5">
                                   <input type="submit" id="registerr" class="form-control btn-success" name="Submit" value="注 册">
                                 </div>
                               </div>
                           </div>
                           <br>
                       </form>
                       <div class="row">
                           <div class="col-md-2 col-md-offset-8">
                               <a href="./login.html" class="btn btn-link">已有账号 ?</a>
                           </div>
                       </div>
                       <br><br><br><br><br>
                   </div>
               </div>
             </div>
             <!-- 用户注册结束 -->
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
                generateCaptcha();
                $(registerForm).bootstrapValidator({
                    message: 'This value is not valid!',
                    feedbackIcons:{
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields:{
                    	uNickname:{
                        	validators:{
                                stringLength:{
                                    min: 1,
                                    max: 20,
                                    message: '昵称不超过20个字符'
                                },
                                regexp:{
                                    regexp: /^[A-Za-z_\u4e00-\u9fa5]+$/,
                                    message: '含有非规定的字符'
                                }
                            }
                        },
                        uPhone:{
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
                        uPassword:{
                            validators:{
                                notEmpty:{
                                    message:'密码不能为空'
                                },
                                stringLength:{
                                    min: 6,
                                    max: 16,
                                    message: '密码长度在6~16个字符'
                                },
                                regexp:{
                                    regexp: /^[a-zA-Z0-9_]+$/,
                                    message: '密码只能由英文字母和_组成'
                                }
                            }
                        },
                        passwordConfirm:{
                            validators:{
                                notEmpty:{
                                    message:'密码不一致'
                                }
                            }
                        },
                        gender:{
                            validators:{
                                notEmpty:{
                                    message: '请选择性别'
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
    	       		$("#registerForm").serialize()<%--序列化表单数据--%>
                })
                
                <%--判断是否有消息，有就提示出来--%>
                var msg = $("#message").val();
                if(msg.length != 0){
                	toastr["info"](msg);
                	$("#message").val(""); <%--提示完后清空消息--%>
                }
            });
        </script>
</body>
</html>
