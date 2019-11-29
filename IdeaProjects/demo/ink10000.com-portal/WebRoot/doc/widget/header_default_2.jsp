<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>页头 - default（深色背景） - 图标+文字|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<header class="am-header am-header-default" data-am-widget="header">
			<div class="am-header-nav am-header-left">
				<a href="#">
					<span class="am-header-nav-title">首页</span>
					<i class="am-header-icon am-icon-home"></i>
				</a>
			</div>
			<h1 class="am-header-title">Amaze UI</h1>
			<div class="am-header-nav am-header-right">
				<a href="#">
					<span class="am-header-nav-title">菜单</span>
					<i class="am-header-icon am-icon-bars"></i>
				</a>
			</div>
		</header>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/header_default_1.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/header_default_3.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="87790bceab7124730685c10fffab5024" data-title="页头 - default（深色背景） - 图标+文字|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>