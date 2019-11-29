<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Breadcrumb|Amaze UI</title>
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
						<li>
							<a href="#ji-ben-xing-shi">基本形式</a>
							<ul class="am-collapse">
								<li><a href="#mo-ren-fen-ge-fu">默认分隔符</a></li>
								<li><a href="#xie-gan-fen-ge-fu">斜杆分隔符</a></li>
							</ul>
						</li>
						<li><a href="#jie-he-icon">结合 Icon</a></li>
					</ul>
				</div>
			</div>
			<h1 id="breadcrumb">Breadcrumb <a href="#breadcrumb" class="doc-anchor"></a></h1>
			<hr>
			<p><code>.am-breadcrumb</code> 面包屑导航。</p>
			<h2 id="ji-ben-xing-shi">基本形式 <a href="#ji-ben-xing-shi" class="doc-anchor"></a></h2>
			<h3 id="mo-ren-fen-ge-fu">默认分隔符 <a href="#mo-ren-fen-ge-fu" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<ol class="am-breadcrumb">
					<li><a href="#">首页</a></li>
					<li><a href="#">分类</a></li>
					<li class="am-active">内容</li>
				</ol>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">ol</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-breadcrumb"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>首页<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>分类<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-active"</span>&gt;</span>内容<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">ol</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="xie-gan-fen-ge-fu">斜杆分隔符 <a href="#xie-gan-fen-ge-fu" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<ol class="am-breadcrumb am-breadcrumb-slash">
					<li><a href="#">首页</a></li>
					<li><a href="#">分类</a></li>
					<li class="am-active">内容</li>
				</ol>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="jie-he-icon">结合 Icon <a href="#jie-he-icon" class="doc-anchor"></a></h2>
			<p>添加图标相应 class 即可。</p>
			<div class="doc-example">
				<ol class="am-breadcrumb">
					<li><a href="#" class="am-icon-home">首页</a></li>
					<li><a href="#">分类</a></li>
					<li class="am-active">内容</li>
				</ol>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">ol</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-breadcrumb"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-home"</span>&gt;</span>首页<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>分类<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-active"</span>&gt;</span>内容<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">ol</span>&gt;</span>
					</code>
				</pre>
			</div>
			<div class="ds-thread" data-thread-key="045c0324648d74c5e585e9fc420e2654" data-title="CSS - Breadcrumb|Amaze UI" id="ds-thread"></div></div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>