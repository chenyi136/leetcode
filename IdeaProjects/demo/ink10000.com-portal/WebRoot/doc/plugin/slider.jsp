<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Slider|Amaze UI</title>
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
								<li><a href="#suo-lue-tu-mo-shi">缩略图模式</a></li>
								<li><a href="#duo-tu-gun-dong">多图滚动</a></li>
							</ul>
						</li>
						<li>
							<a href="#shi-yong-fang-shi">使用方式</a>
							<ul class="am-collapse">
								<li><a href="#html-jie-gou">HTML 结构</a></li>
								<li><a href="#tong-guo-data-api-chu-shi-hua">通过 Data API 初始化</a></li>
								<li><a href="#tong-guo-js-chu-shi-hua">通过 JS 初始化</a></li>
								<li><a href="#mo-ren-can-shu-ji-shuo-ming">默认参数及说明</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="slider">Slider <a href="#slider" class="doc-anchor"></a></h1>
			<hr>
			<p>图片轮播模块，支持触控事件，源自 <a href="#">FlexSlider</a>。本插件算不上轻量，但功能相对完善，基本能满足各种不同的需求。</p>
			<p><strong>类似插件</strong>：</p>
			<ul>
				<li><a href="#">Swiper</a></li>
				<li><a href="#">Slick</a></li>
			</ul>
			<p><a href="#">Web 组件中的图片轮播</a> 调用此插件，只是样式上做了一些扩展。</p>
			<p><strong>演示图标版权归<a href="#">微软 Bing</a> 所有。</strong></p>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<h3 id="ji-ben-xing-shi">基本形式 <a href="#ji-ben-xing-shi" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-slider am-slider-default" data-am-flexslider id="demo-slider-0">
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
				<hr>
				<div class="am-btn-toolbar">
					<button type="button" class="am-btn am-btn-primary js-demo-slider-btn" data-action="add">添加 slide</button>
					<button type="button" class="am-btn am-btn-danger js-demo-slider-btn" data-action="remove">移除 slide</button>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="suo-lue-tu-mo-shi">缩略图模式 <a href="#suo-lue-tu-mo-shi" class="doc-anchor"></a></h3>
			<p>使用该模式时需要在 <code>li</code> 上使用 <code>data-thumb</code> 指定缩略图地址。</p>
			<div class="doc-example">
				<div class="am-slider am-slider-default" data-am-flexslider="{controlNav:'thumbnails',directionNav:false,slideshow:false}">
					<ul class="am-slides">
						<li data-thumb="doc/image/bing-1.jpg"><img src="doc/image/bing-1.jpg"></li>
						<li data-thumb="doc/image/bing-2.jpg"><img src="doc/image/bing-2.jpg"></li>
						<li data-thumb="doc/image/bing-3.jpg"><img src="doc/image/bing-3.jpg"></li>
						<li data-thumb="doc/image/bing-4.jpg"><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p>轮播图数量不等于 <code>4</code> 时需要手动设定缩略图的宽度</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-control-thumbs</span> <span class="hljs-tag">li</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">100%</span>/n</span></span>; <span class="hljs-comment">/*n为轮播图数量*/</span>
}</span>
					</code>
				</pre>
			</div>
			<h3 id="duo-tu-gun-dong">多图滚动 <a href="#duo-tu-gun-dong" class="doc-anchor"></a></h3>
			<p>设置 <code>itemWidth</code> 选项实现多图滚动。<code>itemMargin</code> 仅用作计算滚动宽度用，要设置 <code>&lt;li&gt;</code> 之间的距离仍然需要 CSS， 默认设置了 5px 的宽度，加上 <code>.am-slider-carousel</code> 后生效。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-slider-carousel</span> <span class="hljs-tag">li</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">margin-right</span>:<span class="hljs-value"><span class="hljs-number">5px</span></span></span>;
}</span>
					</code>
				</pre>
			</div>
			<div class="doc-example">
				<div class="am-slider am-slider-default am-slider-carousel" data-am-flexslider="{itemWidth:200,itemMargin:5,slideshow:false}">
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-shi">使用方式 <a href="#shi-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="html-jie-gou">HTML 结构 <a href="#html-jie-gou" class="doc-anchor"></a></h3>
			<p>以下结构<strong>必须</strong>，<code>&lt;li&gt;</code> 中的内容可以自由组合。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-slider am-slider-default"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">ul</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-slides"</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span>...<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="tong-guo-data-api-chu-shi-hua">通过 Data API 初始化 <a href="#tong-guo-data-api-chu-shi-hua" class="doc-anchor"></a></h3>
			<p>在容器上添加 <code>data-am-flexslider</code> 自动初始化。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-slider am-slider-default"</span> <span class="hljs-attribute">data-am-flexslider</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">ul</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-slides"</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span>...<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="tong-guo-js-chu-shi-hua">通过 JS 初始化 <a href="#tong-guo-js-chu-shi-hua" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'.am-slider'</span>).flexslider();</code></pre></div>
			<h4 id="zi-ding-can-shu">自定参数 <a href="#zi-ding-can-shu" class="doc-anchor"></a></h4>
			<p>在初始化函数中传入所需参数即可。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   $(<span class="hljs-string">'.am-slider'</span>).flexslider({
      <span class="hljs-comment">//options</span>
   });
});
					</code>
				</pre>
			</div>
			<h4 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h4>
			<ul>
				<li><code>$(&#39;#slider&#39;).flexslider(&#39;play&#39;);</code> - 播放</li>
				<li><code>$(&#39;#slider&#39;).flexslider(&#39;pause&#39;);</code> - 暂停</li>
				<li><code>$(&#39;#slider&#39;).flexslider(&#39;stop&#39;);</code> - 停止</li>
				<li><code>$(&#39;#slider&#39;).flexslider(&#39;next&#39;);</code> - 上一个</li>
				<li><code>$(&#39;#slider&#39;).flexslider(&#39;prev&#39;);</code> - 下一个</li>
				<li><code>$(&#39;#slider&#39;).flexslider(3);</code> - 切换到第 4 个 slide</li>
			</ul>
			<p><strong><code>v2.4.1</code> 新增方法：</strong></p>
			<ul>
				<li><code>$(&#39;#slider&#39;).flexslider(&#39;addSlide&#39;, obj[, position]);</code> - 添加幻灯片，<code>obj</code> 为 jQuery 对象或者 HTML，<code>position</code> 为插入的位置（可选）；</li>
				<li><code>$(&#39;#slider&#39;).flexslider(&#39;removeSlide&#39;, obj);</code> - 移除指定幻灯片，<code>obj</code> 可以是数字或 jQuery 对象或 DOM 对象或选择符。</li>
			</ul>
			<p><strong>注意</strong>:<code>addSlide</code> 方法在缩略图模式下无法正常工作。</p>
			<h4 id="slider-shi-li">slider 实例 <a href="#slider-shi-li" class="doc-anchor"></a></h4>
			<p>通过 slider 实例可以调用更多方法。<strong><code>v2.4.1</code> 开始，可以直接通过 jQuery 方式调用以下方法。</strong></p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">var</span> slider=$(<span class="hljs-string">'#slider'</span>).data(<span class="hljs-string">'flexslider'</span>);
slider.addSlide(obj,position);<span class="hljs-comment">//插入的元素（选择符或 jQuery 对象）以及位置</span>
slider.removeSlide(obj);<span class="hljs-comment">//移除slide</span>
					</code>
				</pre>
			</div>
			<h4 id="zan-ting-yi-hou-zhong-xin-zi-dong-bo-fang">暂停以后重新自动播放 <a href="#zan-ting-yi-hou-zhong-xin-zi-dong-bo-fang" class="doc-anchor"></a></h4>
			<p><code>pauseOnAction</code> 设置为 <code>true</code> 以后，用户操作 slider 就会暂停播放。</p>
			<p>有的开发者希望过一段时间以后恢复播放，可以通过在 Data API 中设置 <code>playAfterPaused</code> 参数来实现。</p>
			<div class="doc-example">
				<div class="am-slider am-slider-default" data-am-flexslider="{playAfterPaused:8000}">
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p><strong>注意：这个参数只有通过 Data API 初始化的 Slider 才有效。</strong> 使用 JS 初始化的请添加通过以下回调函数实现。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h3 id="mo-ren-can-shu-ji-shuo-ming">默认参数及说明 <a href="#mo-ren-can-shu-ji-shuo-ming" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
{
   animation:<span class="hljs-string">"slide"</span>,<span class="hljs-comment">//String:["fade"|"slide"]，动画效果</span>
   easing:<span class="hljs-string">"swing"</span>,<span class="hljs-comment">//String:滚动动画计时函数</span>
   direction:<span class="hljs-string">"horizontal"</span>,<span class="hljs-comment">//String:滚动方向["horizontal"|"vertical"]</span>
   reverse:<span class="hljs-literal">false</span>,<span class="hljs-comment">//Boolean:翻转slide运动方向</span>
   animationLoop:<span class="hljs-literal">true</span>,<span class="hljs-comment">//Boolean:是否循环播放</span>
   smoothHeight:<span class="hljs-literal">false</span>,<span class="hljs-comment">//Boolean:当slide图片比例不一样时,"true":父类自动适应图片高度,"false":不自动适应，父类高度为图片的最高高度，默认为false</span>
   startAt:<span class="hljs-number">0</span>,<span class="hljs-comment">//Integer:开始播放的slide，从0开始计数</span>
   slideshow:<span class="hljs-literal">true</span>,<span class="hljs-comment">//Boolean:是否自动播放</span>
   slideshowSpeed:<span class="hljs-number">5000</span>,<span class="hljs-comment">//Integer:ms滚动间隔时间</span>
   animationSpeed:<span class="hljs-number">600</span>,<span class="hljs-comment">//Integer:ms动画滚动速度</span>
   initDelay:<span class="hljs-number">0</span>,<span class="hljs-comment">//Integer:ms首次执行动画的延迟</span>
   randomize:<span class="hljs-literal">false</span>,<span class="hljs-comment">//Boolean:是否随机slide顺序</span>
   pauseOnAction:<span class="hljs-literal">true</span>,<span class="hljs-comment">//Boolean:用户操作时停止自动播放</span>
   pauseOnHover:<span class="hljs-literal">false</span>,<span class="hljs-comment">//Boolean:悬停时暂停自动播放</span>
   useCSS:<span class="hljs-literal">true</span>,<span class="hljs-comment">//Boolean:是否使用css3 transition</span>
   touch:<span class="hljs-literal">true</span>,<span class="hljs-comment">//Boolean:允许触摸屏触摸滑动滑块</span>
   video:<span class="hljs-literal">false</span>,<span class="hljs-comment">//Boolean:使用视频的slider，防止CSS3 3D变换毛刺</span>
   controlNav:<span class="hljs-literal">true</span>,<span class="hljs-comment">//Boolean:是否创建控制点</span>
   directionNav:<span class="hljs-literal">true</span>,<span class="hljs-comment">//Boolean:是否创建上/下一个按钮（previous/next）</span>
   prevText:<span class="hljs-string">"Previous"</span>,<span class="hljs-comment">//String:上一个按钮文字</span>
   nextText:<span class="hljs-string">"Next"</span>,<span class="hljs-comment">//String:下一个按钮文字</span>
   keyboard:<span class="hljs-literal">true</span>,<span class="hljs-comment">//Boolean:是否开启键盘左（←）右（→）控制</span>
   multipleKeyboard:<span class="hljs-literal">false</span>,<span class="hljs-comment">//Boolean:是否允许键盘控制多个slide</span>
   mousewheel:<span class="hljs-literal">true</span>,<span class="hljs-comment">//Boolean:是否开启鼠标滚轮控制</span>
   pausePlay:<span class="hljs-literal">false</span>,<span class="hljs-comment">//Boolean:是否创建暂停与播放按钮</span>
   pauseText:<span class="hljs-string">'Pause'</span>,<span class="hljs-comment">//String:暂停按钮文字</span>
   playText:<span class="hljs-string">'Play'</span>,<span class="hljs-comment">//String:播放按钮文字</span>
   controlsContainer:<span class="hljs-string">""</span>,<span class="hljs-comment">//jQuery Object/Selector</span>
   manualControls:<span class="hljs-string">""</span>,<span class="hljs-comment">//jQuery Object/Selector自定义控制slider的元素，如"#tabs-nav li img"，导航数量和slide数量一样</span>
   sync:<span class="hljs-string">""</span>,<span class="hljs-comment">//Selector:关联slide与slide之间的操作。</span>
   asNavFor:<span class="hljs-string">""</span>,<span class="hljs-comment">//Selector:Internal property exposed for turning the slider into a thumbnail navigation for another slider</span>
   itemWidth:<span class="hljs-number">0</span>,<span class="hljs-comment">//Integer:slide宽度，多个同时滚动时设置</span>
   itemMargin:<span class="hljs-number">0</span>,<span class="hljs-comment">//Integer:slide间距</span>
   minItems:<span class="hljs-number">1</span>,<span class="hljs-comment">//Integer:最少显示slide数,与`itemWidth`相关</span>
   maxItems:<span class="hljs-number">0</span>,<span class="hljs-comment">//Integer:最多显示slide数,与`itemWidth`相关</span>
   move:<span class="hljs-number">0</span>,<span class="hljs-comment">//Integer:一次滚动移动的slide数量，0-滚动可见的slide</span>
   start:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{},<span class="hljs-comment">//Callback:function(slider)-初始化完成的回调</span>
   before:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{},<span class="hljs-comment">//Callback:function(slider)-每次滚动开始前的回调</span>
   after:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{},<span class="hljs-comment">//Callback:function(slider)-每次滚动完成后的回调</span>
   end:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{},<span class="hljs-comment">//Callback:function(slider)-执行到最后一个slide的回调</span>
   added:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{},<span class="hljs-comment">//Callback:function(slider)-slide添加时触发</span>
   removed:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{}<span class="hljs-comment">//Callback:function(slider)-slide被移除时触发</span>
   playAfterPaused:<span class="hljs-literal">null</span><span class="hljs-comment">//Integer:ms用户停止操作多长时间以后重新开始自动播放</span>
}
					</code>
				</pre>
			</div>
			<div class="ds-thread" data-thread-key="f3e39598a62e668acc18938aee44e963" data-title="JS 插件 - Slider|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	var e=$("#demo-slider-0"),i=0;
	var d=function(){
		return i++,'<li><img src="assets/i/bing-'+(Math.floor(4*Math.random())+1)+'.jpg"><div class="am-slider-desc">动态插入的 slide '+i+'</div></li>';
	};
	$(".js-demo-slider-btn").on("click",function(){
		var i=this.getAttribute("data-action");
		if("add"===i){
			e.flexslider("addSlide",d());
		}else{
			var l=e.flexslider("count");
			l>1&&e.flexslider("removeSlide",e.flexslider("count")-1);
		}
	});
	$("#your-slider").flexslider({
		playAfterPaused:8000,
		before:function(slider){
			if(slider._pausedTimer){
				window.clearTimeout(slider._pausedTimer);
				slider._pausedTimer= null;
			}
		},
		after:function(slider){
			var pauseTime=slider.vars.playAfterPaused;
			if(pauseTime&&!isNaN(pauseTime)&&!slider.playing){
				if(!slider.manualPause&&!slider.manualPlay&&!slider.stopped){
					slider._pausedTimer=window.setTimeout(function(){
						slider.play();
					},pauseTime);
				}
			}
		}
	});
});
</script>
</body>
</html>