<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Titlebar 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="titlebar-biao-ti-lan">Titlebar 标题栏 <a href="#titlebar-biao-ti-lan" class="doc-anchor"></a></h1>
			<hr>
			<p>标题栏组件，常用作页头、标题等。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#titlebar-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#titlebar-demo-default-0">default（文字标题）</a></li>
								<li><a href="#titlebar-demo-default-1">default（图片标题）</a></li>
								<li><a href="#titlebar-demo-multi-0">multi（单个链接）</a></li>
								<li><a href="#titlebar-demo-multi-1">multi（多链接）</a></li>
								<li><a href="#titlebar-demo-cols-0">cols（浅背景多链接）</a></li>
							</ul>
						</li>
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
			<h2 id="titlebar-demo">组件演示</h2>
			<h3 id="titlebar-demo-default-0">default（文字标题）</h3>
			<div class="doc-example" data-url="doc/widget/titlebar_default_0.jsp">
				<div class="am-titlebar am-titlebar-default" data-am-widget="titlebar">
					<h2 class="am-titlebar-title">栏目标题</h2>
					<nav class="am-titlebar-nav"><a href="#">more »</a></nav>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="titlebar-demo-default-1">default（图片标题）</h3>
			<div class="doc-example" data-url="doc/widget/titlebar_default_1.jsp">
				<div class="am-titlebar am-titlebar-default" data-am-widget="titlebar">
					<h2 class="am-titlebar-title"><img src="doc/image/amazeui-b.png"></h2>
					<nav class="am-titlebar-nav"><a href="#">more »</a></nav>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="titlebar-demo-multi-0">multi（单个链接）</h3>
			<div class="doc-example" data-url="doc/widget/titlebar_multi_0.jsp">
				<div class="am-titlebar am-titlebar-multi" data-am-widget="titlebar">
					<h2 class="am-titlebar-title">栏目标题</h2>
					<nav class="am-titlebar-nav"><a href="#">more »</a></nav>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="titlebar-demo-multi-1">multi（多链接）</h3>
			<div class="doc-example" data-url="doc/widget/titlebar_multi_1.jsp">
				<div class="am-titlebar am-titlebar-multi" data-am-widget="titlebar">
					<h2 class="am-titlebar-title">科技频道</h2>
					<nav class="am-titlebar-nav">
						<a href="#">手机</a>
						<a href="#">数码</a>
						<a href="#">影音</a>
					</nav>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="titlebar-demo-cols-0">cols（浅背景多链接）</h3>
			<div class="doc-example" data-url="doc/widget/titlebar_cols_0.jsp">
				<div class="am-titlebar am-titlebar-cols" data-am-widget="titlebar">
					<h2 class="am-titlebar-title"><a href="#">栏目标题</a></h2>
					<nav class="am-titlebar-nav">
						<a href="#">子栏目</a>
						<a href="#">子栏目</a>
						<a href="#">子栏目</a>
					</nav>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的内容替换为自己的内容。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>titlebar</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="1f007bf6eb2794df27e6d71f8d9ef1e0" data-title="Titlebar 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>