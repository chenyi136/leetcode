<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>菜单 - dropdown1（下拉全宽） - 文字触发|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<nav class="am-menu am-menu-dropdown1" data-am-widget="menu" data-am-menu-collapse>
			<a href="javascript:;" class="am-menu-toggle">
				<span class="am-menu-toggle-title">菜单</span>
				<i class="am-menu-toggle-icon am-icon-angle-right"></i>
			</a>
			<ul class="am-avg-sm-1 am-collapse am-menu-nav">
				<li class="am-parent">
					<a href="#">公司</a>
					<ul class="am-menu-sub am-collapse am-avg-sm-2">
						<li><a href="#">公司</a></li>
						<li><a href="#">人物</a></li>
						<li><a href="#">趋势</a></li>
						<li><a href="#">投融资</a></li>
						<li><a href="#">创业公司</a></li>
						<li><a href="#">创业人物</a></li>
						<li class="am-menu-nav-channel"><a href="#">进入栏目 &raquo;</a></li>
					</ul>
				</li>
				<li class="am-parent">
					<a href="#">人物</a>
					<ul class="am-avg-sm-3 am-collapse am-menu-sub">
						<li><a href="#">公司</a></li>
						<li><a href="#">人物</a></li>
						<li><a href="#">趋势</a></li>
						<li><a href="#">投融资</a></li>
						<li><a href="#">创业公司</a></li>
						<li><a href="#">创业人物</a></li>
					</ul>
				</li>
				<li class="am-parent">
					<a href="#">趋势</a>
					<ul class="am-avg-sm-4 am-collapse am-menu-sub">
						<li><a href="#">公司</a></li>
						<li><a href="#">人物</a></li>
						<li><a href="#">趋势</a></li>
						<li><a href="#">投融资</a></li>
						<li><a href="#">创业公司</a></li>
						<li><a href="#">创业人物</a></li>
						<li class="am-menu-nav-channel"><a href="#">泥煤 &raquo;</a></li>
					</ul>
				</li>
				<li class="am-parent">
					<a href="#">投融资</a>
					<ul class="am-avg-sm-3 am-collapse am-menu-sub">
						<li><a href="#">公司</a></li>
						<li><a href="#">人物</a></li>
						<li><a href="#">趋势</a></li>
						<li><a href="#">投融资</a></li>
						<li><a href="#">创业公司</a></li>
						<li><a href="#">创业人物</a></li>
					</ul>
				</li>
				<li><a href="#">创业公司</a></li>
				<li><a href="#">创业人物</a></li>
			</ul>
		</nav>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/menu_dropdown1_1.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/menu_dropdown2_0.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="5ad0f7210961c5a3c632bc43559a44d8" data-title="菜单 - dropdown1（下拉全宽）-文字触发|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>