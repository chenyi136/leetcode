<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Close|Amaze UI</title>
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
						<li><a href="#ji-ben-yang-shi">基本样式</a></li>
						<li>
							<a href="#dai-bian-kuang-yang-shi">带边框样式</a>
							<ul class="am-collapse">
								<li><a href="#shi-yong-x">使用 x</a></li>
								<li><a href="#shi-yong-icon-font">使用 Icon Font</a></li>
								<li><a href="#chui-zhi-ju-zhong-si-mi-da">垂直居中思密达</a></li>
							</ul>
						</li>
						<li><a href="#hover-xuan-zhuan">hover 旋转</a></li>
					</ul>
				</div>
			</div>
			<h1 id="close">Close <a href="#close" class="doc-anchor"></a></h1>
			<hr>
			<p>关闭按钮样式，可以结合其他不同组件使用。对 <code>&lt;a&gt;</code> 或者 <code>&lt;button&gt;</code> 添加 <code>.am-close</code> class。</p>
			<h2 id="ji-ben-yang-shi">基本样式 <a href="#ji-ben-yang-shi" class="doc-anchor"></a></h2>
			<p>在元素上添加 <code>.am-close</code> class。</p>
			<div class="doc-example">
				<a href="#" class="am-close">&times;</a>
				<br>
				<button type="button" class="am-close">&times;</button>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-close"</span>&gt;</span>&amp;times;<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-close"</span>&gt;</span>&amp;times;<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h2 id="dai-bian-kuang-yang-shi">带边框样式 <a href="#dai-bian-kuang-yang-shi" class="doc-anchor"></a></h2>
			<p>添加 <code>.am-close-alt</code> class。</p>
			<h3 id="shi-yong-x">使用 x <a href="#shi-yong-x" class="doc-anchor"></a></h3>
			<div class="doc-example"><a href="#" class="am-close am-close-alt">&times;</a></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">""</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-close am-close-alt"</span>&gt;</span>&amp;times;<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span></code></pre></div>
			<h3 id="shi-yong-icon-font">使用 Icon Font <a href="#shi-yong-icon-font" class="doc-anchor"></a></h3>
			<div class="doc-example"><a href="#" class="am-close am-close-alt am-icon-times"></a></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">""</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-close am-close-alt am-icon-times"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span></code></pre></div>
			<h3 id="chui-zhi-ju-zhong-si-mi-da">垂直居中思密达 <a href="#chui-zhi-ju-zhong-si-mi-da" class="doc-anchor"></a></h3>
			<div class="am-alert am-alert-warning">这个问题有点头疼，不同字体对齐方式有差异，很难做到所有字体都垂直居中。现在增加了使用 Icon Font 样式（貌似还行，看得我眼睛都眨巴了），大家如果有好的解决方案也可以提供给我们。</div>
			<h2 id="hover-xuan-zhuan">hover 旋转 <a href="#hover-xuan-zhuan" class="doc-anchor"></a></h2>
			<p>添加 <code>.am-close-spin</code> class（需支持 <a href="#">CSS3 transform</a>）。</p>
			<div class="doc-example">
				<a href="#" class="am-close am-close-spin am-close-alt">&times;</a>
				<a href="#" class="am-close am-close-spin am-close-alt am-icon-times"></a>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">""</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-close am-close-alt am-close-spin"</span>&gt;</span>&amp;times;<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">""</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-close am-close-alt am-close-spin am-icon-times"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
					</code>
				</pre>
			</div>
			<div class="ds-thread" data-thread-key="38fde5148ed58f04a696da3d6759f373" data-title="CSS - Close|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>