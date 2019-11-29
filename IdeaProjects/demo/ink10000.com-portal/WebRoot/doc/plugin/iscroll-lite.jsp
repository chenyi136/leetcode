<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Iscroll-lite|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="2"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_plugin.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#chang-jian-wen-ti">常见问题</a>
							<ul class="am-collapse"><li><a href="#shi-yong-iscroll-yi-hou-lian-jie-wu-fa-dian-ji-">使用 iScroll 以后链接无法点击？</a></li></ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="iscroll-lite">iScroll Lite <a href="#iscroll-lite" class="doc-anchor"></a></h1>
			<hr>
			<p>Amaze UI 默认打包了 iScroll <code>lite</code>（当前版本为 5.1.3），具体使用请<a href="#">参考官网</a>。</p>
			<blockquote><p>iscroll-lite.js, it is a stripped down version of the main script. It doesn&#39;t support snap, scrollbars, mouse wheel, key bindings. But if all you need is scrolling (especially on mobile) iScroll lite is the smallest, fastest solution.</p></blockquote>
			<p>通过 <code>$.AMUI.iScroll</code> 访问 <code>IScroll</code> 对象。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">id</span>=<span class="hljs-value">"wrapper"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">ul</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span>...<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span>...<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
      ...
    <span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">var</span> IScroll=$.AMUI.iScroll;
<span class="hljs-keyword">var</span> myScroll=<span class="hljs-keyword">new</span> IScroll(<span class="hljs-string">'#wrapper'</span>);
					</code>
				</pre>
			</div>
			<p>iScroll 主要用来实现平滑的垂直、水平的拖动操作及控制。</p>
			<p>网上很多 iScroll 的例子都是基于 iScroll 4 实现的，<code>5.x</code> API 变动很大，许多 <code>4.x</code> 的例子都不能正常工作，需要做调整。</p>
			<ul>
				<li><a href="#">iSroll 实现的固定顶部</a></li>
				<li><a href="#">iScroll 5 实现的下拉刷新和上拉加载更多</a></li>
				<li><a href="#">iPhone Scrollbars with iScroll (适用于 iScroll 4)</a></li>
			</ul>
			<p>更多例子请参见<a href="#">项目主页</a>，<strong>请注意，Amaze UI 打包的是 <code>lite</code> 版，有些 Demo 并不适用。</strong></p>
			<h2 id="chang-jian-wen-ti">常见问题 <a href="#chang-jian-wen-ti" class="doc-anchor"></a></h2>
			<h3 id="shi-yong-iscroll-yi-hou-lian-jie-wu-fa-dian-ji-">使用 iScroll 以后链接无法点击？ <a href="#shi-yong-iscroll-yi-hou-lian-jie-wu-fa-dian-ji-" class="doc-anchor"></a></h3>
			<p>初始化 iScroll 的时候加上 <code>click:true</code> 参数即可(感谢<a href="#">FB总司令</a>)。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript"><span class="hljs-keyword">var</span> myScroll=<span class="hljs-keyword">new</span> IScroll(<span class="hljs-string">'#wrapper'</span>,{click:<span class="hljs-literal">true</span>});</code></pre></div>
			<div class="ds-thread" data-thread-key="4a1f308361632562017cdbceba9825e2" data-title="JS 插件 - Iscroll-lite|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>