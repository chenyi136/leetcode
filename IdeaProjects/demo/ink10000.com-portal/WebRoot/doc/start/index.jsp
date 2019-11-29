<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用|Amaze UI</title>
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
							<a href="#huo-qu-amaze-ui">获取 Amaze UI</a>
							<ul class="am-collapse">
								<li><a href="#xia-zai-wen-jian">下载文件</a></li>
								<li><a href="#shi-yong-cdn">使用 CDN</a></li>
								<li><a href="#shi-yong-bower">使用 Bower</a></li>
								<li><a href="#yi-zhi-de-cha-jian-shi-yong-shi-li-">移植的插件（使用示例）</a></li>
								<li><a href="#huo-qu-yuan-ma">获取源码</a></li>
							</ul>
						</li>
						<li>
							<a href="#wen-jian-ji-ban-ben-shuo-ming">文件及版本说明</a>
							<ul class="am-collapse">
								<li><a href="#wen-jian-shuo-ming">文件说明</a></li>
								<li><a href="#ban-ben-hao-shuo-ming">版本号说明</a></li>
							</ul>
						</li>
						<li><a href="#xia-zai-bao-mu-lu-jie-gou">下载包目录结构</a></li>
						<li><a href="#chuang-jian-yi-ge-ye-mian">创建一个页面</a></li>
						<li><a href="#can-yu-tao-lun">参与讨论</a></li>
					</ul>
				</div>
			</div>
			<h1 id="kai-shi-shi-yong-amaze-ui">开始使用 Amaze UI <a href="#kai-shi-shi-yong-amaze-ui" class="doc-anchor"></a></h1>
			<hr>
			<p>Amaze UI 是一个轻量级（所有 CSS 和 JS gzip 后 100 kB 左右）、 <a href="#"><strong>Mobile first</strong></a> 的前端框架， 基于开源社区流行前端框架编写（<a href="#">使用、参考的项目列表</a>）。</p>
			<h2 id="huo-qu-amaze-ui">获取 Amaze UI <a href="#huo-qu-amaze-ui" class="doc-anchor"></a></h2>
			<h3 id="xia-zai-wen-jian">下载文件 <a href="#xia-zai-wen-jian" class="doc-anchor"></a></h3>
			<div class="am-g"><div class="am-u-md-8 am-u-md-centered"><a href="#" class="am-btn am-btn-lg am-btn-block am-btn-success" id="doc-dl-btn"><i class="am-icon-download"></i> Amaze UI v2.6.2</a></div></div>
			<ul><li><a href="#"><strong>更新日志</strong></a></li></ul>
			<p><strong>离线文档：</strong></p>
			<div class="am-g">
				<div class="am-u-sm-6"><a href="#" class="am-btn am-btn-block am-btn-primary">HTML 版离线文档</a></div>
				<div class="am-u-sm-6"><a href="#" class="am-btn am-btn-block am-btn-warning">Dash Docsets</a></div>
			</div>
			<p>项目地址：</p>
			<ul>
				<li><a href="#">Amaze UI Docs</a></li>
				<li><a href="#">Amaze UI Dash Docsets Generator</a></li>
			</ul>
			<p><strong>代码片段：</strong></p>
			<div class="am-g">
				<div class="am-u-sm-6"><a href="#" class="am-btn am-btn-block am-btn-secondary">JetBrains 系列编辑器</a></div>
				<div class="am-u-sm-6"><a href="#" class="am-btn am-btn-block am-btn-danger">Sublime</a></div>
			</div>
			<p>详见 <a href="#">Amaze UI Snippets</a>。</p>
			<p><strong>Starter Kit：</strong></p>
			<p>Gulp、NPM 构建的前端开发工作流，点击<a href="#">访问项目主页</a>。</p>
			<h3 id="shi-yong-cdn">使用 CDN <a href="#shi-yong-cdn" class="doc-anchor"></a></h3>
			<h4 id="guan-fang-cdn">官方 CDN <a href="#guan-fang-cdn" class="doc-anchor"></a></h4>
			<p>域名解析服务由 DNSPod 提供，CDN 存储由七牛提供。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
http://cdn.amazeui.org/amazeui/2.6.2/css/amazeui.css
http://cdn.amazeui.org/amazeui/2.6.2/css/amazeui.min.css
http://cdn.amazeui.org/amazeui/2.6.2/js/amazeui.js
http://cdn.amazeui.org/amazeui/2.6.2/js/amazeui.min.js
http://cdn.amazeui.org/amazeui/2.6.2/js/amazeui.ie8polyfill.js
http://cdn.amazeui.org/amazeui/2.6.2/js/amazeui.ie8polyfill.min.js
http://cdn.amazeui.org/amazeui/2.6.2/js/amazeui.widgets.helper.js
http://cdn.amazeui.org/amazeui/2.6.2/js/amazeui.widgets.helper.min.js
					</code>
				</pre>
			</div>
			<h4 id="cdnjs">cdnjs <a href="#cdnjs" class="doc-anchor"></a></h4>
			<p>面向国外的用户可以使用 cdnjs 提供的 CDN 服务（支持 HTTPS）。</p>
			<ul><li><a href="#">https://cdnjs.com/libraries/amazeui</a></li></ul>
			<h3 id="shi-yong-bower">使用 Bower <a href="#shi-yong-bower" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight"><pre><code class="xml">bower install amazeui</code></pre></div>
			<h3 id="yi-zhi-de-cha-jian-shi-yong-shi-li-">移植的插件（使用示例） <a href="#yi-zhi-de-cha-jian-shi-yong-shi-li-" class="doc-anchor"></a></h3>
			<ul>
				<li><a href="#">DateTimePicker - 日期时间选择</a></li>
				<li><a href="#">Echo.js - 图片懒加载</a></li>
				<li><a href="#">Lazyload - 图片懒加载</a></li>
				<li><a href="#">Chosen - 下拉选框增强</a></li>
				<li><a href="#">Masonry - 瀑布流</a></li>
				<li><a href="#">Switch - 开关切换插件</a></li>
				<li><a href="#">Tags Input - 标签输入框</a></li>
				<li><a href="#">Video.js Amaze UI 皮肤</a></li>
				<li><a href="#">jQuery DataTables - 表格分页、排序等</a></li>
				<li><a href="#">Tree - 树形菜单插件</a></li>
				<li><a href="#">Swiper - 图片轮播插件</a></li>
				<li><a href="#">Slick - 图片轮播插件</a></li>
			</ul>
			<h3 id="huo-qu-yuan-ma">获取源码 <a href="#huo-qu-yuan-ma" class="doc-anchor"></a></h3>
			<p>你可以从 GitHub 项目主页获取源代码。</p>
			<h2 id="wen-jian-ji-ban-ben-shuo-ming">文件及版本说明 <a href="#wen-jian-ji-ban-ben-shuo-ming" class="doc-anchor"></a></h2>
			<h3 id="wen-jian-shuo-ming">文件说明 <a href="#wen-jian-shuo-ming" class="doc-anchor"></a></h3>
			<ul>
				<li><code>amazeui.css</code> / <code>amazeui.js</code>：包含 Amaze UI 所有的 CSS、JS。</li>
				<li><code>amazeui.flat.css</code>：圆角版 Amaze UI CSS，演示参见 <code>1.x</code>。</li>
				<li><code>amazeui.ie8polyfill.js</code>：IE8 polyfill。</li>
				<li><code>amazeui.widgets.helper.js</code>： <strong>供使用 Handlebars 的用户使用，其他用户请忽略</strong>，内含 Web 组件必须的 Handlebars helper 及 Web 组件模板 partials。</li>
			</ul>
			<p>以上每个文件都有对应的 minified 文件。</p>
			<h3 id="ban-ben-hao-shuo-ming">版本号说明 <a href="#ban-ben-hao-shuo-ming" class="doc-anchor"></a></h3>
			<p>Amaze UI 遵循 <a href="#">Semantic Versioning</a> 规范，版本格式采用 <code>主版本号.次版本号.修订号</code> 的形式，版本号递增规则如下：</p>
			<ul>
				<li>主版本号：做了不兼容的API 修改，如整体风格变化、大规模重构等；</li>
				<li>次版本号：做了向下兼容的功能性新增；</li>
				<li><p>修订号：做了向下兼容的问题修正、细节调整等。</p></li>
				<li><p><a href="#"><strong>1.x 到 2.x 变更记录暨升级指南</strong></a></p></li>
			</ul>
			<h2 id="xia-zai-bao-mu-lu-jie-gou">下载包目录结构 <a href="#xia-zai-bao-mu-lu-jie-gou" class="doc-anchor"></a></h2>
			<p>下载包中包含 Amaze UI 的 CSS、JS 文件，以及示例文件：</p>
			<ul>
				<li><code>index.html</code> - 空白 HTML 模板；</li>
				<li><code>blog.html</code> - 博客页面模板（<a href="#">预览</a>）；</li>
				<li><code>landing.html</code> - Landing Page 模板（<a href="#">预览</a>）；</li>
				<li><code>login.html</code> - 登录界面模板（<a href="#">预览</a>）；</li>
				<li><code>sidebar.html</code> - 带边栏的文章模板（<a href="#">预览</a>）；</li>
				<li><code>admin-*.html</code> - 简单的管理后台界面（<a href="#">预览</a>）</li>
				<li>在 <code>app.css</code> 中编写 CSS；</li>
				<li>在 <code>app.js</code> 中编写 JavaScript；</li>
				<li>图片资源可以放在 <code>i</code> 目录下。</li>
			</ul>
			<pre>
AmazeUI
|-- assets
|   |-- css
|  |  |-- amazeui.css//Amaze UI 所有样式文件
|  |  |-- amazeui.min.css//约 42 kB (gzipped)
|  |  `-- app.css
|   |-- i
|  |  |-- app-icon72x72@2x.png
|  |  |-- favicon.png
|  |  `-- startup-640x1096.png
|   `-- js
|       |-- amazeui.js
|       |-- amazeui.min.js//约 56 kB (gzipped)
|       |-- amazeui.widgets.helper.js
|       |-- amazeui.widgets.helper.min.js
|       |-- app.js
|       `-- handlebars.min.js
|-- blog.html
|-- index.html
|-- landing.html
|-- login.html
|-- sidebar.html
`-- widget.html
			</pre>
			<h2 id="chuang-jian-yi-ge-ye-mian">创建一个页面 <a href="#chuang-jian-yi-ge-ye-mian" class="doc-anchor"></a></h2>
			<ol>
				<li>新建一个 HTML 文档，将下面的代码粘贴到文档中；</li>
				<li>查看 CSS 组件及 JS 插件，拷贝符合的演示代码，粘贴到 <code>&lt;body&gt;</code> 区域，并按需调整；</li>
				<li>一个简单的页面完成。</li>
			</ol>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-doctype">&lt;!DOCTYPE html&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">html</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"no-js"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">head</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">title</span>&gt;</span>Hello Amaze UI<span class="hljs-tag">&lt;/<span class="hljs-title">title</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">charset</span>=<span class="hljs-value">"UTF-8"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">http-equiv</span>=<span class="hljs-value">"Cache-Control"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"no-siteapp"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">http-equiv</span>=<span class="hljs-value">"X-UA-Compatible"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"IE=edge"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"apple-mobile-web-app-capable"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"yes"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"apple-mobile-web-app-status-bar-style"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"black"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"apple-mobile-web-app-title"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">""</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"description"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">""</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"format-detection"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"telephone=no"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"keywords"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">""</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"mobile-web-app-capable"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"yes"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"msapplication-TileColor"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"#0E90D2"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"msapplication-TileImage"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"assets/i/app-icon72x72@2x.png"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"viewport"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"renderer"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"webkit"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"apple-touch-icon-precomposed"</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"image/png"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"assets/i/startup-640x1096.png"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"apple-touch-icon-precomposed"</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"image/png"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"assets/i/startup-640x1096.png"</span> <span class="hljs-attribute">media</span>=<span class="hljs-value">"(device-width:320px) and (-webkit-device-pixel-ratio:2)"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"alternate icon"</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"image/png"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"assets/i/favicon.png"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"icon"</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"image/png"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"assets/i/favicon.png"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"icon"</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"image/png"</span> <span class="hljs-attribute"><span class="hljs-attribute">href</span>=<span class="hljs-value">"assets/i/app-icon72x72@2x.png"</span> sizes</span>=<span class="hljs-value">"192x192"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"canonical"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">""</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"stylesheet"</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text/css"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"assets/css/amazeui.min.css"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"stylesheet"</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text/css"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"assets/css/app.css"</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">head</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">body</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span>Hello Amaze UI.<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-comment">&lt;!--[if (gte IE 9)|!(IE)]&gt;&lt;!--&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">script</span> <span class="hljs-attribute">src</span>=<span class="hljs-value">"assets/js/jquery.min.js"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">script</span>&gt;</span><span class="hljs-comment">&lt;!--&lt;![endif]--&gt;</span>
<span class="hljs-comment">
&lt;!--[if lte IE 8 ]&gt;
&lt;script src="assets/js/jquery.min-1.11.3.js"&gt;&lt;/script&gt;
&lt;script src="assets/js/modernizr-2.8.3.js"&gt;&lt;/script&gt;
&lt;script src="assets/js/amazeui.ie8polyfill.min-2.6.2.js"&gt;&lt;/script&gt;
&lt;![endif]--&gt;
</span>
<span class="hljs-tag">&lt;<span class="hljs-title">script</span> <span class="hljs-attribute">src</span>=<span class="hljs-value">"assets/js/amazeui.min.js"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">script</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">body</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">html</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h2 id="can-yu-tao-lun">参与讨论 <a href="#can-yu-tao-lun" class="doc-anchor"></a></h2>
			<p>有任何使用问题，请在评论中留言，也欢迎大家发表意见、建议。</p>
			<p><strong>感谢大家对 Amaze UI 的关注和支持！</strong></p>
			<div class="ds-thread" data-thread-key="cfd612c05209983f24889067f1d52ec5" data-title="开始使用|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>