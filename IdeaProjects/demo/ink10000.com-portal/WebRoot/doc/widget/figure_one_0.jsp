<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>单张图片 - one（简约风格）|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<figure class="am-figure am-figure-one" data-am-widget="figure" data-am-figure="{pureview:'auto'}">
			<img src="doc/image/bing-1.jpg" alt="春天的花开秋天的风以及冬天的落阳" data-rel="doc/image/bing-1.jpg">
			<figcaption class="am-figure-capition-btm">春天的花开秋天的风以及冬天的落阳</figcaption>
		</figure>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/figure_default_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/footer_default_0.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="93026b78e6eb79a5f995723accaf2bf0" data-title="单张图片 - one（简约风格）|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>