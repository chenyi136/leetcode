<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>分页 - select（上下页+选择框）|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<ul class="am-pagination am-pagination-select" data-am-widget="pagination">
			<li class="am-pagination-prev"><a href="#">上一页</a></li>
			<li class="am-pagination-select">
				<select>
					<option value="#">1 / 3</option>
					<option value="#">2 / 3</option>
					<option value="#">3 / 3</option>
				</select>
			</li>
			<li class="am-pagination-next"><a href="#">下一页</a></li>
		</ul>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/pagination_default_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/pagination_one_0.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="f8e1839f31ce13ee0785032810101f74" data-title="分页 - select（上下页+选择框）|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>