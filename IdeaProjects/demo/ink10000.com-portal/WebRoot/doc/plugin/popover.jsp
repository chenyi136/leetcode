<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Popover|Amaze UI</title>
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
								<li><a href="#dian-ji-xian-shi">点击显示</a></li>
								<li><a href="#hoverfocus-xian-shi">Hover/Focus 显示</a></li>
								<li><a href="#yan-se-chi-cun">颜色/尺寸</a></li>
							</ul>
						</li>
						<li>
							<a href="#shi-yong-fang-shi">使用方式</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#tong-guo-js">通过 JS</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="popover">Popover <a href="#popover" class="doc-anchor"></a></h1>
			<hr>
			<p>气泡式弹出层组件，本组件无需创建 HTML 结构。</p>
			<p>插件根据元素在窗口中的位置自动判断弹出层显示位置，目前没有设置位置的选项。</p>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<h3 id="dian-ji-xian-shi">点击显示 <a href="#dian-ji-xian-shi" class="doc-anchor"></a></h3>
			<div class="doc-example"><button class="am-btn am-btn-primary" data-am-popover="{content:'鄙是点击显示的 Popover'}">点击显示 Popover</button></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary"</span> <span class="hljs-attribute">data-am-popover</span>=<span class="hljs-value">"{content:'鄙是点击显示的 Popover'}"</span>&gt;</span>点击显示 Popover<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<h3 id="hoverfocus-xian-shi">Hover/Focus 显示 <a href="#hoverfocus-xian-shi" class="doc-anchor"></a></h3>
			<p>Tooltip 效果。</p>
			<div class="doc-example"><button class="am-btn am-btn-success" data-am-popover="{content:'鄙是 Hover/Focus 显示的 Popover',trigger:'hover focus'}">Hover/Focus 显示 Popover</button></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-success"</span> <span class="hljs-attribute">data-am-popover</span>=<span class="hljs-value">"{content:'鄙是点击 Hover 显示的 Popover',trigger:'hover focus'}"</span>&gt;</span>Hover 显示 Popover<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<h3 id="yan-se-chi-cun">颜色/尺寸 <a href="#yan-se-chi-cun" class="doc-anchor"></a></h3>
			<p>通过 <code>theme</code> 选项可以设置 Popover 的颜色和尺寸。</p>
			<div class="doc-example">
				<button class="am-btn am-btn-primary" data-am-popover="{theme:'primary',content:'点击显示的 Primary'}">Primary</button>
				<button class="am-btn am-btn-secondary" data-am-popover="{theme:'danger sm',content:'点击显示的 Danger & Small'}">Danger</button>
				<button class="am-btn am-btn-warning" data-am-popover="{theme:'warning lg',content:'点击显示的 Danger & Small'}">Warning</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-shi">使用方式 <a href="#shi-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>在元素上添加 <code>data-am-popover</code> 属性并设置相关参数。上面的演示都是通过 Data API 实现的。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">data-am-popover</span>=<span class="hljs-value">"{content:'想显示啥',trigger:'hover'}"</span>&gt;</span>Popover<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<h3 id="tong-guo-js">通过 JS <a href="#tong-guo-js" class="doc-anchor"></a></h3>
			<p>通过 <code>$().popover(options)</code> 方式添加元素 Popover 交互。</p>
			<div class="doc-example"><button class="am-btn am-btn-danger" id="my-popover">Popover via JS</button></div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h4 id="can-shu-shuo-ming">参数说明 <a href="#can-shu-shuo-ming" class="doc-anchor"></a></h4>
			<table class="am-table am-table-bordered am-table-striped">
				<thead>
					<tr>
						<th>参数</th>
						<th>类型</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>content</code></td>
						<td><code>string</code></td>
						<td>Popover 显示的内容</td>
					</tr>
					<tr>
						<td><code>trigger</code></td>
						<td><code>string</code></td>
						<td>交互方式，<code>click</code> / <code>hover</code> / <code>focus</code>，默认为 <code>click</code></td>
					</tr>
					<tr>
						<td><code>theme</code></td>
						<td><code>string</code></td>
						<td>Popover 样式，颜色：<code>primary</code> / <code>secondary</code> / <code>success</code> / <code>warning</code> / <code>danger</code>；尺寸： <code>sm</code> / <code>lg</code>。同时设置颜色和尺寸使用一个半角空格 <code></code> 分隔。</td>
					</tr>
				</tbody>
			</table>
			<h4 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h4>
			<ul>
				<li><code>.popover(options)</code> - 激活元素的 Popover 交互功能，<code>options</code> 为对象</li>
				<li><code>.popover(&#39;toggle&#39;)</code> - 交替 Popover 状态</li>
				<li><code>.popover(&#39;open&#39;)</code> - 显示 Popover</li>
				<li><code>.popover(&#39;close&#39;)</code> - 关闭 Popover</li>
				<li><code>.popover(&#39;setContent&#39;, content)</code> - 设置弹出层内容 <span class="am-badge am-badge-danger">v2.4.1+</span></li>
			</ul>
			<h4 id="zi-ding-yi-shi-jian">自定义事件 <a href="#zi-ding-yi-shi-jian" class="doc-anchor"></a></h4>
			<p>事件定义在触发 Popover 交互的元素上。</p>
			<table class="am-table am-table-bordered am-table-striped">
				<thead>
					<tr>
						<th>事件名称</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>open.popover.amui</code></td>
						<td><code>open</code> 方法被调用是立即触发</td>
					</tr>
					<tr>
						<td><code>close.popover.amui</code></td>
						<td><code>close</code> 方法被调用是立即触发</td>
					</tr>
				</tbody>
			</table>
			<div class="ds-thread" data-thread-key="e984f7d6469aeaaf30ace3a72f34e401" data-title="JS 插件 - Popover|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	$("#my-popover").popover({content:"Popover via JavaScript"});
});
</script>
</body>
</html>