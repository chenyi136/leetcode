<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>分页 - default（扁平按钮）|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<ul class="am-pagination am-pagination-default" data-am-widget="pagination">
			<li class="am-pagination-first"><a href="#">第一页</a></li>
			<li class="am-pagination-prev"><a href="#">上一页</a></li>
			<li><a href="#">1</a></li>
			<li class="am-active"><a href="#" class="am-active">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li class="am-pagination-next"><a href="#">下一页</a></li>
			<li class="am-pagination-last"><a href="#">最末页</a></li>
		</ul>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/navbar_one_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/pagination_select_0.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="a41bfdeef15bb97ee4d68024f2636207" data-title="分页 - default（扁平按钮）|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>