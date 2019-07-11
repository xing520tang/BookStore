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
  <link rel="icon" href="./favicon.ico">
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->


  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index.html" class="logo">
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
          <a href="JavaScript:void(0)">
            <i class="fa fa-dashboard"></i> <span>店铺总览</span>
            <!-- <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span> -->
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>图表</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>
            <li><a href="pages/charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>
            <li><a href="pages/charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
            <li><a href="pages/charts/inline.html"><i class="fa fa-circle-o"></i> 内嵌式图表</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>UI元素</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/UI/general.html"><i class="fa fa-circle-o"></i> 常规</a></li>
            <li><a href="pages/UI/icons.html"><i class="fa fa-circle-o"></i> 图标</a></li>
            <li><a href="pages/UI/buttons.html"><i class="fa fa-circle-o"></i> 按钮</a></li>
            <li><a href="pages/UI/sliders.html"><i class="fa fa-circle-o"></i> 滑块</a></li>
            <li><a href="pages/UI/timeline.html"><i class="fa fa-circle-o"></i> 时间线</a></li>
            <li><a href="pages/UI/modals.html"><i class="fa fa-circle-o"></i> 弹框</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-edit"></i> <span>表单</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/forms/general.html"><i class="fa fa-circle-o"></i> 常规元素</a></li>
            <li><a href="pages/forms/advanced.html"><i class="fa fa-circle-o"></i> 高级元素</a></li>
            <li><a href="pages/forms/editors.html"><i class="fa fa-circle-o"></i> 编辑器</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> <span>表格</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/tables/simple.html"><i class="fa fa-circle-o"></i> 表格</a></li>
            <li><a href="pages/tables/data.html"><i class="fa fa-circle-o"></i> 数据表格</a></li>
          </ul>
        </li>
        <li>
          <a href="pages/calendar.html">
            <i class="fa fa-calendar"></i> <span>日历</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-red">3</small>
              <small class="label pull-right bg-blue">17</small>
            </span>
          </a>
        </li>
        <li>
          <a href="pages/mailbox/mailbox.html">
            <i class="fa fa-envelope"></i> <span>邮箱</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-yellow">12</small>
              <small class="label pull-right bg-green">16</small>
              <small class="label pull-right bg-red">5</small>
            </span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-folder"></i> <span>示例</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/examples/invoice.html"><i class="fa fa-circle-o"></i> 单据</a></li>
            <li><a href="pages/examples/profile.html"><i class="fa fa-circle-o"></i> 资料</a></li>
            <li><a href="pages/examples/login.html"><i class="fa fa-circle-o"></i> 登录</a></li>
            <li><a href="pages/examples/register.html"><i class="fa fa-circle-o"></i> 注册</a></li>
            <li><a href="pages/examples/lockscreen.html"><i class="fa fa-circle-o"></i> 锁屏</a></li>
            <li><a href="pages/examples/404.html"><i class="fa fa-circle-o"></i> 404 错误</a></li>
            <li><a href="pages/examples/500.html"><i class="fa fa-circle-o"></i> 500 错误</a></li>
            <li><a href="pages/examples/blank.html"><i class="fa fa-circle-o"></i> 空白页</a></li>
            <li><a href="pages/examples/pace.html"><i class="fa fa-circle-o"></i> 页面加载进度</a></li>
          </ul>
        </li>
        <!-- <li class="treeview">
          <a href="#">
            <i class="fa fa-share"></i> <span>多级菜单</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> 层级1</a></li>
            <li class="treeview">
              <a href="#"><i class="fa fa-circle-o"></i> 层级1
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> 层级2</a></li>
                <li class="treeview">
                  <a href="#"><i class="fa fa-circle-o"></i> 层级2
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                  </a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> 层级3</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 层级3</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li><a href="#"><i class="fa fa-circle-o"></i> 层级1</a></li>
          </ul>
        </li> -->
        <!-- <li class="header">标签</li>
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>重要</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>警告</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>信息</span></a></li> -->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (页眉) -->
    <section class="content-header">
      <h1>
网站数据总览
        <small>控制面板</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active">仪表盘</li>
      </ol>
    </section>

    <!-- 主要内容 -->
    <section class="content">
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

          <!-- Chat box -->
          <div class="box box-success">
            <div class="box-header">
              <i class="fa fa-comments-o"></i>

              <h3 class="box-title">聊天</h3>

              <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
                <div class="btn-group" data-toggle="btn-toggle">
                  <button type="button" class="btn btn-default btn-sm active"><i class="fa fa-square text-green"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-square text-red"></i></button>
                </div>
              </div>
            </div>
            <div class="box-body chat" id="chat-box">
              <!-- chat item -->
              <div class="item">
                <img src="dist/img/user4-128x128.jpg" alt="用户图像" class="online">

                <p class="message">
                  <a href="#" class="name">
                    <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 2:15</small>
                    Mike Doe
                  </a>
                  我想和你谈谈新主题最新消息。
                  他们说这是市场上
                  最好的主题。
                </p>
                <div class="attachment">
                  <h4>附件：</h4>

                  <p class="filename">
                    Theme-thumbnail-image.jpg
                  </p>

                  <div class="pull-right">
                    <button type="button" class="btn btn-primary btn-sm btn-flat">打开</button>
                  </div>
                </div>
                <!-- /.attachment -->
              </div>
              <!-- /.item -->
              <!-- chat item -->
              <div class="item">
                <img src="dist/img/user3-128x128.jpg" alt="用户图像" class="offline">

                <p class="message">
                  <a href="#" class="name">
                    <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:15</small>
                    Alexander Pierce
                  </a>
                  我想和你谈谈新主题最新消息。
                  他们说这是市场上
                  最好的主题。
                </p>
              </div>
              <!-- /.item -->
              <!-- chat item -->
              <div class="item">
                <img src="dist/img/user2-160x160.jpg" alt="用户图像" class="offline">

                <p class="message">
                  <a href="#" class="name">
                    <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:30</small>
                    Susan Doe
                  </a>
                  我想和你谈谈新主题最新消息。
                  他们说这是市场上
                  最好的主题。
                </p>
              </div>
              <!-- /.item -->
            </div>
            <!-- /.chat -->
            <div class="box-footer">
              <div class="input-group">
                <input class="form-control" placeholder="输入消息...">

                <div class="input-group-btn">
                  <button type="button" class="btn btn-success"><i class="fa fa-plus"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- /.box (chat box) -->

          <!-- 快速邮件 -->
          <div class="box box-info">
            <div class="box-header">
              <i class="fa fa-envelope"></i>

              <h3 class="box-title">快速邮件</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip"
                        title="移除">
                  <i class="fa fa-times"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <div class="box-body">
              <form action="#" method="post">
                <div class="form-group">
                  <input type="email" class="form-control" name="emailto" placeholder="发邮件给：">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="subject" placeholder="主题">
                </div>
                <div>
                  <textarea class="textarea" placeholder="消息"
                            style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                </div>
              </form>
            </div>
            <div class="box-footer clearfix">
              <button type="button" class="pull-right btn btn-default" id="sendEmail">发送
                <i class="fa fa-arrow-circle-right"></i></button>
            </div>
          </div>



        </section>
        <!-- /.Left col -->

        <!-- right col (We are only adding the ID to make the widgets sortable)-->
        <!-- <section class="col-lg-5 connectedSortable">

        </section> -->
        <!-- right col -->
      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.1
    </div>
    <div class="text-center">
        <strong>Copyright &copy; 2019 <a href="${APP_PATH }/main">BookStore</a>.</strong> All rights
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
</body>
</html>
