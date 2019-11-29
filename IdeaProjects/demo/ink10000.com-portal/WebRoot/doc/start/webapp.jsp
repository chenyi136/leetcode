<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用 - Webapp|Amaze UI</title>
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
						<li>
							<a href="#zhuo-mian-tu-biao">桌面图标</a>
							<ul class="am-collapse">
								<li><a href="#zhong-ji-fang-an">终极方案</a></li>
								<li><a href="#ios">iOS</a></li>
								<li><a href="#android-chrome">Android Chrome</a></li>
								<li><a href="#win-8">Win 8</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="web-app-xiang-guan">Web App 相关 <a href="#web-app-xiang-guan" class="doc-anchor"></a></h1>
			<hr>
			<h2 id="zhuo-mian-tu-biao">桌面图标 <a href="#zhuo-mian-tu-biao" class="doc-anchor"></a></h2>
			<p>在开发网站的过程中我们常常会设置一个 Touch Icon。由于系统的差异性，添加到桌面图标并没有统一的标准。iOS 最早支持 Touch Icon，并有明确的规范，其他系统一定程度上支持 iOS 的规范。</p>
			<h3 id="zhong-ji-fang-an">终极方案 <a href="#zhong-ji-fang-an" class="doc-anchor"></a></h3>
			<p>下面是兼容 iOS 4.2+ 及 Android 2.1+ 的通用写法：</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"apple-touch-icon-precomposed"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"icon72x72@2x.png"</span>&gt;</span></code></pre></div>
			<ul>
				<li><code>rel='apple-touch-icon-precomposed'</code>：不给 Icon 添加额外的效果；兼容 Android 1.5 - 2.1。</li>
				<li>Icon 尺寸：144px * 144px，兼容 iPhone、iPad 及绝大部分安卓设备。</li>
			</ul>
			<p>如果想了解更多细节，可以继续阅读后面的内容。</p>
			<h3 id="ios">iOS <a href="#ios" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!-- 添加至主屏, 从主屏进入会隐藏地址栏和状态栏, 全屏(content="yes") --&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"apple-mobile-web-app-capable"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"yes"</span>&gt;</span>
<span class="hljs-comment">&lt;!-- 系统顶栏的颜色(content=black、white 和 black-translucent)选其一就可以 --&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"apple-mobile-web-app-status-bar-style"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"black"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"apple-mobile-web-app-status-bar-style"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"white"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"apple-mobile-web-app-status-bar-style"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"black-translucent"</span>&gt;</span>
<span class="hljs-comment">&lt;!-- 指定标题 --&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"apple-mobile-web-app-title"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"Web Starter Kit"</span>&gt;</span>
<span class="hljs-comment">&lt;!-- 指定icon, 建议PNG格式--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"apple-touch-icon"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"touch-icon-iphone.png"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"apple-touch-icon"</span> <span class="hljs-attribute">sizes</span>=<span class="hljs-value">"76x76"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"touch-icon-ipad.png"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"apple-touch-icon"</span> <span class="hljs-attribute">sizes</span>=<span class="hljs-value">"120x120"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"touch-icon-iphone-retina.png"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"apple-touch-icon"</span> <span class="hljs-attribute">sizes</span>=<span class="hljs-value">"152x152"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"touch-icon-ipad-retina.png"</span>&gt;</span>
<span class="hljs-comment">
&lt;!--
使用rel="apple-touch-icon"属性为“增加高光光亮的图标”, 系统会自动为图标添加圆角及高光；
使用rel="apple-touch-icon-precomposed"属性为“设计原图图标”；
--&gt;
</span>
					</code>
				</pre>
			</div>
			<p>尺寸说明：</p>
			<table style="text-align:center;" class="am-table am-table-bd am-table-striped">
				<thead style="text-align:center;">
					<tr>
						<th style="width:100px;text-align:center;">机型</th>
						<th>iPhone 5 and iPod touch (高分辨率)</th>
						<th>iPhone and iPod touch (高分辨率)</th>
						<th>iPad and iPad mini (高分辨率)</th>
						<th>iPad 2 and iPad mini (标准分辨率)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>尺寸 (px)</td>
						<td>120 x 120</td>
						<td>120 x 120</td>
						<td>152 x 152</td>
						<td>76 x 76</td>
					</tr>
				</tbody>
			</table>
			<p><strong>参考链接：</strong></p>
			<ul>
				<li><a href="#">iOS Human Interface Guidelines - Icon and Image Sizes</a></li>
				<li><a href="#">Everything you always wanted to know about touch icons</a></li>
				<li><a href="#">Configuring Web Applications</a></li>
			</ul>
			<h3 id="android-chrome">Android Chrome <a href="#android-chrome" class="doc-anchor"></a></h3>
			<p>Android 下目前只有 Chrome 31 支持 Add to Homescreen。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"mobile-web-app-capable"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"yes"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"icon"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"images/touch/chrome-touch-icon-196x196.png"</span> <span class="hljs-attribute">sizes</span>=<span class="hljs-value">"196x196"</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p><strong>参考链接：</strong></p>
			<ul><li><a href="#">Chrome Add to Homescreen</a></li></ul>
			<h3 id="win-8">Win 8 <a href="#win-8" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!--win8 磁贴图标--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"msapplication-TileImage"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"images/touch/ms-touch-icon-144x144-precomposed.png"</span>&gt;</span>
<span class="hljs-comment">&lt;!--win8 磁贴颜色--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"msapplication-TileColor"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"#3372DF"</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p><strong>参考链接：</strong></p>
			<ul>
				<li><a href="#">Pinned Sites</a></li>
				<li><a href="#">MSDN - Pinned site metadata reference</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="0adcd179955a0b56461cfeeeeb12450f" data-title="开始使用 - Webapp|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>