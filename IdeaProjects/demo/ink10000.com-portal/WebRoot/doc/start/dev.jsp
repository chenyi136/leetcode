<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用 - Widget-dev|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="0"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_start.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li><a href="#zu-jian-jie-gou">组件结构</a></li>
						<li><a href="#fen-xiang-zu-jian">分享组件</a></li>
					</ul>
				</div>
			</div>
			<h1 id="web-zu-jian-jian-jie">Web 组件简介 <a href="#web-zu-jian-jian-jie" class="doc-anchor"></a></h1>
			<hr>
			<p><a href="#">Web Components</a> 颇令人向往，无奈浏览器支持有限，所以，Amaze UI Web 组件按照 Web Components 的实现形式，使用浏览器支持更为普及的技术，将移动开发中常用的组件切割成不同部分，实现类 Web Components 的组件，提高开发效率。</p>
			<h2 id="zu-jian-jie-gou">组件结构 <a href="#zu-jian-jie-gou" class="doc-anchor"></a></h2>
			<div><img src="doc/image/widget.jpg" style="max-width:400px;" class="am-center"></div>
			<p>如上图所示，Amaze UI Web 组件 通过一个 <code>package.json</code> 文件描述，每个组件由模板（hbs）、样式（LESS）、交互（JS）三部分组成，其中样式可能有多个文件（不同的主题）。组件样式和交互以 <a href="doc/css/index.jsp">CSS</a> 、<a href="doc/plugin/index.jsp">JS 插件</a> 为基础编写；使用 <a href="#">Handlebars</a> 作为模板引擎。</p>
			<p>Amaze UI 目前封装的组件及演示请查看 <a href="doc/widget/index.jsp">Web 组件</a> 页。</p>
			<h2 id="fen-xiang-zu-jian">分享组件 <a href="#fen-xiang-zu-jian" class="doc-anchor"></a></h2>
			<p>如果你想分享你开发的 Web 组件，可以 <a href="#">Fork Amaze UI 项目</a>，按照<a href="doc/start/widget.jsp">开发文档</a>开发完成以后，向我们提交 Pull Request。</p>
			<p>通过审核以后，你的组件便会出现在 Amaze UI 官网。</p>
			<p>欢迎大家加入 Web 组件开发者行列（<a href="doc/start/widget.jsp">开发文档</a>），为用户开发更多的组件。</p>
			<div class="ds-thread" data-thread-key="54b3f411614bfcbf8bb1f33baa13a216" data-title="开始使用 - Widget-dev|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>