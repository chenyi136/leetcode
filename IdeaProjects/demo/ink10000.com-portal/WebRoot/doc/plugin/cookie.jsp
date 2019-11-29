<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Cookie|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="2"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_plugin.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="cookie">Cookie <a href="#cookie" class="doc-anchor"></a></h1>
			<hr>
			<p>Cookie 操作方法封装，via <a href="#">Nicholas C. Zakas</a>。</p>
			<p>调用接口：<code>$.AMUI.utils.cookie</code>。</p>
			<ul>
				<li><code>cookie.set(name,value,expires,path,domain,secure)</code> - 设置 cookie；</li>
				<li><code>cookie.get(name)</code> - 获取 cookie；</li>
				<li><code>cookie.unset(name,path,domain,secure)</code> - 删除 cookie</li>
			</ul>
			<p><strong>参考链接</strong></p>
			<ul><li><a href="#">https://developer.mozilla.org/en-US/docs/Web/API/document.cookie</a></li></ul>
			<div class="ds-thread" data-thread-key="bce4719adb2529ab83c53d2f927243d7" data-title="JS 插件 - Cookie|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>