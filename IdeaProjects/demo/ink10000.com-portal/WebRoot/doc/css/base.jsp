<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Base|Amaze UI</title>
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
						<li><a href="#css-he-mo-xing">CSS 盒模型</a></li>
						<li><a href="#zi-hao-ji-dan-wei">字号及单位</a></li>
					</ul>
				</div>
			</div>
			<h1 id="base">Base <a href="#base" class="doc-anchor"></a></h1>
			<hr>
			<p>Amaze UI 定义的一些基础样式。</p>
			<h2 id="css-he-mo-xing">CSS 盒模型 <a href="#css-he-mo-xing" class="doc-anchor"></a></h2>
			<p>曾几何时，IE 6 及更低版本的<strong><em>非标准</em></strong>盒模型被喷得体无完肤。IE 原来的盒模型真的不好么？最终，时间给了另外一个答案。 W3C 终认识到所谓标准盒模型在实际使用中的复杂性，于是在 CSS3 中增加 <code>box-sizing</code>这一属性，允许用户自定义盒模型。</p>
			<blockquote>
				<p><strong>You tell me I&#39;m wrong, Then you better prove you&#39;re right.</strong></p>
				<p><small>King of Pop – Scream</small></p>
			</blockquote>
			<p>这就是 W3C 的证明。</p>
			<p>扯远了，Amaze UI 将所有元素的盒模型设置为 <code>border-box</code>。这下好了，妈妈再也不用担心你没计算好 <code>padding</code>、<code>border</code>而使布局破相了。咱来写样式，不是来学算术。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
*,*<span class="hljs-pseudo">:before</span>,*<span class="hljs-pseudo">:after</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">-moz-box-sizing</span>:<span class="hljs-value">border-box</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-box-sizing</span>:<span class="hljs-value">border-box</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">box-sizing</span>:<span class="hljs-value">border-box</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<p><img src="doc/image/box.png"></p>
			<p>参考链接：</p>
			<ul>
				<li><a href="#">https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing</a></li>
				<li><a href="#">http://www.paulirish.com/2012/box-sizing-border-box-ftw/</a></li>
				<li><a href="#">Box Sizing</a></li>
			</ul>
			<h2 id="zi-hao-ji-dan-wei">字号及单位 <a href="#zi-hao-ji-dan-wei" class="doc-anchor"></a></h2>
			<p>Amaze UI 将浏览器的基准字号设置为 <code>62.5%</code>，也就是 <code>10px</code>，现在 <code>1rem=10px</code>—— 为了计算方便。然后在 <code>body</code>上应用了 <code>font-size:1.6rem;</code>，将页面字号设置为 <code>16px</code>。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-tag">html</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">font-size</span>:<span class="hljs-value"><span class="hljs-number">62.5%</span></span></span>;
}</span>
<span class="hljs-tag">body</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">font-size</span>:<span class="hljs-value"><span class="hljs-number">1.6rem</span></span></span>; <span class="hljs-comment">/*=16px*/</span>
}</span>
					</code>
				</pre>
			</div>
			<p>与 <code>em</code>根据上下文变化不同，<code>rem</code>只跟基准设置关联，只要修改基准字号，所有使用 <code>rem</code>作为单位的设置都会相应改变。</p>
			<p>当然，并非所有所有浏览器的默认字号都是 <code>16px</code>，所以在不同的浏览器上会有细微差异。</p>
			<p>另外，一些需要根据字号做相应变化的场景也使用了 <code>em</code>，需要像素级别精确的场景也使用了 <code>px</code>。</p>
			<p><strong>参考资源：</strong></p>
			<ul>
				<li><a href="#">FONT SIZING WITH REM</a></li>
				<li><a href="#">Type study:Sizing the legible letter</a></li>
				<li><a href="#">The rem checker</a></li>
				<li><a href="#">Mixins for Rem Font Sizing</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="1219c9f08d519a5b93895565f8381805" data-title="CSS - Base|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>