<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Scrollspy|Amaze UI</title>
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
						<li><a href="#shi-yong-yan-shi">使用演示</a></li>
						<li>
							<a href="#diao-yong-fang-shi">调用方式</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#js-diao-yong">JS 调用</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="scrollspy">ScrollSpy <a href="#scrollspy" class="doc-anchor"></a></h1>
			<hr>
			<p>窗口滚动时为根据设置页面元素添加动画效果（仅在支持 CSS3 动画的浏览器上有效）。</p>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<p>下面的演示中包含了各种动画效果。</p>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-lg-3">
						<div class="am-panel am-panel-primary" data-am-scrollspy="{animation:'fade'}">
							<div class="am-panel-hd">Fade</div>
							<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
						</div>
					</div>
				</div>
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-lg-3 am-u-md-offset-4 am-u-lg-offset-3">
						<div class="am-panel am-panel-secondary" data-am-scrollspy="{animation:'scale-up'}">
							<div class="am-panel-hd">Scale-up</div>
							<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
						</div>
					</div>
				</div>
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-lg-3 am-u-md-offset-8 am-u-lg-offset-6">
						<div class="am-panel am-panel-success" data-am-scrollspy="{animation:'scale-down'}">
							<div class="am-panel-hd">Scale-down</div>
							<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
						</div>
					</div>
				</div>
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-lg-3 am-u-md-offset-8 am-u-lg-offset-9">
						<div class="am-panel am-panel-warning" data-am-scrollspy="{animation:'slide-top'}">
							<div class="am-panel-hd">Slide Top</div>
							<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
						</div>
					</div>
				</div>
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-lg-3 am-u-md-offset-8 am-u-lg-offset-6">
						<div class="am-panel am-panel-danger" data-am-scrollspy="{animation:'slide-bottom'}">
							<div class="am-panel-hd">Slide Bottom</div>
							<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
						</div>
					</div>
				</div>
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-lg-3 am-u-md-offset-4 am-u-lg-offset-3">
						<div class="am-panel am-panel-primary" data-am-scrollspy="{animation:'slide-right'}">
							<div class="am-panel-hd">Slide Right</div>
							<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
						</div>
					</div>
				</div>
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-lg-3">
						<div class="am-panel am-panel-secondary" data-am-scrollspy="{animation:'slide-left'}">
							<div class="am-panel-hd">Slide Left</div>
							<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
						</div>
					</div>
				</div>
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-lg-3">
						<div class="am-panel am-panel-success" data-am-scrollspy="{animation:'fade'}">
							<div class="am-panel-hd">Fade</div>
							<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
						</div>
					</div>
					<div class="am-u-sm-12 am-u-md-4 am-u-lg-3">
						<div class="am-panel am-panel-warning" data-am-scrollspy="{animation:'fade',delay:300}">
							<div class="am-panel-hd">Fade delay:300</div>
							<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
						</div>
					</div>
					<div class="am-u-sm-12 am-u-md-4 am-u-lg-3">
						<div class="am-panel am-panel-danger" data-am-scrollspy="{animation:'fade',delay:600}">
							<div class="am-panel-hd">Fade delay:600</div>
							<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
						</div>
					</div>
					<div class="am-u-sm-12 am-u-md-4 am-u-lg-3">
						<div class="am-panel am-panel-primary" data-am-scrollspy="{animation:'fade',delay:900}">
							<div class="am-panel-hd">Fade delay:900</div>
							<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="diao-yong-fang-shi">调用方式 <a href="#diao-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>添加 <code>data-am-scrollspy</code> 属性，并设置相关属性。</p>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>属性</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>data-am-scrollspy="{animation:'fade'}"</code></td>
						<td>动画类名，参见 <a href="doc/css/animation.jsp">Amaze UI 动画库</a>，默认为 <code>fade</code></td>
					</tr>
					<tr>
						<td><code>data-am-scrollspy="{animation:'fade',delay:300}"</code></td>
						<td>延迟动画执行时间（ms），默认为 <code>0</code></td>
					</tr>
					<tr>
						<td><code>data-am-scrollspy="{animation:'fade',repeat:false}"</code></td>
						<td>是否重复动画，默认为 <code>true</code></td>
					</tr>
				</tbody>
			</table>
			<h3 id="js-diao-yong">JS 调用 <a href="#js-diao-yong" class="doc-anchor"></a></h3>
			<p>通过 <code>$().scrollspy(options)</code> 设置，参数同上。</p>
			<div class="doc-example">
				<div class="am-panel am-panel-primary" id="my-scrollspy">
					<div class="am-panel-hd">ScrollSpy via JS</div>
					<div class="am-panel-bd">生命是一团欲望，欲望不满足便痛苦，满足便无聊。人生就在痛苦和无聊之间摇摆。——叔本华</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
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
						<td><code>inview.scrollspy.amui</code></td>
						<td>元素进入窗口可视区域时触发</td>
					</tr>
					<tr>
						<td><code>outview.scrollspy.amui</code></td>
						<td>元素离开窗口可视区域时触发</td>
					</tr>
				</tbody>
			</table>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h4 id="mutationobserver">MutationObserver <a href="#mutationobserver" class="doc-anchor"></a></h4>
			<p>通过 <a href="#">Mutation Observer</a> 可以实现动态加载元素的动画效果。</p>
			<div class="doc-example">
				<p><button class="am-btn am-btn-primary" id="doc-scrollspy-insert">插入</button></p>
				<div data-am-observe id="doc-scrollspy-wrapper"><p>在下面插入一些元素试试：</p></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="a0b5447a82f3e54dfc2fde3e45a31448" data-title="JS 插件 - Scrollspy|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	$("#my-scrollspy").scrollspy({animation:"slide-left",delay:500});
	$("#my-scrollspy").on("inview.scrollspy.amui",function(){
		console.log("进入视口");
	}).on("outview.scrollspy.amui",function(){
		console.log("离开视口");
	});
	var a=1,n=$("#doc-scrollspy-wrapper");
	var c=function(a){
		var c='<div class="am-panel am-panel-primary" data-am-scrollspy="{animation:\'scale-up\'}"><div class="am-panel-bd">我是第'+a+"个插入的元素。</div></div>";
		n.append(c);
	};
	$("#doc-scrollspy-insert").on("click",function(){
		c(a),a++;
	});
});
</script>
</body>
</html>