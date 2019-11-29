<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Divider 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="divider-fen-ge-xian">Divider 分隔线 <a href="#divider-fen-ge-xian" class="doc-anchor"></a></h1>
			<hr>
			<p>分隔线组件。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#divider-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#divider-demo-default-0">default（灰色分隔线）</a></li>
								<li><a href="#divider-demo-dotted-0">dotted（点分割线）</a></li>
								<li><a href="#divider-demo-dashed-0">dashed（虚线分割线）</a></li>
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
						<li><a href="#shu-ju-jie-gou">数据结构</a></li>
					</ul>
				</div>
			</div>
			<h2 id="divider-demo">组件演示</h2>
			<h3 id="divider-demo-default-0">default（灰色分隔线）</h3>
			<div class="doc-example" data-url="doc/widget/divider_default_0.jsp"><hr class="am-divider am-divider-default" data-am-widget="divider"></div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="divider-demo-dotted-0">dotted（点分割线）</h3>
			<div class="doc-example" data-url="doc/widget/divider_dotted_0.jsp"><hr class="am-divider am-divider-dotted" data-am-widget="divider"></div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="divider-demo-dashed-0">dashed（虚线分割线）</h3>
			<div class="doc-example" data-url="doc/widget/divider_dashed_0.jsp"><hr class="am-divider am-divider-dashed" data-am-widget="divider"></div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul><li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域。</li></ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>divider</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<p>本组件无需采集数据。</p>
			<h2 id="shu-ju-jie-gou">数据结构 <a href="#shu-ju-jie-gou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="d3ed63c4c40e03469fe1a4a671a56059" data-title="Divider 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>