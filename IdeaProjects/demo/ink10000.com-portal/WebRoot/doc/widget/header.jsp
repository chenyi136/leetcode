<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Header 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="header">Header <a href="#header" class="doc-anchor"></a></h1>
			<hr>
			<p>页头组件，为移动页面顶部的导航条设计。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#header-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#header-demo-default-0">default（图标）</a></li>
								<li><a href="#header-demo-default-1">default（图片图标）</a></li>
								<li><a href="#header-demo-default-2">default（图标+文字）</a></li>
								<li><a href="#header-demo-default-3">default（多图标）</a></li>
								<li><a href="#header-demo-default-4">default（结合按钮）</a></li>
							</ul>
						</li>
						<li><a href="#ding-bu-gu-ding">顶部固定</a></li>
						<li>
							<a href="#shi-yong-fang-fa">使用方法</a>
							<ul class="am-collapse">
								<li><a href="#zhi-jie-shi-yong">直接使用</a></li>
								<li><a href="#shi-yong-handlebars">使用 Handlebars</a></li>
								<li><a href="#yun-gua-pei-webide">云适配 WebIDE</a></li>
							</ul>
						</li>
						<li><a href="#shu-ju-jie-kou">数据接口</a></li>
					</ul>
				</div>
			</div>
			<h2 id="header-demo">组件演示</h2>
			<h3 id="header-demo-default-0">default（图标）</h3>
			<div class="doc-example" data-url="doc/widget/header_default_0.jsp">
				<header class="am-header am-header-default" data-am-widget="header">
					<div class="am-header-nav am-header-left"><a href="#"><i class="am-header-icon am-icon-home"></i></a></div>
					<h1 class="am-header-title"><a href="#">Amaze UI</a></h1>
					<div class="am-header-nav am-header-right"><a href="#"><i class="am-header-icon am-icon-bars"></i></a></div>
				</header>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="header-demo-default-1">default（图片图标）</h3>
			<div class="doc-example" data-url="doc/widget/header_default_1.jsp">
				<header class="am-header am-header-default" data-am-widget="header">
					<div class="am-header-nav am-header-left"><a href="#"><img src="data:image/svg+xml;charset=utf-8,&lt;svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 42 26' fill='%23fff'&gt;&lt;rect width='4' height='4'/&gt;&lt;rect x='8' y='1' width='34' height='2'/&gt;&lt;rect y='11' width='4' height='4'/&gt;&lt;rect x='8' y='12' width='34' height='2'/&gt;&lt;rect y='22' width='4' height='4'/&gt;&lt;rect x='8' y='23' width='34' height='2'/&gt;&lt;/svg&gt;" class="am-header-icon-custom"></a></div>
					<h1 class="am-header-title"><img src="doc/image/amazeui-cw.png"></h1>
					<div class="am-header-nav am-header-right"><a href="#"><img src="data:image/svg+xml;charset=utf-8,&lt;svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 42 26' fill='%23fff'&gt;&lt;rect width='4' height='4'/&gt;&lt;rect x='8' y='1' width='34' height='2'/&gt;&lt;rect y='11' width='4' height='4'/&gt;&lt;rect x='8' y='12' width='34' height='2'/&gt;&lt;rect y='22' width='4' height='4'/&gt;&lt;rect x='8' y='23' width='34' height='2'/&gt;&lt;/svg&gt;" class="am-header-icon-custom"></a></div>
				</header>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="header-demo-default-2">default（图标+文字）</h3>
			<div class="doc-example" data-url="doc/widget/header_default_2.jsp">
				<header class="am-header am-header-default" data-am-widget="header">
					<div class="am-header-nav am-header-left">
						<a href="#">
							<span class="am-header-nav-title">首页</span>
							<i class="am-header-icon am-icon-home"></i>
						</a>
					</div>
					<h1 class="am-header-title">Amaze UI</h1>
					<div class="am-header-nav am-header-right">
						<a href="#">
							<span class="am-header-nav-title">菜单</span>
							<i class="am-header-icon am-icon-bars"></i>
						</a>
					</div>
				</header>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="header-demo-default-3">default（多图标）</h3>
			<div class="doc-example" data-url="doc/widget/header_default_3.jsp">
				<header class="am-header am-header-default" data-am-widget="header">
					<div class="am-header-nav am-header-left">
						<a href="#"><i class="am-header-icon am-icon-home"></i></a>
						<a href="#"><i class="am-header-icon am-icon-phone"></i></a>
					</div>
					<h1 class="am-header-title">Amaze UI</h1>
					<div class="am-header-nav am-header-right">
						<a href="#"><i class="am-header-icon am-icon-user"></i></a>
						<a href="#"><i class="am-header-icon am-icon-shopping-cart"></i></a>
					</div>
				</header>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="header-demo-default-4">default（结合按钮）</h3>
			<div class="doc-example" data-url="doc/widget/header_default_4.jsp">
				<header class="am-header am-header-default" data-am-widget="header">
					<div class="am-header-nav am-header-left">
						<a href="#" class="am-btn am-btn-default">
							<span class="am-header-nav-title">返回</span>
							<i class="am-header-icon am-icon-home"></i>
						</a>
					</div>
					<h1 class="am-header-title">Amaze UI</h1>
					<div class="am-header-nav am-header-right">
						<a href="#"><i class="am-header-icon am-icon-user"></i></a>
						<a href="#" class="am-btn am-btn-secondary"><i class="am-header-icon am-icon-shopping-cart"></i></a>
					</div>
				</header>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="ding-bu-gu-ding">顶部固定 <a href="#ding-bu-gu-ding" class="doc-anchor"></a></h2>
			<p>在默认样式的基础上添加 <code>.am-header-fixed</code>。</p>
			<p><strong>默认样式：</strong></p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-header-fixed</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">position</span>:<span class="hljs-value">fixed</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">top</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">left</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">right</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">100%</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">z-index</span>:<span class="hljs-value"><span class="hljs-number">1010</span></span></span>;
}</span>
					</code>
				</pre>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p>如果页面中有固定顶部的 Header，JS 会在 <code>&lt;body&gt;</code> 上添加 <code>.am-with-fixed-header</code>，这个 class 下面默认设置了 <code>padding-top: 49px</code>，可以根据具体情况做调整。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-with-fixed-header</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">padding-top</span>:<span class="hljs-value">@am-header-height</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的内容替换为自己的内容。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>header</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="5d7a201ee46f79afee79aeb07358934a" data-title="Header 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>