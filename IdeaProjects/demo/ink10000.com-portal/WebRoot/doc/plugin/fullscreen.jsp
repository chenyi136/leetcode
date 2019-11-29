<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Fullscreen|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
<style type="text/css">
#demo-full-img:-webkit-full-screen{
	width:100%;
	height:auto;
	display:block;
}
</style>
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
							<a href="#fang-fa">方法</a>
							<ul class="am-collapse">
								<li><a href="#code-requestcode">.request()</a></li>
								<li><a href="#code-exitcode">.exit()</a></li>
								<li><a href="#code-togglecode">.toggle()</a></li>
								<li><a href="#shi-jian-jian-ting">事件监听</a></li>
							</ul>
						</li>
						<li>
							<a href="#shu-xing">属性</a>
							<ul class="am-collapse">
								<li><a href="#code-isfullscreencode">.isFullscreen</a></li>
								<li><a href="#code-elementcode">.element</a></li>
								<li><a href="#code-enabledcode">.enabled</a></li>
								<li><a href="#code-rawcode">.raw</a></li>
							</ul>
						</li>
						<li>
							<a href="#shi-yong-shi-li">使用示例</a>
							<ul class="am-collapse">
								<li><a href="#quan-ping-zheng-ge-ye-mian">全屏整个页面</a></li>
								<li><a href="#quan-ping-xian-shi-yuan-su">全屏显示元素</a></li>
								<li><a href="#jian-ting-quan-ping-zhuang-tai-gai-bian">监听全屏状态改变</a></li>
							</ul>
						</li>
						<li><a href="#can-kao-zi-yuan">参考资源</a></li>
						<li><a href="#license">License</a></li>
					</ul>
				</div>
			</div>
			<h1 id="fullscreen">Fullscreen <a href="#fullscreen" class="doc-anchor"></a></h1>
			<hr>
			<p>JavaScript <a href="#">Fullscreen API</a> 跨浏览器兼容封装（<a href="#">Fullscreen API 兼容性列表</a>），免去苦逼写各种浏览器前缀的麻烦。源自 <a href="#">screenfull.js</a>。</p>
			<h2 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h2>
			<p>以下方法通过 <code>$.AMUI.fullscreen</code> 接口调用。</p>
			<h3 id="code-requestcode"><code>.request()</code> <a href="#code-requestcode" class="doc-anchor"></a></h3>
			<p>使元素全屏。接受一个 DOM 元素作为参数，默认为 <code>html</code>。</p>
			<p><code>&lt;iframe&gt;</code> 中需要添加 <code>allowfullscreen</code> 属性 (+ <code>webkitallowfullscreen</code> and <code>moz allowfullscreen</code>)。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">iframe</span> <span class="hljs-attribute">id</span>=<span class="hljs-value">"frame1"</span> <span class="hljs-attribute">allowfullscreen</span> <span class="hljs-attribute">mozallowfullscreen</span> <span class="hljs-attribute">webkitallowfullscreen</span> <span class="hljs-attribute">src</span>=<span class="hljs-value">"iframeTest.html"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">iframe</span>&gt;</span></code></pre></div>
			<p>注意全屏 API 仅能通过用户事件（如 click、touch、key） 初始化。</p>
			<h3 id="code-exitcode"><code>.exit()</code> <a href="#code-exitcode" class="doc-anchor"></a></h3>
			<p>退出全屏模式。</p>
			<h3 id="code-togglecode"><code>.toggle()</code> <a href="#code-togglecode" class="doc-anchor"></a></h3>
			<p>全屏模式切换。</p>
			<h3 id="shi-jian-jian-ting">事件监听 <a href="#shi-jian-jian-ting" class="doc-anchor"></a></h3>
			<h4 id="quan-ping-zhuang-tai-bian-hua">全屏状态变化 <a href="#quan-ping-zhuang-tai-bian-hua" class="doc-anchor"></a></h4>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">var</span> fullscreen=$.AMUI.fullscreen;
<span class="hljs-keyword">if</span>(fullscreen.enabled){
   <span class="hljs-built_in">document</span>.addEventListener(fullscreen.raw.fullscreenchange,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
      <span class="hljs-built_in">console</span>.log(<span class="hljs-string">'Am I fullscreen?'</span>+(fullscreen.isFullscreen?<span class="hljs-string">'Yes'</span>:<span class="hljs-string">'No'</span>));
   });
}
					</code>
				</pre>
			</div>
			<h4 id="jian-ting-quan-ping-cuo-wu">监听全屏错误 <a href="#jian-ting-quan-ping-cuo-wu" class="doc-anchor"></a></h4>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">var</span> fullscreen=$.AMUI.fullscreen;
<span class="hljs-keyword">if</span>(fullscreen.enabled){
   <span class="hljs-built_in">document</span>.addEventListener(fullscreen.raw.fullscreenerror,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">e</span>)</span>{
      <span class="hljs-built_in">console</span>.error(<span class="hljs-string">'Failed to enable fullscreen'</span>,e);
   });
}
					</code>
				</pre>
			</div>
			<h2 id="shu-xing">属性 <a href="#shu-xing" class="doc-anchor"></a></h2>
			<h3 id="code-isfullscreencode"><code>.isFullscreen</code> <a href="#code-isfullscreencode" class="doc-anchor"></a></h3>
			<p>布尔值，是否处于全屏模式。</p>
			<h3 id="code-elementcode"><code>.element</code> <a href="#code-elementcode" class="doc-anchor"></a></h3>
			<p>返回当前处于全屏模式的元素，没有则返回 <code>null</code>。</p>
			<h3 id="code-enabledcode"><code>.enabled</code> <a href="#code-enabledcode" class="doc-anchor"></a></h3>
			<p>是否允许全屏模式。<code>&lt;iframe&gt;</code> 中的页面需要添加 <code>allowfullscreen</code> 属性 (+ <code>webkitallowfullscreen</code> and <code>moz allowfullscreen</code>)。</p>
			<h3 id="code-rawcode"><code>.raw</code> <a href="#code-rawcode" class="doc-anchor"></a></h3>
			<p>返回包含原始方法名称的对象，对象 <code>key</code> 包括： <code>requestFullscreen</code>, <code>exitFullscreen</code>, <code>fullscreenElement</code>, <code>fullscreenEnabled</code>, <code>fullscreenchange</code>,<code>fullscreenerror</code></p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-built_in">document</span>).on($.AMUI.fullscreen.raw.fullscreenchange,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-built_in">console</span>.log(<span class="hljs-string">'Fullscreen change'</span>);
});
					</code>
				</pre>
			</div>
			<h2 id="shi-yong-shi-li">使用示例 <a href="#shi-yong-shi-li" class="doc-anchor"></a></h2>
			<h3 id="quan-ping-zheng-ge-ye-mian">全屏整个页面 <a href="#quan-ping-zheng-ge-ye-mian" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<button class="am-btn am-btn-primary" id="doc-fs-request">全屏窗口</button>
				<button class="am-btn am-btn-secondary" id="doc-fs-exit">退出全屏</button>
				<button class="am-btn am-btn-warning" id="doc-fs-toggle">全屏交替</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h3 id="quan-ping-xian-shi-yuan-su">全屏显示元素 <a href="#quan-ping-xian-shi-yuan-su" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div>
					<img src="doc/image/bing-2.jpg" width="340px" height="142px" id="demo-full-img">
					<br>点击图片全屏显示<br>
					<span id="doc-fs-img"></span>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h3 id="jian-ting-quan-ping-zhuang-tai-gai-bian">监听全屏状态改变 <a href="#jian-ting-quan-ping-zhuang-tai-gai-bian" class="doc-anchor"></a></h3>
			<div class="doc-example"><p>打开控制台，点击上面的演示看看</p></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="can-kao-zi-yuan">参考资源 <a href="#can-kao-zi-yuan" class="doc-anchor"></a></h2>
			<ul>
				<li><a href="#">Using the Fullscreen API in web browsers</a></li>
				<li><a href="#">MDN - Fullscreen API</a></li>
				<li><a href="#">W3C Fullscreen spec</a></li>
				<li><a href="#">Building an amazing fullscreen mobile experience</a></li>
				<li><a href="#">Can I use Full Screen API?</a></li>
			</ul>
			<h2 id="license">License <a href="#license" class="doc-anchor"></a></h2>
			<p>MIT © <a href="#">Sindre Sorhus</a></p>
			<div class="ds-thread" data-thread-key="9518ff597a4c5e4a5206032c62146b14" data-title="JS 插件 - Fullscreen|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	var e=$.AMUI.fullscreen;
	$("#doc-fs-request").on("click",function(){
		e.enabled&&e.request();
	});
	$("#doc-fs-exit").on("click",function(){
		e.enabled&&e.exit();
	});
	$("#doc-fs-toggle").on("click",function(){
		e.enabled&&e.toggle();
	});
	$("#demo-full-img").on("click",function(){
		e.enabled&&e.request(this);
	}).on(e.raw.fullscreenchange,function(){
		var n="图片状态：<strong>"+(e.isFullscreen?"全屏":"非全屏")+"</strong>";
		$("#doc-fs-img").html(n);
	});
	e.enabled&&$(document).on(e.raw.fullscreenchange,function(){
		console.log("Am I fullscreen? "+(e.isFullscreen?"Yes":"No"));
	});
});
</script>
</body>
</html>