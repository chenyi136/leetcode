<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>工具栏 - default（默认） - 自定义图标|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<div class="am-navbar am-navbar-default am-cf" data-am-widget="navbar">
			<ul class="am-avg-sm-4 am-navbar-nav am-cf">
				<li>
					<a href="#">
						<img src="doc/image/information.png">
						<span class="am-navbar-label">消息</span>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="doc/image/phone.png">
						<span class="am-navbar-label">呼叫</span>
					</a>
				</li>
				<li data-am-navbar-share>
					<a href="#">
						<img src="doc/image/share.png">
						<span class="am-navbar-label">分享</span>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="doc/image/mapping.png">
						<span class="am-navbar-label">地图</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/navbar_default_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/navbar_one_0.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="50c5160121ac08d93868f40ca2ca8d45" data-title="工具栏 - default（默认） - 自定义图标|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>