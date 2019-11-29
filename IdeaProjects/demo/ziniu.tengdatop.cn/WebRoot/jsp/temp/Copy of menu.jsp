<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<div class="leftpanel">
			<!-- <div class="media profile-left">
				<div class="ta-c"><a href="#" class="profile-thumb"><img src="_/picture/profile.png" class="img-circle"></a></div>
				<div style="display:block;" class="media-body ta-c">
					<h4 class="media-heading">Salma Hayek</h4>
					<span class="user-options media-body">
						<a href="#"><i class="glyphicon glyphicon-user"></i></a>
						<a href="#"><i class="glyphicon glyphicon-envelope"></i></a>
						<a href="#"><i class="glyphicon glyphicon-cog"></i></a>
						<a href="#"><i class="glyphicon glyphicon-log-out"></i></a>
					</span>
				</div>
			</div> -->
			<ul class="nav nav-pills nav-stacked">
				<li><a href="index.htm"><i class="fa fa-home"></i><span>舆情概览</span></a></li>
				<li class="parent">
					<a href="javascript:;"><i class="fa fa-suitcase"></i><span>实时舆情</span></a>
					<ul class="children">
						<li><a href="analyze/news.htm">新闻</a></li>
						<li><a href="analyze/blog.htm">博客</a></li>
					</ul>
				</li>
				<li class="parent">
					<a href="javascript:;"><i class="fa fa-envelope-o"></i><span>舆情分析</span></a>
					<ul class="children">
						<li><a href="keyword/index.htm">词语分析</a></li>
						<li><a href="media/index.htm">来源分析</a></li>
					</ul>
				</li>
				<li><a href="jsp/2-baogao.jsp"><i class="fa fa-bar-chart-o"></i><span>数据报告</span></a></li>
				<li class="parent">
					<a href="javascript:;"><i class="fa fa-suitcase"></i><span>个人中心</span></a>
					<ul class="children">
						<li><a href="jsp/3-xinxi.jsp">基本信息</a></li>
						<li><a href="program/load.htm">快速设置</a></li>
						<li><a href="jsp/4-chongzhi.jsp">充值中心</a></li>
					</ul>
				</li>
			</ul>
			<div class="public_qr_code"><img src="_/images/qr_code.jpg"></div>
		</div>