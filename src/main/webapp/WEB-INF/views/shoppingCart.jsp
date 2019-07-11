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
  <title>我的购物车</title>
  <link rel="stylesheet" href="${SourcePath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <link href="${SourcePath }/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
  <link href="${SourcePath }/assets/css/navbar-fixed-top.css" rel="stylesheet">
  <link rel="stylesheet" href="${SourcePath }/font-awesom470/css/font-awesome.min.css">
  <%--引入bootstrap-table的css文件 --%>
  <link rel="stylesheet" href="${SourcePath }/bootstrap-table/bootstrap-table.min.css">
  <%--导入消息提示需要的css --%>
  <link href="${SourcePath }/toastr/toastr.min.css" rel="stylesheet">
  <script src="${SourcePath }/assets/js/ie-emulation-modes-warning.js"></script>
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
                  
                    <li class="active"></i><a href="${APP_PATH }/shoppingCart" class="fa fa-shopping-cart"> 购物车</a></li>
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
        		<h3 style="background-color: #9b59b6; color:white;"> BookStore购物车</h3>
        	</div>
        	<hr>
        	<div id="noThingToShow" style="display: none">
        		<br><br><br><br><br><br><br><br><br>
				<div class="row">
					<span class="col-md-2 col-md-offset-5 col-sm-2 col-sm-offset-5">你的购物车空空如也~</span>
					<br>
				</div>
				<br>
				<div class="row">
					<button class="btn btn-info col-md-2 col-md-offset-5 col-sm-2 col-sm-offset-5" id="selectBtn"">去挑选书籍</button>
				</div>
        	</div>
        	<div class="table-container">
        		<table id="table" rules="rows"></table>
        	</div>
        	<hr>
        	<div class="row">
        		<div>
        			<a class="btn btn-xs col-md-1 col-md-offset-1" id="bentchRemove"><span class="glyphicon glyphicon-trash"></span> 批量删除</a>
        			<span class="col-md-3 col-md-offset-7">总计(不含运费): <span class="now_price" id="ppprice">￥0.00</span></span>
        		</div>
        		<div style="margin-top: 35px;margin-left: 20px;">
        			<button class="btn btn-default col-md-1 col-md-offset-1" id="continue">继续选购</button>
        			<button class="btn btn-danger col-md-1 col-md-offset-8 btn-lg" id="sum">结算</button>
        		</div>
        	</div>
        	<br>
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
        <%--引入bootstrap-table的js文件 --%>
        <script src="${SourcePath }/bootstrap-table/bootstrap-table.min.js"></script>
        <script src="${SourcePath }/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
        <%--导入消息提示需要的css --%>
        <script src="${SourcePath }/toastr/toastr.min.js"></script>
        
        <script type="text/javascript">
        	$(function () {<%--初始化--%>
				<%--//1.页面加载完成后直接发送请求，请求数据--%>
				//getCartDate();
				<%--提示信息初始化--%>
				toastr.options = {
						  "closeButton": false,
						  "debug": false,
						  "newestOnTop": false,
						  "progressBar": false,
						  "positionClass": "toast-top-right",
						  "preventDuplicates": false,
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
				<%--继续选购按钮绑定事件--%>
				$("#continue").click(function () {
					window.location.href="${APP_PATH}/main";
				});
				<%--结算按钮绑定事件--%>
				$("#sum").click(function () {
					//获取表格选中行
					var rows = $table.bootstrapTable('getSelections');
					//判断是否选中行
					if (!rows || rows.length == 0) {
						toastr["info"]("请选择要下单的书籍");
					   return;
					}else {
						toastr["info"]("该功能正在完善中呢亲~");
					}
				})
				$("#bentchRemove").click(function () {
					//获取表格选中行
					var rows = $table.bootstrapTable('getSelections');
					//判断是否选中行
					if (!rows || rows.length == 0) {
						toastr["info"]("请选择要删除的书本哦~");
					   return;
					}else{
						toastr["info"]("开发ing...");
						//$table.bootstrapTable('remove', rows);
						/* var ids = $.map(rows, function (row) {
					        return row.id
					      });
						alert(ids);
					      $table.bootstrapTable('remove', {
					        field: 'id',
					        values: ids
					      })*/
					} 
				})
				<%--表格初始化--%>
				InitMainTable();
				var $table;
		        //初始化bootstrap-table的内容
		        function InitMainTable () {
		            //记录页面bootstrap-table全局变量$table，方便应用
		            var queryUrl = "${APP_PATH}/getCartDate"
		            $table = $('#table').bootstrapTable({
		                url: queryUrl,                      //请求后台的URL（*）
		                method: 'GET',                      //请求方式（*）
		                //toolbar: '#toolbar',              //工具按钮用哪个容器
		                striped: false,                      //是否显示行间隔色
		                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		                pagination: false,                   //是否显示分页（*）
		                sortable: true,                     //是否启用排序
		                sortOrder: "asc",                   //排序方式
		                sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
		                pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
		                //pageSize: rows,                     //每页的记录行数（*）
		                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
		                search: false,                      //是否显示表格搜索
		                strictSearch: true,
		                showColumns: true,                  //是否显示所有的列（选择显示的列）
		                showRefresh: true,                  //是否显示刷新按钮
		                minimumCountColumns: 2,             //最少允许的列数
		                clickToSelect: true,                //是否启用点击选中行
		                //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
		                uniqueId: "extend.cartDate.oId",                     //每一行的唯一标识，一般为主键列
		                showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
		                cardView: false,                    //是否显示详细视图
		                detailView: false,                  //是否显示父子表
		                //formatNoMatches:"你还没有选购书本呢亲~" , 
		                //得到查询的参数
		                queryParams : function (params) {
		                    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
		                    var temp = {   
		                        rows: params.limit,                         //页面大小
		                        //page: (params.offset / params.limit) + 1,   //页码
		                        sort: params.sort,      //排序列名  
		                        sortOrder: params.order //排位命令（desc，asc） 
		                    };
		                    return temp;
		                },
		                columns: [{
		                    checkbox: true,  
		                    visible: true                  //是否显示复选框  
		                }, {
		                    field: 'bName',
		                    title: '商品信息',
		                    formatter: infoFormatter
		                }, {
		                    field: 'bPrice',
		                    title: '单价(元)',
		                    //sortable: true,
		                    formatter: priceFormatter
		                }, {
		                    field: 'oNum',
		                    title: '数量',
		                    //width: 130,
		                    sortable: true,
		                    formatter: numFormatter
		                }, {
		                	field: 'bPrice',
		                	title:'金额',
		                	formatter: totalPriceFormatter
		                },
		                {
		                    field:'ID',
		                    title: '操作',
		                    width: 80,
		                    align: 'center',
		                    valign: 'middle',
		                    formatter: actionFormatter
		                }, ],
		                onLoadSuccess: function (data) {
		                	//alert("数据加载成功！")
		                	console.log(data);
		                },
		                onLoadError: function () {
		                    //showTips("数据加载失败！");
		                    alert("数据加载失败")
		                },
		                onCheck: function (row, $element) {
		                	var pre = $("#ppprice").text().split('￥');
		                	$("#ppprice").empty();
		                	var nowPrice = (row.bPrice*row.oNum*row.bDiscount/10 + parseFloat(pre[1])).toFixed(2);
		                	var t = "￥" + nowPrice;
		                	$("#ppprice").empty();
		                	$("#ppprice").append(t);
						},
						onUncheck: function (row, $element) {
		                	var pre = $("#ppprice").text().split('￥');
		                	$("#ppprice").empty();
		                	var nowPrice = Math.abs((parseFloat(pre[1]) - row.bPrice*row.oNum*row.bDiscount/10)).toFixed(2);
		                	var t = "￥" + nowPrice;
		                	$("#ppprice").empty();
		                	$("#ppprice").append(t);
						},
						onCheckAll: function(rows){
							var sum = 0;
							for(var i = 0; i < rows.length; i++){
								sum += rows[i].bPrice*rows[i].oNum*rows[i].bDiscount
							}
							sum = (sum/10).toFixed(2);
							$("#ppprice").empty();
							$("#ppprice").append("￥"+sum);
						},
						onUncheckAll: function(rows){
							$("#ppprice").empty();
							$("#ppprice").append("￥0.00");
						}
		            });
		        };
			});
        	<%--操作栏的格式化--%>
            function actionFormatter(value, row, index) {
                var id = row.bId;
                var result = "";
                result += "<a href='javascript:;' class='btn' onclick=\"DeleteBybId(" + id + ")\" title='删除'>删除</a>";
                return result;
            }
            <%--商品信息栏的格式化--%>
            function infoFormatter(value, row, index) {
				var result = "";
				result += "<a href='${APP_PATH}/goodsDetail/"+row.bId+"'>"
				+"<img src='${SourcePath }"+row.bPicture+"' alt='...' class='img-rounded' style='width:100px;'>"+row.bName+"</a>";
				return result;
			}
            <%--金额栏的格式化--%>
            function totalPriceFormatter(value, row, index) {
            	var result = "";
            	result += '<span class="search_now_price" id="'+index+'">￥'+(row.bPrice*row.oNum*row.bDiscount/10).toFixed(2)+'</span>';
            	return result;
			}
            <%--单价栏的格式化--%>
            function priceFormatter(value, row, index) {
            	var result = "";
            	result += '<span class="ppre_price">￥'+(row.bPrice*row.bDiscount/10).toFixed(2)+'</span>';
            	return result;
			}
            <%--数量的格式化--%>
            function numFormatter(value, row, index) {
            	//alert(row);
            	var result = "";
            	result += "<span>"+value+"</span>";
            	/* result += '<div class="input-group">'+
					          '<span class="input-group-btn">'+
					          '      <button class="btn btn-default" type="button" id="numSub" onclick="sub()" disabled>-</button>'+
					          '</span>'+
					          '<input type="text" id="bookNum" class="form-control" value="'+row.oNum+'" onchange="inputChange()" style="text-align:center;" disabled>'+
					          '<span class="input-group-btn">'+
					          '     <button class="btn btn-default" type="button" id="numAdd" onclick="add('+index+')">+</button>'+
					          '</span>'+'</div>' */
            	return result;
			}
            function DeleteBybId(bId) {<%--bId为书本的id--%>
				//alert(bId);
				toastr["info"]("开发ing...");
			}
        	function getCartDate() {
				$.ajax({
					url:"${APP_PATH}/getCartDate",
					type:"GET",
					success:function(result){
						console.log(result);
						if(result.code == 200){<%--//如果没有数据--%>
							$("#noThingToShow").hide();
						}else{
							
						}
					},
				});
			}
        	$("#selectBtn").click(function(){
        		window.location.href="${APP_PATH}/main"
        	});
        </script>
        
</body>
</html>
