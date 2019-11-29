<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Smooth-scroll|Amaze UI</title>
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
								<li><a href="#gun-dong-dao-ding-bu">滚动到顶部</a></li>
								<li><a href="#gun-dong-dao-di-bu">滚动到底部</a></li>
								<li><a href="#ding-yi-xuan-xiang">定义选项</a></li>
							</ul>
						</li>
						<li>
							<a href="#shi-yong-fang-fa">使用方法</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#tong-guo-javascript">通过 Javascript</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="smooth-scroll">Smooth Scroll <a href="#smooth-scroll" class="doc-anchor"></a></h1>
			<hr>
			<p>平滑滚动插件，源自 <a href="#">Zepto 作者</a>。</p>
			<div class="am-alert am-alert-danger">本插件不支持 IE 9 及以下版本！如果有相关需求请找别的插件代替。</div>
			<p>如果要支持旧版 IE，可以使用下面的代码实现：</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'html,body'</span>).animate({scrollTop:<span class="hljs-number">0</span>},<span class="hljs-string">'500'</span>);</code></pre></div>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<h3 id="gun-dong-dao-ding-bu">滚动到顶部 <a href="#gun-dong-dao-ding-bu" class="doc-anchor"></a></h3>
			<div class="doc-example"><button class="am-btn am-btn-success" data-am-smooth-scroll>滚动到顶部</button></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">data-am-smooth-scroll</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-success"</span>&gt;</span>滚动到顶部<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<h3 id="gun-dong-dao-di-bu">滚动到底部 <a href="#gun-dong-dao-di-bu" class="doc-anchor"></a></h3>
			<div class="doc-example"><button class="am-btn am-btn-primary" id="doc-scroll-to-btm">滚动到底部</button></div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="ding-yi-xuan-xiang">定义选项 <a href="#ding-yi-xuan-xiang" class="doc-anchor"></a></h3>
			<div class="doc-example"><button class="am-btn am-btn-danger" data-am-smooth-scroll="{position:57,speed:5000}">慢悠悠地滚到距离顶部 57px 的位置</button></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-danger"</span> <span class="hljs-attribute">data-am-smooth-scroll</span>=<span class="hljs-value">"{position:57,speed:5000}"</span>&gt;</span>慢悠悠地滚到距离顶部 57px 的位置<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>在元素上添加 <code>data-am-smooth-scroll</code> 属性。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-success"</span> <span class="hljs-attribute">data-am-smooth-scroll</span>&gt;</span>滚动到顶部<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<p>如果要指定滚动的位置，可以给这个属性设一个值。</p>
			<div class="doc-example"><button class="am-btn am-btn-secondary" data-am-smooth-scroll="{position:189}">滚动到滚动条距离顶部 189px 的位置</button></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-secondary" <span class="hljs-attribute">data-am-smooth-scroll</span>=<span class="hljs-value">"{position:189}"</span></span>&gt;</span>...<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<h3 id="tong-guo-javascript">通过 Javascript <a href="#tong-guo-javascript" class="doc-anchor"></a></h3>
			<h4 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h4>
			<p>为了保证不同浏览器兼容，请在 <code>$(window)</code> 上调用 <code>$().smoothScroll()</code> 方法。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-built_in">window</span>).smoothScroll([options])</code></pre></div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-comment">//滚动到底部</span>
$(<span class="hljs-string">'#my-button'</span>).on(<span class="hljs-string">'click'</span>, <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>) </span>{
   <span class="hljs-keyword">var</span> $w=$(<span class="hljs-built_in">window</span>);
   $w.smoothScroll({position:$(<span class="hljs-built_in">document</span>).height()-$w.height()});
});
					</code>
				</pre>
			</div>
			<h4 id="xuan-xiang-shuo-ming">选项说明 <a href="#xuan-xiang-shuo-ming" class="doc-anchor"></a></h4>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th style="width:60px;">参数</th>
						<th style="width:70px;">类型</th>
						<th style="width:110px;">默认</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>position</code></td>
						<td>数值</td>
						<td><code>0</code></td>
						<td>要滚动到位置，默认为 `0`，即滚动到顶部</td>
					</tr>
					<tr>
						<td><code>speed</code></td>
						<td>数值</td>
						<td><code>750 ~ 1500</code></td>
						<td>滚动速度，单位 `ms`，默认为 `750 - 1500`，根据距离判断</td>
					</tr>
				</tbody>
			</table>
			<div class="ds-thread" data-thread-key="86da87b802a0a7e63c65e338d6fe5759" data-title="JS 插件 - Smooth-scroll|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$("#doc-scroll-to-btm").on("click",function(){
	var o=$(window);
	o.smoothScroll({position:$(document).height()-o.height()});
});
</script>
</body>
</html>