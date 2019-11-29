<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Gotop 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="gotop-hui-dao-ding-bu">GoTop 回到顶部 <a href="#gotop-hui-dao-ding-bu" class="doc-anchor"></a></h1>
			<hr>
			<p>回到顶部组件。<code>fixed</code> 主题会根据滚动条位置设定图标的显隐（大于 50px 时才显示）。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#gotop-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#gotop-demo-default-0">default（居中按钮）</a></li>
								<li><a href="#gotop-demo-fixed-0">fixed（默认 Icon）</a></li>
								<li><a href="#gotop-demo-fixed-1">fixed（设置 Icon）</a></li>
								<li><a href="#gotop-demo-fixed-2">fixed（自定义图片）</a></li>
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
			<h2 id="gotop-demo">组件演示</h2>
			<h3 id="gotop-demo-default-0">default（居中按钮）</h3>
			<div class="doc-example" data-url="doc/widget/gotop_default_0.jsp">
				<div class="am-gotop am-gotop-default" data-am-widget="gotop">
					<a href="#top">
						<span class="am-gotop-title">回到顶部</span>
						<i class="am-gotop-icon am-icon-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="gotop-demo-fixed-0">fixed（默认 Icon）</h3>
			<div class="doc-example" data-url="doc/widget/gotop_fixed_0.jsp">
				<div class="am-gotop am-gotop-fixed" data-am-widget="gotop">
					<a href="#top">
						<span class="am-gotop-title">回到顶部</span>
						<i class="am-gotop-icon am-icon-chevron-up"></i>
					</a>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="gotop-demo-fixed-1">fixed（设置 Icon）</h3>
			<div class="doc-example" data-url="doc/widget/gotop_fixed_1.jsp"><div class="am-gotop am-gotop-fixed" data-am-widget="gotop"><a href="#top"><i class="am-gotop-icon am-icon-hand-o-up"></i></a></div></div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="gotop-demo-fixed-2">fixed（自定义图片）</h3>
			<div class="doc-example" data-url="doc/widget/gotop_fixed_2.jsp"><div class="am-gotop am-gotop-fixed" data-am-widget="gotop"><a href="#top"><img src="doc/image/gotop.gif" class="am-gotop-icon-custom"></a></div></div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的内容替换为自己的内容。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>gotop</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="161de065990fc53e52e1ecf190088ffd" data-title="Gotop 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>