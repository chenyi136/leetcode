<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Sticky|Amaze UI</title>
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
							<a href="#ji-ben-yan-shi">基本演示</a>
							<ul class="am-collapse">
								<li><a href="#ji-ben-xing-shi">基本形式</a></li>
								<li><a href="#she-zhi-shang-bian-ju">设置上边距</a></li>
								<li><a href="#dong-hua-xiao-guo">动画效果</a></li>
							</ul>
						</li>
						<li>
							<a href="#diao-yong-fang-shi">调用方式</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#tong-guo-js">通过 JS</a></li>
								<li><a href="#xuan-xiang">选项</a></li>
							</ul>
						</li>
						<li><a href="#zhu-yi-shi-xiang">注意事项</a></li>
					</ul>
				</div>
			</div>
			<h1 id="sticky">Sticky <a href="#sticky" class="doc-anchor"></a></h1>
			<hr>
			<p>当窗口滚动至元素上边距离时，将元素固定在窗口顶部。</p>
			<h2 id="ji-ben-yan-shi">基本演示 <a href="#ji-ben-yan-shi" class="doc-anchor"></a></h2>
			<h3 id="ji-ben-xing-shi">基本形式 <a href="#ji-ben-xing-shi" class="doc-anchor"></a></h3>
			<p>在元素上添加 <code>data-am-sticky</code> 属性。</p>
			<div class="doc-example"><div data-am-sticky><button class="am-btn am-btn-block am-btn-primary">Stick to top</button></div></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">data-am-sticky</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-block"</span>&gt;</span>Stick to top<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
			<h3 id="she-zhi-shang-bian-ju">设置上边距 <a href="#she-zhi-shang-bian-ju" class="doc-anchor"></a></h3>
			<p>元素固定到窗口顶部后，默认上边距为 0，可以在设置上边距 <code>data-am-sticky='{top:100}'</code> 。</p>
			<div class="doc-example"><div data-am-sticky="{top:80}"><button class="am-btn am-btn-primary">Stick 80px below the top</button></div></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">data-am-sticky</span>=<span class="hljs-value">"{top:80}"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary"</span>&gt;</span>Stick 80px below the top<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
			<h3 id="dong-hua-xiao-guo">动画效果 <a href="#dong-hua-xiao-guo" class="doc-anchor"></a></h3>
			<p>使用 <a href="#">CSS3 动画</a> 实现动画效果。</p>
			<div class="doc-example"><div data-am-sticky="{animation:'slide-top'}"><button class="am-btn am-btn-block am-btn-success">固定到顶部动画效果</button></div></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">data-am-sticky</span>=<span class="hljs-value">"{animation:'slide-top'}"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-success am-btn-block"</span>&gt;</span>固定到顶部动画效果<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
			<h2 id="diao-yong-fang-shi">调用方式 <a href="#diao-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>如上面的演示所示，在元素上添加 <code>data-am-sticky</code> 属性。</p>
			<h3 id="tong-guo-js">通过 JS <a href="#tong-guo-js" class="doc-anchor"></a></h3>
			<p>通过 <code>$.sticky(options)</code> 设置。</p>
			<div class="doc-example"><div id="my-sticky"><button class="am-btn am-btn-danger">Stick via JavaScript &amp; 150px below the top</button></div></div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="xuan-xiang">选项 <a href="#xuan-xiang" class="doc-anchor"></a></h3>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th style="width:60px;">参数</th>
						<th style="width:70px;">类型</th>
						<th style="width:50px;">默认</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>top</code></td>
						<td>数值</td>
						<td><code>0</code></td>
						<td>距离顶部位置</td>
					</tr>
					<tr>
						<td><code>animation</code></td>
						<td>字符串</td>
						<td><code>''</code></td>
						<td>动画名称</td>
					</tr>
					<tr>
						<td><code>bottom</code></td>
						<td>数值<br>或返回数值的函数</td>
						<td><code>0</code></td>
						<td>距离底部小于该数值时不再往下滚动，避免覆盖下面的元素</td>
					</tr>
				</tbody>
			</table>
			<h2 id="zhu-yi-shi-xiang">注意事项 <a href="#zhu-yi-shi-xiang" class="doc-anchor"></a></h2>
			<ul>
				<li>Sticky 插件是监听窗口滚动事件，当滚动距离超过元素上边距时，添加 <code>.am-sticky</code> 类，将元素的 <code>position</code> 设置为 <code>fixed</code>，同时设置一个 <code>top</code> 值（默认为 0）。</li>
				<li>插件初始化的时候会给在元素外面包裹 <code>.am-sticky-placeholder</code> 作为占位符避免页面抖动，有可能会影响使用使用子选择的样式。</li>
				<li><strong>已知问题</strong>：如果设置了动画，窗口快速 <code>resize</code> 时，动画会执行多次。</li>
			</ul>
			<div style="height:400px;"></div>
			<div class="ds-thread" data-thread-key="277413bffadfaad0551d598d3369dc84" data-title="JS 插件 - Sticky|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	$("#my-sticky").sticky({
		top:150,
		bottom:function(){
			return $(".amz-footer").height();
		}
	});
});
</script>
</body>
</html>