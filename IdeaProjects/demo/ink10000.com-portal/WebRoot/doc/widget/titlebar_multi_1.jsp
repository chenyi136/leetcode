<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>标题栏 - multi（浅背景上边框） - 多链接|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<div class="am-titlebar am-titlebar-multi" data-am-widget="titlebar">
			<h2 class="am-titlebar-title">科技频道</h2>
			<nav class="am-titlebar-nav">
				<a href="#">手机</a>
				<a href="#">数码</a>
				<a href="#">影音</a>
			</nav>
		</div>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/titlebar_multi_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/titlebar_cols_0.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="f9ac0b3dda932a0e2c3f049819833b51" data-title="标题栏 - multi（浅背景上边框） - 多链接|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>