<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>图片轮播 - d2（浮层标题+底部圆形控制点）|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<div class="am-slider am-slider-d2" data-am-widget="slider" data-am-slider="{'directionNav':false}">
			<ul class="am-slides">
				<li>
					<img src="doc/image/bing-1.jpg">
					<div class="am-slider-desc">
						<div class="am-slider-content">
							<h2 class="am-slider-title">远方有一个地方 那里种有我们的梦想</h2>
							<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
						</div>
						<a href="#" class="am-slider-more">了解更多</a>
					</div>
				</li>
				<li>
					<img src="doc/image/bing-2.jpg">
					<div class="am-slider-desc">
						<div class="am-slider-content">
							<h2 class="am-slider-title">某天也许会相遇 相遇在这个好地方</h2>
							<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
						</div>
						<a href="#" class="am-slider-more">了解更多</a>
					</div>
				</li>
				<li>
					<img src="doc/image/bing-3.jpg">
					<div class="am-slider-desc">
						<div class="am-slider-content">
							<h2 class="am-slider-title">不要太担心 只因为我相信 终会走过这条遥远的道路</h2>
							<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
						</div>
						<a href="#" class="am-slider-more">了解更多</a>
					</div>
				</li>
				<li>
					<img src="doc/image/bing-4.jpg">
					<div class="am-slider-desc">
						<div class="am-slider-content">
							<h2 class="am-slider-title">OH PARA PARADISE 是否那么重要 你是否那么地遥远</h2>
							<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
						</div>
						<a href="#" class="am-slider-more">了解更多</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/slider_d1_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/slider_d3_0.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="23ff44fcb1e693429124d9cfb68cdb31" data-title="图片轮播 - d2（浮层标题+底部圆形控制点）|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>