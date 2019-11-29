<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用 - Compatibility|Amaze UI</title>
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
							<a href="#fen-ji-liu-lan-qi-zhi-chi-abbr-titlegraded-browser-supportgbsabbr">分级浏览器支持（GBS）</a>
							<ul class="am-collapse">
								<li><a href="#amaze-ui-gbs-miao-shu">Amaze UI GBS 描述</a></li>
								<li><a href="#amaze-ui-gbs">Amaze UI GBS</a></li>
								<li><a href="#ie-89">IE 8/9</a></li>
								<li><a href="#ie-8">IE 8</a></li>
							</ul>
						</li>
						<li><a href="#guan-yu-ie-67">关于 IE 6/7</a></li>
					</ul>
				</div>
			</div>
			<h1 id="compatibility">Compatibility <a href="#compatibility" class="doc-anchor"></a></h1>
			<hr>
			<p>Amaze UI 面向现代浏览器开发，对 IE 8/9 等浏览器只提供有限的支持。</p>
			<p><strong>注意：</strong></p>
			<ul>
				<li><strong>请不要使用 <code>IETester</code> 这种不靠谱的工具测试</strong>；</li>
				<li>按照微软<a href="#">官方的说法</a>，IE 开发者工具中的浏览器模式也不一定靠谱；</li>
				<li>微软官方提供了<a href="#">各种 IE 测试虚拟机</a>。</li>
			</ul>
			<h2 id="fen-ji-liu-lan-qi-zhi-chi-abbr-titlegraded-browser-supportgbsabbr">分级浏览器支持（<abbr>GBS</abbr>） <a href="#fen-ji-liu-lan-qi-zhi-chi-abbr-titlegraded-browser-supportgbsabbr" class="doc-anchor"></a></h2>
			<p><a href="#"><abbr>GBS</abbr></a> 是 YUI 团队提出的应对日益增长的浏览器兼容问题的思路，详情可以查看 <a href="#">YUI 相关页面</a>。</p>
			<h3 id="amaze-ui-gbs-miao-shu">Amaze UI GBS 描述 <a href="#amaze-ui-gbs-miao-shu" class="doc-anchor"></a></h3>
			<ul>
				<li><strong>A 级：</strong>最高支持级别，充分利用 H5 和 CSS3 等技术，提供最优的视觉和交互效果。</li>
				<li><strong>B 级：</strong>有限支持，基本的样式和正常的交互，不考虑视觉、交互效果。</li>
				<li><strong>C 级：</strong>核心支持，显示语义化的 HTML 标记渲染的内容，不考虑样式和行为。</li>
				<li><strong>X 级：</strong>未知、零散的很少使用或已经停止开发的浏览器，可能不支持，也可能支持。</li>
			</ul>
			<h3 id="amaze-ui-gbs">Amaze UI GBS <a href="#amaze-ui-gbs" class="doc-anchor"></a></h3>
			<p>按照国际惯例，Amaze UI 提供对主流浏览器（系统）最近两个稳定版本的全面支持。结合国内实际情况，一些浏览器的支持缩减为最新正式版，IE 则对更老版本做了有限支持。</p>
			<p>Amaze UI 对浏览器做了一个粗略分级，<strong>优先支持 A 级浏览器</strong>。</p>
			<p>由于资源有限，无法列出所有的浏览器，<strong>使用 <code>WebKit</code> 的浏览器只要不乱修改内核，理论上应该都支持</strong>。</p>
			<p>关于浏览器功能支持的更多细节请参考 <a href="#">Can I use</a>（UC 浏览器的数据已经被收录，不知是喜是忧）。</p>
			<table class="am-table am-table-bordered am-table-striped">
				<thead>
					<tr>
						<th>OS/Browser</th>
						<th>Ver</th>
						<th>Windows</th>
						<th>iOS(7.1.2+)</th>
						<th>OS X (10.9+)</th>
						<th>Android (4.1+)</th>
						<th>WP(8+)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>Chrome</th>
						<td>L2</td>
						<td class="am-success">A</td>
						<td class="am-success">A</td>
						<td class="am-success">A</td>
						<td class="am-success">A</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<th rowspan="4">IE</th>
						<td>10+</td>
						<td class="am-success">A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-success">A-</td>
					</tr>
					<tr>
						<td>9</td>
						<td class="am-warning">B</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<td>8</td>
						<td class="am-danger">C+</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<td>lte7</td>
						<td class="am-danger">C</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<th>Firefox</th>
						<td>L2</td>
						<td class="am-success">A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-success">A</td>
						<td class="am-primary">X</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<th>Safari</th>
						<td>L2</td>
						<td class="am-primary">X</td>
						<td class="am-success">A</td>
						<td class="am-success">A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<th>Opera</th>
						<td>L1</td>
						<td class="am-primary">X</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-primary">X</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<th>Opera Coast</th>
						<td>L1</td>
						<td class="am-disabled">N/A</td>
						<td class="am-success">A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<th>Opera Mini</th>
						<td>L1</td>
						<td class="am-disabled">N/A</td>
						<td class="am-primary">X</td>
						<td class="am-disabled">N/A</td>
						<td class="am-primary">X</td>
						<td class="am-primary">X</td>
					</tr>
					<tr>
						<th class="am-text-nowrap">Stock<sup>1</sup></th>
						<td>L1</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-primary">X</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<th>UC 浏览器</th>
						<td>L1</td>
						<td class="am-primary">X</td>
						<td class="am-success">A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-success">A</td>
						<td class="am-success">A-</td>
					</tr>
					<tr>
						<th rowspan="2">360浏览器</th>
						<td>L1-极速</td>
						<td class="am-success">A-</td>
						<td class="am-primary">X</td>
						<td class="am-success">N/A</td>
						<td class="am-primary">X</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<td>L1-IE8</td>
						<td class="am-danger">C+</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-primary">X</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<th rowspan="2">搜狗浏览器</th>
						<td class="am-text-nowrap">L1-极速</td>
						<td class="am-success">A-</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<td>L1-IE8</td>
						<td class="am-danger">C+</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
					</tr>
					<tr>
						<th>FF Mobile</th>
						<td>L1</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td class="am-disabled">N/A</td>
						<td>X</td>
						<td class="am-disabled">N/A</td>
					</tr>
				</tbody>
			</table>
			<p><strong>注释：</strong></p>
			<ul>
				<li><code>L</code> 代表 <code>last</code>，<code>L2</code> - 最新的两个稳定版本；<code>L1</code> - 最新稳定版本。</li>
				<li><code>1</code> 安卓系统自动浏览器，由于部分厂商对浏览器做了修改，列为 X 级。</li>
			</ul>
			<p><strong>参考链接</strong>：</p>
			<ul><li><a href="#">iOS Version Stats</a></li></ul>
			<h3 id="ie-89">IE 8/9 <a href="#ie-89" class="doc-anchor"></a></h3>
			<ul>
				<li>IE 8/9 不支持 <code>transition</code>，看不到任何动画效果；</li>
				<li>IE 9 对 ES5 支持相对较好，引入完整的 <code>amazeui.js</code> 不会报错，IE 8 则不然；</li>
				<li><strong>Web 组件部分不提供 IE 8/9 官方支持</strong>。</li>
			</ul>
			<p><strong>有限支持 IE 8/9 的 JS 插件</strong>：</p>
			<ul>
				<li>警告框（Alert）；</li>
				<li>按钮交互（Button）；</li>
				<li>折叠面板（Collpase）；</li>
				<li>下拉组件（Dropdown）；</li>
				<li>模态窗口（Modal）；</li>
				<li>弹出框（Popover）；</li>
				<li>图片轮播（Slider）；</li>
				<li>侧边栏（OffCanvas）；</li>
				<li>滚动侦测（ScrollSpyNav）；</li>
				<li>固定元素（Sticky）；</li>
				<li>选项卡（Tabs）；</li>
			</ul>
			<table class="am-table am-table-bordered am-table-striped">
				<thead>
					<tr>
						<th class="col-xs-4">功能</th>
						<th class="col-xs-4">IE 8</th>
						<th class="col-xs-4">IE 9</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th><code>border-radius</code></th>
						<td class="am-danger"><span class="am-icon-close"></span>NO</td>
						<td class="am-success"><span class="am-icon-check"></span>YES</td>
					</tr>
					<tr>
						<th><code>box-shadow</code></th>
						<td class="am-danger"><span class="am-icon-remove"></span>NO</td>
						<td class="am-success"><span class="am-icon-check"></span>YES</td>
					</tr>
					<tr>
						<th><code>transform</code></th>
						<td class="am-danger"><span class="am-icon-remove"></span>NO</td>
						<td class="am-success"><span class="am-icon-check"></span>YES（<code>-ms</code> 前缀）</td>
					</tr>
					<tr>
						<th><code>Flex Box</code></th>
						<td class="am-danger" colspan="2"><span class="am-icon-remove"></span>NO</td>
					</tr>
					<tr>
						<th><code>transition</code></th>
						<td class="am-danger" colspan="2"><span class="am-icon-remove"></span>NO</td>
					</tr>
					<tr>
						<th><code>placeholder</code></th>
						<td class="am-danger" colspan="2"><span class="am-icon-remove"></span>NO</td>
					</tr>
				</tbody>
			</table>
			<h3 id="ie-8">IE 8 <a href="#ie-8" class="doc-anchor"></a></h3>
			<div class="am-alert am-alert-warning">请注意，我们对 IE 8 的支持的仅限为<strong>布局、部分 JS 插件交互基本正常</strong>，IE 8 相关 Issue 将列为 `P4`(最低优先级，可能不会处理)。</div>
			<p>需要<strong>支持 IE 8 的用户请使用条件注释引入<del><code>amazeui.legacy.js</code></del></strong> <code>amazeui.ie8polyfill.min.js</code>。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
﻿<span class="hljs-comment">&lt;!--[if (gte IE 9)|!(IE)]&gt;&lt;!--&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">script</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text/javascript"</span> <span class="hljs-attribute">src</span>=<span class="hljs-value">"http://libs.baidu.com/jquery/2.1.4/jquery.min.js"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">script</span>&gt;</span><span class="hljs-comment">&lt;!--&lt;![endif]--&gt;</span>
<span class="hljs-comment">
&lt;!--[if lt IE 9]&gt;
&lt;script type="text/javascript" src="assets/js/jquery.min-1.11.3.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="assets/js/amazeui.ie8polyfill.min-2.6.2.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="assets/js/amazeui.ie8polyfill.min-2.6.2.js"&gt;&lt;/script&gt;
&lt;![endif]--&gt;
</span>
<span class="hljs-tag">&lt;<span class="hljs-title">script</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text/javascript"</span> <span class="hljs-attribute">src</span>=<span class="hljs-value">"assets/js/amazeui.js"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">script</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p><code>amazeui.ie8polyfill.js</code> 中包含以下 polyfill：</p>
			<ul>
				<li><a href="#">Console-polyfill</a></li>
				<li><a href="#">es5-shim</a></li>
				<li><a href="#">es5-sham</a></li>
				<li><a href="#">EventListener Polyfill</a></li>
				<li><a href="#">REM-unit-polyfill</a></li>
				<li><a href="#">Respond.js</a></li>
			</ul>
			<h4 id="html5-xin-yuan-su">HTML5 新元素 <a href="#html5-xin-yuan-su" class="doc-anchor"></a></h4>
			<p>以下任意引入一个即可，Amaze UI 官网引的是 Modernizr。</p>
			<ul>
				<li><a href="#">Modernizr</a></li>
				<li><a href="#">HTML5 Shiv</a></li>
			</ul>
			<h4 id="media-query">Media Query <a href="#media-query" class="doc-anchor"></a></h4>
			<ul><li><a href="#">Respond.js</a></li></ul>
			<h4 id="rem">rem <a href="#rem" class="doc-anchor"></a></h4>
			<ul><li><a href="#">REM unit polyfill</a></li></ul>
			<h4 id="codebox-sizingcode"><code>box-sizing</code> <a href="#codebox-sizingcode" class="doc-anchor"></a></h4>
			<blockquote><p>IE 8 ignores <code>box-sizing:border-box</code> if min/max-width/height is used.</p></blockquote>
			<h4 id="wei-yuan-su">伪元素 <a href="#wei-yuan-su" class="doc-anchor"></a></h4>
			<p>IE 8 只支持 CSS 2.1 规范中的单冒号语法（<code>:before</code>/<code>:after</code>），不支持 CSS3 的双冒号语法(<code>::before</code>/<code>::after</code>)。</p>
			<h4 id="zi-ti-tu-biao">字体图标 <a href="#zi-ti-tu-biao" class="doc-anchor"></a></h4>
			<p>参见 Bootstrap 中的 <a href="#">issue 及里面提供的解决方法</a>。</p>
			<h2 id="guan-yu-ie-67">关于 IE 6/7 <a href="#guan-yu-ie-67" class="doc-anchor"></a></h2>
			<p><strong>Amaze UI 不会支持 IE 6~7</strong>。</p>
			<div class="ds-thread" data-thread-key="ea103f94d3e8ae4ea6be9227aac36f0e" data-title="开始使用 - Compatibility|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>