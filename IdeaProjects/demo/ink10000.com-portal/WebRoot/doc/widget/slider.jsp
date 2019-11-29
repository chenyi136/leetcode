<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Slider 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="slider">Slider <a href="#slider" class="doc-anchor"></a></h1>
			<hr>
			<p>图片轮播模块，更多细节<a href="doc/plugin/slider.jsp">参见 JS 插件中的介绍</a>。</p>
			<p><strong>演示图标版权归<a href="#">微软 Bing</a> 所有。</strong></p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#slider-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#slider-demo-default-0">default（默认）</a></li>
								<li><a href="#slider-demo-default-1">default（标题）</a></li>
								<li><a href="#slider-demo-default-2">default（多图）</a></li>
								<li><a href="#slider-demo-default-3">default（缩略图）</a></li>
								<li><a href="#slider-demo-a1-0">a1（圆形控制点）</a></li>
								<li><a href="#slider-demo-a2-0">a2（方形控制点）</a></li>
								<li><a href="#slider-demo-a3-0">a3（底部黑边圆形控制点）</a></li>
								<li><a href="#slider-demo-a4-0">a4（底部白边圆形控制点）</a></li>
								<li><a href="#slider-demo-a5-0">a5（长条等分控制点）</a></li>
								<li><a href="#slider-demo-b1-0">b1（方形居中左右箭头）</a></li>
								<li><a href="#slider-demo-b2-0">b2（圆形居中左右箭头）</a></li>
								<li><a href="#slider-demo-b3-0">b3（图片外左右箭头）</a></li>
								<li><a href="#slider-demo-b4-0">b4（图片外左右圆形箭头）</a></li>
								<li><a href="#slider-demo-c1-0">c1（标题+长条控制点）</a></li>
								<li><a href="#slider-demo-c2-0">c2（标题+方形控制点）</a></li>
								<li><a href="#slider-demo-c3-0">c3（标题+居中左右箭头）</a></li>
								<li><a href="#slider-demo-c4-0">c4（标题+居底左右箭头）</a></li>
								<li><a href="#slider-demo-d1-0">d1（标题+底部圆形左右箭头）</a></li>
								<li><a href="#slider-demo-d2-0">d2（浮层标题+底部圆形控制点）</a></li>
								<li><a href="#slider-demo-d3-0">d3（标题+缩略图导航）</a></li>
							</ul>
						</li>
						<li>
							<a href="#shi-yong-fang-fa">使用方法</a>
							<ul class="am-collapse">
								<li><a href="#zhi-jie-shi-yong">直接使用</a></li>
								<li><a href="#shi-yong-handlebars">使用 Handlebars</a></li>
								<li><a href="#yun-gua-pei-webide">云适配 WebIDE</a></li>
							</ul>
						</li>
						<li><a href="#shu-ju-jie-kou">数据接口</a></li>
						<li><a href="#slider-can-shu-shuo-ming">Slider 参数说明</a></li>
						<li>
							<a href="#chang-jian-wen-ti">常见问题</a>
							<ul class="am-collapse">
								<li><a href="#zai-yi-xie-liu-lan-qi-shang-chu-xian-shan-tui-wen-ti-">在一些浏览器上出现闪退问题？</a></li>
								<li><a href="#ru-he-she-zhi-kuan-gao-">如何设置宽、高？</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h2 id="slider-demo">组件演示</h2>
			<h3 id="slider-demo-default-0">default（默认）</h3>
			<div class="doc-example" data-url="doc/widget/slider_default_0.jsp">
				<div class="am-slider am-slider-default" data-am-widget="slider" data-am-slider>
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-default-1">default（标题）</h3>
			<div class="doc-example" data-url="doc/widget/slider_default_1.jsp">
				<div class="am-slider am-slider-default" data-am-widget="slider" data-am-slider="{'animation':'slide','slideshow':false}">
					<ul class="am-slides">
						<li>
							<img src="doc/image/bing-1.jpg">
							<div class="am-slider-desc">这是标题标题标题标题标题标题标题0</div>
						</li>
						<li>
							<img src="doc/image/bing-2.jpg">
							<div class="am-slider-desc">这是标题标题标题标题标题标题标题1</div>
						</li>
						<li>
							<img src="doc/image/bing-3.jpg">
							<div class="am-slider-desc">这是标题标题标题标题标题标题标题2</div>
						</li>
						<li>
							<img src="doc/image/bing-4.jpg">
							<div class="am-slider-desc">这是标题标题标题标题标题标题标题3</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-default-2">default（多图）</h3>
			<div class="doc-example" data-url="doc/widget/slider_default_2.jsp">
				<div class="am-slider am-slider-default" data-am-widget="slider" data-am-slider="{'animation':'slide','animationLoop':false,'itemWidth':200,'itemMargin':5}">
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
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-default-3">default（缩略图）</h3>
			<div class="doc-example" data-url="doc/widget/slider_default_3.jsp">
				<div class="am-slider am-slider-default" data-am-widget="slider" data-am-slider="{'animation':'slide','controlNav':'thumbnails'}">
					<ul class="am-slides">
						<li data-thumb="doc/image/bing-1.jpg"><img src="doc/image/bing-1.jpg"></li>
						<li data-thumb="doc/image/bing-2.jpg"><img src="doc/image/bing-2.jpg"></li>
						<li data-thumb="doc/image/bing-3.jpg"><img src="doc/image/bing-3.jpg"></li>
						<li data-thumb="doc/image/bing-4.jpg"><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-a1-0">a1（圆形控制点）</h3>
			<div class="doc-example" data-url="doc/widget/slider_a1_0.jsp">
				<div class="am-slider am-slider-a1" data-am-widget="slider" data-am-slider="{'directionNav':false}">
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-a2-0">a2（方形控制点）</h3>
			<div class="doc-example" data-url="doc/widget/slider_a2_0.jsp">
				<div class="am-slider am-slider-a2" data-am-widget="slider" data-am-slider="{'directionNav':false}">
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-a3-0">a3（底部黑边圆形控制点）</h3>
			<div class="doc-example" data-url="doc/widget/slider_a3_0.jsp">
				<div class="am-slider am-slider-a3" data-am-widget="slider" data-am-slider="{'directionNav':false}">
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-a4-0">a4（底部白边圆形控制点）</h3>
			<div class="doc-example" data-url="doc/widget/slider_a4_0.jsp">
				<div class="am-slider am-slider-a4" data-am-widget="slider" data-am-slider="{'directionNav':false}">
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-a5-0">a5（长条等分控制点）</h3>
			<div class="doc-example" data-url="doc/widget/slider_a5_0.jsp">
				<div class="am-slider am-slider-a5" data-am-widget="slider" data-am-slider="{'directionNav':false}">
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-b1-0">b1（方形居中左右箭头）</h3>
			<div class="doc-example" data-url="doc/widget/slider_b1_0.jsp">
				<div class="am-slider am-slider-b1" data-am-widget="slider" data-am-slider="{'controlNav':false}">
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-b2-0">b2（圆形居中左右箭头）</h3>
			<div class="doc-example" data-url="doc/widget/slider_b2_0.jsp">
				<div class="am-slider am-slider-b2" data-am-widget="slider" data-am-slider="{'controlNav':false}">
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-b3-0">b3（图片外左右箭头）</h3>
			<div class="doc-example" data-url="doc/widget/slider_b3_0.jsp">
				<div class="am-slider am-slider-b3" data-am-widget="slider" data-am-slider="{'controlNav':false}">
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
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-b4-0">b4（图片外左右圆形箭头）</h3>
			<div class="doc-example" data-url="doc/widget/slider_b4_0.jsp">
				<div class="am-slider am-slider-b4" data-am-widget="slider" data-am-slider="{'controlNav':false}">
					<ul class="am-slides">
						<li><img src="doc/image/bing-1.jpg"></li>
						<li><img src="doc/image/bing-2.jpg"></li>
						<li><img src="doc/image/bing-3.jpg"></li>
						<li><img src="doc/image/bing-4.jpg"></li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-c1-0">c1（标题+长条控制点）</h3>
			<div class="doc-example" data-url="doc/widget/slider_c1_0.jsp">
				<div class="am-slider am-slider-c1" data-am-widget="slider" data-am-slider="{'directionNav':false}">
					<ul class="am-slides">
						<li>
							<img src="doc/image/bing-1.jpg">
							<div class="am-slider-desc">远方有一个地方 那里种有我们的梦想</div>
						</li>
						<li>
							<img src="doc/image/bing-2.jpg">
							<div class="am-slider-desc">某天也许会相遇 相遇在这个好地方</div>
						</li>
						<li>
							<img src="doc/image/bing-3.jpg">
							<div class="am-slider-desc">不要太担心 只因为我相信 终会走过这条遥远的道路</div>
						</li>
						<li>
							<img src="doc/image/bing-4.jpg">
							<div class="am-slider-desc">OH PARA PARADISE 是否那么重要 你是否那么地遥远</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-c2-0">c2（标题+方形控制点）</h3>
			<div class="doc-example" data-url="doc/widget/slider_c2_0.jsp">
				<div class="am-slider am-slider-c2" data-am-widget="slider" data-am-slider="{'directionNav':false}">
					<ul class="am-slides">
						<li>
							<img src="doc/image/bing-1.jpg">
							<div class="am-slider-desc">远方有一个地方 那里种有我们的梦想</div>
						</li>
						<li>
							<img src="doc/image/bing-2.jpg">
							<div class="am-slider-desc">某天也许会相遇 相遇在这个好地方</div>
						</li>
						<li>
							<img src="doc/image/bing-3.jpg">
							<div class="am-slider-desc">不要太担心 只因为我相信 终会走过这条遥远的道路</div>
						</li>
						<li>
							<img src="doc/image/bing-4.jpg">
							<div class="am-slider-desc">OH PARA PARADISE 是否那么重要 你是否那么地遥远</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-c3-0">c3（标题+居中左右箭头）</h3>
			<div class="doc-example" data-url="doc/widget/slider_c3_0.jsp">
				<div class="am-slider am-slider-c3" data-am-widget="slider" data-am-slider="{'controlNav':false}">
					<ul class="am-slides">
						<li>
							<img src="doc/image/bing-1.jpg">
							<div class="am-slider-desc"><div class="am-slider-counter"><span class="am-active">1</span>/4</div>远方有一个地方 那里种有我们的梦想</div>
						</li>
						<li>
							<img src="doc/image/bing-2.jpg">
							<div class="am-slider-desc"><div class="am-slider-counter"><span class="am-active">2</span>/4</div>某天也许会相遇 相遇在这个好地方</div>
						</li>
						<li>
							<img src="doc/image/bing-3.jpg">
							<div class="am-slider-desc"><div class="am-slider-counter"><span class="am-active">3</span>/4</div>不要太担心 只因为我相信 终会走过这条遥远的道路</div>
						</li>
						<li>
							<img src="doc/image/bing-4.jpg">
							<div class="am-slider-desc"><div class="am-slider-counter"><span class="am-active">4</span>/4</div>OH PARA PARADISE 是否那么重要 你是否那么地遥远</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-c4-0">c4（标题+居底左右箭头）</h3>
			<div class="doc-example" data-url="doc/widget/slider_c4_0.jsp">
				<div class="am-slider am-slider-c4" data-am-widget="slider" data-am-slider="{'controlNav':false}">
					<ul class="am-slides">
						<li>
							<img src="doc/image/bing-1.jpg">
							<div class="am-slider-desc">远方有一个地方 那里种有我们的梦想</div>
						</li>
						<li>
							<img src="doc/image/bing-2.jpg">
							<div class="am-slider-desc">某天也许会相遇 相遇在这个好地方</div>
						</li>
						<li>
							<img src="doc/image/bing-3.jpg">
							<div class="am-slider-desc">不要太担心 只因为我相信 终会走过这条遥远的道路</div>
						</li>
						<li>
							<img src="doc/image/bing-4.jpg">
							<div class="am-slider-desc">OH PARA PARADISE 是否那么重要 你是否那么地遥远</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-d1-0">d1（标题+底部圆形左右箭头）</h3>
			<div class="doc-example" data-url="doc/widget/slider_d1_0.jsp">
				<div class="am-slider am-slider-d1" data-am-widget="slider" data-am-slider="{'controlNav':false}">
					<ul class="am-slides">
						<li>
							<img src="doc/image/bing-1.jpg">
							<div class="am-slider-desc">
								<h2 class="am-slider-title">远方有一个地方 那里种有我们的梦想</h2>
								<a class="am-slider-more">了解更多</a>
							</div>
						</li>
						<li>
							<img src="doc/image/bing-2.jpg">
							<div class="am-slider-desc">
								<h2 class="am-slider-title">某天也许会相遇 相遇在这个好地方</h2>
								<a class="am-slider-more">了解更多</a>
							</div>
						</li>
						<li>
							<img src="doc/image/bing-3.jpg">
							<div class="am-slider-desc">
								<h2 class="am-slider-title">不要太担心 只因为我相信 终会走过这条遥远的道路</h2>
								<a class="am-slider-more">了解更多</a>
							</div>
						</li>
						<li>
							<img src="doc/image/bing-4.jpg">
							<div class="am-slider-desc">
								<h2 class="am-slider-title">OH PARA PARADISE 是否那么重要 你是否那么地遥远</h2>
								<a class="am-slider-more">了解更多</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-d2-0">d2（浮层标题+底部圆形控制点）</h3>
			<div class="doc-example" data-url="doc/widget/slider_d2_0.jsp">
				<div class="am-slider am-slider-d2" data-am-widget="slider" data-am-slider="{'directionNav':false}">
					<ul class="am-slides">
						<li>
							<img src="doc/image/bing-1.jpg">
							<div class="am-slider-desc">
								<div class="am-slider-content">
									<h2 class="am-slider-title">远方有一个地方 那里种有我们的梦想</h2>
									<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
								</div>
								<a class="am-slider-more">了解更多</a>
							</div>
						</li>
						<li>
							<img src="doc/image/bing-2.jpg">
							<div class="am-slider-desc">
								<div class="am-slider-content">
									<h2 class="am-slider-title">某天也许会相遇 相遇在这个好地方</h2>
									<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
								</div>
								<a class="am-slider-more">了解更多</a>
							</div>
						</li>
						<li>
							<img src="doc/image/bing-3.jpg">
							<div class="am-slider-desc">
								<div class="am-slider-content">
									<h2 class="am-slider-title">不要太担心 只因为我相信 终会走过这条遥远的道路</h2>
									<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
								</div>
								<a class="am-slider-more">了解更多</a>
							</div>
						</li>
						<li>
							<img src="doc/image/bing-4.jpg">
							<div class="am-slider-desc">
								<div class="am-slider-content">
									<h2 class="am-slider-title">OH PARA PARADISE 是否那么重要 你是否那么地遥远</h2>
									<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
								</div>
								<a class="am-slider-more">了解更多</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="slider-demo-d3-0">d3（标题+缩略图导航）</h3>
			<div class="doc-example" data-url="doc/widget/slider_d3_0.jsp">
				<div class="am-slider am-slider-d3" data-am-widget="slider" data-am-slider="{'controlNav':'thumbnails','directionNav':false}">
					<ul class="am-slides">
						<li data-thumb="doc/image/bing-1.jpg">
							<img src="doc/image/bing-1.jpg">
							<div class="am-slider-desc">
								<h2 class="am-slider-title">远方有一个地方 那里种有我们的梦想</h2>
								<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
							</div>
						</li>
						<li data-thumb="doc/image/bing-2.jpg">
							<img src="doc/image/bing-2.jpg">
							<div class="am-slider-desc">
								<h2 class="am-slider-title">某天也许会相遇 相遇在这个好地方</h2>
								<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
							</div>
						</li>
						<li data-thumb="doc/image/bing-3.jpg">
							<img src="doc/image/bing-3.jpg">
							<div class="am-slider-desc">
								<h2 class="am-slider-title">不要太担心 只因为我相信 终会走过这条遥远的道路</h2>
								<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
							</div>
						</li>
						<li data-thumb="doc/image/bing-4.jpg">
							<img src="doc/image/bing-4.jpg">
							<div class="am-slider-desc">
								<h2 class="am-slider-title">OH PARA PARADISE 是否那么重要 你是否那么地遥远</h2>
								<p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的内容替换为自己的内容。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>slider</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="slider-can-shu-shuo-ming">Slider 参数说明 <a href="#slider-can-shu-shuo-ming" class="doc-anchor"></a></h2>
			<p>注意：通过模块传递的JSON字符串参数无法传递 callback，如需传递 callback 函数，请手动启动 slider：</p>
			<ul>
				<li>添加 <code>am-slider-manual</code> 类名，禁用模块默认的初始化函数；</li>
				<li>在自定义脚本里调用 slider：</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="chang-jian-wen-ti">常见问题 <a href="#chang-jian-wen-ti" class="doc-anchor"></a></h2>
			<h3 id="zai-yi-xie-liu-lan-qi-shang-chu-xian-shan-tui-wen-ti-">在一些浏览器上出现闪退问题？ <a href="#zai-yi-xie-liu-lan-qi-shang-chu-xian-shan-tui-wen-ti-" class="doc-anchor"></a></h3>
			<p>示例代码中的引号做了<strong>不必要</strong>的 encode，导致解析参数时出错，解决方法是把 <code>&amp;quot;</code> 替换成 <code>'</code>。<strong>从 2015.05.15 开始，通过 <code>Copy</code> 按钮拷贝的代码已经自动替换引号</strong>。</p>
			<p>由于 Handlebars.js 的安全机制，暂时无法在显示层面修复。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="ru-he-she-zhi-kuan-gao-">如何设置宽、高？ <a href="#ru-he-she-zhi-kuan-gao-" class="doc-anchor"></a></h3>
			<p>组件本身不提供设置宽、高的接口，宽度是容器的 <code>100%</code>，高度由 slide 里的内容决定。如果需要手动设置宽、高，请通过 CSS 设置容器的宽、高实现。</p>
			<div class="ds-thread" data-thread-key="d5fa336c6182069f92ba58d5c8ee0ea8" data-title="Slider 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>