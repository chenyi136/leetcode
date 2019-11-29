<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Nav|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="1"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_css.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li><a href="#ji-ben-yang-shi">基本样式</a></li>
						<li><a href="#shui-ping-dao-hang">水平导航</a></li>
						<li><a href="#biao-qian-shi-dao-hang">标签式导航</a></li>
						<li><a href="#kuan-du-zi-gua-ying">宽度自适应</a></li>
						<li><a href="#dao-hang-zhuang-tai">导航状态</a></li>
						<li><a href="#dao-hang-biao-ti-ji-fen-ge-xian">导航标题及分隔线</a></li>
						<li>
							<a href="#xia-la-cai-dan">下拉菜单</a>
							<ul class="am-collapse"><li><a href="#tab-shi">Tab 式</a></li></ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="nav">Nav <a href="#nav" class="doc-anchor"></a></h1>
			<hr>
			<p>导航样式组件，在 <code>&lt;ul&gt;</code> 链接列表中添加 <code>.am-nav</code> class。</p>
			<h2 id="ji-ben-yang-shi">基本样式 <a href="#ji-ben-yang-shi" class="doc-anchor"></a></h2>
			<p><code>&lt;ul&gt;</code> 添加 <code>.am-nav</code> class 以后就是一个基本的垂直导航。默认样式中并没有限定导航的宽度，可以结合网格使用。</p>
			<div class="doc-example">
				<ul class="am-nav">
					<li class="am-active"><a href="#">首页</a></li>
					<li><a href="#">开始使用</a></li>
					<li><a href="#">按需定制</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="shui-ping-dao-hang">水平导航 <a href="#shui-ping-dao-hang" class="doc-anchor"></a></h2>
			<p>在 <code>.am-nav</code> 的基础上再添加 <code>.am-nav-pills</code>，形成一个水平导航。</p>
			<div class="doc-example">
				<ul class="am-nav am-nav-pills">
					<li class="am-active"><a href="#">首页</a></li>
					<li><a href="#">开始使用</a></li>
					<li><a href="#">按需定制</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="biao-qian-shi-dao-hang">标签式导航 <a href="#biao-qian-shi-dao-hang" class="doc-anchor"></a></h2>
			<p>在 <code>.am-nav</code> 的基础上添加 <code>.am-nav-tabs</code>，形成一个标签式的导航。激活的标签在 <code>&lt;li&gt;</code> 上添加 <code>.am-active</code>。</p>
			<div class="doc-example">
				<ul class="am-nav am-nav-tabs">
					<li class="am-active"><a href="#">首页</a></li>
					<li><a href="#">开始使用</a></li>
					<li><a href="#">按需定制</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="kuan-du-zi-gua-ying">宽度自适应 <a href="#kuan-du-zi-gua-ying" class="doc-anchor"></a></h2>
			<p>在水平导航或标签式导航上添加 <code>.am-nav-justify</code> 让 <code>&lt;li&gt;</code> 平均分配宽度（通过<code>display:table-cell</code> 实现）。</p>
			<p>平均分配只在 <code>media-up</code> (&gt; 640px) 有效，&lt;=640px 时菜单会垂直堆叠（缩小浏览器窗口效果可以查看效果）。</p>
			<div class="doc-example">
				<ul class="am-nav am-nav-pills am-nav-justify">
					<li class="am-active"><a href="#">首页</a></li>
					<li><a href="#">开始使用</a></li>
					<li><a href="#">按需定制</a></li>
					<li><a href="#">加入我们</a></li>
				</ul>
				<ul class="am-nav am-nav-tabs am-nav-justify">
					<li class="am-active"><a href="#">首页</a></li>
					<li><a href="#">开始使用</a></li>
					<li><a href="#">加入我们</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="dao-hang-zhuang-tai">导航状态 <a href="#dao-hang-zhuang-tai" class="doc-anchor"></a></h2>
			<p>导航状态 class 添加在 <code>&lt;li&gt;</code> 上。</p>
			<ul>
				<li><code>.am-disabled</code> - 禁用</li>
				<li><code>.am-active</code> - 激活</li>
			</ul>
			<div class="doc-example">
				<ul class="am-nav am-nav-pills">
					<li class="am-active"><a href="#">首页</a></li>
					<li><a href="#">关于我们</a></li>
					<li class="am-disabled"><a href="#">禁用链接</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="dao-hang-biao-ti-ji-fen-ge-xian">导航标题及分隔线 <a href="#dao-hang-biao-ti-ji-fen-ge-xian" class="doc-anchor"></a></h2>
			<p>导航标题及分隔线目前仅适用于垂直菜单。</p>
			<ul>
				<li><code>.am-nav-header</code> 导航标题，直接放在 <code>&lt;li&gt;</code> 中。</li>
				<li><code>.am-nav-divider</code> 导航分隔线，添加到空的 <code>&lt;li&gt;</code> 上。</li>
			</ul>
			<div class="doc-example">
				<ul class="am-nav">
					<li><a href="#"><span class="am-icon-home"></span>首页</a></li>
					<li class="am-nav-header">开始使用</li>
					<li><a href="#">关于我们</a></li>
					<li><a href="#">联系我们</a></li>
					<li class="am-nav-divider"></li>
					<li><a href="#">响应式</a></li>
					<li><a href="#">移动优先</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="xia-la-cai-dan">下拉菜单 <a href="#xia-la-cai-dan" class="doc-anchor"></a></h2>
			<p>需结合 JS <a href="#">Dropdown</a> 组件使用。</p>
			<div class="doc-example">
				<ul class="am-nav am-nav-pills">
					<li class="am-active"><a href="#">首页</a></li>
					<li><a href="#">项目</a></li>
					<li class="am-dropdown" data-am-dropdown>
						<a href="javascript:;" class="am-dropdown-toggle" data-am-dropdown-toggle>菜单 <span class="am-icon-caret-down"></span></a>
						<ul class="am-dropdown-content">
							<li class="am-dropdown-header">Header</li>
							<li><a href="#">1. 一行代码，简单快捷</a></li>
							<li class="am-active"><a href="#">2. 网址不变且唯一</a></li>
							<li><a href="#">3. 内容实时同步更新</a></li>
							<li class="am-disabled"><a href="#">4. 云端跨平台适配</a></li>
							<li class="am-divider"></li>
							<li><a href="#">5. 专属的一键拨叫</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="tab-shi">Tab 式 <a href="#tab-shi" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<ul class="am-nav am-nav-tabs">
					<li class="am-active"><a href="#">首页</a></li>
					<li><a href="#">项目</a></li>
					<li class="am-dropdown" data-am-dropdown>
						<a href="javascript:;" class="am-dropdown-toggle" data-am-dropdown-toggle>菜单 <span class="am-icon-caret-down"></span></a>
						<ul class="am-dropdown-content">
							<li class="am-dropdown-header">Header</li>
							<li><a href="#">1. 一行代码，简单快捷</a></li>
							<li class="am-active"><a href="#">2. 网址不变且唯一</a></li>
							<li><a href="#">3. 内容实时同步更新</a></li>
							<li class="am-disabled"><a href="#">4. 云端跨平台适配</a></li>
							<li class="am-divider"></li>
							<li><a href="#">5. 专属的一键拨叫</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="6264c0af1f4304730244912fdde496ef" data-title="CSS - Nav|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>