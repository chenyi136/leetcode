<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Badge|Amaze UI</title>
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
						<li><a href="#mo-ren-yang-shi">默认样式</a></li>
						<li><a href="#yuan-jiao-yang-shi">圆角样式</a></li>
						<li><a href="#tuo-yuan-yang-shi">椭圆样式</a></li>
						<li><a href="#da-xiao">大小</a></li>
					</ul>
				</div>
			</div>
			<h1 id="badge">Badge <a href="#badge" class="doc-anchor"></a></h1>
			<hr>
			<p>添加 <code>.am-badge</code>到 <code>&lt;div&gt;</code>或者 <code>&lt;span&gt;</code>元素。</p>
			<h2 id="mo-ren-yang-shi">默认样式 <a href="#mo-ren-yang-shi" class="doc-anchor"></a></h2>
			<div class="doc-example">
				<span class="am-badge">1</span>
				<span class="am-badge am-badge-primary">2</span>
				<span class="am-badge am-badge-secondary">3</span>
				<span class="am-badge am-badge-success">4</span>
				<span class="am-badge am-badge-warning">5</span>
				<span class="am-badge am-badge-danger">6</span>
				<span class="am-badge am-badge-success">Allmobilize</span>
				<br>
				<a class="am-badge am-badge-primary">Free</a>
				<a class="am-badge am-badge-secondary">Secondary</a>
				<a class="am-badge am-badge-success">Success</a>
				<a class="am-badge am-badge-warning">Warning</a>
				<a class="am-badge am-badge-danger">Danger</a>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge"</span>&gt;</span>1<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-primary"</span>&gt;</span>2<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-secondary"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-success"</span>&gt;</span>4<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-warning"</span>&gt;</span>5<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-danger"</span>&gt;</span>6<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-success"</span>&gt;</span>Allmobilize<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-primary"</span>&gt;</span>Free<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-secondary"</span>&gt;</span>Secondary<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-success"</span>&gt;</span>Success<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-warning"</span>&gt;</span>Warning<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-danger"</span>&gt;</span>Danger<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h2 id="yuan-jiao-yang-shi">圆角样式 <a href="#yuan-jiao-yang-shi" class="doc-anchor"></a></h2>
			<p>在默认样式的基础上添加 <code>.am-radius</code>。</p>
			<div class="doc-example">
				<span class="am-badge am-radius">1</span>
				<span class="am-badge am-badge-primary am-radius">2</span>
				<span class="am-badge am-badge-secondary am-radius">3</span>
				<span class="am-badge am-badge-success am-radius">4</span>
				<span class="am-badge am-badge-warning am-radius">5</span>
				<span class="am-badge am-badge-danger am-radius">6</span>
				<span class="am-badge am-badge-success am-radius">Allmobilize</span>
				<br>
				<a class="am-badge am-badge-primary am-radius">Free</a>
				<a class="am-badge am-badge-secondary am-radius">Secondary</a>
				<a class="am-badge am-badge-success am-radius">Success</a>
				<a class="am-badge am-badge-warning am-radius">Warning</a>
				<a class="am-badge am-badge-danger am-radius">Danger</a>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-radius"</span>&gt;</span>1<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-primary am-radius"</span>&gt;</span>2<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-secondary am-radius"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-success am-radius"</span>&gt;</span>4<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-warning am-radius"</span>&gt;</span>5<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-danger am-radius"</span>&gt;</span>6<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-success am-radius"</span>&gt;</span>Allmobilize<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-primary am-radius"</span>&gt;</span>Free<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-secondary am-radius"</span>&gt;</span>Secondary<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-success am-radius"</span>&gt;</span>Success<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-warning am-radius"</span>&gt;</span>Warning<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-danger am-radius"</span>&gt;</span>Danger<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h2 id="tuo-yuan-yang-shi">椭圆样式 <a href="#tuo-yuan-yang-shi" class="doc-anchor"></a></h2>
			<p>在默认样式的基础上添加 <code>.am-round</code>。</p>
			<div class="doc-example">
				<span class="am-badge am-round">1</span>
				<span class="am-badge am-badge-primary am-round">2</span>
				<span class="am-badge am-badge-secondary am-round">3</span>
				<span class="am-badge am-badge-success am-round">4</span>
				<span class="am-badge am-badge-warning am-round">5</span>
				<span class="am-badge am-badge-danger am-round">6</span>
				<span class="am-badge am-badge-success am-round">Allmobilize</span>
				<br>
				<a class="am-badge am-badge-primary am-round">Free</a>
				<a class="am-badge am-badge-secondary am-round">Secondary</a>
				<a class="am-badge am-badge-success am-round">Success</a>
				<a class="am-badge am-badge-warning am-round">Warning</a>
				<a class="am-badge am-badge-danger am-round">Danger</a>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-round"</span>&gt;</span>1<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-primary am-round"</span>&gt;</span>2<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-secondary am-round"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-success am-round"</span>&gt;</span>4<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-warning am-round"</span>&gt;</span>5<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-danger am-round"</span>&gt;</span>6<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-success am-round"</span>&gt;</span>Allmobilize<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-primary am-round"</span>&gt;</span>Free<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-secondary am-round"</span>&gt;</span>Secondary<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-success am-round"</span>&gt;</span>Success<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-warning am-round"</span>&gt;</span>Warning<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-danger am-round"</span>&gt;</span>Danger<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h2 id="da-xiao">大小 <a href="#da-xiao" class="doc-anchor"></a></h2>
			<p>结合<a href="doc/css/utility.jsp">辅助类</a>中的字号 class，改变徽章大小。</p>
			<div class="doc-example">
				<span class="am-badge am-badge-primary">default</span>
				<span class="am-badge am-badge-secondary am-text-sm">small</span>
				<span class="am-badge am-badge-success am-text-default">normal</span>
				<span class="am-badge am-badge-warning am-text-lg">large</span>
				<span class="am-badge am-badge-danger am-text-xl">x large</span>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-primary"</span>&gt;</span>default<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-secondary am-text-sm"</span>&gt;</span>small<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-success am-text-default"</span>&gt;</span>normal<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-warning am-text-lg"</span>&gt;</span>large<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-badge am-badge-danger am-text-xl"</span>&gt;</span>x large<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
					</code>
				</pre>
			</div>
			<div class="ds-thread" data-thread-key="39137b237b017ebab9d17a331fdad54d" data-title="CSS - Badge|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>