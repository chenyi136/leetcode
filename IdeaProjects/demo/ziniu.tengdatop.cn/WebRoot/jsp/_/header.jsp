<%@ page language="java" import="
com.ziniu.pojo.OnlineInfo,
com.ziniu.tool.ServletTool" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%OnlineInfo online = ServletTool.getOnline(request);%>
<header>
	<div class="headerwrapper">
		<div class="header-left">
			<a href="${ROOT}" class="logo"><img src="_/images/logo.png" style="width:230px;height:65px;"></a>
			<div class="pull-right"><a class="menu-collapse"><i class="fa fa-bars"></i></a></div>
		</div>
		<div class="header-right">
			<div class="pull-right">
				<div class="btn-group btn-group-option">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<img src="<%=online.face%>" class="img-circle avatar-img">
						<span class="user-name"><%=online.name%></span>
						<i class="fa fa-caret-down"></i>
					</button>
					<ul class="dropdown-menu pull-right">
						<li><a href="logout.htm"><i class="glyphicon glyphicon-log-out"></i>退出登录</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>