<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用 - Project-structure|Amaze UI</title>
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
						<li><a href="#xiang-mu-jie-gou">项目结构</a></li>
						<li><a href="#less">Less</a></li>
						<li><a href="#javascript">JavaScript</a></li>
					</ul>
				</div>
			</div>
			<h1 id="ji-yu-amaze-ui-jin-jie-kai-fa">基于 Amaze UI 进阶开发 <a href="#ji-yu-amaze-ui-jin-jie-kai-fa" class="doc-anchor"></a></h1>
			<hr>
			<p>使用中有何问题，请直接在<a href="#ds-thread">评论</a>中留言，我们会不断补充完善文档。</p>
			<h2 id="xiang-mu-jie-gou">项目结构 <a href="#xiang-mu-jie-gou" class="doc-anchor"></a></h2>
			<pre>
Amaze UI
|-- HISTORY.md
|-- LICENSE
|-- README.md
|-- package.json
|-- dist #部署目录
|-- docs #文档
|-- fonts #Icon font，使用 Font Awesome
|-- gulpfile.js #构建配置文件
|-- js #JS文件
|-- less #Less文件
|-- tools #相关工具
|-- vendor # 第三方文件
`-- widget # Web 组件
			</pre>
			<h2 id="less">Less <a href="#less" class="doc-anchor"></a></h2>
			<p><code>less</code> 文件中存放了所有 LESS 源文件，其中以 <code>ui.</code> 开头的为 JS 插件相关的样式。</p>
			<p>下面两个文件为开发中可能需要关注的：</p>
			<ul><li><code>mixins.less</code> - LESS 常用函数封装</li><li><code>variables.less</code> - 所有变量列表</li></ul>
			<pre>
less
|-- amazeui.less //Amaze UI所有样式文件
|-- amui.less //CSS、JavaScript样式，不包含 Web 组件
├── amazeui.less
├── amui.less
├── animation.less
├── article.less
├── badge.less
├── base.less
├── block-grid.less
├── breadcrumb.less
├── button-group.less
├── button.less
├── close.less
├── code.less
├── comment.less
├── form.less
├── grid.less
├── icon.less
├── image.less
├── input-group.less
├── legacy.ie.less
├── list.less
├── mixins.less
├── nav.less
├── pagination.less
├── panel.less
├── print.less
├── progress.less
├── table.less
├── thumbnail.less
├── topbar.less
├── ui.add2home.less
├── ui.alert.less
├── ui.component.less
├── ui.datepicker.less
├── ui.dropdown.less
├── ui.flexslider.less
├── ui.modal.less
├── ui.offcanvas.less
├── ui.popover.less
├── ui.progress.less
├── ui.pureview.less
├── ui.selected.less
├── ui.share.less
├── ui.tabs.less
├── ui.ucheck.less
├── utility.less
└── variables.less
			</pre>
			<h2 id="javascript">JavaScript <a href="#javascript" class="doc-anchor"></a></h2>
			<p>JS 文件分三类：</p>
			<ul>
				<li><code>ui.</code> 开头的为 <a href="doc/plugin/index.jsp">JS 插件</a>中的【UI 增强】部分；</li>
				<li><code>util.</code> 开头的为 <a href="doc/plugin/index.jsp">JS 插件</a>中的 【实用工具】部分。</li>
			</ul>
			<pre>
js
├── core.js
├── ui.add2home.js
├── ui.alert.js
├── ui.button.js
├── ui.collapse.js
├── ui.datepicker.js
├── ui.dimmer.js
├── ui.dropdown.js
├── ui.flexslider.js
├── ui.iscroll-lite.js
├── ui.modal.js
├── ui.offcanvas.js
├── ui.pinchzoom.js
├── ui.popover.js
├── ui.progress.js
├── ui.pureview.js
├── ui.scrollspy.js
├── ui.scrollspynav.js
├── ui.selected.js
├── ui.share.js
├── ui.smooth-scroll.js
├── ui.sticky.js
├── ui.tabs.js
├── ui.ucheck.js
├── ui.validator.js
├── util.cookie.js
├── util.fullscreen.js
├── util.geolocation.js
├── util.hammer.js
├── util.qrcode.js
└── util.store.js
			</pre>
			<div class="ds-thread" data-thread-key="c6de3715f9198887a6296e90b16892ee" data-title="开始使用 - Project-structure|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>