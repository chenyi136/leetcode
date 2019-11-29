<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>回顶部 - default（居中按钮）|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div style="margin-top:2000px;" data-backend-compiled id="demo-view">
		<div class="am-gotop am-gotop-default" data-am-widget="gotop">
			<a href="#top">
				<span class="am-gotop-title">回到顶部</span>
				<i class="am-gotop-icon am-icon-chevron-up"></i>
			</a>
		</div>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/gallery_one_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/gotop_fixed_0.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="ad197ff4265f1c1e44650f1c48f30aaa" data-title="回顶部 - default（居中按钮）|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>