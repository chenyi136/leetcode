<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Normalize|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="1"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_css.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="normalize">Normalize <a href="#normalize" class="doc-anchor"></a></h1>
			<hr>
				<p>在统一浏览器默认样式上，<a href="#">Reset</a> 一度非常流行，更有简单粗暴的通配符 reset ：</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
*<span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">margin</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">padding</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">border</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
}</span>
						</code>
					</pre>
				</div>
				<p>时过境迁，Reset 逐渐淡出的前沿前端的视野，<a href="#">normalize.css</a> 取而代之。normalize.css，统一样式的同时保留可辨识性；reset 统一样式，完全没有可读性，分不清是男人、女人，或者是不男不女，看着都一样。</p>
				<p>Amaze UI 也使用了 normalize.css，但部分细节做了一些调整：</p>
				<ul>
					<li><code>html</code> 添加 <code>-webkit-font-smoothing:antialiased;</code></li>
					<li><code>&lt;hgroup&gt;</code> 已经从 W3C 标准中移除，不建议使用</li>
					<li><code>&lt;img&gt;</code> 设置最大宽度为 <code>100%</code></li>
					<li><code>&lt;figure&gt;</code> 外边距设置为 <code>0</code></li>
					<li><code>&lt;textarea&gt;</code> 添加 <code>vertical-align:top; resize:vertical;</code></li>
					<li>移除 <code>&lt;dfn&gt;</code> 斜体字样式</li>
					<li>移除 <code>&lt;h1&gt;</code> 样式</li>
				</ul>
				<div class="ds-thread" data-thread-key="0264c1136515ac024867b9e344ede44f" data-title="CSS - Normalize|Amaze UI" id="ds-thread"></div>
			</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>