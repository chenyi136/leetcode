<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Image|Amaze UI</title>
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
						<li><a href="#ji-chu-yang-shi">基础样式</a></li>
						<li><a href="#xiang-ying-shi-tu-pian">响应式图片</a></li>
						<li>
							<a href="#zeng-qiang-yang-shi">增强样式</a>
							<ul class="am-collapse">
								<li><a href="#yuan-jiao-yang-shi">圆角样式</a></li>
								<li><a href="#bian-kuang">边框</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="image">Image <a href="#image" class="doc-anchor"></a></h1>
			<hr>
			<p>定义图片样式。</p>
			<h2 id="ji-chu-yang-shi">基础样式 <a href="#ji-chu-yang-shi" class="doc-anchor"></a></h2>
			<p>基础样式定义在 <code>base</code> 中。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-tag">img</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">box-sizing</span>:<span class="hljs-value">border-box</span></span>;
   <span class="hljs-comment">/*v2.3 开始移除以下代码，详见 #502*/</span>
   <span class="hljs-comment">/*max-width:100%;
   height:auto;*/</span>
   <span class="hljs-rule"><span class="hljs-attribute">vertical-align</span>:<span class="hljs-value">middle</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">border</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
}</span>
					</code>
				</pre>
			</div>
			<h2 id="xiang-ying-shi-tu-pian">响应式图片 <a href="#xiang-ying-shi-tu-pian" class="doc-anchor"></a></h2>
			<p><del>如上面的代码所示， <code>base</code> 里已经设置了 <code>max-width:100%</code>，图片会自动适应到容器的宽度（但不会超过图片原始宽度），不需要添加额外的 class（<a href="#">演示</a>）。如果要让图片始终和容器一样宽，需要设置 <code>width:100%</code>。</del></p>
			<p><code>v2.3</code> 为解决 <a href="#">#502</a>，基础样式中取消了图片最大宽度设置，新增了 <code>.am-img-responsive</code> class。</p>
			<div class="doc-example"><img src="doc/image/bing-6.jpg" class="am-img-responsive"></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">img</span> <span class="hljs-attribute">src</span>=<span class="hljs-value">"doc/image/bing-6.jpg"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-img-responsive"</span>&gt;</span></code></pre></div>
			<h2 id="zeng-qiang-yang-shi">增强样式 <a href="#zeng-qiang-yang-shi" class="doc-anchor"></a></h2>
			<h3 id="yuan-jiao-yang-shi">圆角样式 <a href="#yuan-jiao-yang-shi" class="doc-anchor"></a></h3>
			<p>为<code>&lt;img&gt;</code>元素设置不同的 class，增强其样式。</p>
			<ul>
				<li><code>.am-radius</code> 圆角</li>
				<li><code>.am-round</code> 椭圆</li>
				<li><code>.am-circle</code> 圆形，一般用于正方形的图片(你要觉得椭圆好看，用在长方形上也可以)</li>
			</ul>
			<div class="doc-example">
				<p>
					<img src="doc/image/bing-6.jpg" class="am-radius" width="140px" height="140px">
					<img src="doc/image/bing-6.jpg" class="am-round" width="200px" height="120px">
					<img src="doc/image/bing-6.jpg" class="am-circle" width="140px" height="140px">
				</p>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="bian-kuang">边框 <a href="#bian-kuang" class="doc-anchor"></a></h3>
			<ul><li><code>.am-img-thumbnail</code> 边框</li></ul>
			<div class="doc-example">
				<img src="doc/image/bing-6.jpg" class="am-img-thumbnail" width="140px" height="140px">
				<img src="doc/image/bing-6.jpg" class="am-img-thumbnail am-radius" width="140px" height="140px">
				<img src="doc/image/bing-6.jpg" class="am-img-thumbnail am-circle" width="140px" height="140px">
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="d4460ca7dd1061c19845f1c6c46e7527" data-title="CSS - Image|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>