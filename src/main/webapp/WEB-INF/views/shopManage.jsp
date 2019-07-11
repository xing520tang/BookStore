<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% pageContext.setAttribute("APP_PATH", request.getContextPath()) ;%> 
<% pageContext.setAttribute("SourcePath",request.getContextPath()+"/static"); %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>商店后台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="icon" href="${SourcePath }/imgs/favicon.ico">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${SourcePath }/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
   <link rel="stylesheet" href="${SourcePath }/font-awesom470/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${SourcePath }/bower_components/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${SourcePath }/bower_components/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${SourcePath }/bower_components/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="${SourcePath }/bower_components/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="${SourcePath }/bower_components/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="${SourcePath }/bower_components/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="${SourcePath }/bower_components/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="${SourcePath }/bower_components/bootstrap3-wysihtml5.min.css">
    <%--引入bootstrap-table的css文件 --%>
  <link rel="stylesheet" href="${SourcePath }/bootstrap-table/bootstrap-table.min.css">
    <link href="${SourcePath }/assets/css/backManage.css" rel="stylesheet">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="${APP_PATH }/main" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>B</b>oS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>BookStore</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">切换导航</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- 用户账号: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${SourcePath }/imgs/user2-160x160.jpg" class="user-image" alt="用户图像">
              <span class="hidden-xs">${user.uNickname }</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="${SourcePath }/imgs/user2-160x160.jpg" class="img-circle" alt="用户图像">

                <p>
                  BookStore 店铺管理员
                  <small>注册于 ${user.uRegisterDate }</small>
                </p>
              </li>
              <!-- Menu Body -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="${APP_PATH }/main" class="btn btn-default btn-flat">返回网站主页</a>
                </div>
                <div class="pull-right">
                  <a href="${APP_PATH }/exit" class="btn btn-default btn-flat">退出管理系统</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${SourcePath }/imgs/user2-160x160.jpg" class="img-circle" alt="用户图像">
        </div>
        <div class="pull-left info">
          <p>${user.uNickname }</p>
          <p>店铺管理员</p>
        </div>
      </div>
      <!-- 导航菜单: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">主导航</li>
        <li class="active">
          <a href="${APP_PATH }/shopManage">
            <i class="fa fa-dashboard"></i> <span>店铺总览</span>
            <!-- <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span> -->
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> <span>订单管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li id="toDo"><a href="javascript:void(0);"><i class="fa fa-circle-o"></i> 待处理</a></li>
            <li id="orderList"><a href="javascript:void(0);"><i class="fa fa-circle-o"></i> 订单列表</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-calendar"></i> <span>书本管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li id="addBook"><a href="javascript:void(0);"><i class="fa fa-circle-o"></i> 添加书本</a></li>
            <li id="bookList"><a href="javascript:void(0);"><i class="fa fa-circle-o"></i> 书本列表</a></li>
          </ul>
        </li>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- 内容 -->
  <div class="content-wrapper" id="main-container">
    <!-- Content Header (页眉) -->
    <section class="content-header">
      <h1>
		<span id="headerTitle">网站数据总览</span>
        <small>控制面板</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i><span id="headerTitle1"> 首页</span></a></li>
        <li class="active" id="headerTitle2">仪表盘</li>
      </ol>
    </section>
	<%--订单管理表格 --%>
	<section class="content" id="ttable" style="display: none;">
		<table id="table"></table>
	</section>
	
	<%--书本列表表格 --%>
	<section class="content" id="bookTable" style="display: none;">
		<table id="table1"></table>
	</section>
	
    <!-- 主要内容 -->
    <section class="content" id="main-content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <!-- 新订单数 -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
                <!-- 添加订单数据 -->
              <h3>150</h3>

              <p>新订单</p>
            </div>
            <div class="icon">
              <i class="fa fa-shopping-cart"></i>
            </div>
            <a href="#" class="small-box-footer">更多信息 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>53<sup style="font-size: 20px">%</sup></h3>

              <p>跳出率</p>
            </div>
            <div class="icon">
              <i class="fa fa-pie-chart"></i>
            </div>
            <a href="#" class="small-box-footer">更多信息 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <!-- 用户注册数 -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>

              <p>用户注册</p>
            </div>
            <div class="icon">
              <i class="fa fa-user-plus"></i>
            </div>
            <a href="#" class="small-box-footer">更多信息 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- 网站浏览数-->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65</h3>

              <p>独立访客</p>
            </div>
            <div class="icon">
              <i class="fa fa-pie-chart"></i>
            </div>
            <a href="#" class="small-box-footer">更多信息 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <section class="col-lg-12 connectedSortable">

            <!-- solid sales graph -->
            <div class="box box-solid bg-teal-gradient">
              <div class="box-header">
                <i class="fa fa-th"></i>

                <h3 class="box-title">销售图表</h3>

                <div class="box-tools pull-right">
                  <button type="button" class="btn bg-teal btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                  </button>
                  <button type="button" class="btn bg-teal btn-sm" data-widget="remove"><i class="fa fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="box-body border-radius-none">
                <div class="chart" id="line-chart" style="height: 400px;"></div>
              </div>
              <!-- /.box-body -->

              <!-- /.box-footer -->
            </div>
            <!-- /.box -->

          <!-- 自定义标签 (带有标签的销售额)-->
          <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-right">
              <li class="active"><a href="#revenue-chart" data-toggle="tab">地区</a></li>
              <li><a href="#sales-chart" data-toggle="tab">圆环图</a></li>
              <li class="pull-left header"><i class="fa fa-inbox"></i> 销售额</li>
            </ul>
            <div class="tab-content no-padding">
              <!-- Morris chart - Sales -->
              <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;"></div>
              <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;"></div>
            </div>
          </div>
          <!-- /.nav-tabs-custom -->

        </section>
      </div>

    </section>
    <!-- 主要内容结束 -->
  </div>
  <!-- /内容结束 -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.1
    </div>
    <div class="text-center">
        <strong>Copyright &copy; 2019 <a href="${APP_PATH}/main">BookStore</a>.</strong> All rights
        reserved.
    </div>
  </footer>

  <!-- 控制侧边栏 -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab"> </div>
      <!-- /.tab-pane -->
      <!-- 统计标签内容 -->
      <div class="tab-pane" id="control-sidebar-stats-tab">统计标签内容</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab"> </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- 添加侧边栏的背景。
       这个 div必须放在 control-sidebar 之后 -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="${SourcePath }/js/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${SourcePath }/bower_components/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="${SourcePath }/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="${SourcePath }/bower_components/raphael.min.js"></script>
<script src="${SourcePath }/bower_components/morris.min.js"></script>
<!-- Sparkline -->
<script src="${SourcePath }/bower_components/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="${SourcePath }/bower_components/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${SourcePath }/bower_components/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="${SourcePath }/bower_components/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="${SourcePath }/bower_components/moment.min.js"></script>
<script src="${SourcePath }/bower_components/daterangepicker.js"></script>
<!-- datepicker -->
<script src="${SourcePath }/bower_components/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="${SourcePath }/bower_components/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="${SourcePath }/bower_components/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${SourcePath }/bower_components/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${SourcePath }/bower_components/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${SourcePath }/bower_components/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${SourcePath }/bower_components/demo.js"></script>
<%--引入bootstrap-table的js文件 --%>
        <script src="${SourcePath }/bootstrap-table/bootstrap-table.min.js"></script>
        <script src="${SourcePath }/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<%--初始化 --%>
<script type="text/javascript">
	$(function() {
		<%--表格初始化--%>
		InitMainTable();
	    <%--//初始化bootstrap-table的内容--%>
        var $table;
	    function InitMainTable () {
	        //记录页面bootstrap-table全局变量$table，方便应用
	        //var queryUrl =  "${APP_PATH}/getBOrderInfo"
	        $table = $('#table').bootstrapTable({
	            //url: queryUrl,                      //请求后台的URL（*）
	            //method: 'GET',           //请求方式（*）
	            //toolbar: '#toolbar',              //工具按钮用哪个容器
	            striped: false,                      //是否显示行间隔色
	            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	            pagination: true,                   //是否显示分页（*）
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
	            uniqueId: "oId",                     //每一行的唯一标识，一般为主键列
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
	                visible: false                  //是否显示复选框  
	            }, {
	                field: 'oId',
	                align: 'center',
	                valign: 'middle',
	                sortable: true,
	                title: '订单编号',
	                //formatter: infoFormatter
	            }, {
	                field: 'oState',
	                align: 'center',
	                valign: 'middle',
	                title: '订单状态',
	                formatter: oStateFormatter
	                //formatter: priceFormatter
	            }, {
	            	field: 'bPrice',
	            	 align: 'center',
	                 valign: 'middle',
	            	title:'订单金额',
	            	formatter: totalPriceFormatter
	            },{
	            	field: 'oNum',
	            	 align: 'center',
	                 valign: 'middle',
	                 sortable: true,
	            	title: '数量'
	            },
	            {
	                field: 'bName',
	                title: '商品信息',
	                //width: 130,
	                //sortable: true,
	                formatter: infoFormatter
	            },{
	            	field: 'oDate',
	            	 align: 'center',
	                 valign: 'middle',
	                 sortable: true,
	            	title: '创建日期',
	            		formatter: dateFormatter
	            }, 
	            {
	            	field: 'uPhone',
	            	 align: 'center',
	                 valign: 'middle',
	            	title: '收货人'
	            },{
	            	field: 'uAddress',
	            	 align: 'center',
	                 valign: 'middle',
	            	title: '收货地址'
	            },
	            {
	                field:'oState',
	                title: '操作',
	                align: 'center',
	                valign: 'middle',
	                formatter: actionFormatter
	            }, ],
	            onLoadSuccess: function (data) {
	            	//alert("数据加载成功！")
	            	console.log(data);
					<%--//清空主内容--%>
					$("#main-content").empty();
					$("#ttable").show();
					$("#bookTable").hide();
					$("#headerTitle").empty();
					$("#headerTitle").append("订单管理");
					$("#headerTitle1").empty();
					$("#headerTitle1").append("订单管理");
					$("#headerTitle2").empty();
					$("#headerTitle2").append(headerTitle2);
	            },
	            onLoadError: function () {
	                alert("数据加载失败")
	            },
	        });
	        <%--订单状态的格式化--%>
	        function oStateFormatter(value, row, index) {
	            var id = row.bId;
	            var result = "";
	            if(value == 1){
	            	result += "已发货"
	            }else if(value == 0){
	            	result += "<span style='color:red;'>未发货</span>"
	            }else result += "购物车"
	            return result;
	        };
	        <%--订单金额的格式化--%>
	        function totalPriceFormatter(value, row, index) {
	        	var result = "";
	        	result += '<span class="search_now_price" id="'+index+'">￥'+(row.bPrice*row.oNum*row.bDiscount/10).toFixed(2)+'</span>';
	        	return result;
			}
	        <%--商品信息栏的格式化--%>
	        function infoFormatter(value, row, index) {
				var result = "";
				result += "<a href='${APP_PATH}/goodsDetail/"+row.bId+"' >"
				+"<img src='${SourcePath }"+row.bPicture+"' alt='...' class='img-rounded' style='width:80px;'>"+row.bName+"</a>";
				return result;
			}
	        <%--操作栏格式化--%>
	        function actionFormatter(value, row, index) {
	        	var result = "";
	        	if(value==0){
	        		result += "<button class='btn btn-default' id='"+row.oId+"' onclick='deliverBtnClick("+row.oId+")'>发货</button>"
	        	}else{
	        		result += "无";
	        	}
	        	return result;
			}
	        <%--日期栏格式化--%>
	        function dateFormatter(value, row, index) {
	        	var result = "";
	        	result += '<span>'+(new Date(value).toLocaleDateString())+'</span>';
	        	return result;
			}
	    };
	    
		<%--书本列表表格初始化--%>
		InitMainTable1();
	    <%--//初始化bootstrap-table的内容--%>
        var $table1;
	    function InitMainTable1 () {
	        //记录页面bootstrap-table全局变量$table，方便应用
	        //var queryUrl =  "${APP_PATH}/getBOrderInfo"
	        $table1 = $('#table1').bootstrapTable({
	            //toolbar: '#toolbar',              //工具按钮用哪个容器
	            striped: false,                      //是否显示行间隔色
	            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	            pagination: true,                   //是否显示分页（*）
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
	            uniqueId: "bId",                     //每一行的唯一标识，一般为主键列
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
	                visible: false                  //是否显示复选框  
	            }, {
	                field: 'bId',
	                align: 'center',
	                valign: 'middle',
	                sortable: true,
	                title: '书本编号',
	            }, {
	                field: 'bState',
	                align: 'center',
	                valign: 'middle',
	                title: '书本状态',
	                formatter: oStateFormatter
	                //formatter: priceFormatter
	            }, {
	            	field: 'bPrice',
	            	 align: 'center',
	                 valign: 'middle',
	            	title:'单价',
	            	formatter: singlePriceFormatter
	            },{
	            	field: 'bDiscount',
	            	 align: 'center',
	                 valign: 'middle',
	            	title:'折扣',
	            	formatter: discountFormatter
	            }
	            ,{
	            	field: 'bStock',
	            	 align: 'center',
	                 valign: 'middle',
	                 sortable: true,
	            	title: '库存'
	            },
	            {
	                field: 'bName',
	                title: '书本信息',
	                //width: 130,
	                //sortable: true,
	                formatter: infoFormatter
	            },{
	            	field: 'bPubDate',
	            	 align: 'center',
	                 valign: 'middle',
	                 sortable: true,
	            	title: '出版日期',
	            	formatter: dateFormatter
	            }, 
	            {
	            	field: 'bAuthor',
	            	 align: 'center',
	                 valign: 'middle',
	            	title: '作者'
	            },{
	                field:'oState',
	                title: '操作',
	                align: 'center',
	                valign: 'middle',
	                formatter: actionFormatter
	            }, ],
	        });
	        <%--折扣的格式化--%>
	        function discountFormatter(value, row, index) {
	            var result = "";
				if(value == 10){
					return result += "无";
				}else return result += value.toFixed(2) + "折";
	            return result;
			}
	        <%--书本状态的格式化--%>
	        function oStateFormatter(value, row, index) {
	            var id = row.bId;
	            var result = "";
				if(value == 1){
	            	result += "<span style='color:red;'>已上架</span>"
	            }else result += "待审核"
	            return result;
	        };
	        <%--单价的格式化--%>
	        function singlePriceFormatter(value, row, index) {
	        	var result = "";
	        	result += '<span class="search_now_price" id="'+row.bId+'">￥'+(row.bPrice*row.bDiscount/10).toFixed(2)+'</span>';
	        	return result;
			}
	        <%--商品信息栏的格式化--%>
	        function infoFormatter(value, row, index) {
				var result = "";
				result += "<a href='${APP_PATH}/goodsDetail/"+row.bId+"' >"
				+"<img src='${SourcePath }"+row.bPicture+"' alt='...' class='img-rounded' style='width:80px;'>"+row.bName+"</a>";
				return result;
			}
	        <%--操作栏格式化--%>
	        function actionFormatter(value, row, index) {
	        	var result = "";
	        	if(value==0){
	        		result += "无";
	        	}else{
	        		result += "<button class='btn btn-default btn-xs' id='"+row.bId+"' onclick='editBtnClick("+row.bId+")'>"
	        		+"<span class='glyphicon glyphicon-pencil' aria-hidden='true'>编辑</button>";
	        		result += " <button class='btn btn-danger btn-xs' id='"+row.bId+"' onclick='downBtnClick("+row.bId+")'>"
	        		+"<span class='glyphicon glyphicon-share-alt' aria-hidden='true'>下架</button>";
	        	}
	        	return result;
			}
	        <%--日期栏格式化--%>
	        function dateFormatter(value, row, index) {
	        	var result = "";
	        	result += '<span>'+(new Date(value).toLocaleDateString())+'</span>';
	        	return result;
			}
	    };
	    
	    <%--初始化函数结束--%>
	    <%--给待处理添加点击事件--%>
		$("#toDo").click(function () {
			alert("待处理被点击");
			<%--发送请求--%>
			$.ajax({
				url: "${APP_PATH}/getBOrderInfoToDo",
				type: "GET",
				success: function (data) {
					alert("加载数据成功")
					console.log(data);
					reBuild("待处理")
					$table.bootstrapTable('load', data);
				},
				error: function () {
					alert("加载数据失败");
				}
			});
			//build_borderinfo("${APP_PATH}/getBOrderInfo", "待处理");
		});
		
		<%--给订单列表添加点击事件--%>
		$("#orderList").click(function () {
			alert("订单列表被点击");
			<%--发送请求--%>
			$.ajax({
				url:"${APP_PATH}/getBOrderInfo",
				type:"GET",
				success: function (data) {
					alert("加载数据成功")
					console.log(data);
					reBuild("订单列表")
					$table.bootstrapTable('load', data);
				}
			});
		});
		
		<%--给书本列表添加点击事件--%>
		$("#bookList").click(function () {
			alert("书本列表被点击");
			<%--发送请求--%>
			$.ajax({
				url:"${APP_PATH}/getBookInfo",
				type:"GET",
				success: function (data) {
					alert("加载数据成功")
					console.log(data);
					buildBookList()
					$table1.bootstrapTable('load', data);
				}
			});
		});
		<%--构建书本列表--%>
		function buildBookList() {
			<%--//清空主内容--%>
			$("#main-content").empty();
			$("#ttable").hide();
			$("#bookTable").show();
			$("#headerTitle").empty();
			$("#headerTitle").append("书本管理");
			$("#headerTitle1").empty();
			$("#headerTitle1").append("书本管理");
			$("#headerTitle2").empty();
			$("#headerTitle2").append("书本列表");
		}
		<%--重构页面--%>
		function reBuild(headerTitle2) {
			<%--//清空主内容--%>
			$("#main-content").empty();
			$("#ttable").show();
			$("#headerTitle").empty();
			$("#bookTable").hide();
			$("#headerTitle").append("订单管理");
			$("#headerTitle1").empty();
			$("#headerTitle1").append("订单管理");
			$("#headerTitle2").empty();
			$("#headerTitle2").append(headerTitle2);
		}
	});
	
	<%--得到所有商家所有订单信息--%>
	function getBOrderInfo() {
		$.ajax({
			url:"${APP_PATH}/getBOrderInfo",
			type:"GET",
			success: function (result) {
				console.log(result);
				清空主内容
				$("#main-content").empty();
				$("#main-content").append($("<table id='table'></table>"));
				构建表格显示
				build_borderinfo(result);
			}
		});
	}
	
	function deliverBtnClick(oId) {
		alert("发货功能正在编辑中....."+oId);
	}
	function editBtnClick(bId) {
		alert("编辑功能正在编辑中....."+bId);
	}
	function downBtnClick(bId) {
		alert("下架功能正在编辑中....."+bId);
	}
</script>
</body>
</html>
