<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>内容列表 - one（简约风格） - 默认|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<div class="am-list-news am-list-news-one" data-am-widget="list_news">
			<div class="am-list-news-hd am-cf"><a href="#"><ins><h2>综合新闻</h2></ins></a></div>
			<div class="am-list-news-bd">
				<ul class="am-list">
					<li class="am-g am-list-item-dated">
						<a href="#" class="am-list-item-hd">我很囧，你保重....晒晒旅行中的那些囧！</a>
						<span class="am-list-date">2013-09-18</span>
					</li>
					<li class="am-g am-list-item-dated">
						<a href="#" class="am-list-item-hd">我最喜欢的一张画</a>
						<span class="am-list-date">2013-10-14</span>
					</li>
					<li class="am-g am-list-item-dated">
						<a href="#" class="am-list-item-hd">“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！</a>
						<span class="am-list-date">2013-11-18</span>
					</li>
				</ul>
			</div>
			<div class="am-list-news-ft"><a href="#" class="am-list-news-more am-btn am-btn-default">更多 &raquo;</a></div>
		</div>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/list_news_default_7.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/list_news_one_1.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="52a29990bb462a9dd380b184da59533b" data-title="内容列表 - one（简约风格） - 默认|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>