<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Animation|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="1"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_css.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#shi-yong-yan-shi">使用演示</a>
							<ul class="am-collapse">
								<li><a href="#mo-ren-xiao-guo">默认效果</a></li>
								<li><a href="#fan-xiang-dong-hua">反向动画</a></li>
								<li><a href="#dong-hua-yan-chi-zhi-xing">动画延迟执行</a></li>
							</ul>
						</li>
						<li><a href="#can-kao-zi-yuan">参考资源</a></li>
					</ul>
				</div>
			</div>
			<h1 id="animation">Animation <a href="#animation" class="doc-anchor"></a></h1>
			<hr>
			<p>CSS3 动画封装，浏览器需支持 CSS3 动画。</p>
			<table class="am-table am-table-bordered am-table-striped">
				<thead>
					<tr>
						<th>Class</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>.am-animation-fade</code></td>
						<td>淡入</td>
					</tr>
					<tr>
						<td><code>.am-animation-scale-up</code></td>
						<td>逐渐放大</td>
					</tr>
					<tr>
						<td><code>.am-animation-scale-down</code></td>
						<td>逐渐缩小</td>
					</tr>
					<tr>
						<td><code>.am-animation-slide-top</code></td>
						<td>顶部滑入</td>
					</tr>
					<tr>
						<td><code>.am-animation-slide-bottom</code></td>
						<td>底部滑入</td>
					</tr>
					<tr>
						<td><code>.am-animation-slide-left</code></td>
						<td>左侧滑入</td>
					</tr>
					<tr>
						<td><code>.am-animation-slide-right</code></td>
						<td>右侧滑入</td>
					</tr>
					<tr>
						<td><code>.am-animation-shake</code></td>
						<td>左右摇动</td>
					</tr>
					<tr>
						<td><code>.am-animation-spin</code></td>
						<td>无限旋转</td>
					</tr>
				</tbody>
			</table>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<p>点击按钮查看动画效果。</p>
			<h3 id="mo-ren-xiao-guo">默认效果 <a href="#mo-ren-xiao-guo" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-g doc-animations">
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-primary" data-doc-animation="fade">Fade</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-secondary" data-doc-animation="scale-up">Scale Up</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-success" data-doc-animation="scale-down">Scale Down</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-warning" data-doc-animation="slide-top">Slide Top</button></div>
				</div>
				<div class="am-g doc-animations">
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-primary" data-doc-animation="slide-bottom">Slide Bottom</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-secondary" data-doc-animation="slide-left">Slide Left</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-success" data-doc-animation="slide-right">Slide Right</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-warning" data-doc-animation="shake">Shake</button></div>
				</div>
				<span class="am-icon-cog am-animation-spin"></span>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="fan-xiang-dong-hua">反向动画 <a href="#fan-xiang-dong-hua" class="doc-anchor"></a></h3>
			<p>添加 <code>.am-animation-reverse</code>，让动画反向运行（通过把 <a href="#"><code>animation-direction</code></a>设置为 <code>reverse</code>实现）。</p>
			<div class="doc-example">
				<div class="am-g doc-animations">
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-primary am-animation-reverse" data-doc-animation="fade">Fade</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-secondary am-animation-reverse" data-doc-animation="scale-up">Scale Up</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-success am-animation-reverse" data-doc-animation="scale-down">Scale Down</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-warning am-animation-reverse" data-doc-animation="slide-top">Slide Top</button></div>
				</div>
				<div class="am-g doc-animations">
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-primary am-animation-reverse" data-doc-animation="slide-bottom">Slide Bottom</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-secondary am-animation-reverse" data-doc-animation="slide-left">Slide Left</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-block am-btn-success am-animation-reverse" data-doc-animation="slide-right">Slide Right</button></div>
					<div class="am-u-sm-6 am-u-md-3"><button class="am-btn am-btn-warning am-btn-block am-animation-reverse" data-doc-animation="shake">Shake</button></div>
				</div>
				<span class="am-icon-cog am-animation-spin am-animation-reverse"></span>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="dong-hua-yan-chi-zhi-xing">动画延迟执行 <a href="#dong-hua-yan-chi-zhi-xing" class="doc-anchor"></a></h3>
			<p>添加以下 class 可以使动画延迟 <code>1-6s</code>执行。</p>
			<ul>
				<li><code>.am-animation-delay-1</code></li>
				<li><code>.am-animation-delay-2</code></li>
				<li><code>.am-animation-delay-3</code></li>
				<li><code>.am-animation-delay-4</code></li>
				<li><code>.am-animation-delay-5</code></li>
				<li><code>.am-animation-delay-6</code></li>
			</ul>
			<p>自定义延时：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.my-animation-delay</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-animation-delay</span>:<span class="hljs-value"><span class="hljs-number">15s</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">animation-delay</span>:<span class="hljs-value"><span class="hljs-number">15s</span></span></span>;
}</span>
					</code>
				</pre>
			</div>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-danger" id="animation-start">点击开始执行动画</button>
				<hr>
				<div id="animation-group">
					<p><button type="button" class="am-btn am-btn-primary">没延迟的动画</button></p>
					<p><button type="button" class="am-btn am-btn-primary am-animation-delay-1">延迟 1s 执行</button></p>
					<p><button type="button" class="am-btn am-btn-secondary am-animation-delay-2">延迟 2s 执行</button></p>
					<p><button type="button" class="am-btn am-btn-success am-animation-delay-3">延迟 3s 执行</button></p>
					<p><button type="button" class="am-btn am-btn-warning am-animation-delay-4">延迟 4s 执行</button></p>
					<p><button type="button" class="am-btn am-btn-danger am-animation-delay-5">延迟 5s 执行</button></p>
					<p><button type="button" class="am-btn am-btn-primary am-animation-delay-6">延迟 6s 执行</button></p>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="can-kao-zi-yuan">参考资源 <a href="#can-kao-zi-yuan" class="doc-anchor"></a></h2>
			<ul>
				<li><a href="#">CSS 动画</a></li>
				<li><a href="#">Animate.css</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="31780880aec5a3a8fac8c869d69a2d73" data-title="CSS - Animation|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	$(".doc-animations").on("click","[data-doc-animation]",function(){
		var a=$(this);
		var i="am-animation-"+a.data("docAnimation");
		a.data("animation-idle")&&window.clearTimeout(a.data("animation-idle"));
		a.removeClass(i);
		window.setTimeout(function(){
			a.addClass(i);
			a.data("animation-idle",window.setTimeout(function(){
				a.removeClass(i);
				a.data("animation-idle",!1);
			},500));
		},50);
	});
	var n=$("#animation-group").find(".am-btn");
	var a=[],o=!1,i="am-animation-scale-up";
	$("#animation-start").on("click",function(){
		o||(o=!0,n.each(function(){
			var n=new $.Deferred;
			a.push(n);
			var o=$(this);
			$.AMUI.support.animation&&o.addClass(i).one($.AMUI.support.animation.end,function(){
				o.removeClass(i),n.resolve();
			});
		}),$.when.apply(null,a).done(function(){
			o=!1,console.log("[AMUI] - 所有动画执行完成"),a=[];
		}));
	});
});
</script>
</body>
</html>