<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--[if lte IE 9]>
	<div class="am-alert am-alert-danger ie-warning" data-am-alert>
		<button type="button" class="am-close">&times;</button>
		<div class="am-container">365 安全卫士提醒：你的浏览器太古董了，妹子无爱，<a href="#">速速点击换一个</a>！</div>
	</div>
<![endif]-->
<div style="height:40px;background:#444;" class="am-projects">
	<div class="am-cf amz-container">
		<nav class="am-projects-nav">
			<a href="#" class="active">Web</a>
			<a href="#">Touch</a>
		</nav>
		<nav class="am-projects-misc"><a href="#"><span class="am-icon-comments-o"></span> 社区</a></nav>
	</div>
</div>
<header id="amz-header">
	<div class="amz-container am-cf">
		<h1><a href="doc/index.jsp">Amaze UI</a></h1>
		<button class="am-show-sm-only am-btn am-btn-primary" data-am-collapse="{target:'.amz-header-nav'}">
			<span class="am-sr-only">&nbsp;</span>
			<span class="am-icon-bars"></span>
		</button>
		<nav>
			<ul class="am-collapse amz-header-nav">
				<%
					int type = Integer.parseInt(request.getParameter("type"));
					String[][] menu = new String[][] {
						{ "doc/start/index.jsp", "开始使用" },
						{ "doc/css/index.jsp", "CSS" },
						{ "doc/plugin/index.jsp", "JS 插件" },
						{ "doc/widget/index.jsp", "Web 组件" },
						{ "doc/about/index.jsp", "关于" }
					};
					for (int i = 0; i < menu.length; i++) {
						out.println("<li" + (i == type ? " class=\"am-active\"" : "") + "><a href=\"" + menu[i][0] + "\">" + menu[i][1] + "</a></li>");
					}
				%>
				<li class="amz-cse">
					<form class="cse-form">
						<input type="text" placeholder="搜索" name="q">
						<button><span class="am-icon-search"></span></button>
					</form>
				</li>
			</ul>
		</nav>
	</div>
</header>
<div class="amz-banner">
	<div class="amz-container" data-am-scrollspy="{animation:'scale-up',repeat:false}">
	<%
		String[][] title = new String[][] {
			{ "开始使用", "Amaze UI 概览，下载、使用，模板示例，二次开发……" },
			{ "CSS", "浏览器默认样式统一，基础样式，网格，表格、表单、按钮及常用组件样式。" },
			{ "JS 插件", "Amaze UI JS 插件，使用注意事项，以及 JS 插件介绍。" },
			{ "Web 组件", "兼容大多浏览器的类 Web Components 组件" },
			{ "关于我们", "关于我们" }
		};
		out.append("<h1>" + title[type][0] + "</h1>");
		out.append("<p>" + title[type][1] + "</p>");
	%>
	</div>
</div>