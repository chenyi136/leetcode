<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>标题栏 - default（左边框） - 文字标题|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<div class="am-titlebar am-titlebar-default" data-am-widget="titlebar">
			<h2 class="am-titlebar-title">栏目标题</h2>
			<nav class="am-titlebar-nav"><a href="#">more &raquo;</a></nav>
		</div>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/tabs_one_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/titlebar_default_1.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="7f6318454e0c83ef3e93a8f3d1890f8f" data-title="标题栏 - default（左边框） - 文字标题|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>