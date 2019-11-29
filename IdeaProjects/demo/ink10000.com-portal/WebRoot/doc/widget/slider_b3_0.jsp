<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>图片轮播 - b3（图片外左右箭头）|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<div class="am-slider am-slider-b3" data-am-widget="slider" data-am-slider="{'controlNav':false}">
			<ul class="am-slides">
				<li><img src="doc/image/bing-1.jpg"></li>
				<li><img src="doc/image/bing-2.jpg"></li>
				<li><img src="doc/image/bing-3.jpg"></li>
				<li><img src="doc/image/bing-4.jpg"></li>
				<li><img src="doc/image/bing-1.jpg"></li>
				<li><img src="doc/image/bing-2.jpg"></li>
				<li><img src="doc/image/bing-3.jpg"></li>
				<li><img src="doc/image/bing-4.jpg"></li>
			</ul>
		</div>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/slider_b2_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/slider_b4_0.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="65399794898d8728757ed3ec6a5062ee" data-title="图片轮播 - b3（图片外左右箭头）|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>