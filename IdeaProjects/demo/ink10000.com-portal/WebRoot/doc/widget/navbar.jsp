<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Navbar 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="navbar-gong-ju-lan">Navbar 工具栏 <a href="#navbar-gong-ju-lan" class="doc-anchor"></a></h1>
			<hr>
			<p>底部工具栏组件。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#navbar-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#navbar-demo-default-0">default（字体图标）</a></li>
								<li><a href="#navbar-demo-default-1">default（自定义图标）</a></li>
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
			<h2 id="navbar-demo">组件演示</h2>
			<h3 id="navbar-demo-default-0">default（字体图标）</h3>
			<div class="doc-example" data-url="doc/widget/navbar_default_0.jsp">
				<div class="am-navbar am-navbar-default am-cf" data-am-widget="navbar">
					<ul class="am-avg-sm-4 am-navbar-nav am-cf">
						<li>
							<a href="#">
								<span class="am-icon-phone"></span>
								<span class="am-navbar-label">呼叫</span>
							</a>
						</li>
						<li data-am-navbar-share>
							<a href="#">
								<span class="am-icon-share-square-o"></span>
								<span class="am-navbar-label">分享</span>
							</a>
						</li>
						<li data-am-navbar-qrcode>
							<a href="#">
								<span class="am-icon-qrcode"></span>
								<span class="am-navbar-label">二维码</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="am-icon-github"></span>
								<span class="am-navbar-label">GitHub</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="am-icon-download"></span>
								<span class="am-navbar-label">下载使用</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="am-icon-location-arrow"></span>
								<span class="am-navbar-label">Bug 反馈</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="navbar-demo-default-1">default（自定义图标）</h3>
			<div class="doc-example" data-url="doc/widget/navbar_default_1.jsp">
				<div class="am-navbar am-navbar-default am-cf" data-am-widget="navbar">
					<ul class="am-avg-sm-4 am-navbar-nav am-cf">
						<li>
							<a href="#">
								<img src="doc/image/information.png">
								<span class="am-navbar-label">消息</span>
							</a>
						</li>
						<li>
							<a href="#">
								<img src="doc/image/phone.png">
								<span class="am-navbar-label">呼叫</span>
							</a>
						</li>
						<li data-am-navbar-share>
							<a href="#">
								<img src="doc/image/share.png">
								<span class="am-navbar-label">分享</span>
							</a>
						</li>
						<li>
							<a href="#">
								<img src="doc/image/mapping.png">
								<span class="am-navbar-label">地图</span>
							</a>
						</li>
					</ul>
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
			<p>本组件 Handlebars partial 名称为 <code>navbar</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="c636b1be1482e2c96627802b34b16b67" data-title="Navbar 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>