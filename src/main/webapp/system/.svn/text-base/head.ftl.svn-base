<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword"
	content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<link rel="shortcut icon" href="img/favicon.png">
<title>${SYS_SITENAME} - 后台</title>
<!-- Bootstrap core CSS -->
<link href="${basePath}/system/css/bootstrap.min.css" rel="stylesheet">
<link href="${basePath}/system/css/bootstrap-reset.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${basePath}/system/css/gallery.css" />	
<!--external css-->
<link
	href="${basePath}/system/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link href="${basePath}/system/assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />	
<link href="${basePath}/system/assets/ueditor1/third-party/SyntaxHighlighter/shCoreDefault.css" rel="stylesheet" />	
<!-- Custom styles for this template -->
<link href="${basePath}/system/css/style.css" rel="stylesheet">
<link href="${basePath}/system/css/style-responsive.css" rel="stylesheet" />
<link href="${basePath}/system/assets/uploadify/uploadify.css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
      <script src="${basePath}/system/js/html5shiv.js"></script>
      <script src="${basePath}/system/js/respond.min.js"></script>
    <![endif]-->
	<script type="text/javascript">
		window.BasePath = "${basePath}";
		window.ContextPath = "${contextPath}";
		kindId = 0;
		kind = "article";
	</script>
<script src="${basePath}/system/js/jquery.js"></script>
</head>
<body>
	<section id="container" class="">
		<!--header start-->
		<header class="header white-bg">
			<!--logo start-->
			<a href="${basePath}/index.htm" class="logo" title="访问前台页面">
				<img src="${basePath}/system/images/logo.png" style="height: 38px;" />
			</a>
			<!--logo end-->
			<div class="nav notify-row" id="top_menu">
				<!--  notification goes here -->
			</div>
			<div class="top-nav ">

				<ul class="nav pull-right top-menu">
                  <!-- user login dropdown start-->
                  <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                          <span class="username">${SESSION_ADMIN.email}</span>
                          <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu extended logout">
                          <div class="log-arrow-up"></div>
                          <li><a href="${basePath}/admin/admin/update.htm"><i class="icon-cog"></i> 设置</a></li>
                          <li><a href="${basePath}/auth/admin/logout.htm"><i class="icon-key"></i> 安全退出</a></li>
                      </ul>
                  </li>
                  <!-- user login dropdown end -->
              </ul>
          
			</div>
		</header>
		<!--header end-->
		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu goes here-->
				<ul class="sidebar-menu" id="nav-accordion">
					<#if rootmenus?exists && rootmenus?size &gt; 0>
						<#list rootmenus as item>
							<li class="sub-menu">
								<a <#if item.bindmenu?exists && menu==item.bindmenu>class="active"</#if> href="<#if item.url?exists && item.url=='javascript:void(0);'>${item.url!''}<#else>${basePath}${item.url!''}</#if>"> <i class="${item.icon!''}"></i> <span>${item.name!''}</span></a>
								<#if item.childs?exists && item.childs?size &gt; 0>
									<#list item.childs as childmenu>
										<ul class="sub">
											<li <#if childmenu.bindmenu?exists && submenu==childmenu.bindmenu>class="active"</#if>><a href="${basePath}${childmenu.url!''}">${childmenu.name!''}</a></li>
										</ul>
									</#list>
								</#if>
							</li>
						</#list>
					</#if>
				</ul>
			</div>
		</aside>
		<!--sidebar end-->		
