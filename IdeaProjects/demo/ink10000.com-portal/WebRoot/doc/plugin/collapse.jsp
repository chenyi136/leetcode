<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Collapse|Amaze UI</title>
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
								<li><a href="#zhe-die-mian-ban">折叠面板</a></li>
								<li><a href="#zhe-die-cai-dan">折叠菜单</a></li>
								<li><a href="#zhe-die-lie-biao">折叠列表</a></li>
							</ul>
						</li>
						<li>
							<a href="#diao-yong-fang-shi">调用方式</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#tong-guo-js">通过 JS</a></li>
							</ul>
						</li>
						<li><a href="#zhu-yi-shi-xiang">注意事项</a></li>
					</ul>
				</div>
			</div>
			<h1 id="collapse">Collapse <a href="#collapse" class="doc-anchor"></a></h1>
			<hr>
			<p>折叠效果组件，用于制作下滑菜单或手风琴效果。</p>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<h3 id="zhe-die-mian-ban">折叠面板 <a href="#zhe-die-mian-ban" class="doc-anchor"></a></h3>
			<p>结合 <a href="doc/css/panel.jsp">Panel</a> 组件实现手风琴效果。需结合以下辅助 class 使用：</p>
			<ul>
				<li>要隐藏的内容添加 <code>.am-collapse</code>；</li>
				<li>默认显示的内容添加 <code>.am-collapse.am-in</code>；</li>
			</ul>
			<p>添加以上 class 以后，通过 Data API 来调用：</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">h4</span> <span class="hljs-attribute">data-am-collapse</span>=<span class="hljs-value">"{parent:'#accordion',target:'#do-not-say-1'}"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">h4</span>&gt;</span></code></pre></div>
			<p>其中：</p>
			<ul>
				<li><code>parent</code> 为容器 ID</li>
				<li><code>target</code> 为要伸缩的容器 ID</li>
			</ul>
			<p>如果触发元素为 <code>&lt;a&gt;</code> 元素，可以把 <code>target</code> 设置在 <code>href</code> 属性里。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#do-not-say-1"</span> <span class="hljs-attribute">data-am-collapse</span>=<span class="hljs-value">"{parent:'#accordion'}"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span></code></pre></div>
			<div class="doc-example">
				<div class="am-panel-group" id="accordion">
					<div class="am-panel am-panel-default">
						<div class="am-panel-hd"><h4 class="am-panel-title" data-am-collapse="{parent:'#accordion',target:'#do-not-say-1'}">莫言 - 你不懂我，我不怪你 #1</h4></div>
						<div class="am-collapse am-panel-collapse am-in" id="do-not-say-1"><div class="am-panel-bd">每个人都有一个死角， 自己走不出来，别人也闯不进去。<br>我把最深沉的秘密放在那里。<br>你不懂我，我不怪你。<br><br>每个人都有一道伤口， 或深或浅，盖上布，以为不存在。<br>我把最殷红的鲜血涂在那里。<br>你不懂我，我不怪你。</div></div>
					</div>
					<div class="am-panel am-panel-default">
						<div class="am-panel-hd"><h4 class="am-panel-title" data-am-collapse="{parent:'#accordion',target:'#do-not-say-2'}">莫言 - 你不懂我，我不怪你 #2</h4></div>
						<div class="am-collapse am-panel-collapse" id="do-not-say-2"><div class="am-panel-bd">每个人都有一场爱恋， 用心、用情、用力，感动也感伤。<br>我把最炙热的心情 藏在那里。<br>你不懂我，我不怪你。<br><br>每个人都有 一行眼泪， 喝下的冰冷的水，酝酿成的热泪。<br>我把最心酸的委屈汇在那里。<br>你不懂我，我不怪你。<br><br>每个人都有一段告白， 忐忑、不安，却饱含真心和勇气。<br>我把最抒情的语言用在那里。<br>你不懂我，我不怪你。</div></div>
					</div>
					<div class="am-panel am-panel-default">
						<div class="am-panel-hd"><h4 class="am-panel-title" data-am-collapse="{parent:'#accordion',target:'#do-not-say-3'}">莫言 - 你不懂我，我不怪你 #3</h4></div>
						<div class="am-collapse am-panel-collapse" id="do-not-say-3"><div class="am-panel-bd">你永远也看不见我最爱你的时候，<br>因为我只有在看不见你的时候，才最爱你。<br>同样，你永远也看不见我最寂寞的时候，<br>因为我只有在你看不见我的时候，我才最寂寞。<br><br>也许，我太会隐藏自己的悲伤。<br>也许，我太会安慰自己的伤痕。<br>也许，你眼中的我，太会照顾自己， 所以，你从不考虑我的感受。<br><br>你以为，我可以很迅速的恢复过来，有些自私的以为。<br>从阴雨走到艳阳，我路过泥泞、路过风。<br>一路走来，你不曾懂我，我亦不曾怪你</div></div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="zhe-die-cai-dan">折叠菜单 <a href="#zhe-die-cai-dan" class="doc-anchor"></a></h3>
			<p>使用时注意目标元素外面应该有一个容器，以便动画执行时计算高度。</p>
			<div class="doc-example">
				<button class="am-btn am-btn-primary" data-am-collapse="{target:'#collapse-nav'}">Menu <i class="am-icon-bars"></i></button>
				<nav>
					<ul class="am-collapse am-nav" id="collapse-nav">
						<li><a href="#">开始使用</a></li>
						<li><a href="#">CSS 介绍</a></li>
						<li class="am-active"><a href="#">JS 介绍</a></li>
						<li><a href="#">功能定制</a></li>
					</ul>
				</nav>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="zhe-die-lie-biao">折叠列表 <a href="#zhe-die-lie-biao" class="doc-anchor"></a></h3>
			<p>感谢 <a href="#">@looly</a> 提供的例子。<strong>注意 <code>&lt;li&gt;</code> 标签上需要添加 <code>am-panel</code> class</strong>。</p>
			<div class="doc-example">
				<ul class="am-list admin-sidebar-list" id="collapase-nav-1">
					<li class="am-panel"><a href="#" data-am-collapse="{parent:'#collapase-nav-1'}"><i class="am-margin-left-sm am-icon-home"></i> 首页</a></li>
					<li class="am-panel">
						<a data-am-collapse="{parent:'#collapase-nav-1',target:'#user-nav'}"><i class="am-margin-left-sm am-icon-users"></i> 人员管理 <i class="am-margin-right am-icon-angle-right am-fr"></i></a>
						<ul class="am-list am-collapse admin-sidebar-sub" id="user-nav">
							<li><a href="#"><i class="am-margin-left-sm am-icon-user"></i> 添加人员</a></li>
							<li><a href="#"><i class="am-margin-left-sm am-icon-user"></i> 人员列表</a></li>
						</ul>
					</li>
					<li class="am-panel">
						<a data-am-collapse="{parent:'#collapase-nav-1',target:'#company-nav'}"><i class="am-margin-left-sm am-icon-table"></i> 单位（部门）管理 <i class="am-icon-angle-right am-fr am-margin-right"></i></a>
						<ul class="am-list am-collapse admin-sidebar-sub" id="company-nav">
							<li><a href="#"><span class="am-margin-left-sm am-icon-table"></span> 添加单位（部门）</a></li>
							<li><a href="#"><span class="am-margin-left-sm am-icon-table"></span> 单位（部门）列表</a></li>
						</ul>
					</li>
					<li class="am-panel">
						<a data-am-collapse="{parent:'#collapase-nav-1',target:'#role-nav'}"><i class="am-margin-left-sm am-icon-table"></i> 角色管理 <i class="am-icon-angle-right am-fr am-margin-right"></i></a>
						<ul class="am-list am-collapse admin-sidebar-sub" id="role-nav">
							<li><a href="#"><span class="am-margin-left-sm am-icon-table"></span> 添加角色</a></li>
							<li><a href="#"><span class="am-margin-left-sm am-icon-table"></span> 角色列表</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="diao-yong-fang-shi">调用方式 <a href="#diao-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>在元素上添加 <code>data-am-collapse</code> 并设置 <code>target</code> 的值为折叠元素 ID：</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">data-am-collapse</span>=<span class="hljs-value">"{target:'#my-collapse'}"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<h3 id="tong-guo-js">通过 JS <a href="#tong-guo-js" class="doc-anchor"></a></h3>
			<p>使用方法：</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'#myCollapse'</span>).collapse();</code></pre></div>
			<h4 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h4>
			<ul><li><code>$().collapse(options)</code> - 绑定元素展开/折叠操作</li></ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'#myCollapse'</span>).collapse({toggle:<span class="hljs-literal">false</span>});</code></pre></div>
			<ul>
				<li><code>$().collapse(&#39;toggle&#39;)</code> - 切换面板状态</li>
				<li><code>$().collapse(&#39;open&#39;)</code> - 展开面板</li>
				<li><code>$().collapse(&#39;close&#39;)</code> - 关闭面板</li>
			</ul>
			<h4 id="xuan-xiang">选项 <a href="#xuan-xiang" class="doc-anchor"></a></h4>
			<table class="am-table am-table-bordered am-table-striped">
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
						<td><code>parent</code></td>
						<td>选择符</td>
						<td><code>false</code></td>
						<td>如果设置了 <code>parent</code> 参数，且该容器下有多个可折叠的面板时，展开一个面板会关闭其它展开的面板。换言之，如果想让多个面板可以都处于展开状态，那不设置这个参数即可。</td>
					</tr>
					<tr>
						<td><code>toggle</code></td>
						<td>布尔值</td>
						<td><code>true</code></td>
						<td>交替执行展开/关闭操作</td>
					</tr>
				</tbody>
			</table>
			<h4 id="zi-ding-yi-shi-jian">自定义事件 <a href="#zi-ding-yi-shi-jian" class="doc-anchor"></a></h4>
			<p>自定义事件在<strong>折叠的元素</strong>上触发，以上面的折叠菜单为例，<code>#collapse-nav</code> 触发自定义事件：</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<table class="am-table am-table-bordered am-table-striped">
				<thead>
					<tr>
						<th>事件</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>open.collapse.amui</code></td>
						<td><code>open</code> 方法被调用时立即触发</td>
					</tr>
					<tr>
						<td><code>opened.collapse.amui</code></td>
						<td>元素完全展开后触发</td>
					</tr>
					<tr>
						<td><code>close.collapse.amui</code></td>
						<td><code>close</code> 方法被调用后立即触发</td>
					</tr>
					<tr>
						<td><code>closed.collapse.amui</code></td>
						<td>元素折叠完成后触发</td>
					</tr>
				</tbody>
			</table>
			<h2 id="zhu-yi-shi-xiang">注意事项 <a href="#zhu-yi-shi-xiang" class="doc-anchor"></a></h2>
			<p><strong>不要在折叠内容的容器上设置垂直的 <code>margin</code>/<code>padding</code>/<code>border</code> 样式。</strong></p>
			<p>jQuery 计算元素高度的方式有点奇葩，暂时只能通过上面的方式规避。</p>
			<div class="ds-thread" data-thread-key="a494872a6b1176e20601577c50c38830" data-title="JS 插件 - Collapse|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	$("#collapse-nav").on("open.collapse.amui",function(){
		console.log("折叠菜单打开了！");
	}).on("close.collapse.amui",function(){
		console.log("折叠菜单关闭鸟！");
	});
});
</script>
</body>
</html>