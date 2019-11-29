<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Print|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="1"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_css.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li><a href="#xian-shi-url-lian-jie">显示 URL 链接</a></li>
						<li><a href="#fu-zhu-class">辅助 Class</a></li>
						<li><a href="#can-kao-lian-jie">参考链接</a></li>
					</ul>
				</div>
			</div>
			<h1 id="print">Print <a href="#print" class="doc-anchor"></a></h1>
			<hr>
			<p>打印样式组件，打印时将 <code>color</code> 设置成黑色，删除 <code>background</code> 、<code>text-shadow</code> 、<code>box-shadow</code> 样式，以节省打印机耗材，加快打印速度。</p>
			<h2 id="xian-shi-url-lian-jie">显示 URL 链接 <a href="#xian-shi-url-lian-jie" class="doc-anchor"></a></h2>
			<p>利用 CSS3 <code>content</code> 属性，将 <code>&lt;a&gt;</code> 和 <code>&lt;abbr&gt;</code> 的标题、链接显示在后面。</p>
			<div class="doc-example">
				<a href="#">Amaze UI</a>
				<br>
				<abbr>Amaze UI</abbr>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!-- 点击浏览器菜单里的【打印】，预览打印样式 --&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>Amaze UI<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">abbr</span> <span class="hljs-attribute">title</span>=<span class="hljs-value">"#"</span>&gt;</span>Amaze UI<span class="hljs-tag">&lt;/<span class="hljs-title">abbr</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h2 id="fu-zhu-class">辅助 Class <a href="#fu-zhu-class" class="doc-anchor"></a></h2>
			<ul>
				<li><code>am-print-hide</code> 浏览器可见，打印机隐藏。</li>
				<li><code>am-print-block</code>、<code>am-print-inline-block</code>、<code>am-print-inline</code> 打印机可见，浏览器隐藏。在打印机中分别对应为<code>block</code>,<code>inline-block</code>,<code>inline</code>样式。</li>
			</ul>
			<div class="doc-example">
				<div class="am-print-hide"><button type="button" class="am-btn am-btn-block am-btn-primary">浏览器可见，打印机不可见</button></div>
				<div class="am-print-block"><button type="button" class="am-btn am-btn-block am-btn-primary">打印机可见，浏览器不可见</button></div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!-- 在打印预览中查看效果 --&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-print-hide"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-block"</span>&gt;</span>浏览器可见，打印机不可见<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-print-block"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-block"</span>&gt;</span>打印机可见，浏览器不可见<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h2 id="can-kao-lian-jie">参考链接 <a href="#can-kao-lian-jie" class="doc-anchor"></a></h2>
			<ul><li><a href="#">html5-boilerplate main.css</a></li></ul>
			<div class="ds-thread" data-thread-key="9b2e7f4acc1f4fd23646cafa0fa3c335" data-title="CSS - Print|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>