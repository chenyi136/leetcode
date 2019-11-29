<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 about"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 about"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 about"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js about"><!--<![endif]-->
<head>
	<title>关于我们|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="4"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_about.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="guan-yu-wo-men">关于我们 <a href="#guan-yu-wo-men" class="doc-anchor"></a></h1>
			<hr>
			<p>Amaze UI 是一个轻量级、 Mobile first 的前端框架， 由 Amaze UI 小组基于开源社区流行前端框架编写。</p>
			<p>Amaze UI 小组目前有两位成员，我们崇尚开放、自由，欢迎大家参与到 Amaze UI 开发、维护中来。</p>
			<div class="ds-thread" data-thread-key="668195e1efa704b39d47817b29a1ccb9" data-title="关于我们|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>