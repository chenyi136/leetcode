<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Dropdown|Amaze UI</title>
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
								<li><a href="#xia-la-lie-biao">下拉列表</a></li>
								<li><a href="#shang-la-lie-biao">上拉列表</a></li>
								<li><a href="#xia-la-nei-rong">下拉内容</a></li>
								<li><a href="#kuan-du-gua-ying">宽度适应</a></li>
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
			<h1 id="dropdown">Dropdown <a href="#dropdown" class="doc-anchor"></a></h1>
			<hr>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<h3 id="xia-la-lie-biao">下拉列表 <a href="#xia-la-lie-biao" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-dropdown" data-am-dropdown>
					<button class="am-dropdown-toggle am-btn am-btn-primary" data-am-dropdown-toggle>下拉列表 <span class="am-icon-caret-down"></span></button>
					<ul class="am-dropdown-content">
						<li class="am-dropdown-header">标题</li>
						<li><a href="#">快乐的方式不只一种</a></li>
						<li class="am-active"><a href="#">最荣幸是</a></li>
						<li><a href="#">谁都是造物者的光荣</a></li>
						<li class="am-disabled"><a href="#">就站在光明的角落</a></li>
						<li class="am-divider"></li>
						<li><a href="#">天空海阔 要做最坚强的泡沫</a></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="shang-la-lie-biao">上拉列表 <a href="#shang-la-lie-biao" class="doc-anchor"></a></h3>
			<p>在 <code>.am-dropdown</code> 上添加 <code>.am-dropdown-up</code> class，在上面弹出内容。</p>
			<div class="doc-example">
				<div class="am-dropdown am-dropdown-up" data-am-dropdown>
					<button class="am-dropdown-toggle am-btn am-btn-danger" data-am-dropdown-toggle>上拉列表 <span class="am-icon-caret-up"></span></button>
					<ul class="am-dropdown-content">
						<li class="am-dropdown-header">标题</li>
						<li><a href="#">快乐的方式不只一种</a></li>
						<li class="am-active"><a href="#">最荣幸是</a></li>
						<li><a href="#">谁都是造物者的光荣</a></li>
						<li class="am-disabled"><a href="#">就站在光明的角落</a></li>
						<li class="am-divider"></li>
						<li><a href="#">天空海阔 要做最坚强的泡沫</a></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="xia-la-nei-rong">下拉内容 <a href="#xia-la-nei-rong" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-dropdown" data-am-dropdown>
					<button class="am-dropdown-toggle am-btn am-btn-success">下拉内容 <span class="am-icon-caret-down"></span></button>
					<div class="am-dropdown-content">
						<h2>I am what I am</h2>
						<p>多么高兴 在琉璃屋中快乐生活 对世界说 甚么是光明和磊落 我就是我 是颜色不一样的烟火</p>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="kuan-du-gua-ying">宽度适应 <a href="#kuan-du-gua-ying" class="doc-anchor"></a></h3>
			<p>下拉内容 <code>.am-dropdown-content</code> 为绝对定位，宽度会根据内容缩放（最小为 <code>160px</code>）。</p>
			<p>在 <code>data-am-dropdown</code> 里指定要适应到的元素，下拉内容的宽度会设置为该元素的宽度。当然可以直接在 CSS 里设置下拉内容的宽度。</p>
			<div class="doc-example">
				<div id="doc-dropdown-justify">
					<div class="am-dropdown" data-am-dropdown="{justify:'#doc-dropdown-justify'}">
						<button class="am-dropdown-toggle am-btn am-btn-success">宽度适应下拉 <span class="am-icon-caret-down"></span></button>
						<div class="am-dropdown-content">
							<h2>I am what I am</h2>
							<p>多么高兴 在琉璃屋中快乐生活 对世界说 甚么是光明和磊落 我就是我 是颜色不一样的烟火</p>
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="diao-yong-fang-shi">调用方式 <a href="#diao-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>如上面的演示所示，根据示例组织好 HTML 结构，然后在 <code>.am-dropdown</code> 上添加 <code>data-am-dropdown</code> 属性，相关选项可以设置在该属性的值里。</p>
			<h3 id="tong-guo-js">通过 JS <a href="#tong-guo-js" class="doc-anchor"></a></h3>
			<p>按照示例组织好 HTML 结构（不加 <code>data-am-dropdown</code> 属性），然后通过 JS 来调用。</p>
			<div class="doc-example">
				<div style="width:400px;" id="doc-dropdown-justify-js">
					<div class="am-dropdown" id="doc-dropdown-js">
						<button class="am-dropdown-toggle am-btn am-btn-danger">通过 JS 调用 <span class="am-icon-caret-down"></span></button>
						<div class="am-dropdown-content">
							<h2>I am what I am</h2>
							<p>多么高兴 在琉璃屋中快乐生活 对世界说 甚么是光明和磊落 我就是我 是颜色不一样的烟火</p>
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h4 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h4>
			<ul>
				<li><code>$(element).dropdown(options)</code> 激活下拉功能；</li>
				<li><code>$(element).dropdown(&#39;toggle&#39;)</code> 下拉状态交替；</li>
				<li><code>$(element).dropdown(&#39;close&#39;)</code> 隐藏下拉菜单；</li>
				<li><code>$(element).dropdown(&#39;open&#39;)</code> 显示下拉菜单。</li>
			</ul>
			<div class="doc-example">
				<button class="am-btn am-btn-secondary" id="doc-dropdown-toggle">调用 Toggle</button>
				<button class="am-btn am-btn-success" id="doc-dropdown-open">调用 Open</button>
				<button class="am-btn am-btn-warning" id="doc-dropdown-close">调用 Close</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h4 id="can-shu-shuo-ming">参数说明 <a href="#can-shu-shuo-ming" class="doc-anchor"></a></h4>
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
						<td><code>boundary</code></td>
						<td>选择器</td>
						<td><code>window</code></td>
						<td>下拉内容边界，避免下拉内容超过边界被遮盖截断</td>
					</tr>
					<tr>
						<td><code>justify</code></td>
						<td>选择器</td>
						<td><code>undefined</code></td>
						<td>下拉内容适应宽度的元素</td>
					</tr>
				</tbody>
			</table>
			<h4 id="zi-ding-yi-shi-jian">自定义事件 <a href="#zi-ding-yi-shi-jian" class="doc-anchor"></a></h4>
			<p>下拉框的自定义事件在 <code>.am-dropdown</code> 上触发。</p>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>事件名称</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>open.dropdown.amui</code></td>
						<td>调用显示下拉框方法时立即触发</td>
					</tr>
					<tr>
						<td><code>opened.dropdown.amui</code></td>
						<td>下拉框显示完成时触发</td>
					</tr>
					<tr>
						<td><code>close.dropdown.amui</code></td>
						<td>调用隐藏方法时触发</td>
					</tr>
					<tr>
						<td><code>closed.dropdown.amui</code></td>
						<td>下拉框关闭完成时触发</td>
					</tr>
				</tbody>
			</table>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="9765c3078e6b32ae791aee6531011f59" data-title="JS 插件 - Dropdown|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	$("#doc-dropdown-js").dropdown({justify:"#doc-dropdown-justify-js"});
	var n=$("#doc-dropdown-js"),d=n.data("amui.dropdown");
	function o(){
		$(window).smoothScroll({position:n.offset().top});
	}
	$("#doc-dropdown-toggle").on("click",function(d){
		return o(),n.dropdown("toggle"),!1;
	});
	$("#doc-dropdown-open").on("click",function(c){
		return o(),d.active?alert("已经打开了，施主又何必再纠缠呢！"):n.dropdown("open"),!1;
	});
	$("#doc-dropdown-close").on("click",function(c){
		return o(),d.active?n.dropdown("close"):alert("没有开哪有关，没有失哪有得！"),!1;
	});
	n.on("open.dropdown.amui",function(o){
		console.log("open event triggered");
	});
});
</script>
</body>
</html>