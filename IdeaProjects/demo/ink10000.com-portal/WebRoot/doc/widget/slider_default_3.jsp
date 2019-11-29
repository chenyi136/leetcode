<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>图片轮播 - default（默认） - 缩略图|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<div class="am-slider am-slider-default" data-am-widget="slider" data-am-slider="{'animation':'slide','controlNav':'thumbnails'}">
			<ul class="am-slides">
				<li data-thumb="doc/image/bing-1.jpg"><img src="doc/image/bing-1.jpg"></li>
				<li data-thumb="doc/image/bing-2.jpg"><img src="doc/image/bing-2.jpg"></li>
				<li data-thumb="doc/image/bing-3.jpg"><img src="doc/image/bing-3.jpg"></li>
				<li data-thumb="doc/image/bing-4.jpg"><img src="doc/image/bing-4.jpg"></li>
			</ul>
		</div>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/slider_default_2.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/slider_a1_0.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="0b8e83a0ead4b869bc89876b6d0ba0d4" data-title="图片轮播 - default（默认） - 缩略图|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>