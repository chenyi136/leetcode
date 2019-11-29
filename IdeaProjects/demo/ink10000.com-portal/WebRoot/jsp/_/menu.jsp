<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="j_menu">
	<ul class="am-list">
		<li><form action="search/index.htm" id="j_filter"><input type="text" placeholder="快速搜索内容" name="key"></form></li>
		<li><a href="admin/index.htm" class="am-icon-building"> 首页</a></li>
		<li>
			<a href="javascript:void(1531795402209);" data-am-collapse="{target:'#j_blog'}">
				<i class="am-icon-building"> 云享部落</i>
				<i class="am-margin-right am-icon-angle-right am-fr"></i>
			</a>
			<ul class="am-list am-collapse" id="j_blog">
				<li><a href="blog/catena/list.htm" class="am-icon-database"> 视频系列</a></li>
			</ul>
		</li>
	</ul>
	<!-- <div class="am-panel am-panel-default">
		<div class="am-panel-bd">
			<p class="am-icon-bookmark"> 公告</p>
			<p>时光静好，与君语；细水流年，与君同。—— Amaze UI</p>
		</div>
	</div> -->
</div>