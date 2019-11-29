<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Nprogress|Amaze UI</title>
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
						<li><a href="#ji-ben-shi-yong">基本使用</a></li>
						<li><a href="#shi-yong-chang-jing">使用场景</a></li>
						<li><a href="#gao-ji-shi-yong">高级使用</a></li>
						<li>
							<a href="#can-shu-she-zhi">参数设置</a>
							<ul class="am-collapse">
								<li><a href="#mo-ren-can-shu">默认参数</a></li>
								<li><a href="#can-shu-jie-shi">参数解释</a></li>
							</ul>
						</li>
						<li><a href="#zi-ding-yi">自定义</a></li>
						<li><a href="#can-kao-lian-jie">参考链接</a></li>
					</ul>
				</div>
			</div>
			<h1 id="progress">Progress <a href="#progress" class="doc-anchor"></a></h1>
			<hr>
			<p>类似 Google、Youtube、Medium 的进度条，源自 <a href="#">NProgress</a>。</p>
			<h2 id="ji-ben-shi-yong">基本使用 <a href="#ji-ben-shi-yong" class="doc-anchor"></a></h2>
			<hr>
			<p>调用 <code>start()</code> 、 <code>done()</code> 控制进度条。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$.AMUI.progress.start();
$.AMUI.progress.done();
					</code>
				</pre>
			</div>
			<div class="doc-example">
				<button class="am-btn am-btn-primary" id="np-s">$.AMUI.progress.start();</button>
				<button class="am-btn am-btn-success" id="np-d">$.AMUI.progress.done();</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<p>如果使用 <a href="#">Turbolinks</a> 1.3.0+ 或者类似的库，可以在自定义事件回调中调用 Progress。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-built_in">document</span>).on(<span class="hljs-string">'page:fetch'</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{$.AMUI.progress.start();});
$(<span class="hljs-built_in">document</span>).on(<span class="hljs-string">'page:change'</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{$.AMUI.progress.done();});
$(<span class="hljs-built_in">document</span>).on(<span class="hljs-string">'page:restore'</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{$.AMUI.progress.remove();});
					</code>
				</pre>
			</div>
			<h2 id="shi-yong-chang-jing">使用场景 <a href="#shi-yong-chang-jing" class="doc-anchor"></a></h2>
			<ul>
				<li><p>在 Ajax 应用中添加进度条，绑定到 Zepto（jQuery） <code>ajaxStart</code> 和 <code>ajaxStop</code> 事件中。</p></li>
				<li><p>没有使用 Turbolinks/Pjax 也可以添加高大上的进度条，绑定到 <code>$(document).ready</code> 和 <code>$(window).load</code> 即可。</p></li>
			</ul>
			<h2 id="gao-ji-shi-yong">高级使用 <a href="#gao-ji-shi-yong" class="doc-anchor"></a></h2>
			<p><strong>设置百分比</strong>:调用 <code>.set(n)</code> 可以设置进度百分比, <em>n</em> 的取值区间为 <code>0..1</code>。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$.AMUI.progress.set(<span class="hljs-number">0.0</span>);<span class="hljs-comment">//Sorta same as .start()</span>
$.AMUI.progress.set(<span class="hljs-number">0.4</span>);
$.AMUI.progress.set(<span class="hljs-number">1.0</span>);<span class="hljs-comment">//Sorta same as .done()</span>
					</code>
				</pre>
			</div>
			<p><strong>增加进度</strong>:调用 <code>.inc()</code>，进度将会增加一个随机的数量，但不会到达 100%。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$.AMUI.progress.inc();</code></pre></div>
			<p>也可以给 <code>.inc()</code> 传递一个数值参数:</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$.AMUI.progress.inc(<span class="hljs-number">0.2</span>);<span class="hljs-comment">//This will get the current status value and adds 0.2 until status is 0.994</span></code></pre></div>
			<p><code>.inc()</code> 方法会获取当前进度值并增加 0.2，但最多只到达 0.994。</p>
			<p><strong>强制结束</strong>:传递 <code>true</code> 给 <code>done()</code>，强制显示进度条（默认情况是如果没有 <em>.start()</em>，<em>.done()</em> 执行任何操作）。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$.AMUI.progress.done(<span class="hljs-literal">true</span>);</code></pre></div>
			<p><strong>获取进度值</strong>:使用 <code>.status</code> 属性。</p>
			<div class="doc-example">
				<button class="am-btn am-btn-primary" id="np-set">$.AMUI.progress.set(0.4);</button>
				<button class="am-btn am-btn-warning" id="np-inc">$.AMUI.progress.inc();</button>
				<button class="am-btn am-btn-success" id="np-fd">$.AMUI.progress.done(true);</button>
				<button class="am-btn am-btn-danger" id="np-status">$.AMUI.progress.status;</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="can-shu-she-zhi">参数设置 <a href="#can-shu-she-zhi" class="doc-anchor"></a></h2>
			<h3 id="mo-ren-can-shu">默认参数 <a href="#mo-ren-can-shu" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
{
   minimum:<span class="hljs-number">0.08</span>,
   easing:<span class="hljs-string">'ease'</span>,
   positionUsing:<span class="hljs-string">''</span>,
   speed:<span class="hljs-number">200</span>,
   trickle:<span class="hljs-literal">true</span>,
   trickleRate:<span class="hljs-number">0.02</span>,
   trickleSpeed:<span class="hljs-number">800</span>,
   showSpinner:<span class="hljs-literal">true</span>,
   barSelector:<span class="hljs-string">'[role="nprogress-bar"]'</span>,
   spinnerSelector:<span class="hljs-string">'[role="nprogress-spinner"]'</span>,
   parent:<span class="hljs-string">'body'</span>,
   template:<span class="hljs-string">'&lt;div class="nprogress-bar" role="nprogress-bar"&gt;</span><span class="hljs-string">&lt;div class="nprogress-peg"&gt;&lt;/div&gt;&lt;/div&gt;</span><span class="hljs-string">&lt;div class="nprogress-spinner" role="nprogress-spinner"&gt;</span><span class="hljs-string">&lt;div class="nprogress-spinner-icon"&gt;&lt;/div&gt;&lt;/div&gt;'</span>
}
					</code>
				</pre>
			</div>
			<h3 id="can-shu-jie-shi">参数解释 <a href="#can-shu-jie-shi" class="doc-anchor"></a></h3>
			<p><code>minimum</code>:设置最小百分比。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$.AMUI.progress.configure({minimum:<span class="hljs-number">0.1</span>});</code></pre></div>
			<p><code>template</code>:设置模板，注意相应更改 <code>barSelector</code>、<code>spinnerSelector</code>。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$.AMUI.progress.configure({template:<span class="hljs-string">"&lt;div class='....'&gt;...&lt;/div&gt;"</span>});</code></pre></div>
			<p><code>ease</code>、<code>speed</code>:设置动画缓动函数和速度（<code>ms</code>）</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$.AMUI.progress.configure({ease:<span class="hljs-string">'ease'</span>,speed:<span class="hljs-number">500</span>});</code></pre></div>
			<p><code>trickle</code>、<code>trickleRate</code>、<code>trickleSpeed</code>:</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$.AMUI.progress.configure({trickle:<span class="hljs-literal">false</span>});</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$.AMUI.progress.configure({trickleRate:<span class="hljs-number">0.02</span>,trickleSpeed:<span class="hljs-number">800</span>});</code></pre></div>
			<p><code>showSpinner</code>:</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">NProgress.configure({showSpinner:<span class="hljs-literal">false</span>});</code></pre></div>
			<p><code>parent</code>:</p>
			<p>设置插入进度条的父容器，默认为 <code>body</code>。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$.AMUI.progress.configure({parent:<span class="hljs-string">'#container'</span>});</code></pre></div>
			<h2 id="zi-ding-yi">自定义 <a href="#zi-ding-yi" class="doc-anchor"></a></h2>
			<p>通过更改 css 改变进度条样式，对应的样式为 <code>less</code> 目录下面的 <code>ui.progress.less</code>。</p>
			<h2 id="can-kao-lian-jie">参考链接 <a href="#can-kao-lian-jie" class="doc-anchor"></a></h2>
			<ul><li><a href="#">New UI Pattern:Website Loading Bars</a></li></ul>
			<div class="ds-thread" data-thread-key="0697e3f8bf3a2f6a3c2c0304bf8cf449" data-title="JS 插件 - Nprogress|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	var n=$.AMUI.progress;
	$("#np-s").on("click",function(){
		n.start();
	});
	$("#np-d").on("click",function(){
		n.done();
	});
	$("#np-set").on("click",function(){
		n.set(0.4);
	});
	$("#np-inc").on("click",function(){
		n.inc();
	});
	$("#np-fd").on("click",function(){
		n.done(!0);
	});
	$("#np-status").on("click",function(){
		$(this).text("Status:"+n.status);
	});
});
</script>
</body>
</html>