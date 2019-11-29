<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用 - Collections|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="0"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_start.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li><a href="#html5-api-ying-yong">HTML5 API 应用</a></li>
						<li><a href="#ua-shi-bie">UA 识别</a></li>
						<li>
							<a href="#biao-dan-chu-li">表单处理</a>
							<ul class="am-collapse">
								<li><a href="#codeltselectgtcode-xiang-guan">&lt;select&gt; 相关</a></li>
								<li><a href="#shang-chuan-zu-jian">上传组件</a></li>
								<li><a href="#ri-qi-xuan-ze">日期选择</a></li>
								<li><a href="#qu-se">取色</a></li>
							</ul>
						</li>
						<li><a href="#tu-biao-hui-zhi">图表绘制</a></li>
						<li><a href="#ri-qi-ge-shi-hua">日期格式化</a></li>
						<li>
							<a href="#ye-mian-jiao-hu">页面交互</a>
							<ul class="am-collapse">
								<li><a href="#biao-ge-chu-li">表格处理</a></li>
								<li><a href="#slider">Slider</a></li>
								<li><a href="#pu-bu-liu">瀑布流</a></li>
								<li><a href="#tu-pian-lan-jia-zai">图片懒加载</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="collections">Collections <a href="#collections" class="doc-anchor"></a></h1>
			<hr>
			<p>一些 Amaze UI 中没有的、我们认为好的解决方案。</p>
			<h2 id="html5-api-ying-yong">HTML5 API 应用 <a href="#html5-api-ying-yong" class="doc-anchor"></a></h2>
			<ul>
				<li><a href="#">History.js - gracefully supports the HTML5 History/State APIs</a></li>
				<li><a href="#">pushState + ajax</a></li>
				<li><a href="#">Notify.js(Web Notifications API)</a></li>
			</ul>
			<h2 id="ua-shi-bie">UA 识别 <a href="#ua-shi-bie" class="doc-anchor"></a></h2>
			<ul><li><a href="#">detector</a></li></ul>
			<h2 id="biao-dan-chu-li">表单处理 <a href="#biao-dan-chu-li" class="doc-anchor"></a></h2>
			<h3 id="codeltselectgtcode-xiang-guan"><code>&lt;select&gt;</code> 相关 <a href="#codeltselectgtcode-xiang-guan" class="doc-anchor"></a></h3>
			<ul>
				<li><a href="#">Chosen</a></li>
				<li><a href="#">Select2</a></li>
				<li><a href="#">bootstrap-select</a></li>
			</ul>
			<h3 id="shang-chuan-zu-jian">上传组件 <a href="#shang-chuan-zu-jian" class="doc-anchor"></a></h3>
			<ul>
				<li><a href="#">jQuery File Upload Plugin</a></li>
				<li><a href="#">百度 Web Uploader</a></li>
				<li><a href="#">Uploadify</a></li>
				<li><a href="#">arale-upload - 轻量级 iframe and html5 file uploader</a></li>
				<li><a href="#">Fine Uploader</a></li>
			</ul>
			<h3 id="ri-qi-xuan-ze">日期选择 <a href="#ri-qi-xuan-ze" class="doc-anchor"></a></h3>
			<ul>
				<li><a href="#">Both Date and Time picker widget based on twitter bootstrap</a></li>
				<li><a href="#">GMU 日历组件</a></li>
				<li><a href="#">Mobiscroll</a></li>
			</ul>
			<h3 id="qu-se">取色 <a href="#qu-se" class="doc-anchor"></a></h3>
			<ul><li><a href="#">Colorpicker plugin for Twitter Bootstrap</a></li></ul>
			<h2 id="tu-biao-hui-zhi">图表绘制 <a href="#tu-biao-hui-zhi" class="doc-anchor"></a></h2>
			<ul>
				<li><a href="#">Chart.js - Simple HTML5 Charts using Canvas</a></li>
				<li><a href="#">百度 ECharts</a></li>
				<li><a href="#">Chartist.js</a></li>
			</ul>
			<h2 id="ri-qi-ge-shi-hua">日期格式化 <a href="#ri-qi-ge-shi-hua" class="doc-anchor"></a></h2>
			<ul><li><a href="#">Moment.js</a></li></ul>
			<h2 id="ye-mian-jiao-hu">页面交互 <a href="#ye-mian-jiao-hu" class="doc-anchor"></a></h2>
			<h3 id="biao-ge-chu-li">表格处理 <a href="#biao-ge-chu-li" class="doc-anchor"></a></h3>
			<ul><li><a href="#">DataTables</a></li></ul>
			<h3 id="slider">Slider <a href="#slider" class="doc-anchor"></a></h3>
			<ul>
				<li><a href="#">slick - the last carousel you&#39;ll ever need</a></li>
				<li><a href="#">Swiper</a></li>
				<li><a href="#">Swipe - the most accurate touch slider</a></li>
			</ul>
			<h3 id="pu-bu-liu">瀑布流 <a href="#pu-bu-liu" class="doc-anchor"></a></h3>
			<ul>
				<li><a href="#">Masonry</a></li>
				<li><a href="#">Isotope - Filter &amp; sort magical layouts</a></li>
			</ul>
			<h3 id="tu-pian-lan-jia-zai">图片懒加载 <a href="#tu-pian-lan-jia-zai" class="doc-anchor"></a></h3>
			<ul>
				<li><a href="#">imagesLoaded</a></li>
				<li><a href="#">Echo.js</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="223424de382f16b4a55d5d04d8d4f1c4" data-title="开始使用 - Collections|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>