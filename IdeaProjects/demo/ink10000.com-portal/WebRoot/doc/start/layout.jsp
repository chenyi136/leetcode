<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用 - Layouts|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
<style type="text/css">
.am-thumbnail span.am-thumbnail-caption{
	display:block;
}
</style>
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
							<a href="#shi-li-shuo-ming">示例说明</a>
							<ul class="am-collapse">
								<li><a href="#zhan-shi-ye-mian">展示页面</a></li>
								<li><a href="#deng-lu-ye-mian">登录页面</a></li>
								<li><a href="#bo-ke-ye-mian">博客页面</a></li>
								<li><a href="#bo-ke-ce-lan-ye-mian">博客侧栏页面</a></li>
								<li><a href="#guan-li-hou-tai-mo-ban">管理后台模板</a></li>
							</ul>
						</li>
						<li><a href="#jin-yong-xiang-ying-shi">禁用响应式</a></li>
					</ul>
				</div>
			</div>
			<h1 id="bu-ju-shi-li">布局示例 <a href="#bu-ju-shi-li" class="doc-anchor"></a></h1>
			<hr>
			<p>Amaze UI 目前提供几个常见的布局示例，供开发者参考，后续会增加更多示例。</p>
			<hr>
			<p><strong>关于图标显示异常的说明：</strong></p>
			<p><del>为避免 <code>Mixed Content</code> 错误，Icon Font 的 URL 没有添加协议，直接使用磁盘路径 <code>file:///...</code> 打开时示例页面时无法正常显示图标，请放在 HTTP 服务中查看。</del></p>
			<p><strong>最新的下载包中已经将字体路径替换为本地路径！</strong></p>
			<ul>
				<li>使用 JetBrais 系（WebStorm 等）打开示例文件夹，然后在编辑器里点预览按钮；</li>
				<li><code>cd</code> 到示例目录，<code>python -m SimpleHTTPServer</code>；</li>
				<li>或者使用其他 HTTP 服务器。</li>
			</ul>
			<hr>
			<h2 id="shi-li-shuo-ming">示例说明 <a href="#shi-li-shuo-ming" class="doc-anchor"></a></h2>
			<div class="am-g">
				<div class="am-u-sm-6 am-u-md-3"><a href="#" class="am-thumbnail"><img src="doc/image/landing.png" class="am-img-thumbnail"><span class="am-thumbnail-caption">展示页面</span></a></div>
				<div class="am-u-sm-6 am-u-md-3"><a href="#" class="am-thumbnail"><img src="doc/image/login.png" class="am-img-thumbnail"><span class="am-thumbnail-caption">登录注册页面</span></a></div>
				<div class="am-u-sm-6 am-u-md-3"><a href="#" class="am-thumbnail"><img src="doc/image/blog.png" class="am-img-thumbnail"><span class="am-thumbnail-caption">博客页面</span></a></div>
				<div class="am-u-sm-6 am-u-md-3"><a href="#" class="am-thumbnail"><img src="doc/image/sidebar.png" class="am-img-thumbnail"><span class="am-thumbnail-caption">侧边栏页面</span></a></div>
			</div>
			<div class="am-g"><div class="am-u-sm-6 am-u-md-3"><a href="#" class="am-thumbnail"><img src="doc/image/bing-11.jpg" class="am-img-thumbnail"><span class="am-thumbnail-caption">管理后台模板</span></a></div></div>
			<h3 id="zhan-shi-ye-mian">展示页面 <a href="#zhan-shi-ye-mian" class="doc-anchor"></a></h3>
			<p>使用组件说明：</p>
			<ul>
				<li>
					CSS 部分：
					<a href="doc/css/grid.jsp" class="am-badge am-badge-success">网格</a>
					<a href="doc/css/icon.jsp" class="am-badge am-badge-success">图标</a>
					<a href="doc/css/button.jsp" class="am-badge am-badge-success">按钮</a>
					<a href="doc/css/form.jsp" class="am-badge am-badge-success">表单</a>
					<a href="doc/css/article.jsp" class="am-badge am-badge-success">文章页</a>
					<a href="doc/css/topbar.jsp" class="am-badge am-badge-success">导航条</a>
					<a href="doc/css/utility.jsp" class="am-badge am-badge-success">辅助类</a>
				</li>
				<li>
					JS 插件部分：
					<a href="doc/plugin/dropdown.jsp" class="am-badge am-badge-primary">下拉组件</a>
					<a href="doc/plugin/scrollspy.jsp" class="am-badge am-badge-primary">滚动侦测</a>
				</li>
			</ul>
			<h3 id="deng-lu-ye-mian">登录页面 <a href="#deng-lu-ye-mian" class="doc-anchor"></a></h3>
			<p>使用组件说明：</p>
			<ul>
				<li>
					CSS 部分：
					<a href="doc/css/grid.jsp" class="am-badge am-badge-success">网格</a>
					<a href="doc/css/icon.jsp" class="am-badge am-badge-success">图标</a>
					<a href="doc/css/button.jsp" class="am-badge am-badge-success">按钮</a>
					<a href="doc/css/button-group.jsp" class="am-badge am-badge-success">按钮组</a>
					<a href="doc/css/form.jsp" class="am-badge am-badge-success">表单</a>
				</li>
			</ul>
			<h3 id="bo-ke-ye-mian">博客页面 <a href="#bo-ke-ye-mian" class="doc-anchor"></a></h3>
			<p>使用组件说明：</p>
			<ul>
				<li>
					CSS 部分：
					<a href="doc/css/grid.jsp" class="am-badge am-badge-success">网格</a>
					<a href="doc/css/block-grid.jsp" class="am-badge am-badge-success">等宽布局</a>
					<a href="doc/css/icon.jsp" class="am-badge am-badge-success">图标</a>
					<a href="doc/css/button.jsp" class="am-badge am-badge-success">按钮</a>
					<a href="doc/css/panel.jsp" class="am-badge am-badge-success">面板</a>
					<a href="doc/css/list.jsp" class="am-badge am-badge-success">列表</a>
					<a href="doc/css/pagination.jsp" class="am-badge am-badge-success">分页</a>
				</li>
				<li>
					JS 插件部分：
					<a href="doc/plugin/dropdown.jsp" class="am-badge am-badge-primary">下拉组件</a>
				</li>
			</ul>
			<h3 id="bo-ke-ce-lan-ye-mian">博客侧栏页面 <a href="#bo-ke-ce-lan-ye-mian" class="doc-anchor"></a></h3>
			<p>使用组件说明：</p>
			<ul>
				<li>
					CSS 部分：
					<a href="doc/css/grid.jsp" class="am-badge am-badge-success">网格</a>
					<a href="doc/css/article.jsp" class="am-badge am-badge-success">文章页</a>
					<a href="doc/css/comment.jsp" class="am-badge am-badge-success">评论列表</a>
					<a href="doc/css/button.jsp" class="am-badge am-badge-success">按钮</a>
					<a href="doc/css/icon.jsp" class="am-badge am-badge-success">图标</a>
					<a href="doc/css/list.jsp" class="am-badge am-badge-success">列表</a>
					<a href="doc/css/utility.jsp" class="am-badge am-badge-success">辅助类</a>
				</li>
				<li>
					JS 插件部分：
					<a href="doc/plugin/offcanvas.jsp" class="am-badge am-badge-primary">侧边栏组件</a>
				</li>
			</ul>
			<h3 id="guan-li-hou-tai-mo-ban">管理后台模板 <a href="#guan-li-hou-tai-mo-ban" class="doc-anchor"></a></h3>
			<ul>
				<li><a href="#">index 页面</a></li>
				<li><a href="#">user 页面</a></li>
				<li><a href="#">gallery 页面</a></li>
				<li><a href="#">table 页面</a></li>
				<li><a href="#">form 页面</a></li>
				<li><a href="#">help 页面</a></li>
				<li><a href="#">log 页面</a></li>
				<li><a href="#">404 页面</a></li>
			</ul>
			<h2 id="jin-yong-xiang-ying-shi">禁用响应式 <a href="#jin-yong-xiang-ying-shi" class="doc-anchor"></a></h2>
			<p>不喜欢响应式？可以尝试禁用：</p>
			<ul><li>删除 <code>head</code> 里的视口设置 <code>meta</code> 标签；</li></ul>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-comment">&lt;!--&lt;meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"&gt;--&gt;</span></code></pre></div>
			<ul><li>固定容器 <code>.am-container</code> 宽度（可以自己添加一个 class，不一定要使用内置的）：</li></ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-container</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">980px</span> <span class="hljs-important">!important</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">max-width</span>:<span class="hljs-value">none</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<ul><li>使用网格系统时，只添加 <code>.am-u-sm-*</code> class，移除其他断点的 class。</li></ul>
			<p>至此，布局层的响应式被禁用了（<a href="#">参考示例</a>）。</p>
			<div class="ds-thread" data-thread-key="ff1669d65e47f115f696f281ff992b1f" data-title="开始使用 - Layouts|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>