<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Alert|Amaze UI</title>
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
							<a href="#shi-yong-yan-shi">使用演示</a>
							<ul class="am-collapse">
								<li><a href="#ji-ben-xing-shi">基本形式</a></li>
								<li><a href="#guan-bi-an-niu">关闭按钮</a></li>
								<li><a href="#bu-tong-zhuang-tai">不同状态</a></li>
								<li><a href="#duo-nei-rong">多内容</a></li>
							</ul>
						</li>
						<li>
							<a href="#diao-yong-fang-shi">调用方式</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#tong-guo-js">通过 JS</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="alert">Alert <a href="#alert" class="doc-anchor"></a></h1>
			<hr>
			<p>显示可关闭的页内警告信息。</p>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<h3 id="ji-ben-xing-shi">基本形式 <a href="#ji-ben-xing-shi" class="doc-anchor"></a></h3>
			<div class="doc-example"><div class="am-alert">没什么可给你，但求凭这阙歌。谢谢你风雨里，都不退愿陪着我。</div></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-alert"</span>&gt;</span>没什么可给你，但求凭这阙歌。谢谢你风雨里，都不退愿陪着我。<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
			<h3 id="guan-bi-an-niu">关闭按钮 <a href="#guan-bi-an-niu" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-alert" data-am-alert>
					<button type="button" class="am-close">&times;</button>
					<p>没什么可给你，但求凭这阙歌。谢谢你风雨里，都不退愿陪着我。</p>
				</div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-alert"</span> <span class="hljs-attribute">data-am-alert</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-close"</span>&gt;</span>&amp;times;<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span>没什么可给你，但求凭这阙歌。谢谢你风雨里，都不退愿陪着我。<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="bu-tong-zhuang-tai">不同状态 <a href="#bu-tong-zhuang-tai" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-alert am-alert-success" data-am-alert>
					<button type="button" class="am-close">&times;</button>
					<p>没什么可给你，但求凭这阙歌。谢谢你风雨里，都不退愿陪着我。</p>
				</div>
				<div class="am-alert am-alert-warning" data-am-alert>
					<button type="button" class="am-close">&times;</button>
					<p>没什么可给你，但求凭这阙歌。谢谢你风雨里，都不退愿陪着我。</p>
				</div>
				<div class="am-alert am-alert-danger" data-am-alert>
					<button type="button" class="am-close">&times;</button>
					<p>没什么可给你，但求凭这阙歌。谢谢你风雨里，都不退愿陪着我。</p>
				</div>
				<div class="am-alert am-alert-secondary" data-am-alert>
					<button type="button" class="am-close">&times;</button>
					<p>没什么可给你，但求凭这阙歌。谢谢你风雨里，都不退愿陪着我。</p>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="duo-nei-rong">多内容 <a href="#duo-nei-rong" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-alert" data-am-alert>
					<button type="button" class="am-close">&times;</button>
					<h3>共同渡过</h3><p>《共同渡过》是张国荣1987年发行的专辑《Summer Romance》中的一首歌。</p>
					<ul>
						<li>若我可再活多一次都盼</li>
						<li>再可以在路途重逢着你</li>
						<li>共去写一生的句子</li>
						<li>若我可再活多一次千次</li>
						<li>我都盼面前仍是你</li>
						<li>我要他生都有今生的暖意</li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="diao-yong-fang-shi">调用方式 <a href="#diao-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>在 Alert 最外层元素上添加 <code>data-am-alert</code>。</p>
			<div class="doc-example">
				<div class="am-alert" data-am-alert id="my-alert">
					<button type="button" class="am-close">&times;</button>
					<p>没什么可给你，但求凭这阙歌。谢谢你风雨里，都不退愿陪着我。</p>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="tong-guo-js">通过 JS <a href="#tong-guo-js" class="doc-anchor"></a></h3>
			<p>开启关闭按钮交互功能：</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'.am-alert'</span>).alert();</code></pre></div>
			<h4 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h4>
			<ul>
				<li><code>$().alert()</code> - 激活 Alert 元素关闭按钮的交互功能。</li>
				<li><code>$().alert(&#39;close&#39;)</code>：直接关闭元素。</li>
			</ul>
			<h4 id="zi-ding-yi-shi-jian">自定义事件 <a href="#zi-ding-yi-shi-jian" class="doc-anchor"></a></h4>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>事件名称</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>close.alert.amui</code></td>
						<td><code>close</code> 方法被调用时立即触发</td>
					</tr>
					<tr>
						<td><code>closed.alert.amui</code></td>
						<td>元素被关闭以后触发（CSS 动画执行完成）</td>
					</tr>
				</tbody>
			</table>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-string">'#my-alert'</span>).on(<span class="hljs-string">'closed.alert.amui'</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   alert(<span class="hljs-string">'警告窗口已经关闭'</span>);
});
					</code>
				</pre>
			</div>
			<h4 id="js-kong-zhi-shi-li">JS 控制示例 <a href="#js-kong-zhi-shi-li" class="doc-anchor"></a></h4>
			<p><strong>示例1：</strong>激活 Alert 元素关闭按钮的交互功能</p>
			<div class="doc-example">
				<div class="am-alert" id="your-alert">
					<button type="button" class="am-close">&times;</button>
					<p>在应用 JS 激活之前这个警告框是无法关闭的。不信点右边的 x 试试。</p>
				</div>
				<button type="button" class="am-btn am-btn-danger" id="doc-alert-btn-bind">点击激活上面 Alert 的关闭功能</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p><strong>示例2</strong>：使用 JS 关闭警告框及监听自定义事件</p>
			<div class="doc-example">
				<div class="am-alert" id="your-alert-1">
					<button type="button" class="am-close">&times;</button>
					<p>这是一个警告框！</p>
				</div>
				<button type="button" class="am-btn am-btn-warning" id="doc-alert-btn-close">点击关闭上面的 Alert</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="32a8658273fb9d5756fe9bd20cdce828" data-title="JS 插件 - Alert|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	$(document).on("closed.alert.amui",function(){
		console.log("警告窗口已经关闭");
	});
	$("#doc-alert-btn-bind").one("click",function(){
		$("#your-alert").alert();
		window.alert("已激活，点击上的 X 试试！");
	});
	$("#doc-alert-btn-close").one("click",function(){
		$("#your-alert-1").alert("close");
	});
	$(document).on("close.alert.amui","#your-alert-1",function(o){
		window.alert("警告框开始关闭！");
	});
	$(document).on("closed.alert.amui","#your-alert-1",function(o){
		window.alert("警告框关闭完成！");
	});
});
</script>
</body>
</html>