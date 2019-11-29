<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Tabs|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
<style type="text/css">
.am-tabs-nav li{
	position:relative;
	z-index:1;
}
.am-tabs-nav .am-icon-close{
	position:absolute;
	top:0;
	right:10px;
	color:#888;
	cursor:pointer;
	z-index:100;
}
.am-tabs-nav .am-icon-close:hover{
	color:#333;
}
.am-tabs-nav .am-icon-close~a{
	padding-right:25px !important;
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
							<a href="#shi-yong-yan-shi">使用演示</a>
							<ul class="am-collapse">
								<li><a href="#nei-rong-gao-du-yi-zhi">内容高度一致</a></li>
								<li><a href="#zi-gua-ying-nei-rong-gao-du">自适应内容高度</a></li>
								<li><a href="#jin-yong-hong-kong-cao-zuo">禁用触控操作</a></li>
							</ul>
						</li>
						<li>
							<a href="#diao-yong-fang-shi">调用方式</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#tong-guo-js">通过 JS</a></li>
							</ul>
						</li>
						<li>
							<a href="#faq">FAQ</a>
							<ul class="am-collapse"><li><a href="#tab-nei-rong-bu-neng-xuan-ze-ru-he-chu-li-">Tab 内容不能选择，如何处理？</a></li></ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="tabs">Tabs <a href="#tabs" class="doc-anchor"></a></h1>
			<hr>
			<p>选项卡插件，基于 CSS3 <code>transition</code> 实现水平平滑滚动；CSS3 动画实现回弹效果（触控操作时）。</p>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<h3 id="nei-rong-gao-du-yi-zhi">内容高度一致 <a href="#nei-rong-gao-du-yi-zhi" class="doc-anchor"></a></h3>
			<p>下面的例子同时演示了动态插入、删除选项卡的实现方式。</p>
			<div class="doc-example">
				<div class="am-tabs" data-am-tabs="{noSwipe:1}" id="doc-tab-demo-1">
					<ul class="am-nav am-nav-tabs am-tabs-nav">
						<li class="am-active"><a href="javascript:;">流浪</a></li>
						<li><a href="javascript:;">流浪</a></li>
						<li><a href="javascript:;">再流浪</a></li>
					</ul>
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active">我就这样告别山下的家，我实在不愿轻易让眼泪留下。我以为我并不差不会害怕，我就这样自己照顾自己长大。我不想因为现实把头低下，我以为我并不差能学会虚假。怎样才能够看穿面具里的谎话？别让我的真心散的像沙。如果有一天我变得更复杂，还能不能唱出歌声里的那幅画？ A</div>
						<div class="am-tab-panel">我就这样告别山下的家，我实在不愿轻易让眼泪留下。我以为我并不差不会害怕，我就这样自己照顾自己长大。我不想因为现实把头低下，我以为我并不差能学会虚假。怎样才能够看穿面具里的谎话？别让我的真心散的像沙。如果有一天我变得更复杂，还能不能唱出歌声里的那幅画？ B</div>
						<div class="am-tab-panel">我就这样告别山下的家，我实在不愿轻易让眼泪留下。我以为我并不差不会害怕，我就这样自己照顾自己长大。我不想因为现实把头低下，我以为我并不差能学会虚假。怎样才能够看穿面具里的谎话？别让我的真心散的像沙。如果有一天我变得更复杂，还能不能唱出歌声里的那幅画？ C</div>
					</div>
				</div>
				<br>
				<button type="button" class="am-btn am-btn-primary js-append-tab">插入 Tab</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="css">CODE</code></pre></div>
			<h3 id="zi-gua-ying-nei-rong-gao-du">自适应内容高度 <a href="#zi-gua-ying-nei-rong-gao-du" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-tabs" data-am-tabs>
					<ul class="am-nav am-nav-tabs am-tabs-nav">
						<li class="am-active"><a href="#tab1">恣意</a></li>
						<li><a href="#tab2">等候</a></li>
						<li><a href="#tab3">流浪</a></li>
					</ul>
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-fade am-in am-active" id="tab1">置身人群中<br>你只需要被淹没 享受 沉默<br>退到人群后<br>你只需给予双手 微笑 等候</div>
						<div class="am-tab-panel am-fade" id="tab2">走在忠孝东路<br>徘徊在茫然中<br>在我的人生旅途<br>选择了多少错误<br>我在睡梦中惊醒<br>感叹悔言无尽<br>恨我不能说服自己<br>接受一切教训<br>让生命去等候<br>等候下一个漂流<br>让生命去等候<br>等候下一个伤口</div>
						<div class="am-tab-panel am-fade" id="tab3">我就这样告别山下的家，我实在不愿轻易让眼泪留下。我以为我并不差不会害怕，我就这样自己照顾自己长大。我不想因为现实把头低下，我以为我并不差能学会虚假。怎样才能够看穿面具里的谎话？别让我的真心散的像沙。如果有一天我变得更复杂，还能不能唱出歌声里的那幅画？</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="jin-yong-hong-kong-cao-zuo">禁用触控操作 <a href="#jin-yong-hong-kong-cao-zuo" class="doc-anchor"></a></h3>
			<p>部分用户反应在过长的 Tabs 中滚动页面时会意外触发 Tab 切换事件，用户可以选择禁用触控操作。</p>
			<div class="doc-example">
				<div class="am-tabs" data-am-tabs="{noSwipe:1}">
					<ul class="am-nav am-nav-tabs am-tabs-nav">
						<li class="am-active"><a href="#tab2-1">恣意</a></li>
						<li><a href="#tab2-2">等候</a></li>
						<li><a href="#tab2-3">流浪</a></li>
					</ul>
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-fade am-in am-active" id="tab2-1">置身人群中<br>你只需要被淹没 享受 沉默<br>退到人群后<br>你只需给予双手 微笑 等候</div>
						<div class="am-tab-panel am-fade" id="tab2-2">走在忠孝东路<br>徘徊在茫然中<br>在我的人生旅途<br>选择了多少错误<br>我在睡梦中惊醒<br>感叹悔言无尽<br>恨我不能说服自己<br>接受一切教训<br>让生命去等候<br>等候下一个漂流<br>让生命去等候<br>等候下一个伤口</div>
						<div class="am-tab-panel am-fade" id="tab2-3">我就这样告别山下的家，我实在不愿轻易让眼泪留下。我以为我并不差不会害怕，我就这样自己照顾自己长大。我不想因为现实把头低下，我以为我并不差能学会虚假。怎样才能够看穿面具里的谎话？别让我的真心散的像沙。如果有一天我变得更复杂，还能不能唱出歌声里的那幅画？</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="diao-yong-fang-shi">调用方式 <a href="#diao-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>在选项卡容器 <code>.am-tabs</code> 上添加 <code>data-am-tabs</code> 属性。上面的演示即通过此种方式调用。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="tong-guo-js">通过 JS <a href="#tong-guo-js" class="doc-anchor"></a></h3>
			<h4 id="xuan-xiang">选项 <a href="#xuan-xiang" class="doc-anchor"></a></h4>
			<ul><li><code>options.noSwipe</code> 是否禁用触控事件。</li></ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'#someTabs'</span>).tabs({noSwipe:<span class="hljs-number">1</span>});</code></pre></div>
			<h4 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h4>
			<ul>
				<li><code>$().tabs(options)</code> - 初始化选项卡；</li>
				<li><code>$().tabs(&#39;open&#39;, index)</code> - 切换到指定的标签页，<code>index</code> 可以是数值或 jQuery 对象（选择符），如 <code>$(&#39;.am-tabs-nav a&#39;).eq(2)</code>；</li>
				<li><code>$().tabs(&#39;refresh&#39;)</code> - 刷新选项卡，动态添加、移除标签页后需手动刷新；</li>
				<li><code>$().tabs(&#39;destroy&#39;)</code> - 销毁选项卡。</li>
			</ul>
			<div class="doc-example">
				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-nav am-nav-justify am-nav-tabs am-tabs-nav">
						<li class="am-active"><a href="#">彩虹</a></li>
						<li><a href="#">画面</a></li>
						<li><a href="#">窗外</a></li>
					</ul>
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active">外面是个下雨天，不由得就会想念</div>
						<div class="am-tab-panel">像重复的广告片，总是闪烁的画面，那么地熟悉</div>
						<div class="am-tab-panel">像窗外的雨，绿油油的树叶，自由地在说笑</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h4 id="zi-ding-yi-shi-jian">自定义事件 <a href="#zi-ding-yi-shi-jian" class="doc-anchor"></a></h4>
			<p>自定义事件触发在标签上。</p>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>事件名称</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>open.tabs.amui</code></td>
						<td>打开一个选项卡时立即触发</td>
					</tr>
					<tr>
						<td><code>opened.tabs.amui</code></td>
						<td>选项卡打开完成时触发（CSS 动画执行完成）</td>
					</tr>
				</tbody>
			</table>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<p>打开控制台操作<a href="#doc-my-tabs">上面的选项卡</a>查看事件监听输出的文字。</p>
			<h2 id="faq">FAQ <a href="#faq" class="doc-anchor"></a></h2>
			<h3 id="tab-nei-rong-bu-neng-xuan-ze-ru-he-chu-li-">Tab 内容不能选择，如何处理？ <a href="#tab-nei-rong-bu-neng-xuan-ze-ru-he-chu-li-" class="doc-anchor"></a></h3>
			<p>这个问题由 <a href="#">Hammer.js</a> 引起。</p>
			<blockquote><p>Hammer is setting a property to improve the UX of the panning on desktop.</p></blockquote>
			<p>可以使用下面的样式覆盖掉 Hammer.js 的样式：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-tabs-bd</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">-moz-user-select</span>:<span class="hljs-value">text <span class="hljs-important">!important</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-user-select</span>:<span class="hljs-value">text <span class="hljs-important">!important</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-ms-user-select</span>:<span class="hljs-value">text <span class="hljs-important">!important</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">user-select</span>:<span class="hljs-value">text <span class="hljs-important">!important</span></span></span>;
}</span>
					</code>
				</pre>
			</div>
			<p>也可以选择禁用触控事件。</p>
			<div class="ds-thread" data-thread-key="d92ae54e2ae4215c7669926ec0e14774" data-title="JS 插件 - Tabs|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	var n=0,e=$("#doc-tab-demo-1"),i=e.find(".am-tabs-nav"),s=e.find(".am-tabs-bd");
	function a(){
		var a='<li><span class="am-icon-close"></span><a href="javascript:;">标签 '+n+"</a></li>";
		var c='<div class="am-tab-panel">动态插入的标签内容'+n+"</div>";
		i.append(a),s.append(c),n++,e.tabs("refresh");
	}
	$(".js-append-tab").on("click",function(){
		a();
	});
	i.on("click",".am-icon-close",function(){
		var a=$(this).closest("li"),n=i.children("li").index(a);
		a.remove(),s.find(".am-tab-panel").eq(n).remove(),e.tabs("open",n>0?n-1:n+1),e.tabs("refresh");
	});
	var n1=$("#doc-my-tabs");
	n1.tabs(),n1.find("a").on("opened.tabs.amui",function(n){
		console.log("[%s] 选项卡打开了",$(this).text());
	});
});
</script>
</body>
</html>