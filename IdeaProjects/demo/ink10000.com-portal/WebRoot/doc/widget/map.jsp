<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Map 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="map-di-tu">Map 地图 <a href="#map-di-tu" class="doc-anchor"></a></h1>
			<hr>
			<p><strong>本组件调用百度地图极速版 API，适用于触控设备，使用鼠标无法进行拖放等操作。</strong></p>
			<p>如果通过地址定位不准确，可以选择使用经纬度定位，设置经纬度定位以后，地址定位会被忽略。</p>
			<p><strong>经纬度获取：</strong>打开<a href="#">百度地图坐标拾取系统</a>，在地图中找准要标识的位置，点击右上角【复制】按钮即可获取经纬度（逗号前面的为经度，后面的为纬度）。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#map-demo">组件演示</a>
							<ul class="am-collapse"><li><a href="#map-demo-default-0">default（默认）</a></li></ul>
						</li>
						<li>
							<a href="#shi-yong-fang-fa">使用方法</a>
							<ul class="am-collapse">
								<li><a href="#zhi-jie-shi-yong">直接使用</a></li>
								<li><a href="#shi-yong-handlebars">使用 Handlebars</a></li>
								<li><a href="#yun-gua-pei-webide">云适配 WebIDE</a></li>
							</ul>
						</li>
						<li><a href="#api">API</a></li>
					</ul>
				</div>
			</div>
			<h2 id="map-demo">组件演示</h2>
			<h3 id="map-demo-default-0">default（默认）</h3>
			<div class="doc-example" data-url="doc/widget/map_default_0.jsp"><div class="am-map am-map-default" data-am-widget="map" data-address="北京市海淀区海淀大街27号亿景大厦3层西区" data-latitude data-longitude data-name="云适配" data-icon="doc/image/mapicon.png" data-scalecontrol data-setzoom="17" data-zoomcontrol="true"><div id="bd-map"></div></div></div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的配置信息替换成自己的信息。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>map</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面，设置名称、坐标等信息；</li>
				<li>本组件无需采集数据。</li>
			</ul>
			<h2 id="api">API <a href="#api" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="dec96f47e201f6279290b8d8262f883c" data-title="Map 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>