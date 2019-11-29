<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>图片轮播 - default（默认） - 标题|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<div class="am-slider am-slider-default" data-am-widget="slider" data-am-slider="{'animation':'slide','slideshow':false}">
			<ul class="am-slides">
				<li>
					<img src="doc/image/bing-1.jpg">
					<div class="am-slider-desc">这是标题标题标题标题标题标题标题0</div>
				</li>
				<li>
					<img src="doc/image/bing-2.jpg">
					<div class="am-slider-desc">这是标题标题标题标题标题标题标题1</div>
				</li>
				<li>
					<img src="doc/image/bing-3.jpg">
					<div class="am-slider-desc">这是标题标题标题标题标题标题标题2</div>
				</li>
				<li>
					<img src="doc/image/bing-4.jpg">
					<div class="am-slider-desc">这是标题标题标题标题标题标题标题3</div>
				</li>
			</ul>
		</div>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/slider_default_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/slider_default_2.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="aae4c6b01c18c2e625bb583f7d5d9d84" data-title="图片轮播 - default（默认） - 标题|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>