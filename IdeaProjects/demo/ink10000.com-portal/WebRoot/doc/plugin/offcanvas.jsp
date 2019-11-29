<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Offcanvas|Amaze UI</title>
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
							<a href="#shi-yong-shi-li">使用示例</a>
							<ul class="am-collapse">
								<li><a href="#mo-ren-yang-shi">默认样式</a></li>
								<li><a href="#push-xiao-guo">Push 效果</a></li>
								<li><a href="#you-ce-xian-shi">右侧显示</a></li>
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
			<h1 id="offcanvas">OffCanvas <a href="#offcanvas" class="doc-anchor"></a></h1>
			<hr>
			<p>侧滑插件。实际使用案例参见菜单组件<a href="doc/widget/menu_offcanvas1_0.jsp">演示一</a>、<a href="doc/widget/menu_offcanvas1_1.jsp">演示二</a>。</p>
			<h2 id="shi-yong-shi-li">使用示例 <a href="#shi-yong-shi-li" class="doc-anchor"></a></h2>
			<p>该组件由触发器和侧滑元素两部分组成。触发器上添加 <code>data-am-offcanvas</code> 属性，侧滑元素使用固定的 HTML 结构。</p>
			<h3 id="mo-ren-yang-shi">默认样式 <a href="#mo-ren-yang-shi" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<a href="#doc-oc-demo1" data-am-offcanvas>点击显示侧边栏</a>
				<div class="am-offcanvas" id="doc-oc-demo1"><div class="am-offcanvas-bar"><div class="am-offcanvas-content"><p>我不愿让你一个人<br>承受这世界的残忍<br>我不愿眼泪陪你到 永恒</p></div></div></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="push-xiao-guo">Push 效果 <a href="#push-xiao-guo" class="doc-anchor"></a></h3>
			<p>设置 <code>effect:&#39;push&#39;</code>。</p>
			<div class="doc-example">
				<button class="am-btn am-btn-primary" data-am-offcanvas="{target:'#doc-oc-demo2',effect:'push'}">点击显示侧边栏</button>
				<div class="am-offcanvas" id="doc-oc-demo2"><div class="am-offcanvas-bar"><div class="am-offcanvas-content"><p>我不愿让你一个人<br>承受这世界的残忍<br>我不愿眼泪陪你到 永恒</p></div></div></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="you-ce-xian-shi">右侧显示 <a href="#you-ce-xian-shi" class="doc-anchor"></a></h3>
			<p>边栏默认显示在左侧，在内容容器上添加 <code>.am-offcanvas-bar-flip</code> class 调整为右侧。</p>
			<div class="doc-example">
				<button class="am-btn am-btn-success" data-am-offcanvas="{target:'#doc-oc-demo3'}">右侧显示侧边栏</button>
				<div class="am-offcanvas" id="doc-oc-demo3">
					<div class="am-offcanvas-bar am-offcanvas-bar-flip">
						<div class="am-offcanvas-content">
							<p>我不愿让你一个人<br>承受这世界的残忍<br>我不愿眼泪陪你到 永恒<br></p>
							<p><a href="#">网易音乐</a></p>
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="diao-yong-fang-shi">调用方式 <a href="#diao-yong-fang-shi" class="doc-anchor"></a></h2>
			<p>首先，按照以下结构组织好侧栏内容：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-offcanvas"</span> <span class="hljs-attribute">id</span>=<span class="hljs-value">"your-id"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-offcanvas-bar"</span>&gt;</span>
      <span class="hljs-comment">&lt;!-- 你的内容 --&gt;</span>
   <span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>在要触发侧栏的元素上添加 <code>data-am-offcanvas</code> 属性：</p>
			<ul>
				<li>如果是 <code>&lt;a&gt;</code> 元素，则把 <code>href</code> 的值设置为边栏的 ID：<code>href='#your-id'</code>；</li>
				<li>如果是其他元素，则在 <code>data-am-offcanvas</code> 的值里面指定侧边栏 ID：</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">data-am-offcanvas</span>=<span class="hljs-value">"{target:'#your-id'}"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>属性</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>{target:'#your-id'}</code></td>
						<td>指定侧边栏，如果是 <code>a</code> 元素则写在 <code>href</code> 里</td>
					</tr>
					<tr>
						<td><code>{effect:'push'}</code></td>
						<td>边栏动画效果，可选的值为 <code>overlay|push</code> 默认为 <code>overlay</code></td>
					</tr>
				</tbody>
			</table>
			<h3 id="tong-guo-js">通过 JS <a href="#tong-guo-js" class="doc-anchor"></a></h3>
			<p>组织好 OffCanvas HTML 以后，可以通过 Javascript 调用。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'#my-offcanvas'</span>).offCanvas(options);</code></pre></div>
			<p><strong>注意：</strong> 这里 <code>#my-offcanvas</code> 直接指向侧边栏元素，而不是触发器。</p>
			<h4 id="can-shu-shuo-ming">参数说明 <a href="#can-shu-shuo-ming" class="doc-anchor"></a></h4>
			<ul><li><code>options.effect</code>，值为 <code>overlay|push</code>，默认为 <code>overlay</code>。</li></ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'#my-offcanvas'</span>).offCanvas({effect:<span class="hljs-string">'push'</span>});</code></pre></div>
			<p>通过 <code>$().offCanvas(options)</code> 设置，参数同上。</p>
			<h4 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h4>
			<ul>
				<li><code>$().offCanvas(options)</code> - 设置边栏参数并打开边栏</li>
				<li><code>$().offCanvas(&#39;open&#39;)</code> - 打开边栏</li>
				<li><code>$().offCanvas(&#39;close&#39;)</code> - 关闭边栏</li>
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
						<td><code>open.offcanvas.amui</code></td>
						<td>打开边栏时立即触发</td>
					</tr>
					<tr>
						<td><code>close.offcanvas.amui</code></td>
						<td>关闭边栏时立即触发</td>
					</tr>
				</tbody>
			</table>
			<h4 id="js-kong-zhi-shi-li">JS 控制示例 <a href="#js-kong-zhi-shi-li" class="doc-anchor"></a></h4>
			<p>下面的示例演示了使用 JS 打开/关闭侧边栏。侧边栏打开以后，关闭按钮无法点击到，可以在控制台输入以下代码模拟点击事件：</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'[data-rel="close"]'</span>).click();</code></pre></div>
			<div class="doc-example">
				<div class="am-offcanvas" id="my-offcanvas"><div class="am-offcanvas-bar"><div class="am-offcanvas-content"><p>你那张略带着<br>一点点颓废的脸孔<br>轻薄的嘴唇<br>含着一千个谎言</p></div></div></div>
				<button class="am-btn am-btn-primary doc-oc-js" data-rel="open">打开侧边栏</button>
				<button class="am-btn am-btn-primary doc-oc-js" data-rel="close">关闭侧边栏</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="cb77fd4c062d096484e512990732a3ef" data-title="JS 插件 - Offcanvas|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	var o="#my-offcanvas",n=$(o);
	$(".doc-oc-js").on("click",function(){
		n.offCanvas($(this).data("rel"));
	});
	n.on("open.offcanvas.amui",function(){
		console.log(o+" 打开了。");
	}).on("close.offcanvas.amui",function(){
		console.log(o+" 关闭了。");
	});
});
</script>
</body>
</html>