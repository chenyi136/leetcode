<%@ page language="java" import="com.mc.portal.tool.html.First" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
First.ICONS.put("dashboard", "帮助");
First.ICONS.put("envelope-o", "邮箱");
First.ICONS.put("font", "图标");
First.ICONS.put("html5", "网页");
First.ICONS.put("info-circle", "资料");
First.ICONS.put("pinterest", "接口");
First.ICONS.put("tasks", "事项");
%>
<header class="am-topbar am-topbar-inverse" id="j_head">
	<div id="j_alert"></div>
	<div class="am-topbar-brand">
		<strong><a href="${ROOT}admin/index.htm">${SITE}</a></strong>
		<small> v1.0</small>
	</div>
	<div class="am-topbar-collapse">
		<ul class="am-topbar-nav am-topbar-right am-nav am-nav-pills">
			<li><a href="notify/index.htm" class="<%=First.icon("envelope-o")%>"> 收件箱 <b class="am-badge am-badge-warning" id="j_notify">0</b></a></li>
			<li><a href="task/index.htm" class="<%=First.icon("tasks")%>"> 待办事项</a></li>
			<li><a href="share/help.htm" class="<%=First.icon("dashboard")%>"> 帮助文档</a></li>
			<li class="am-dropdown" data-am-dropdown>
				<a class="am-dropdown-toggle" data-am-dropdown-toggle><i class="<%=First.icon("user")%>"></i> 娄满朝 <i class="<%=First.icon("caret-down")%>"></i></a>
				<ul class="am-dropdown-content">
					<li><a href="admin/profile.htm" class="<%=First.icon("info-circle")%>"> 个人资料</a></li>
					<li><a href="admin/param.htm" class="<%=First.icon("cog")%>"> 我的设置</a></li>
					<li><a href="daily/index.htm" class="<%=First.icon("at")%>"> 我的日志</a></li>
					<li><a href="share/nozzle.htm" class="<%=First.icon("pinterest")%>"> 接口文档</a></li>
					<li><a href="share/doc.htm" class="<%=First.icon("html5")%>"> 前端开发</a></li>
					<li><a href="share/icon.htm" class="<%=First.icon("font")%>"> 系统图标</a></li>
					<li><a href="feedback/index.htm" class="<%=First.icon("question-circle")%>"> 意见反馈</a></li>
					<li><a href="logout.htm" class="<%=First.icon("power-off")%>"> 退出系统</a></li>
				</ul>
			</li>
			<li><a class="<%=First.icon("arrows-alt")%>" id="j_screen"></a></li>
		</ul>
	</div>
</header>