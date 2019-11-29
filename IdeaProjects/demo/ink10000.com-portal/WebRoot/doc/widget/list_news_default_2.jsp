<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>内容列表 - default（默认） - 带摘要|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<div class="am-list-news am-list-news-default" data-am-widget="list_news">
			<div class="am-list-news-hd am-cf">
				<a href="#">
					<ins>
						<h2>栏目标题</h2>
						<span class="am-list-news-more am-fr">更多 &raquo;</span>
					</ins>
				</a>
			</div>
			<div class="am-list-news-bd">
				<ul class="am-list">
					<li class="am-g am-list-item-desced">
						<a href="#" class="am-list-item-hd">我很囧，你保重....晒晒旅行中的那些囧！</a>
						<div class="am-list-item-text">囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！</div>
					</li>
					<li class="am-g am-list-item-desced">
						<a href="#" class="am-list-item-hd">我最喜欢的一张画</a>
						<div class="am-list-item-text">你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，</div>
					</li>
					<li class="am-g"><a href="#" class="am-list-item-hd">“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！</a></li>
				</ul>
			</div>
		</div>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/list_news_default_1.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/list_news_default_3.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="55f6d33aac3d1ff62d456ec5c32fd942" data-title="内容列表 - default（默认） - 带摘要|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>