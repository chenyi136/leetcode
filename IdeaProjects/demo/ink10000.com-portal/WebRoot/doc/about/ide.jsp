<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js doc-ide"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js doc-ide"><!--<![endif]-->
<head>
	<title>WebIDE 模块文档速查|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
<style type="text/css">
.boxes{
	width:300px;
}
.boxes .box{
	height:100px;
	line-height:100px;
	font-weight:700;
	text-align:center;
	color:#EEE;
	transition:transform .25s ease;
}
.boxes .box:hover{
	font-size:250%;
	transform:rotate(360deg);
	-webkit-animation:heart .45s ease-in-out .15s infinite;
	animation:heart .45s ease-in-out .15s infinite;
}
.box-1,.box-5,.box-9{
	background-color:red;
}
.box-2,.box-6{
	background-color:orange;
}
.box-3,.box-7{
	background-color:#00F;
}
.box-4,.box-8{
	background-color:green;
}
{
@-webkit-keyframes heart{
	0%{
		font-size:150%;
	}
	100%{
		font-size:300%;
	}
}
@keyframes heart{
	0%{
		font-size:150%;
	}
	100%{
		font-size:300%;
	}
}
</style>
</head>
<body data-amui="2.x">
<div id="layout">
	<header class="am-cf" id="dbg-header">
		<h1><a href="index.jsp">Amaze UI</a></h1>
		<h2>WebIDE 组件文档速查 <span class="am-icon-coffee"></span></h2>
	</header>
	<div id="main">
		<nav class="dbg-sidebar" id="dbg-sidebar">
			<ul class="md-toc">
				<li>
					<a href="#base">Base</a>
					<ul class="am-collapse">
						<li><a href="#css-he-mo-xing">CSS 盒模型</a></li>
						<li><a href="#zi-hao-ji-dan-wei">字号及单位</a></li>
					</ul>
				</li>
				<li>
					<a href="#mixins">Mixins</a>
					<ul class="am-collapse">
						<li><a href="#codeclearfixcode">clearfix()</a></li>
						<li><a href="#codeplaceholdercolorcode">placeholder(@color)</a></li>
						<li><a href="#codetext-overflowcode">text-overflow()</a></li>
						<li><a href="#codetext-hidecode">text-hide()</a></li>
						<li><a href="#ju-bu-bian-kuang-yuan-jiao">局部边框圆角</a></li>
						<li><a href="#codebox-shadowcode">box-shadow()</a></li>
						<li><a href="#codetransitioncode">transition()</a></li>
						<li><a href="#a-hrefhttpsdeveloper-mozilla-orgzh-cndocscsstransformcss3-transforma">CSS3 transform</a></li>
						<li><a href="#a-hrefhttpsdeveloper-mozilla-orgen-usdocswebcssanimationredirectlocaleen-usampredirectslugcss2fanimationcss3-animationa">CSS3 Animation</a></li>
						<li><a href="#codebox-sizingcode">box-sizing()</a></li>
						<li><a href="#css3-jian-bian">CSS3 渐变</a></li>
						<li><a href="#css-san-jiao-xing">CSS 三角形</a></li>
						<li><a href="#css-arrow">CSS Arrow</a></li>
					</ul>
				</li>
				<li>
					<a href="#grid">Grid</a>
					<ul class="am-collapse">
						<li><a href="#ji-ben-shi-yong">基本使用</a></li>
						<li><a href="#jin-jie-shi-yong">进阶使用</a></li>
					</ul>
				</li>
				<li>
					<a href="#avg-grid">AVG-Grid</a>
					<ul class="am-collapse">
						<li><a href="#ji-ben-shi-yong-1">基本使用</a></li>
						<li><a href="#xiang-ying-shi">响应式</a></li>
						<li><a href="#jiu-gong-ge">九宫格</a></li>
					</ul>
				</li>
				<li>
					<a href="#utility">Utility</a>
					<ul class="am-collapse">
						<li><a href="#bu-ju-xiang-guan">布局相关</a></li>
						<li><a href="#wen-ben-gong-ju">文本工具</a></li>
						<li><a href="#xiang-ying-shi-fu-zhu">响应式辅助</a></li>
					</ul>
				</li>
				<li>
					<a href="#button">Button</a>
					<ul class="am-collapse">
						<li><a href="#ji-ben-shi-yong-2">基本使用</a></li>
						<li><a href="#an-niu-zhuang-tai">按钮状态</a></li>
						<li><a href="#an-niu-chi-cun">按钮尺寸</a></li>
						<li><a href="#kuai-ji-xian-shi">块级显示</a></li>
						<li><a href="#an-niu-icon">按钮 Icon</a></li>
					</ul>
				</li>
				<li>
					<a href="#icon">Icon</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa">使用方法</a></li>
						<li><a href="#tu-biao-da-xiao">图标大小</a></li>
						<li><a href="#icon-button">Icon button</a></li>
						<li><a href="#xuan-zhuan-dong-hua">旋转动画</a></li>
						<li><a href="#gu-ding-kuan-du">固定宽度</a></li>
						<li><a href="#fu-zhi-tu-biao">复制图标</a></li>
						<li><a href="#cun-zai-wen-ti">存在问题</a></li>
						<li><a href="#suo-you-tu-biao-lie-biao">所有图标列表</a></li>
					</ul>
				</li>
				<li>
					<a href="#accordion-zhe-die-mian-ban">Accordion 折叠面板</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-1">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou">数据接口</a></li>
						<li><a href="#zhu-yi-shi-xiang">注意事项</a></li>
					</ul>
				</li>
				<li>
					<a href="#duoshuo">Duoshuo</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-2">使用方法</a></li>
						<li><a href="#api">API</a></li>
					</ul>
				</li>
				<li>
					<a href="#figure-dan-zhang-tu-pian">Figure 单张图片</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-3">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-1">数据接口</a></li>
					</ul>
				</li>
				<li>
					<a href="#footer-ye-jiao">Footer 页脚</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-4">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-2">数据接口</a></li>
					</ul>
				</li>
				<li>
					<a href="#gallery-tu-pian-hua-lang">Gallery 图片画廊</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-5">使用方法</a></li>
						<li><a href="#zhi-ding-suo-lue-tu">指定缩略图</a></li>
						<li><a href="#bu-shi-yong-wei-xin-tu-pian-cha-kan-qi">不使用微信图片查看器</a></li>
						<li><a href="#shu-ju-jie-kou-3">数据接口</a></li>
					</ul>
				</li>
				<li>
					<a href="#gotop-hui-dao-ding-bu">GoTop 回到顶部</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-6">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-4">数据接口</a></li>
					</ul>
				</li>
				<li>
					<a href="#header">Header</a>
					<ul class="am-collapse">
						<li><a href="#ding-bu-gu-ding">顶部固定</a></li>
						<li><a href="#shi-yong-fang-fa-7">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-5">数据接口</a></li>
					</ul>
				</li>
				<li>
					<a href="#intro-jian-jie-zu-jian">Intro 简介组件</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-8">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-6">数据接口</a></li>
					</ul>
				</li>
				<li>
					<a href="#list-nei-rong-lie-biao">List 内容列表</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-9">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-7">数据接口</a></li>
					</ul>
				</li>
				<li>
					<a href="#map-di-tu">Map 地图</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-10">使用方法</a></li>
						<li><a href="#api-1">API</a></li>
					</ul>
				</li>
				<li>
					<a href="#mechat">MeChat</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-shuo-ming">使用说明</a></li>
						<li><a href="#api-2">API</a></li>
					</ul>
				</li>
				<li>
					<a href="#menu-cai-dan">Menu 菜单</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-11">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-8">数据接口</a></li>
					</ul>
				</li>
				<li>
					<a href="#navbar-gong-ju-lan">Navbar 工具栏</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-12">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-9">数据接口</a></li>
					</ul>
				</li>
				<li>
					<a href="#pagination-fen-ye">Pagination 分页</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-13">使用方法</a></li>
						<li><a href="#shu-ju-jie-gou">数据结构</a></li>
					</ul>
				</li>
				<li>
					<a href="#paragraph-duan-luo">Paragraph 段落</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-14">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-10">数据接口</a></li>
					</ul>
				</li>
				<li>
					<a href="#slider">Slider</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-15">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-11">数据接口</a></li>
						<li><a href="#slider-can-shu-shuo-ming">Slider 参数说明</a></li>
						<li><a href="#chang-jian-wen-ti">常见问题</a></li>
					</ul>
				</li>
				<li>
					<a href="#tabs-xuan-xiang-qia">Tabs 选项卡</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-16">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-12">数据接口</a></li>
						<li><a href="#chang-jian-wen-ti-1">常见问题</a></li>
					</ul>
				</li>
				<li>
					<a href="#titlebar-biao-ti-lan">Titlebar 标题栏</a>
					<ul class="am-collapse">
						<li><a href="#shi-yong-fang-fa-17">使用方法</a></li>
						<li><a href="#shu-ju-jie-kou-13">数据接口</a></li>
					</ul>
				</li>
				<li>
					<a href="#wechatpay">WechatPay</a>
					<ul class="am-collapse">
						<li><a href="#api-3">API</a></li>
						<li><a href="#wei-xin-js-sdk-diao-yong-zhi-fu-jie-kou-yao-dian">微信 JS SDK 调用支付接口要点</a></li>
					</ul>
				</li>
			</ul>
		</nav>
		<div class="main-content">
			<div class="doc-content" id="doc-ide-content">
				<h1 id="base">Base <a href="#base" class="doc-anchor"></a></h1>
				<hr>
				<p>Amaze UI 定义的一些基础样式。</p>
				<h2 id="css-he-mo-xing">CSS 盒模型 <a href="#css-he-mo-xing" class="doc-anchor"></a></h2>
				<p>曾几何时，IE 6 及更低版本的<strong><em>非标准</em></strong>盒模型被喷得体无完肤。IE 原来的盒模型真的不好么？最终，时间给了另外一个答案。 W3C 终认识到所谓标准盒模型在实际使用中的复杂性，于是在 CSS3 中增加 <code>box-sizing</code> 这一属性，允许用户自定义盒模型。</p>
				<blockquote>
					<p><strong>You tell me I&#39;m wrong, Then you better prove you&#39;re right.</strong></p>
					<p><small>King of Pop – Scream</small></p>
				</blockquote>
				<p>这就是 W3C 的证明。</p>
				<p>扯远了，Amaze UI 将所有元素的盒模型设置为 <code>border-box</code>。这下好了，妈妈再也不用担心你没计算好 <code>padding</code>、<code>border</code> 而使布局破相了。咱来写样式，不是来学算术。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
*,*<span class="hljs-pseudo">:before</span>,*<span class="hljs-pseudo">:after</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">-moz-box-sizing</span>:<span class="hljs-value">border-box</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-box-sizing</span>:<span class="hljs-value">border-box</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">box-sizing</span>:<span class="hljs-value">border-box</span></span>;
}</span>
						</code>
					</pre>
				</div>
				<p><img src="doc/image/box.png"></p>
				<p>参考链接：</p>
				<ul>
					<li><a href="https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing">https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing</a></li>
					<li><a href="http://www.paulirish.com/2012/box-sizing-border-box-ftw/">http://www.paulirish.com/2012/box-sizing-border-box-ftw/</a></li>
					<li><a href="http://css-tricks.com/box-sizing/">Box Sizing</a></li>
				</ul>
				<h2 id="zi-hao-ji-dan-wei">字号及单位 <a href="#zi-hao-ji-dan-wei" class="doc-anchor"></a></h2>
				<p>Amaze UI 将浏览器的基准字号设置为 <code>62.5%</code>，也就是 <code>10px</code>，现在 <code>1rem=10px</code> —— 为了计算方便。然后在 <code>body</code> 上应用了 <code>font-size:1.6rem;</code>，将页面字号设置为 <code>16px</code>。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-tag">html</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">font-size</span>:<span class="hljs-value"><span class="hljs-number">62.5%</span></span></span>;
}</span>
<span class="hljs-tag">body</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">font-size</span>:<span class="hljs-value"><span class="hljs-number">1.6rem</span></span></span>;<span class="hljs-comment">/*=16px*/</span>
}</span>
						</code>
					</pre>
				</div>
				<p>与 <code>em</code> 根据上下文变化不同，<code>rem</code> 只跟基准设置关联，只要修改基准字号，所有使用 <code>rem</code> 作为单位的设置都会相应改变。</p>
				<p>当然，并非所有所有浏览器的默认字号都是 <code>16px</code>，所以在不同的浏览器上会有细微差异。</p>
				<p>另外，一些需要根据字号做相应变化的场景也使用了 <code>em</code>，需要像素级别精确的场景也使用了 <code>px</code>。</p>
				<p><strong>参考资源：</strong></p>
				<ul>
					<li><a href="http://snook.ca/archives/html_and_css/font-size-with-rem">FONT SIZING WITH REM</a></li>
					<li><a href="http://blog.typekit.com/2011/11/09/type-study-sizing-the-legible-letter/">Type study:Sizing the legible letter</a></li>
					<li><a href="https://offroadcode.com/prototypes/rem-calculator/">The rem checker</a></li>
					<li><a href="http://css-tricks.com/snippets/css/less-mixin-for-rem-font-sizing/">Mixins for Rem Font Sizing</a></li>
				</ul>
				<hr class="doc-divider">
				<h1 id="mixins">Mixins <a href="#mixins" class="doc-anchor"></a></h1>
				<hr>
				<p>Mixins 整理了一些常用的 Less 函数，包括 CSS3 各种属性封装。Mixins 封装的时候即考虑了主流浏览器的兼容性， 同时避免一些无用的浏览器前缀属性，建议在实际项目中使用相关 mixin。</p>
				<h2 id="codeclearfixcode"><code>clearfix()</code> <a href="#codeclearfixcode" class="doc-anchor"></a></h2>
				<p>详见 <a href="http://nicolasgallagher.com/micro-clearfix-hack/">A new micro clearfix hack</a></p>
				<h3 id="source-code">Source Code <a href="#source-code" class="doc-anchor"></a></h3>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.clearfix(){
   &amp;:before,
   &amp;:after{
      content:" ";/*1*/
      display:table;/*2*/
   }
   &amp;:after{
      clear:both;
   }
}
						</code>
					</pre>
				</div>
				<h3 id="example">Example <a href="#example" class="doc-anchor"></a></h3>
				<div class="doc-example">
					<div class="am-cf doc-cf">
						<div class="am-fl">float:left</div>
						<div class="am-fr">float:right</div>
					</div>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h2 id="codeplaceholdercolorcode"><code>placeholder(@color)</code> <a href="#codeplaceholdercolorcode" class="doc-anchor"></a></h2>
				<p>设置表单占位符颜色</p>
				<h3 id="source-code-1">Source Code <a href="#source-code-1" class="doc-anchor"></a></h3>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.placeholder(@color:@input-color-placeholder){
   &amp;:-moz-placeholder{color:@color;}//Firefox 4-18
   &amp;::-moz-placeholder{color:@color;}//Firefox 19+
   &amp;:-ms-input-placeholder{color:@color;}//Internet Explorer 10+
   &amp;::-webkit-input-placeholder{color:@color;}//Safari and Chrome
}
						</code>
					</pre>
				</div>
				<h3 id="example-1">Example <a href="#example-1" class="doc-anchor"></a></h3>
				<div class="doc-example"><input type="text" class="doc-placeholder" placeholder="Hello, AM UI."></div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">input</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-placeholder"</span> <span class="hljs-attribute">placeholder</span>=<span class="hljs-value">"Hello, AM UI."</span>&gt;</span></code></pre></div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.doc-placeholder{
   .placeholder(red);
}
						</code>
					</pre>
				</div>
				<h2 id="codetext-overflowcode"><code>text-overflow()</code> <a href="#codetext-overflowcode" class="doc-anchor"></a></h2>
				<p>单行显示文字，超过容器宽度时自动截断。 <code>display</code> 的值应为 <code>block</code> 或者 <code>inline-block</code>。</p>
				<h3 id="source-code-2">Source Code <a href="#source-code-2" class="doc-anchor"></a></h3>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.text-overflow</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">display:</span>block</span>;)<span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">display</span>:<span class="hljs-value">@display</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">word-wrap</span>:<span class="hljs-value">normal</span></span>;<span class="hljs-comment">/*for IE*/</span>
   <span class="hljs-rule"><span class="hljs-attribute">text-overflow</span>:<span class="hljs-value">ellipsis</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">white-space</span>:<span class="hljs-value">nowrap</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">overflow</span>:<span class="hljs-value">hidden</span></span>;
}</span>
						</code>
					</pre>
				</div>
				<h3 id="example-2">Example <a href="#example-2" class="doc-anchor"></a></h3>
				<div class="doc-example"><p class="doc-to">云适配是一项全球独一无二的网站跨平台适配技术，是指在原网站中插入一行代码</p></div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-to"</span>&gt;</span>云适配是一项全球独一无二的网站跨平台适配技术，是指在原网站中插入一行代码<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.doc-to{
   .text-overflow();
   width:100px;
}
						</code>
					</pre>
				</div>
				<h2 id="codetext-hidecode"><code>text-hide()</code> <a href="#codetext-hidecode" class="doc-anchor"></a></h2>
				<p>CSS image replacement。考虑可访性和SEO，同时兼顾显示效果。</p>
				<h3 id="source-code-3">Source Code <a href="#source-code-3" class="doc-anchor"></a></h3>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.text-hide</span>()<span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">font</span>:<span class="hljs-value">~<span class="hljs-string">"0/0"</span> a</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">color</span>:<span class="hljs-value">transparent</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">text-shadow</span>:<span class="hljs-value">none</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">background-color</span>:<span class="hljs-value">transparent</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">border</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
}</span>
						</code>
					</pre>
				</div>
				<h3 id="example-3">Example <a href="#example-3" class="doc-anchor"></a></h3>
				<div class="doc-example"><h1 class="doc-ir"><a href="#">云适配</a></h1></div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">h1</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-ir"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>云适配<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">h1</span>&gt;</span></code></pre></div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.doc-ir{
   a{
      display:block;
      .text-hide;
      background:#000 url(http://www.yunshipei.com/static/img/logo.png) no-repeat 0 0;
      height:38px;
   }
}
						</code>
					</pre>
				</div>
				<h2 id="ju-bu-bian-kuang-yuan-jiao">局部边框圆角 <a href="#ju-bu-bian-kuang-yuan-jiao" class="doc-anchor"></a></h2>
				<ul>
					<li><code>border-top-radius()</code> 上边框圆角</li>
					<li><code>border-right-radius()</code> 右边看圆角</li>
					<li><code>border-bottom-radius()</code> 下边框圆角</li>
					<li><code>border-left-radius()</code> 左边框圆角</li>
				</ul>
				<p><code>border-radius</code> 已经得到主流现代浏览器完整的支持，把你那没有的前缀都去掉吧。</p>
				<h3 id="source-code-4">Source Code <a href="#source-code-4" class="doc-anchor"></a></h3>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.border-top-radius</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">radius)</span></span>{
   <span class="hljs-tag">border-top-right-radius</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">radius;</span>
   border-top-left-radius:@radius</span>;
}
<span class="hljs-class">.border-right-radius</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">radius)</span></span>{
   <span class="hljs-tag">border-bottom-right-radius</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">radius;</span>
   border-top-right-radius:@radius</span>;
}
<span class="hljs-class">.border-bottom-radius</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">radius)</span></span>{
   <span class="hljs-tag">border-bottom-right-radius</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">radius;</span>
   border-bottom-left-radius:@radius</span>;
}
<span class="hljs-class">.border-left-radius</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">radius)</span></span>{
   <span class="hljs-tag">border-bottom-left-radius</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">radius;</span>
   border-top-left-radius:@radius</span>;
}
						</code>
					</pre>
				</div>
				<h3 id="example-4">Example <a href="#example-4" class="doc-anchor"></a></h3>
				<div class="doc-example">
					<div class="doc-box doc-br-top">border-top-radius</div>
					<div class="doc-box doc-br-right">border-right-radius</div>
					<div class="doc-box doc-br-bottom">border-bottom-radius</div>
					<div class="doc-box doc-br-left">border-left-radius</div>
				</div>
				<h2 id="codebox-shadowcode"><code>box-shadow()</code> <a href="#codebox-shadowcode" class="doc-anchor"></a></h2>
				<p><a href="https://developer.mozilla.org/zh-CN/docs/CSS/box-shadow">CSS3 阴影</a>。</p>
				<h3 id="source-code-5">Source Code <a href="#source-code-5" class="doc-anchor"></a></h3>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.box-shadow</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">shadow)</span></span>{
   <span class="hljs-tag">-webkit-box-shadow</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">shadow;</span>//iOS&lt;<span class="hljs-number">4.3</span>&amp;Android&lt;<span class="hljs-number">4.1</span>&amp;bb7.<span class="hljs-number">0</span>
   box-shadow:@shadow</span>;
}
						</code>
					</pre>
				</div>
				<h3 id="example-5">Example <a href="#example-5" class="doc-anchor"></a></h3>
				<div class="doc-example"><div class="doc-box doc-box-shadow"></div></div>
				<h2 id="codetransitioncode"><code>transition()</code> <a href="#codetransitioncode" class="doc-anchor"></a></h2>
				<p><a href="https://developer.mozilla.org/zh-CN/docs/CSS/transition">CSS3 transition</a>.</p>
				<h3 id="source-code-6">Source Code <a href="#source-code-6" class="doc-anchor"></a></h3>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.transition</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">transition)</span></span>{
   <span class="hljs-tag">-webkit-transition</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">transition;</span>
   transition:@transition</span>;
}
						</code>
					</pre>
				</div>
				<h2 id="a-hrefhttpsdeveloper-mozilla-orgzh-cndocscsstransformcss3-transforma"><a href="https://developer.mozilla.org/zh-CN/docs/CSS/transform">CSS3 transform</a> <a href="#a-hrefhttpsdeveloper-mozilla-orgzh-cndocscsstransformcss3-transforma" class="doc-anchor"></a></h2>
				<p>封装了几种 CSS transform函数，按需使用。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.rotate(@degrees){
   -webkit-transform:rotate(@degrees);
   -ms-transform:rotate(@degrees);//IE9+
   transform:rotate(@degrees);
}
.scale(@ratio){
   -webkit-transform:scale(@ratio);
   -ms-transform:scale(@ratio);//IE9+
   transform:scale(@ratio);
}
.translate(@x;@y){
   -webkit-transform:translate(@x,@y);
   -ms-transform:translate(@x,@y);//IE9+
   transform:translate(@x,@y);
}
.skew(@x;@y){
   -webkit-transform:skew(@x,@y);
   -ms-transform:skewX(@x) skewY(@y);//See https://github.com/twbs/bootstrap/issues/4885;IE9+
   transform:skew(@x,@y);
}
.translate3d(@x;@y;@z){
   -webkit-transform:translate3d(@x,@y,@z);
   transform:translate3d(@x,@y,@z);
}
.rotateX(@degrees){
   -webkit-transform:rotateX(@degrees);
   -ms-transform:rotateX(@degrees);//IE9+
   transform:rotateX(@degrees);
}
.rotateY(@degrees){
   -webkit-transform:rotateY(@degrees);
   -ms-transform:rotateY(@degrees);//IE9+
   transform:rotateY(@degrees);
}
.perspective(@perspective){
   -webkit-perspective:@perspective;
   -moz-perspective:@perspective;
   perspective:@perspective;
}
.perspective-origin(@perspective){
   -webkit-perspective-origin:@perspective;
   -moz-perspective-origin:@perspective;
   perspective-origin:@perspective;
}
.transform-origin(@origin){
   -webkit-transform-origin:@origin;
   -moz-transform-origin:@origin;
   transform-origin:@origin;
}
						</code>
					</pre>
				</div>
				<h2 id="a-hrefhttpsdeveloper-mozilla-orgen-usdocswebcssanimationredirectlocaleen-usampredirectslugcss2fanimationcss3-animationa"><a href="https://developer.mozilla.org/en-US/docs/Web/CSS/animation?redirectlocale=en-US&amp;redirectslug=CSS%2Fanimation">CSS3 Animation</a> <a href="#a-hrefhttpsdeveloper-mozilla-orgen-usdocswebcssanimationredirectlocaleen-usampredirectslugcss2fanimationcss3-animationa" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.animation</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">animation)</span></span>{
   <span class="hljs-tag">-webkit-animation</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">animation;</span>
   animation:@animation</span>;
}
						</code>
					</pre>
				</div>
				<h2 id="codebox-sizingcode"><code>box-sizing()</code> <a href="#codebox-sizingcode" class="doc-anchor"></a></h2>
				<p><a href="https://developer.mozilla.org/zh-CN/docs/CSS/box-sizing"><code>box-sizing</code></a> 用来改变 <a href="https://developer.mozilla.org/en-US/docs/CSS/Box_model">CSS 盒模型</a> ，从而改变元素高宽的计算方式。</p>
				<ul>
					<li><code>content-box</code> 默认值，标准盒模型。 width 与 height 是内容区的宽与高， 不包括边框，内边距，外边距。</li>
					<li><code>padding-box</code> width 与 height 包括内边距，不包括边距与外边距。</li>
					<li><code>border-box</code> width 与 height 包括内边距与边框，不包括外边距。这是IE 怪异模式（Quirks mode）使用的 盒模型 。</li>
				</ul>
				<h3 id="source-code-7">Source Code <a href="#source-code-7" class="doc-anchor"></a></h3>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.box-sizing</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">boxmodel)</span></span>{
   <span class="hljs-tag">-webkit-box-sizing</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">boxmodel;</span>
   -moz-box-sizing:@boxmodel</span>;
   <span class="hljs-tag">box-sizing</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">boxmodel;</span>
}</span>
						</code>
					</pre>
				</div>
				<h2 id="css3-jian-bian">CSS3 渐变 <a href="#css3-jian-bian" class="doc-anchor"></a></h2>
				<ul>
					<li><code>.horizontal(@start-color:#555;@end-color:#333;@start-percent:0%;@end-percent:100%)</code> - 从左至右的水平渐变</li>
					<li><code>.vertical(@start-color:#555;@end-color:#333;@start-percent:0%;@end-percent:100%)</code> - 从上到下垂直渐变</li>
					<li><code>.directional(@start-color:#555;@end-color:#333;@deg:45deg)</code> - 定向渐变</li>
					<li><code>.horizontal-3c(@start-color:#00b3ee;@mid-color:#7a43b6;@color-stop:50%;@end-color:#c3325f)</code> - 水平三色渐变</li>
					<li><code>.vertical-3c(@start-color:#00b3ee;@mid-color:#7a43b6;@color-stop:50%;@end-color:#c3325f)</code> - 垂直三色渐变</li>
					<li><code>.radial(@inner-color:#555;@outer-color:#333)</code> - 放射状渐变</li>
					<li><code>.striped(@color:rgba(255,255,255,.15);@angle:45deg)</code> - 条纹渐变</li>
				</ul>
				<h3 id="example-6">Example <a href="#example-6" class="doc-anchor"></a></h3>
				<div class="doc-example">
					<div class="doc-gradient doc-gradient-1"></div>
					<div class="doc-gradient doc-gradient-2"></div>
					<div class="doc-gradient doc-gradient-3"></div>
					<div class="doc-gradient doc-gradient-4"></div>
					<div class="doc-gradient doc-gradient-5"></div>
					<div class="doc-gradient doc-gradient-6"></div>
					<div class="doc-gradient doc-gradient-7"></div>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-gradient doc-gradient-1"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-gradient doc-gradient-2"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-gradient doc-gradient-3"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-gradient doc-gradient-4"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-gradient doc-gradient-5"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-gradient doc-gradient-6"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-gradient doc-gradient-7"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.doc-gradient-1{
   #gradient &gt; .horizontal(red,black);
}
.doc-gradient-2{
   #gradient &gt; .vertical(red,black);
}
.doc-gradient-3{
   #gradient &gt; .directional(red,black);
}
.doc-gradient-4{
   #gradient &gt; .horizontal-3c();
}
.doc-gradient-5{
   #gradient &gt; .vertical-3c();
}
.doc-gradient-6{
   #gradient &gt; .radial(red,black);
}
.doc-gradient-7{
   #gradient &gt; .striped(blue);
}
						</code>
					</pre>
				</div>
				<p>示例中为了突出效果，设置的颜色比较奇葩，如果不想被设计掐死，最好别写出这样的颜色。</p>
				<p>渐变 mixins 的用法如上面，<code>#gradient &gt; .striped</code> 这样子（别告诉我单词太长记不住，框架不解决智商问题）。</p>
				<h2 id="css-san-jiao-xing">CSS 三角形 <a href="#css-san-jiao-xing" class="doc-anchor"></a></h2>
				<ul>
					<li><code>.caret-up(@size:6px;@color:#222)</code> - 普通三角形</li>
					<li><code>.caret-down(@size:6px;@color:#222)</code> - 二逼（倒立）三角形</li>
					<li><code>.caret-left(@size:6px;@color:#222)</code> - 左撇三角形</li>
					<li><code>.caret-right(@size:6px;@color:#222)</code> - 右拐三角形</li>
				</ul>
				<h3 id="source-code-8">Source Code <a href="#source-code-8" class="doc-anchor"></a></h3>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.caret-down(@size:6px;@color:#222){
   display:inline-block;
   width:0;
   height:0;
   vertical-align:middle;
   border-top:@size solid @color;
   border-right:@size solid transparent;
   border-left:@size solid transparent;
   //Firefox fix for https://github.com/twbs/bootstrap/issues/9538.Once fixed, we can just straight up remove this.
   border-bottom:0 dotted;
   .rotate(360deg);
}
						</code>
					</pre>
				</div>
				<h3 id="example-7">Example <a href="#example-7" class="doc-anchor"></a></h3>
				<div class="doc-example">
					<span class="doc-caret doc-caret-u"></span>
					<span class="doc-caret doc-caret-d"></span>
					<span class="doc-caret doc-caret-l"></span>
					<span class="doc-caret doc-caret-r"></span>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-caret doc-caret-u"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-caret doc-caret-d"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-caret doc-caret-l"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-caret doc-caret-r"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
						</code>
					</pre>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.doc-caret-u{
   .caret-up(10px,red);
}
.doc-caret-d{
   .caret-down(15px,purple);
}
.doc-caret-l{
   .caret-left(20px,blue);
}
.doc-caret-r{
   .caret-right(25px,green);
}
						</code>
					</pre>
				</div>
				<h2 id="css-arrow">CSS Arrow <a href="#css-arrow" class="doc-anchor"></a></h2>
				<p>CSS 箭头。</p>
				<ul>
					<li>45deg (default) - right</li>
					<li>135deg - down</li>
					<li>-45deg - up</li>
					<li>-135deg -left</li>
				</ul>
				<h3 id="source-code-9">Source Code <a href="#source-code-9" class="doc-anchor"></a></h3>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.arrow</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">color:#DDD;</span>@width:<span class="hljs-number">6px</span></span>;<span class="hljs-at_rule">@<span class="hljs-keyword">border-width:</span><span class="hljs-number">2px</span></span>;<span class="hljs-at_rule">@<span class="hljs-keyword">deg:</span><span class="hljs-number">45deg</span>)</span>{
   <span class="hljs-tag">display</span>:<span class="hljs-tag">inline-block</span>;
   <span class="hljs-tag">width</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">width;</span>
   height:@width</span>;
   <span class="hljs-tag">border</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">color</span> solid</span>;
   <span class="hljs-tag">border-width</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">border-width</span> @border-width <span class="hljs-number">0</span> <span class="hljs-number">0</span></span>;
   <span class="hljs-class">.rotate</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">deg);</span>
}</span>
						</code>
					</pre>
				</div>
				<h3 id="example-8">Example <a href="#example-8" class="doc-anchor"></a></h3>
				<div class="doc-example">
					<span class="doc-arrow doc-arrow-r"></span>
					<span class="doc-arrow doc-arrow-d"></span>
					<span class="doc-arrow doc-arrow-u"></span>
					<span class="doc-arrow doc-arrow-l"></span>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-arrow doc-arrow-r"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-arrow doc-arrow-d"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-arrow doc-arrow-u"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-arrow doc-arrow-l"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
						</code>
					</pre>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.doc-arrow{
   .arrow(purple,10px,3px)
}
.doc-arrow-d{
   .arrow(red,10px,3px,135deg)
}
.doc-arrow-u{
   .arrow(green,10px,3px,-45deg)
}
.doc-arrow-l{
   .arrow(green,10px,3px,-135deg)
}
						</code>
					</pre>
				</div>
				<hr class="doc-divider">
				<h1 id="grid">Grid <a href="#grid" class="doc-anchor"></a></h1>
				<hr>
				<p>Amaze UI 使用了 <code>12</code> 列的响应式网格系统。使用时需在外围容器上添加 <code>.am-g</code> class，在列上添加 <code>.am-u-[sm|md|lg]-[1-12]</code> class，然后根据不同的屏幕需求设置不同的宽度（<code>u</code> 可以理解为 <code>unit</code>， 比较贴合网格数字的含义，参考了 <a href="http://purecss.io/grids/">Pure CSS</a> 的网格命名。）。</p>
				<p>响应式断点如下：</p>
				<table class="am-table am-table-bordered am-table-striped">
					<thead>
						<tr>
							<th style="width:100px;">Class</th>
							<th>区间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>am-u-sm-*</code></td>
							<td><code>0 - 640px</code></td>
						</tr>
						<tr>
							<td><code>am-u-md-*</code></td>
							<td><code>641px - 1024px</code></td>
						</tr>
						<tr>
							<td><code>am-u-lg-*</code></td>
							<td><code>1025px +</code></td>
						</tr>
					</tbody>
				</table>
				<p>Amaze UI 以 <strong>移动优先</strong> 的理念开发， <strong>如果不设置大屏的网格，应用到小屏幕的样式会继承到更大的屏幕上</strong>。</p>
				<div class="am-alert am-alert-warning"><strong>注意：</strong>为了方便查看效果，演示中的网格加了红色边框，实际中没有。 <code>.doc-am-g</code> 为辅助 Demo 显示添加的 class，实际使用时不需要。</div>
				<h2 id="ji-ben-shi-yong">基本使用 <a href="#ji-ben-shi-yong" class="doc-anchor"></a></h2>
				<h3 id="ji-ben-gai-nian">基本概念 <a href="#ji-ben-gai-nian" class="doc-anchor"></a></h3>
				<p>在 <code>&lt;table&gt;</code> 中，行用 <code>&lt;tr&gt;</code> 划分，列用 <code>&lt;td&gt;</code> 划分，行和列组合在一起形成行，网格中也类似：</p>
				<ul>
					<li><strong>行</strong> - <code>.am-g</code>:网格中的行，用于包裹列，清除列的浮动；</li>
					<li><strong>列</strong> - <code>.am-u-xx-n</code>:网格中的列，<code>xx</code> 为视口区间，<code>n</code> 为该列所占的份数，如 <code>n</code> 为 <code>3</code> 时表示这一列占整行宽度的 <code>3/12</code>，即 <code>1/4</code>。</li>
				</ul>
				<p><strong>示例 1：一个基本的网格</strong></p>
				<p>下面的示例中，行包含两列，第一列占 <code>4</code> 份，第二列占 <code>8</code> 份，我们只设置了 <code>.am-u-sm-n</code> 这个 class，意味着无论视口多大，都保持这个比例的划分。</p>
				<div class="doc-example">
					<div class="am-g doc-am-g">
						<div class="am-u-sm-4">4</div>
						<div class="am-u-sm-8">8</div>
					</div>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-4"</span>&gt;</span>4<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-8"</span>&gt;</span>8<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<p><strong>示例 2：不同区间不同的划分比例</strong></p>
				<p>下面的示例中，<code>sm</code> 区间两列是等分的，<code>md</code> 区间为 <code>1:2</code> 划分，<code>lg</code> 区间为 <code>1:3</code>。</p>
				<div class="doc-example">
					<div class="am-g doc-am-g">
						<div class="am-u-sm-6 am-u-md-4 am-u-lg-3">sm-6 md-4 lg-3</div>
						<div class="am-u-sm-6 am-u-md-8 am-u-lg-9">sm-6 md-8 lg-9</div>
					</div>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g doc-am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6 am-u-md-4 am-u-lg-3"</span>&gt;</span>sm-6 md-4 lg-3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6 am-u-md-8 am-u-lg-9"</span>&gt;</span>sm-6 md-8 lg-9<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h3 id="xian-zhi-xing-de-kuan-du">限制行的宽度 <a href="#xian-zhi-xing-de-kuan-du" class="doc-anchor"></a></h3>
				<p>Amaze UI 中， 行 <code>.am-g</code> 的宽度被设置为 <code>100%</code>， 未限定最大宽度，会随着窗口自动缩放。</p>
				<p>可以在行上添加 <code>.am-g-fixed</code> class，将最大宽度限制为 <code>1000px</code>（虽然显示器分辨率越来越高，但基于用户体验考虑，仍然选择这个值），也可以根据自己的需求设置一个最大宽度限制。</p>
				<p>源代码中的相关 CSS 为：</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.am-g</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">margin</span>:<span class="hljs-value"><span class="hljs-number">0</span> auto</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">100%</span></span></span>;
}</span>
<span class="hljs-class">.am-g-fixed</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">max-width</span>:<span class="hljs-value"><span class="hljs-number">1000px</span></span></span>;
}</span>
						</code>
					</pre>
				</div>
				<p><strong>示例 3：限制宽度的网格</strong> （<a href="http://jsbin.com/mamole/">查看演示</a>）</p>
				<p>请在宽度大于 <code>1000px</code> 中的窗口中查看。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">h2</span>&gt;</span>没有限制宽度的网格<span class="hljs-tag">&lt;/<span class="hljs-title">h2</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-4"</span>&gt;</span>4<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-8"</span>&gt;</span>8<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">h2</span>&gt;</span>限制宽度的网格<span class="hljs-tag">&lt;/<span class="hljs-title">h2</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-4"</span>&gt;</span>4<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-8"</span>&gt;</span>8<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<p>通过 <code>.am-g</code> + <code>.am-g-fixed</code> 限制行的宽度，<strong>网格并不需要容器</strong>，这可能和某些框架不太一样。</p>
				<h3 id="quan-kuan-de-xing">全宽的行 <a href="#quan-kuan-de-xing" class="doc-anchor"></a></h3>
				<p>有时某些可能是全宽的，按照上面的逻辑，应该使用下面的代码来实现：</p>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-12"</span>&gt;</span>全宽限制最大宽度的行<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
				<p>是的，这样用也没问题，不过不觉得有点冗余么？这时候<strong>容器 <code>.am-container</code></strong>就派上用场了：</p>
				<p><code>.am-container</code> 和网格列设置了相同的左右 <code>padding</code>，可以和网格内容对齐。</p>
				<p><strong>示例 4：容器</strong></p>
				<p>蓝色边框的是 <code>.am-container</code>。</p>
				<div class="doc-example">
					<div class="am-container">I'm in the .am-container.</div>
					<div class="am-g am-g-fixed doc-am-g">
						<div class="am-u-sm-6">.am-u-sm-6</div>
						<div class="am-u-sm-6">.am-u-sm-6</div>
					</div>
					<div class="am-container">
						<div class="am-g doc-am-g">
							<div class="am-u-sm-6">.am-u-sm-6</div>
							<div class="am-u-sm-6">.am-u-sm-6</div>
						</div>
					</div>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-comment">&lt;!--没有使用网格的内容--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-container"</span>&gt;</span>I'm in the .am-container.<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--网格行限制宽度--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--当然，如果你觉得嵌套一层也无所谓的话，这样用也可以--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-container"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<p><code>.am-container</code> 的样式为：</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.am-container</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-box-sizing</span>:<span class="hljs-value">border-box</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-moz-box-sizing</span>:<span class="hljs-value">border-box</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">box-sizing</span>:<span class="hljs-value">border-box</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">margin-left</span>:<span class="hljs-value">auto</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">margin-right</span>:<span class="hljs-value">auto</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">padding-left</span>:<span class="hljs-value"><span class="hljs-number">1rem</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">padding-right</span>:<span class="hljs-value"><span class="hljs-number">1rem</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">100%</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">max-width</span>:<span class="hljs-value"><span class="hljs-number">1000px</span></span></span>;
}</span>
<span class="hljs-at_rule">@<span class="hljs-keyword">media</span> only screen and (min-width:<span class="hljs-number">641px</span>)</span>{
   <span class="hljs-class">.am-container</span> <span class="hljs-rules">{
      <span class="hljs-rule"><span class="hljs-attribute">padding-left</span>:<span class="hljs-value"><span class="hljs-number">1.5rem</span></span></span>;
      <span class="hljs-rule"><span class="hljs-attribute">padding-right</span>:<span class="hljs-value"><span class="hljs-number">1.5rem</span></span></span>;
   }</span>
}
						</code>
					</pre>
				</div>
				<h3 id="duo-xing-wang-ge">多行网格 <a href="#duo-xing-wang-ge" class="doc-anchor"></a></h3>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<p>或者</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<p>上面两种写法的都没有问题，但出于对每行样式控制的方便程度考虑，推荐第一种。</p>
				<h3 id="bu-zu-12-fen-de-wang-ge">不足 12 份的网格 <a href="#bu-zu-12-fen-de-wang-ge" class="doc-anchor"></a></h3>
				<p>网格拆分时使用了非整数的百分比（100/12 * n），浏览器在计算的时候会有一些差异，最终所有列的宽度和可能没有达到 100%，导致网格右侧会有很小的空隙。因此，向右浮动最后一列，以填满行的右边（如下面示例中的第一行）。</p>
				<p>实际使用中，如果行的网格数不足 <code>12</code>，需要在最后一列上添加 <code>.am-u-end</code>。</p>
				<p><strong>示例 5：不足 12 份的网格</strong></p>
				<div class="doc-example">
					<div class="am-g doc-am-g">
						<div class="am-u-sm-3">3</div>
						<div class="am-u-sm-3">3</div>
						<div class="am-u-sm-3">3</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-3">3</div>
						<div class="am-u-sm-3">3</div>
						<div class="am-u-sm-3 am-u-end">3</div>
					</div>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-comment">&lt;!--未添加.am-u-end的情形--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--添加.am-u-end后--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3 am-u-end"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<p><strong>至此，网格的基本使用就介绍完了。</strong>如果已经满足需求，那施主就请回吧，该摇一摇，或撸啊撸，请自便。</p>
				<p>如非要往下看，出现头昏眼花等各种不适，后果自负，请自备郝思嘉速效救心丸……</p>
				<h2 id="jin-jie-shi-yong">进阶使用 <a href="#jin-jie-shi-yong" class="doc-anchor"></a></h2>
				<h3 id="xiang-ying-shi-fu-zhu-class">响应式辅助 Class <a href="#xiang-ying-shi-fu-zhu-class" class="doc-anchor"></a></h3>
				<p>Amaze UI 中内置了一些辅助响应式的 class，详见<a href="doc/css/utility.jsp">辅助类-辅助 Class</a>。</p>
				<p><strong>示例 6：响应式辅助类控制元素显隐</strong></p>
				<p>调整浏览器窗口以查看响应式效果。</p>
				<div class="doc-example">
					<div class="am-g doc-am-g">
						<div class="am-u-lg-3">
							<span class="am-show-md-down">sm-full</span>
							<span class="am-show-lg-only">lg-3</span>
						</div>
						<div class="am-u-lg-6">
							<span class="am-show-md-down">sm-full</span>
							<span class="am-show-lg-only">lg-6</span>
						</div>
						<div class="am-u-lg-3">
							<span class="am-show-md-down">sm-full</span>
							<span class="am-show-lg-only">lg-3</span>
						</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-6 am-u-lg-2">
							<span class="am-show-md-down">6</span>
							<span class="am-hide-md-down">2</span>
						</div>
						<div class="am-u-sm-6 am-u-lg-8">
							<span class="am-show-md-down">6</span>
							<span class="am-hide-md-down">8</span>
						</div>
						<div class="am-u-sm-12 am-u-lg-2">
							<span class="am-show-md-down">full</span>
							<span class="am-hide-md-down">2</span>
						</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-3">3</div>
						<div class="am-u-sm-9">9</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-lg-4">
							<span class="am-show-md-down">full</span>
							<span class="am-hide-md-down">4</span>
						</div>
						<div class="am-u-lg-8">
							<span class="am-show-md-down">full</span>
							<span class="am-hide-md-down">8</span>
						</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-6 am-u-lg-5">
							<span class="am-show-md-down">6</span>
							<span class="am-hide-md-down">5</span>
						</div>
						<div class="am-u-sm-6 am-u-lg-7">
							<span class="am-show-md-down">6</span>
							<span class="am-hide-md-down">7</span>
						</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-lg-6">
							<span class="am-show-md-down">full</span>
							<span class="am-hide-md-down">6</span>
						</div>
						<div class="am-u-lg-6">
							<span class="am-show-md-down">full</span>
							<span class="am-hide-md-down">6</span>
						</div>
					</div>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h3 id="lie-bian-ju">列边距 <a href="#lie-bian-ju" class="doc-anchor"></a></h3>
				<p>添加 <code>am-u-sm-offset-*</code>、<code>am-u-md-offset-*</code>、<code>am-u-lg-offset-*</code> 设置列的左边距。</p>
				<p><strong>示例 7：列边距啪啪啪</strong></p>
				<div class="doc-example">
					<div class="am-g doc-am-g">
						<div class="am-u-sm-1">1</div>
						<div class="am-u-sm-11">11</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-1">1</div>
						<div class="am-u-sm-10 am-u-sm-offset-1">10, offset 1</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-1">1</div>
						<div class="am-u-sm-9 am-u-sm-offset-2">9, offset 2</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-1">1</div>
						<div class="am-u-sm-8 am-u-sm-offset-3">8, offset 3</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-1">1</div>
						<div class="am-u-sm-7 am-u-sm-offset-4">7, offset 4</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-1">1</div>
						<div class="am-u-sm-6 am-u-sm-offset-5">6, offset 5</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-1">1</div>
						<div class="am-u-sm-5 am-u-sm-offset-6">5, offset 6</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-1">1</div>
						<div class="am-u-sm-4 am-u-sm-offset-7">4, offset 7</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-1">1</div>
						<div class="am-u-sm-3 am-u-sm-offset-8">3, offset 8</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-1">1</div>
						<div class="am-u-sm-2 am-u-sm-offset-9">2, offset 9</div>
					</div>
					<div class="am-g doc-am-g">
						<div class="am-u-sm-1">1</div>
						<div class="am-u-sm-1 am-u-sm-offset-10">1, offset 10</div>
					</div>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h3 id="ju-zhong-de-lie">居中的列 <a href="#ju-zhong-de-lie" class="doc-anchor"></a></h3>
				<p>添加 <code>.am-u-xx-centered</code> 实现列居中：</p>
				<ul>
					<li>如果始终的设为居中，只需要添加 <code>.am-u-sm-centered</code>（移动优先，继承）；</li>
					<li>某些区间不居中添加， <code>.am-u-xx-uncentered</code>。</li>
				</ul>
				<p><strong>示例 8：居中， To be or not to be</strong></p>
				<div class="doc-example">
					<div class="am-g doc-am-g"><div class="am-u-sm-centeredam-u-sm-3">3 centered</div></div>
					<div class="am-g doc-am-g"><div class="am-u-lg-centered am-u-sm-6">6 centered</div></div>
					<div class="am-g doc-am-g"><div class="am-u-sm-centered am-u-lg-uncentered am-u-sm-9">9 md-down-centered</div></div>
					<div class="am-g doc-am-g"><div class="am-u-sm-centered am-u-sm-11">11 centered</div></div>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-comment">&lt;!--.am-u-sm-centered始终居中--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3 am-u-sm-centered"</span>&gt;</span>3 centered<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--.am-u-lg-centered大于1024时居中--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6 am-u-lg-centered"</span>&gt;</span>6 centered<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--大于1024时不居中--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-9 am-u-sm-centered am-u-lg-uncentered"</span>&gt;</span>9 md-down-centered <span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--始终居中--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-11 am-u-sm-centered"</span>&gt;</span>11 centered<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h3 id="lie-pai-xu">列排序 <a href="#lie-pai-xu" class="doc-anchor"></a></h3>
				<p>出于 SEO 考虑，有时会有一些结构和表现不一致的情况，比如一个主要内容 + 边栏的布局，结构中主要内容在前、边栏在后，但表现中需要把边栏放在左边，主要内容放在右边，可以通过 <code>.am-u-xx-push-*</code> / <code>.am-u-xx-pull-*</code> 来实现。</p>
				<p><strong>示例 9：结构与表现表里不一</strong></p>
				<p>改变浏览器窗口宽度查看效果。</p>
				<div class="doc-example">
					<div class="am-g doc-am-g">
						<div class="am-u-md-8 am-u-md-push-4 am-u-lg-reset-order">8 main</div>
						<div class="am-u-md-4 am-u-md-pull-8 am-u-lg-reset-order">4 sidebar</div>
					</div>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-comment">&lt;!--结构中main在前，sidebar在后通过 push/pull，在 medium区间将sidebar显示到左侧，main显示到右侧large区间 reset回结构排序--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-md-8 am-u-md-push-4 am-u-lg-reset-order"</span>&gt;</span>8 main<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-md-4 am-u-md-pull-8 am-u-lg-reset-order"</span>&gt;</span>4 sidebar<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h3 id="yi-chu-lie-nei-bian-ju">移除列内边距 <a href="#yi-chu-lie-nei-bian-ju" class="doc-anchor"></a></h3>
				<p>有同学提出列默认的内边距在某些场景太大，这时 <code>.am-g-collapse</code> 就派上用场了。</p>
				<p><strong>示例 10:没有内边距的列</strong></p>
				<p>在行 <code>.am-g</code> 上添加 <code>.am-g-collapse</code>，移除列的内边距（<code>padding</code>）。</p>
				<div class="doc-example">
					<div class="am-g am-g-collapse doc-am-g">
						<div class="am-u-sm-6">.am-u-sm-6</div>
						<div class="am-u-sm-6">.am-u-sm-6</div>
					</div>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-collapse"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<hr class="doc-divider">
				<h1 id="avg-grid">AVG-Grid <a href="#avg-grid" class="doc-anchor"></a></h1>
				<hr>
				<p>Average Grid，均分网格（原 Block Grid），使用 <code>ul</code> / <code>ol</code> 创建等分列，用于内容的排列。</p>
				<p>响应式断点为：</p>
				<table class="am-table am-table-bordered am-table-striped">
					<thead>
						<tr>
							<th style="width:160px;">Class</th>
							<th>区间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>.am-avg-sm-*</code></td>
							<td><code>0 - 640px</code></td>
						</tr>
						<tr>
							<td><code>.am-avg-md-*</code></td>
							<td><code>641px - 1024px</code></td>
						</tr>
						<tr>
							<td><code>.am-avg-lg-*</code></td>
							<td><code>1025px +</code></td>
						</tr>
					</tbody>
				</table>
				<p>与布局网格不同的是，这里的<strong>数字表示几等分</strong>，而不是占 12 等分中的几列，比如 <code>.am-avg-sm-2</code> 会将子元素 <code>&lt;li&gt;</code> 的宽度设置为 <code>50%</code>。</p>
				<p>考虑到通用性（菜单、图片）等，<code>&lt;li&gt;</code> 没有设置 <code>padding</code>，使用时需根据需求自行设置。</p>
				<p>另外需要注意的 AVG Grid <strong>只能用于 <code>&lt;ul&gt;</code> / <code>&lt;ol&gt;</code> 结构</strong>。</p>
				<p><del>下面的演示中，添加了以下自定义样式（Less）：</del></p>
				<p>这部分代码已经整合到<a href="doc/css/thumbnail.jsp">缩略图</a>，无需再添加。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.doc-block-grid{
   margin-left:-5px;
   margin-right:-5px;
   &gt;li{
      padding:0 5px 10px 5px;
      img{
         border:1px solid #CCC;
         padding:2px;
         background:#FFF;
      }
   }
}
						</code>
					</pre>
				</div>
				<p><strong>演示图标版权归<a href="http://www.bing.com/">微软 Bing</a> 所有。</strong></p>
				<h2 id="ji-ben-shi-yong-1">基本使用 <a href="#ji-ben-shi-yong-1" class="doc-anchor"></a></h2>
				<p>只添加 <code>.am-avg-sm-*</code>，应用于所有屏幕尺寸。</p>
				<div class="doc-example">
					<ul class="am-avg-sm-4 am-thumbnails">
						<li><img src="doc/image/bing-1.jpg" class="am-thumbnail"></li>
						<li><img src="doc/image/bing-2.jpg" class="am-thumbnail"></li>
						<li><img src="doc/image/bing-3.jpg" class="am-thumbnail"></li>
						<li><img src="doc/image/bing-4.jpg" class="am-thumbnail"></li>
					</ul>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h2 id="xiang-ying-shi">响应式 <a href="#xiang-ying-shi" class="doc-anchor"></a></h2>
				<p>按需增加更多响应式 class，缩放窗口可以查看响应效果。</p>
				<div class="doc-example">
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-thumbnails">
						<li><img src="doc/image/bing-1.jpg" class="am-thumbnail"></li>
						<li><img src="doc/image/bing-2.jpg" class="am-thumbnail"></li>
						<li><img src="doc/image/bing-3.jpg" class="am-thumbnail"></li>
						<li><img src="doc/image/bing-4.jpg" class="am-thumbnail"></li>
						<li><img src="doc/image/bing-1.jpg" class="am-thumbnail"></li>
						<li><img src="doc/image/bing-2.jpg" class="am-thumbnail"></li>
						<li><img src="doc/image/bing-3.jpg" class="am-thumbnail"></li>
						<li><img src="doc/image/bing-4.jpg" class="am-thumbnail"></li>
					</ul>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h2 id="jiu-gong-ge">九宫格 <a href="#jiu-gong-ge" class="doc-anchor"></a></h2>
				<p>看到同学提这样的需求，就简单写一个示例。</p>
				<div class="doc-example">
					<ul class="am-avg-sm-3 boxes">
						<li class="box box-1">1</li>
						<li class="box box-2">2</li>
						<li class="box box-3">3</li>
						<li class="box box-4">4</li>
						<li class="box box-5">5</li>
						<li class="box box-6">6</li>
						<li class="box box-7">7</li>
						<li class="box box-8">8</li>
						<li class="box box-9">9</li>
					</ul>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">ul</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-avg-sm-3 boxes"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"box box-1"</span>&gt;</span>1<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"box box-2"</span>&gt;</span>2<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"box box-3"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"box box-4"</span>&gt;</span>4<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"box box-5"</span>&gt;</span>5<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"box box-6"</span>&gt;</span>6<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"box box-7"</span>&gt;</span>7<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"box box-8"</span>&gt;</span>8<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"box box-9"</span>&gt;</span>9<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
						</code>
					</pre>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="css">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="utility">Utility <a href="#utility" class="doc-anchor"></a></h1>
				<hr>
				<p>一些常用样式的 class，与 LESS minxins 的区别在于：mixins 在样式中调用，而 utility 直接在 HTML 中引用。比如要对一个元素清除浮动，在元素上添加 <code>am-cf</code> 这个 class 即可。</p>
				<h2 id="bu-ju-xiang-guan">布局相关 <a href="#bu-ju-xiang-guan" class="doc-anchor"></a></h2>
				<h3 id="rong-qi">容器 <a href="#rong-qi" class="doc-anchor"></a></h3>
				<h4 id="ji-ben-rong-qi">基本容器 <a href="#ji-ben-rong-qi" class="doc-anchor"></a></h4>
				<p><del><code>.am-container</code>，盒模型为 <code>border-box</code>，水平居中对齐，清除浮动。</del></p>
				<p><code>.am-container</code> 放到了<a href="doc/css/grid.jsp">网格</a>里面。</p>
				<h4 id="shui-ping-gun-dong">水平滚动 <a href="#shui-ping-gun-dong" class="doc-anchor"></a></h4>
				<p><code>.am-scrollable-horizontal</code> 内容超出容器宽度时显示水平滚动条。</p>
				<div class="doc-example">
					<div class="am-scrollable-horizontal">
						<table class="am-table am-table-bordered am-table-striped am-text-nowrap">
							<thead>
								<tr>
									<th>-=表格标题=-</th>
									<th>-=表格标题=-</th>
									<th>-=表格标题=-</th>
									<th>-=表格标题=-</th>
									<th>-=表格标题=-</th>
									<th>-=表格标题=-</th>
									<th>-=表格标题=-</th>
									<th>-=表格标题=-</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
								</tr>
								<tr>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
								</tr>
								<tr>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
									<td>表格数据</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h4 id="chui-zhi-gun-dong">垂直滚动 <a href="#chui-zhi-gun-dong" class="doc-anchor"></a></h4>
				<p><code>.am-scrollable-vertical</code> 内容超过设置的高度以后显示滚动条，默认设置的高度为 <code>240px</code>。</p>
				<div class="doc-example">
					<div class="am-scrollable-vertical">
						<p>《你不懂我，我不怪你》<br>作者：莫言</p>
						<p>每个人都有一个死角， 自己走不出来，别人也闯不进去。<br>我把最深沉的秘密放在那里。<br>你不懂我，我不怪你。</p>
						<p>每个人都有一道伤口， 或深或浅，盖上布，以为不存在。<br>我把最殷红的鲜血涂在那里。<br>你不懂我，我不怪你。</p>
						<p>每个人都有一场爱恋， 用心、用情、用力，感动也感伤。<br>我把最炙热的心情 藏在那里。<br>你不懂我，我不怪你。</p>
						<p>每个人都有 一行眼泪， 喝下的冰冷的水，酝酿成的热泪。<br>我把最心酸的委屈汇在那里。<br>你不懂我，我不怪你。</p>
						<p>每个人都有一段告白， 忐忑、不安，却饱含真心和勇气。<br>我把最抒情的语言用在那里。<br>你不懂我，我不怪你。</p>
					</div>
				</div>
				<h3 id="fu-dong-xiang-guan">浮动相关 <a href="#fu-dong-xiang-guan" class="doc-anchor"></a></h3>
				<ul>
					<li><p><code>.am-cf</code> - 清除浮动</p></li>
					<li><p><code>.am-nbfc</code> - 使用 <code>overflow:hidden;</code> 创建新的 <abbr>BFC</abbr> 清除浮动（<a href="https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Block_formatting_context">参考</a>）</p></li>
				</ul>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.am-cf{
   .clearfix();
}
						</code>
					</pre>
				</div>
				<ul>
					<li><code>.am-fl</code> - 左浮动</li>
					<li><code>.am-fr</code> - 右浮动</li>
					<li><code>.am-center</code> - 水平居中</li>
				</ul>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.am-center</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">display</span>:<span class="hljs-value">block</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">margin-left</span>:<span class="hljs-value">auto</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">margin-right</span>:<span class="hljs-value">auto</span></span>;
}</span>
						</code>
					</pre>
				</div>
				<p>示例：</p>
				<div class="doc-example">
					<div style="padding:10px;border:1px dashed #DDD;" class="am-cf">
						<button class="am-btn am-btn-success am-fl">向左浮动</button>
						<button class="am-btn am-btn-success am-fr">向右浮动</button>
					</div>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-cf"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-success am-fl"</span>&gt;</span>向左浮动<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-success am-fr"</span>&gt;</span>向右浮动<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h3 id="chui-zhi-dui-qi">垂直对齐 <a href="#chui-zhi-dui-qi" class="doc-anchor"></a></h3>
				<p>垂直对齐的原理为把父容器内的 “幽灵”元素（使用伪元素）高度设置为 <code>100%</code>，再通过设置需要对齐的元素 <code>vertical-align</code> 属性实现（<a href="https://developer.mozilla.org/zh-CN/docs/Web/CSS/vertical-align">参考</a>）。</p>
				<table class="am-table am-table-bd am-table-striped">
					<thead>
						<tr>
							<th>Class</th>
							<th>描述</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>.am-vertical-align</code></td>
							<td>将这个 class 添加到父容器，父容器需要指定高度。</td>
						</tr>
						<tr>
							<td><code>.am-vertical-align-middle</code></td>
							<td>需要垂直居中的元素</td>
						</tr>
						<tr>
							<td><code>.am-vertical-align-bottom</code></td>
							<td>添加到需要底部对齐的元素</td>
						</tr>
					</tbody>
				</table>
				<h4 id="chui-zhi-ju-zhong-dui-qi">垂直居中对齐 <a href="#chui-zhi-ju-zhong-dui-qi" class="doc-anchor"></a></h4>
				<div class="doc-example"><div style="height:150px;border:1px dashed #DDD;" class="am-vertical-align"><div class="am-vertical-align-middle">飘在半空中的 XX</div></div></div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">style</span>=<span class="hljs-value">"height:150px;"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-vertical-align"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-vertical-align-middle"</span>&gt;</span>飘在半空中的 XX<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
				<h4 id="di-bu-dui-qi">底部对齐 <a href="#di-bu-dui-qi" class="doc-anchor"></a></h4>
				<div class="doc-example"><div style="height:150px;border:1px dashed #DDD;" class="am-vertical-align"><div class="am-vertical-align-bottom">DOWN 到了谷底...降到零下几度 C</div></div></div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">style</span>=<span class="hljs-value">"height:150px;" <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-vertical-align"</span></span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-vertical-align-bottom"</span>&gt;</span>DOWN 到了谷底...降到零下几度 C<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
				<h4 id="can-kao-lian-jie">参考链接 <a href="#can-kao-lian-jie" class="doc-anchor"></a></h4>
				<ul>
					<li><a href="http://coding.smashingmagazine.com/2013/08/09/absolute-horizontal-vertical-centering-css/">CSS 实现水平、垂直居中</a></li>
					<li><a href="http://css-tricks.com/centering-in-the-unknown/">Centering in the Unknown</a></li>
					<li><a href="http://thx.alibaba-inc.com/cube/doc/layout/">Cube Layout.css</a></li>
				</ul>
				<h3 id="yuan-su-xian-shi">元素显示 <a href="#yuan-su-xian-shi" class="doc-anchor"></a></h3>
				<h4 id="xian-shi-shu-xing">显示属性 <a href="#xian-shi-shu-xing" class="doc-anchor"></a></h4>
				<ul>
					<li><code>.am-block</code> - <code>display</code> 设置为 <code>block</code></li>
					<li><code>.am-inline</code> - <code>display</code> 设置为 <code>inline</code></li>
					<li><code>.am-inline-block</code> - <code>display</code> 设置为 <code>inline-block</code></li>
				</ul>
				<h4 id="yin-cang-yuan-su">隐藏元素 <a href="#yin-cang-yuan-su" class="doc-anchor"></a></h4>
				<p>添加 <code>.am-hide</code> class。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.am-hide</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">display</span>:<span class="hljs-value">none <span class="hljs-important">!important</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">visibility</span>:<span class="hljs-value">hidden <span class="hljs-important">!important</span></span></span>;
}</span>
						</code>
					</pre>
				</div>
				<div class="doc-example"><button class="am-btn am-btn-danger am-hide">I'm hidden.....</button></div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-comment">&lt;!--隐藏了，Demo 里看不到按钮--&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-danger am-hide"</span>&gt;</span>I'm hidden.....<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
				<h3 id="nei-wai-bian-ju">内外边距 <a href="#nei-wai-bian-ju" class="doc-anchor"></a></h3>
				<h4 id="chi-cun">尺寸 <a href="#chi-cun" class="doc-anchor"></a></h4>
				<ul>
					<li><code>xs</code> - 5px</li>
					<li><code>sm</code> - 10px</li>
					<li>default - 16px</li>
					<li><code>lg</code> - 24px</li>
					<li><code>xl</code> - 32px</li>
				</ul>
				<h4 id="class-lie-biao">class 列表 <a href="#class-lie-biao" class="doc-anchor"></a></h4>
				<p>不加尺寸为默认大小（16px），<code>{size}</code> 可以为 <code>0, xs, sm, lg, xl</code> 中之一。</p>
				<ul><li><strong>v2.4:</strong> 增加 <code>0</code> 值的内外边距辅助类。</li></ul>
				<table class="am-table am-table-bd am-table-striped">
					<thead>
						<tr>
							<th>Margin</th>
							<th>Padding</th>
						</tr>
					</thead>
					<tr>
						<td><code>.am-margin</code><br><code>.am-margin-{size}</code></td>
						<td><code>.am-padding</code><br><code>.am-padding-{size}</code></td>
					</tr>
					<tr>
						<td>水平方向外边距<br><code>.am-margin-horizontal</code><br><code>.am-margin-horizontal-{size}</code></td>
						<td>水平方向内边距<br><code>.am-padding-horizontal</code><br><code>.am-padding-horizontal-{size}</code></td>
					</tr>
					<tr>
						<td>垂直方向外边距<br><code>.am-margin-vertical</code><br><code>.am-margin-vertical-{size}</code></td>
						<td>垂直方向内边距<br><code>.am-padding-vertical</code><br><code>.am-padding-vertical-{size}</code></td>
					</tr>
					<tr>
						<td>左外边距<br><code>.am-margin-left</code><br><code>.am-margin-left-{size}</code></td>
						<td>左内边距<br><code>.am-padding-left</code><br><code>.am-padding-left-{size}</code></td>
					</tr>
					<tr>
						<td>右外边距<br><code>.am-margin-right</code><br><code>.am-margin-right-{size}</code></td>
						<td>右内边距<br><code>.am-padding-right</code><br><code>.am-padding-right-{size}</code></td>
					</tr>
					<tr>
						<td>上外边距<br><code>.am-margin-top</code><br><code>.am-margin-top-{size}</code></td>
						<td>上内边距<br><code>.am-padding-top</code><br><code>.am-padding-top-{size}</code></td>
					</tr>
					<tr>
						<td>下外边距<br><code>.am-margin-bottom</code><br><code>.am-margin-bottom-{size}</code></td>
						<td>下内边距<br><code>.am-padding-bottom</code><br><code>.am-padding-bottom-{size}</code></td>
					</tr>
				</table>
				<h2 id="wen-ben-gong-ju">文本工具 <a href="#wen-ben-gong-ju" class="doc-anchor"></a></h2>
				<h3 id="zi-ti">字体 <a href="#zi-ti" class="doc-anchor"></a></h3>
				<ul>
					<li><code>.am-sans-serif</code> 非衬线，Amaze UI 主要使用的。</li>
					<li><code>.am-serif</code> 衬线字体，中文为宋体，Amaze UI 中未使用。</li>
					<li><code>.am-kai</code> 应为衬线字体，中文为楷体，Amaze UI <code>&lt;blockquote&gt;</code> 使用此。</li>
					<li><code>.am-monospace</code> 等宽字体，Amaze UI 源代码中使用。</li>
				</ul>
				<p>下面为几种字体系列演示：</p>
				<div class="doc-example">
					<p>The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
					<p class="am-serif">The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
					<p class="am-kai">The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
					<p class="am-monospace">The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h3 id="wen-ben-yan-se">文本颜色 <a href="#wen-ben-yan-se" class="doc-anchor"></a></h3>
				<div class="doc-example">
					<p>千万不要因为走得太久，而忘记了我们为什么出发。</p>
					<p class="am-text-primary">千万不要因为走得太久，而忘记了我们为什么出发。</p>
					<p class="am-text-secondary">千万不要因为走得太久，而忘记了我们为什么出发。</p>
					<p class="am-text-success">千万不要因为走得太久，而忘记了我们为什么出发。</p>
					<p class="am-text-warning">千万不要因为走得太久，而忘记了我们为什么出发。</p>
					<p class="am-text-danger">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h3 id="lian-jie-yan-se-jian-dan">链接颜色减淡 <a href="#lian-jie-yan-se-jian-dan" class="doc-anchor"></a></h3>
				<p>超链接颜色默认为主色（蓝色），添加 <code>.am-link-muted</code> class 将链接颜色设置为灰色。</p>
				<div class="doc-example">
					<a href="#" class="am-link-muted">超级链接</a>
					<h3 class="am-link-muted"><a href="#">超级链接</a></h3>
					<ul class="am-link-muted">
						<li><a href="#">超级链接</a></li>
						<li><a href="#">超级链接</a></li>
					</ul>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h3 id="wen-zi-da-xiao">文字大小 <a href="#wen-zi-da-xiao" class="doc-anchor"></a></h3>
				<ul>
					<li><code>.am-text-xs</code> - 12px</li>
					<li><code>.am-text-sm</code> - 14px</li>
					<li><code>.am-text-default</code> - 16px</li>
					<li><code>.am-text-lg</code> - 18px</li>
					<li><code>.am-text-xl</code> - 24px</li>
					<li><code>.am-text-xxl</code> - 32px</li>
					<li><code>.am-text-xxxl</code> - 42px</li>
				</ul>
				<div class="doc-example">
					<p class="am-text-xs am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
					<p class="am-text-sm am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
					<p class="am-text-default am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
					<p class="am-text-lg am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
					<p class="am-text-xl am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
					<p class="am-text-xxl am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
					<p class="am-text-xxxl am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<p>常用字号参考：</p>
				<table class="am-table am-table-bd am-table-striped">
					<thead>
						<tr>
							<th class="text-center">REMs</th>
							<th class="text-center">Pixels</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>6.8rem</td>
							<td>68px</td>
						</tr>
						<tr>
							<td>5rem</td>
							<td>50px</td>
						</tr>
						<tr>
							<td>3.8rem</td>
							<td>38px</td>
						</tr>
						<tr>
							<td>3.2rem</td>
							<td>32px</td>
						</tr>
						<tr>
							<td>2.8rem</td>
							<td>28px</td>
						</tr>
						<tr>
							<td>2.4rem</td>
							<td>24px</td>
						</tr>
						<tr>
							<td>2.2rem</td>
							<td>22px</td>
						</tr>
						<tr>
							<td>1.8rem</td>
							<td>18px</td>
						</tr>
						<tr>
							<td><strong>1.6rem (base)</strong></td>
							<td><strong>16px (base)</strong></td>
						</tr>
						<tr>
							<td>1.4rem</td>
							<td>14px</td>
						</tr>
						<tr>
							<td>1.2rem</td>
							<td>12px</td>
						</tr>
						<tr>
							<td>1rem</td>
							<td>10px</td>
						</tr>
						<tr>
							<td>0.8rem</td>
							<td>8px</td>
						</tr>
						<tr>
							<td>0.5rem</td>
							<td>5px</td>
						</tr>
					</tbody>
				</table>
				<h3 id="wen-ben-zuo-you-dui-qi">文本左右对齐 <a href="#wen-ben-zuo-you-dui-qi" class="doc-anchor"></a></h3>
				<p>文字对齐辅助 class，可设置为响应式。</p>
				<table class="am-table am-table-bd am-table-striped">
					<thead>
						<tr>
							<th>左对齐</th>
							<th>右对齐</th>
							<th>居中</th>
							<th>自适应</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>.am-text-left</code></td>
							<td><code>.am-text-right</code></td>
							<td><code>.am-text-center</code></td>
							<td><code>.am-text-justify</code></td>
						</tr>
						<tr>
							<td><code>.am-sm-text-left</code></td>
							<td><code>.am-sm-text-right</code></td>
							<td><code>.am-sm-text-center</code></td>
							<td><code>.am-sm-text-justify</code></td>
						</tr>
						<tr>
							<td><code>.am-sm-only-text-left</code></td>
							<td><code>.am-sm-only-text-right</code></td>
							<td><code>.am-sm-only-text-center</code></td>
							<td><code>.am-sm-only-text-justify</code></td>
						</tr>
						<tr>
							<td><code>.am-md-text-left</code></td>
							<td><code>.am-md-text-right</code></td>
							<td><code>.am-md-text-center</code></td>
							<td><code>.am-md-text-justify</code></td>
						</tr>
						<tr>
							<td><code>.am-md-only-text-left</code></td>
							<td><code>.am-md-only-text-right</code></td>
							<td><code>.am-md-only-text-center</code></td>
							<td><code>.am-md-only-text-justify</code></td>
						</tr>
						<tr>
							<td><code>.am-lg-text-left</code></td>
							<td><code>.am-lg-text-right</code></td>
							<td><code>.am-lg-text-center</code></td>
							<td><code>.am-lg-text-justify</code></td>
						</tr>
					</tbody>
				</table>
				<h3 id="wen-ben-chui-zhi-dui-qi">文本垂直对齐 <a href="#wen-ben-chui-zhi-dui-qi" class="doc-anchor"></a></h3>
				<ul>
					<li><code>.am-text-top</code> - 顶对齐</li>
					<li><code>.am-text-middle</code> - 居中对齐</li>
					<li><code>.am-text-bottom</code> - 底对齐</li>
				</ul>
				<div class="doc-example">
					<div class="am-g">
						<div class="am-u-md-4">
							<img src="doc/image/bing-6.jpg" width="48px" height="48px">
							<span class="am-text-top">顶部对齐</span>
						</div>
						<div class="am-u-md-4">
							<img src="doc/image/bing-6.jpg" width="48px" height="48px">
							<span class="am-text-middle">居中对齐</span>
						</div>
						<div class="am-u-md-4">
							<img src="doc/image/bing-6.jpg" width="48px" height="48px">
							<span class="am-text-bottom">底部对齐</span>
						</div>
					</div>
				</div>
				<h3 id="wen-zi-huan-xing-ji-jie-duan">文字换行及截断 <a href="#wen-zi-huan-xing-ji-jie-duan" class="doc-anchor"></a></h3>
				<table class="am-table am-table-bd am-table-striped">
					<thead>
						<tr>
							<th style="min-width:130px;">Class</th>
							<th>描述</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>.am-text-truncate</code></td>
							<td>禁止换行，超出容器部分截断（以 <code>...</code> 结束）</td>
						</tr>
						<tr>
							<td><code>.am-text-break</code></td>
							<td>超出文字容器宽度时强制换行，主要用于英文排版</td>
						</tr>
						<tr>
							<td><code>.am-text-nowrap</code></td>
							<td>禁止换行，不截断超出容器宽度部分</td>
						</tr>
					</tbody>
				</table>
				<h4 id="dan-xing-wen-zi-jie-duan">单行文字截断 <a href="#dan-xing-wen-zi-jie-duan" class="doc-anchor"></a></h4>
				<p><code>.am-text-truncate</code>，元素 <code>display</code> 属性需为 <code>block</code> 或 <code>inline-block</code>。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.am-text-truncate</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">word-wrap</span>:<span class="hljs-value">normal</span></span>; <span class="hljs-comment">/*for IE*/</span>
   <span class="hljs-rule"><span class="hljs-attribute">text-overflow</span>:<span class="hljs-value">ellipsis</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">white-space</span>:<span class="hljs-value">nowrap</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">overflow</span>:<span class="hljs-value">hidden</span></span>;
}</span>
						</code>
					</pre>
				</div>
				<div class="doc-example"><div style="padding:10px;width:250px;border:1px dashed #DDD;" class="am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发</div></div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-comment">&lt;!--超出200px的文字将会被截断--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">style</span>=<span class="hljs-value">"padding:10px;width:250px;"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-text-truncate"</span>&gt;</span>千万不要因为走得太久，而忘记了我们为什么出发<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
						</code>
					</pre>
				</div>
				<p>参考链接：</p>
				<ul>
					<li><a href="https://developer.mozilla.org/en-US/docs/Web/CSS/white-space">https://developer.mozilla.org/en-US/docs/Web/CSS/white-space</a></li>
					<li><a href="https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow">https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow</a></li>
					<li><a href="http://www.99css.com/archives/811">IE8 &amp; 9 white-space nowrap 失效</a></li>
				</ul>
				<h4 id="duo-xing-wen-zi-jie-duan">多行文字截断 <a href="#duo-xing-wen-zi-jie-duan" class="doc-anchor"></a></h4>
				<p>在只针对 PC 端开发的年代，可以通过后端控制输出文字的长度来实现固定行数的效果。</p>
				<p>但在响应式页面，这可能不再适用，只能输出足够多的文字，然后通过前端截取需要的行数。</p>
				<p>Webkit 内核的浏览器可以通过 <code>-webkit-line-clamp</code> 私有属性实现多行文字截取。其他浏览器没有这个属性，我的做法通常是把容器的高度限定为 <code>行高 * 显示的行数</code>，超出的部分隐藏，勉强达到目的。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.line-clamp{
   overflow:hidden;
   text-overflow:ellipsis;
   display:-webkit-box;
   -webkit-line-clamp:2;//这里修改为要显示的行数
   -webkit-box-orient:vertical;
}
						</code>
					</pre>
				</div>
				<p>如果需要考虑其他内核的浏览器，可以使用 Amaze UI 封装的 Mixin:</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-tag">line-clamp</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">lines,</span>@line-height:<span class="hljs-number">1.3em</span>)</span>{
   <span class="hljs-tag">text-overflow</span>:<span class="hljs-tag">ellipsis</span>;
   <span class="hljs-tag">display</span>:<span class="hljs-tag">-webkit-box</span>;
   <span class="hljs-tag">-webkit-box-orient</span>:<span class="hljs-tag">vertical</span>;
   <span class="hljs-tag">-webkit-line-clamp</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">lines;</span>//number of lines to show
   overflow:hidden</span>;
   <span class="hljs-tag">line-height</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">line-height;</span>
   max-height:@line-height * @lines</span>;
}
						</code>
					</pre>
				</div>
				<p>当然，也有一些 JS 插件可以跨浏览器实现，但个人并不推荐在这种场合使用 JS。</p>
				<p><strong>参考链接</strong></p>
				<ul>
					<li><a href="http://dropshado.ws/post/1015351370/webkit-line-clamp">-webkit-line-clamp</a></li>
					<li><a href="http://css-tricks.com/line-clampin/">Line Clampin’ - Truncating Multiple Line Text</a></li>
					<li><a href="http://www.mobify.com/blog/multiline-ellipsis-in-pure-css/">CSS Ellipsis:How to Manage Multi-Line Ellipsis in Pure CSS</a></li>
					<li><a href="https://github.com/josephschmitt/Clamp.js">Clamp.js</a></li>
					<li><a href="https://github.com/jpntex/TextTailor.js">TextTailor.JS</a></li>
				</ul>
				<h3 id="tu-pian-ti-huan">图片替换 <a href="#tu-pian-ti-huan" class="doc-anchor"></a></h3>
				<p>CSS Image Replacement 是一个历史悠久的技术，也随着前端技术的发展不断进化。</p>
				<p>图片替换技术兼顾显示效果、可访性、SEO，推荐开发者在网站 Logo 、设计特殊的栏目标题等场合使用。</p>
				<p>使用 <code>.am-text-ir</code> class 结合背景图片实现图片替换。</p>
				<div class="doc-example"><header class="doc-ir-demo"><h1><a href="#" class="am-text-ir">Amaze UI</a></h1></header></div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">header</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-ir-demo"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">h1</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-text-ir"</span>&gt;</span>Amaze UI<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">h1</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">header</span>&gt;</span></code></pre></div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.doc-ir-demo</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">background</span>:<span class="hljs-value"><span class="hljs-hexcolor">#3BB4F2</span></span></span>;
}</span>
<span class="hljs-class">.doc-ir-demo</span> <span class="hljs-tag">h1</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">margin</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">padding</span>:<span class="hljs-value"><span class="hljs-number">10px</span></span></span>;
}</span>
<span class="hljs-class">.doc-ir-demo</span> <span class="hljs-tag">a</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">display</span>:<span class="hljs-value">block</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">height</span>:<span class="hljs-value"><span class="hljs-number">29px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">125px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">background</span>:<span class="hljs-value"><span class="hljs-function">url</span>(/i/landing/logo.png) no-repeat left center</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-background-size</span>:<span class="hljs-value"><span class="hljs-number">125px</span> <span class="hljs-number">24px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">background-size</span>:<span class="hljs-value"><span class="hljs-number">125px</span> <span class="hljs-number">24px</span></span></span>;
}</span>
						</code>
					</pre>
				</div>
				<ul>
					<li><a href="https://github.com/h5bp/html5-boilerplate/commit/aa0396eae757">Update CSS image replacement technique</a></li>
					<li><a href="http://css-tricks.com/search-results/?q=image++replace">CSS-Tricks|Search Results for &#39;image replace&#39;</a></li>
				</ul>
				<h3 id="tu-wen-hun-pai-fu-zhu">图文混排辅助 <a href="#tu-wen-hun-pai-fu-zhu" class="doc-anchor"></a></h3>
				<p>使用 <code>float</code> 实现的类似 HTML <code>align</code> 属性的效果，父容器要清除浮动。与 <code>.am-fl</code>、<code>.am-fr</code> 相比，浮动的元素加了 <code>margin</code>。</p>
				<ul>
					<li><code>.am-align-left</code></li>
					<li><code>.am-align-right</code></li>
				</ul>
				<div class="doc-example">
					<div class="am-cf">
						<p class="am-align-left"><img src="doc/image/bing-1.jpg" width="240px"></p>
						<p style="margin-top:0;">那时候刚好下着雨，柏油路面湿冷冷的，还闪烁着青、黄、红颜色的灯火。我们就在骑楼下躲雨，看绿色的邮筒孤独地站在街的对面。我白色风衣的大口袋里有一封要寄给南部的母亲的信。樱子说她可以撑伞过去帮我寄信。我默默点头。</p>
						<p>“谁叫我们只带来一把小伞哪。”她微笑着说，一面撑起伞，准备过马路帮我寄信。从她伞骨渗下来的小雨点，溅在我的眼镜玻璃上。</p>
						<p>随着一阵拔尖的煞车声，樱子的一生轻轻地飞了起来。缓缓地，飘落在湿冷的街面上，好像一只夜晚的蝴蝶。</p>
						<p>虽然是春天，好像已是秋深了。</p>
						<div class="am-align-right"><img src="doc/image/bing-2.jpg" width="240px"></div>
						<p>她只是过马路去帮我寄信。这简单的行动，却要叫我终身难忘了。我缓缓睁开眼，茫然站在骑楼下，眼里裹着滚烫的泪水。世上所有的车子都停了下来，人潮涌向马路中央。没有人知道那躺在街面的，就是我的，蝴蝶。这时她只离我五公尺，竟是那么遥远。更大的雨点溅在我的眼镜上，溅到我的生命里来。</p>
						<p>为什么呢？只带一把雨伞？</p>
						<p>然而我又看到樱子穿着白色的风衣，撑着伞，静静地过马路了。她是要帮我寄信的。那，那是一封写给南部母亲的信。我茫然站在骑楼下，我又看到永远的樱子走到街心。其实雨下得并不大，却是一生一世中最大的一场雨。而那封信是这样写的，年轻的樱子知不知道呢？</p>
						<p>妈：我打算在下个月和樱子结婚。</p>
					</div>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h2 id="xiang-ying-shi-fu-zhu">响应式辅助 <a href="#xiang-ying-shi-fu-zhu" class="doc-anchor"></a></h2>
				<h3 id="shi-kou-da-xiao">视口大小 <a href="#shi-kou-da-xiao" class="doc-anchor"></a></h3>
				<p><code>.am-[show|hide]-[sm|md|lg][-up|-down|-only]</code>，调整浏览器窗口大小查看元素的显隐。</p>
				<p>class 释义：</p>
				<ul>
					<li><code>show</code> 显示，<code>hide</code> 隐藏，这应该不难理解；</li>
					<li><code>sm</code>、<code>md</code>、<code>lg</code> 是划分屏幕大小区间的缩写，对应 small、medium、large，网格里面做了说明；</li>
					<li><code>down</code> 指小于区间，<code>up</code> 指大于区间， <code>only</code> 指仅在这个区间。</li>
				</ul>
				<p>按照上面的翻译一下下面的 class:</p>
				<ul>
					<li><code>.am-show-sm-only</code>:只在 <code>sm</code> 区间显示</li>
					<li><code>.am-show-sm-up</code>:大于 <code>sm</code> 区间时显示</li>
					<li><code>.am-show-sm</code>:在 <code>sm</code> 区间显示，如果没有设置 <code>md</code>、<code>lg</code> 区间的显隐，则元素在所有区间都显示</li>
					<li><code>.am-show-md-down</code>:小于 <code>md</code> 区间时显示</li>
				</ul>
				<table class="am-table am-table-bd am-table-striped">
					<thead>
						<tr>
							<th>显示辅助 class</th>
							<th>隐藏辅助 class</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>.am-show-sm-only</code><br><code>.am-show-sm-up</code><br><code>.am-show-sm</code><br><code>.am-show-sm-down</code></td>
							<td><code>.am-hide-sm-only</code><br><code>.am-hide-sm-up</code><br><code>.am-hide-sm</code><br><code>.am-hide-sm-down</code></td>
						</tr>
						<tr>
							<td><code>.am-show-md-only</code><br><code>.am-show-md-up</code><br><code>.am-show-md</code><br><code>.am-show-md-down</code></td>
							<td><code>.am-hide-md-only</code><br><code>.am-hide-md-up</code><br><code>.am-hide-md</code><br><code>.am-hide-md-down</code></td>
						</tr>
						<tr>
							<td><code>.am-show-lg-only</code><br><code>.am-show-lg-up</code><br><code>.am-show-lg</code><br><code>.am-show-lg-down</code></td>
							<td><code>.am-hide-lg-only</code><br><code>.am-hide-lg-up</code><br><code>.am-hide-lg</code><br><code>.am-hide-lg-down</code></td>
						</tr>
					</tbody>
				</table>
				<div class="doc-example">
					<ul>
						<li class="am-show-sm-only">仅 small 可见</li>
						<li class="am-show-md-up">medium + 可见</li>
						<li class="am-show-md-only">仅 medium 可见</li>
						<li class="am-show-lg-up">large 可见</li>
						<li class="am-show-lg-only">仅 large 可见</li>
					</ul>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">ul</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-sm-only"</span>&gt;</span>仅 small 可见<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-md-up"</span>&gt;</span>medium + 可见<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-md-only"</span>&gt;</span>仅 medium 可见<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-lg-up"</span>&gt;</span>large 可见<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-lg-only"</span>&gt;</span>仅 large 可见<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h3 id="ping-mu-fang-xiang">屏幕方向 <a href="#ping-mu-fang-xiang" class="doc-anchor"></a></h3>
				<ul>
					<li>横屏：<code>.am-show-landscape</code>, <code>.am-hide-landscape</code></li>
					<li>竖屏：<code>.am-show-portrait</code>, <code>.am-hide-portrait</code></li>
				</ul>
				<div class="doc-example">
					<ul>
						<li class="am-show-landscape">横屏可见...</li>
						<li class="am-show-portrait">竖屏可见...</li>
					</ul>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">ul</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-landscape"</span>&gt;</span>横屏可见...<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-portrait"</span>&gt;</span>竖屏可见...<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
						</code>
					</pre>
				</div>
				<hr class="doc-divider">
				<h1 id="button">Button <a href="#button" class="doc-anchor"></a></h1>
				<hr>
				<h2 id="ji-ben-shi-yong-2">基本使用 <a href="#ji-ben-shi-yong-2" class="doc-anchor"></a></h2>
				<h3 id="mo-ren-yang-shi">默认样式 <a href="#mo-ren-yang-shi" class="doc-anchor"></a></h3>
				<p>在要应用按钮样式的元素上添加 <code>.am-btn</code>，再设置相应的颜色。</p>
				<ul>
					<li><code>.am-btn-default</code> - 默认，灰色按钮</li>
					<li><code>.am-btn-primary</code> - 蓝色按钮</li>
					<li><code>.am-btn-secondary</code> - 浅蓝色按钮</li>
					<li><code>.am-btn-success</code> - 绿色按钮</li>
					<li><code>.am-btn-warning</code> - 橙色按钮</li>
					<li><code>.am-btn-danger</code> - 红色按钮</li>
					<li><code>.am-btn-link</code></li>
				</ul>
				<div class="doc-example">
					<button type="button" class="am-btn am-btn-default">默认样式</button>
					<button type="button" class="am-btn am-btn-primary">主色按钮</button>
					<button type="button" class="am-btn am-btn-secondary">次色按钮</button>
					<button type="button" class="am-btn am-btn-success">绿色按钮</button>
					<button type="button" class="am-btn am-btn-warning">橙色按钮</button>
					<button type="button" class="am-btn am-btn-danger">红色按钮</button>
					<a class="am-btn am-btn-link">链接</a>
					<a href="#" class="am-btn am-btn-danger">应用按钮样式的链接</a>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default"</span>&gt;</span>默认样式<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary"</span>&gt;</span>主色按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-secondary"</span>&gt;</span>次色按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-success"</span>&gt;</span>绿色按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-warning"</span>&gt;</span>橙色按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-danger"</span>&gt;</span>红色按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-link"</span>&gt;</span>链接<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-danger"</span>&gt;</span>应用按钮样式的链接<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h3 id="yuan-jiao-an-niu">圆角按钮 <a href="#yuan-jiao-an-niu" class="doc-anchor"></a></h3>
				<p>在默认样式的基础上添加 <code>.am-radius</code> class.</p>
				<div class="doc-example">
					<button type="button" class="am-btn am-btn-default am-radius">默认样式</button>
					<button type="button" class="am-btn am-btn-primary am-radius">主色按钮</button>
					<button type="button" class="am-btn am-btn-secondary am-radius">次色按钮</button>
					<button type="button" class="am-btn am-btn-success am-radius">绿色按钮</button>
					<button type="button" class="am-btn am-btn-warning am-radius">橙色按钮</button>
					<button type="button" class="am-btn am-btn-danger am-radius">红色按钮</button>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-radius"</span>&gt;</span>默认样式<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
				<h3 id="tuo-yuan-xing-an-niu">椭圆形按钮 <a href="#tuo-yuan-xing-an-niu" class="doc-anchor"></a></h3>
				<p>在默认样式的基础上添加 <code>.am-round</code> class.</p>
				<div class="doc-example">
					<button type="button" class="am-btn am-btn-default am-round">默认样式</button>
					<button type="button" class="am-btn am-btn-primary am-round">主色按钮</button>
					<button type="button" class="am-btn am-btn-secondary am-round">次色按钮</button>
					<button type="button" class="am-btn am-btn-success am-round">绿色按钮</button>
					<button type="button" class="am-btn am-btn-warning am-round">橙色按钮</button>
					<button type="button" class="am-btn am-btn-danger am-round">红色按钮</button>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-round"</span>&gt;</span>默认样式<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
				<h2 id="an-niu-zhuang-tai">按钮状态 <a href="#an-niu-zhuang-tai" class="doc-anchor"></a></h2>
				<h3 id="ji-huo-zhuang-tai">激活状态 <a href="#ji-huo-zhuang-tai" class="doc-anchor"></a></h3>
				<p>在按钮上添加 <code>.am-active</code> class。</p>
				<div class="doc-example">
					<button type="button" class="am-btn am-btn-primary am-active">激活状态</button>
					<button type="button" class="am-btn am-btn-default am-active">激活状态</button>
					<br>
					<br>
					<a href="#" class="am-btn am-btn-primary am-active">链接按钮激活状态</a>
					<a href="#" class="am-btn am-btn-default am-active">链接按钮激活状态</a>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-active"</span>&gt;</span>激活状态<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-active"</span>&gt;</span>激活状态<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-active"</span> <span class="hljs-attribute">role</span>=<span class="hljs-value">"button"</span>&gt;</span>链接按钮激活状态<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-active"</span> <span class="hljs-attribute">role</span>=<span class="hljs-value">"button"</span>&gt;</span>链接按钮激活状态<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h3 id="jin-yong-zhuang-tai">禁用状态 <a href="#jin-yong-zhuang-tai" class="doc-anchor"></a></h3>
				<p>在按钮上设置 <code>disabled</code> 属性或者添加 <code>.am-disabled</code> class。</p>
				<div class="doc-example">
					<button type="button" class="am-btn am-btn-primary" disabled="disabled">禁用状态</button>
					<button type="button" class="am-btn am-btn-default" disabled="disabled">禁用状态</button>
					<br>
					<br>
					<a href="#" class="am-btn am-btn-primary am-disabled">链接按钮禁用状态</a>
					<a href="#" class="am-btn am-btn-default am-disabled">链接按钮禁用状态</a>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary"</span> <span class="hljs-attribute">disabled</span>=<span class="hljs-value">"disabled"</span>&gt;</span>禁用状态<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default"</span> <span class="hljs-attribute">disabled</span>=<span class="hljs-value">"disabled"</span>&gt;</span>禁用状态<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-disabled"</span>&gt;</span>链接按钮禁用状态<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-disabled"</span>&gt;</span>链接按钮禁用状态<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
						</code>
					</pre>
				</div>
				<div class="am-alert am-alert-warning">IE9 会把设置了 <code>disabled</code> 属性的 <code>button</code> 元素文字渲染成灰色并加上白色阴影，CSS 无法控制这个默认样式。</div>
				<h2 id="an-niu-chi-cun">按钮尺寸 <a href="#an-niu-chi-cun" class="doc-anchor"></a></h2>
				<ul>
					<li><code>.am-btn-xl</code></li>
					<li><code>.am-btn-lg</code></li>
					<li><code>.am-btn-default</code></li>
					<li><code>.am-btn-sm</code></li>
					<li><code>.am-btn-xs</code></li>
				</ul>
				<div class="doc-example">
					<button class="am-btn am-btn-xl am-btn-default">按钮 - xl</button>
					<button class="am-btn am-btn-lg am-btn-default">按钮 - lg</button>
					<button class="am-btn am-btn-default">按钮默认大小</button>
					<button class="am-btn am-btn-sm am-btn-default">按钮 - sm</button>
					<button class="am-btn am-btn-xs am-btn-default">按钮 - xs</button>
					<br>
					<br>
					<button class="am-btn am-btn-xl am-btn-primary">按钮 - xl</button>
					<button class="am-btn am-btn-lg am-btn-primary">按钮 - lg</button>
					<button class="am-btn am-btn-primary">按钮默认大小</button>
					<button class="am-btn am-btn-sm am-btn-primary">按钮 - sm</button>
					<button class="am-btn am-btn-xs am-btn-primary">按钮 - xs</button>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-btn-xl"</span>&gt;</span>按钮 - xl<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-btn-lg"</span>&gt;</span>按钮 - lg<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default"</span>&gt;</span>按钮默认大小<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-btn-sm"</span>&gt;</span>按钮 - sm<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-btn-xs"</span>&gt;</span>按钮 - xs<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-xl"</span>&gt;</span>按钮 - xl<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-lg"</span>&gt;</span>按钮 - lg<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary"</span>&gt;</span>按钮默认大小<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-sm"</span>&gt;</span>按钮 - sm<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-xs"</span>&gt;</span>按钮 - xs<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h2 id="kuai-ji-xian-shi">块级显示 <a href="#kuai-ji-xian-shi" class="doc-anchor"></a></h2>
				<p>添加 <code>.am-btn-block</code> class。</p>
				<div class="doc-example">
					<button type="button" class="am-btn am-btn-block am-btn-primary">块级显示的按钮</button>
					<button type="button" class="am-btn am-btn-block am-btn-default">块级显示的按钮</button>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-block"</span>&gt;</span>块级显示的按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-btn-block"</span>&gt;</span>块级显示的按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h2 id="an-niu-icon">按钮 Icon <a href="#an-niu-icon" class="doc-anchor"></a></h2>
				<p>使用 Icon 之前需先引入 <a href="doc/css/icon.jsp">Icon 组件</a>。</p>
				<div class="doc-example">
					<button class="am-btn am-btn-default"><i class="am-icon-cog"></i> 设置</button>
					<a href="#" class="am-btn am-btn-warning"><i class="am-icon-shopping-cart"></i> 结账</a>
					<button class="am-btn am-btn-default"><i class="am-icon-spinner am-icon-spin"></i> 加载中</button>
					<button class="am-btn am-btn-primary">下载片片 <i class="am-icon-cloud-download"></i></button>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-cog"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span> 设置<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-warning"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-shopping-cart"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span> 结账<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-spinner am-icon-spin"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span> 加载中<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary"</span>&gt;</span>下载片片 <span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-cloud-download"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
						</code>
					</pre>
				</div>
				<hr class="doc-divider">
				<h1 id="icon">Icon <a href="#icon" class="doc-anchor"></a></h1>
				<hr>
				<p>Amaze UI Icon 组件目前使用了 <a href="http://fontawesome.io/icons/">Font Awesome</a>（Amaze UI 2.2.0 中升级至 4.3.0），涵盖除部分国内社交网站图标以外的其他常见图标。</p>
				<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
				<h3 id="tian-jia-class">添加 Class <a href="#tian-jia-class" class="doc-anchor"></a></h3>
				<p>在 HTML 上添加添加 <code>am-icon-{图标名称}</code> class。</p>
				<div class="doc-example">
					<span class="am-icon-qq">QQ</span>
					<span class="am-icon-weixin">Wechat</span>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-qq"</span>&gt;</span> QQ<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-weixin"</span>&gt;</span> Wechat<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h3 id="shi-yong-mixin">使用 Mixin <a href="#shi-yong-mixin" class="doc-anchor"></a></h3>
				<p><strong>LESS 用户</strong>可以调用 mixin 编写样式：</p>
				<ol>
					<li>在要设置 Icon 的元素里调用 <code>.am-icon-font</code> mixin 设置字体；</li>
					<li><code>content</code> 设置为 Icon 名称对应的变量 <code>content:@fa-var-{图标名称}</code>。</li>
				</ol>
				<div class="doc-example"><span class="doc-icon-custom">新浪微博</span></div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-icon-custom"</span>&gt;</span> 新浪微博<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span></code></pre></div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
.doc-icon-custom{
   &amp;:before{
     .am-icon-font;
     content:@fa-var-weibo;
   }
}
						</code>
					</pre>
				</div>
				<h3 id="xiu-gai-zi-ti-lu-jing">修改字体路径 <a href="#xiu-gai-zi-ti-lu-jing" class="doc-anchor"></a></h3>
				<p><del>字体图标目前引了 <a href="http://staticfile.org/">Staticfile CDN</a> 上的文件（支持 HTTPS），可以自行替换：</del><strong>编译好的 CSS 中已经替换为本地文件。</strong></p>
				<ul>
					<li><strong>使用 LESS</strong>： 通过设置变量 <code>@fa-font-path</code> 覆盖默认的值，如 <code>@fa-font-path:'../fonts';</code>。这个变量定义在 <code>icon.less</code> 里。</li>
					<li><strong>直接使用 CSS</strong>： 查找替换 <code>//dn-staticfile.qbox.me/font-awesome/4.2.0/fonts/</code>。</li>
				</ul>
				<h2 id="tu-biao-da-xiao">图标大小 <a href="#tu-biao-da-xiao" class="doc-anchor"></a></h2>
				<ul>
					<li><code>.am-icon-sm</code>，放大 150%</li>
					<li><code>.am-icon-md</code>，放大 200%</li>
					<li><code>.am-icon-lg</code>，放大 250%</li>
				</ul>
				<div class="doc-example">
					<p><span class="am-icon-home"></span> 默认大小</p>
					<p><span class="am-icon-home am-icon-sm"></span> .am-icon-sm</p>
					<p><span class="am-icon-home am-icon-md"></span> .am-icon-md</p>
					<p><span class="am-icon-home am-icon-lg"></span> .am-icon-lg</p>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-home"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span> 默认大小<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-home am-icon-sm"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span> .am-icon-sm<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-home am-icon-md"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span> .am-icon-md<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-home am-icon-lg"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span> .am-icon-lg<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h2 id="icon-button">Icon button <a href="#icon-button" class="doc-anchor"></a></h2>
				<p>在 Icon 上添加 <code>.am-btn-icon</code> class。</p>
				<p>如果需要设置 Icon Button 的颜色，可以添加以下 class：</p>
				<ul>
					<li><code>.am-primary</code></li>
					<li><code>.am-secondary</code></li>
					<li><code>.am-success</code></li>
					<li><code>.am-warning</code></li>
					<li><code>.am-danger</code></li>
				</ul>
				<div class="doc-example">
					<a href="#" class="am-icon-btn am-icon-twitter"></a>
					<a href="#" class="am-icon-btn am-icon-facebook"></a>
					<a href="#" class="am-icon-btn am-icon-github"></a>
					<a href="#" class="am-icon-btn am-icon-qq am-primary"></a>
					<a href="#" class="am-icon-btn am-icon-drupal am-secondary"></a>
					<a href="#" class="am-icon-btn am-icon-shield am-success"></a>
					<a href="#" class="am-icon-btn am-icon-warning am-warning"></a>
					<a href="#" class="am-icon-btn am-icon-youtube am-danger"></a>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-btn am-icon-twitter"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-btn am-icon-facebook"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-btn am-icon-github"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-btn am-primary am-icon-qq"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-btn am-secondary am-icon-drupal"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-btn am-success am-icon-shield"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-btn am-warning am-icon-warning"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-btn am-danger am-icon-youtube"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h2 id="xuan-zhuan-dong-hua">旋转动画 <a href="#xuan-zhuan-dong-hua" class="doc-anchor"></a></h2>
				<p>注意：Chrome 和 Firefox 下， <code>display:inline-block;</code> 或 <code>display:block;</code> 的元素才会应用旋转动画。</p>
				<div class="doc-example">
					<i class="am-icon-spin am-icon-spinner"></i>
					<i class="am-icon-spin am-icon-refresh"></i>
					<i class="am-icon-spin am-icon-circle-o-notch"></i>
					<i class="am-icon-spin am-icon-cog"></i>
					<i class="am-icon-spin am-icon-gear"></i>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-spinner am-icon-spin"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-refresh am-icon-spin"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-circle-o-notch am-icon-spin"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-cog am-icon-spin"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-gear am-icon-spin"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span>
						</code>
					</pre>
				</div>
				<p><strong>v2.3</strong> 新增动画：</p>
				<div class="doc-example"><i class="am-icon-spinner am-icon-pulse"></i></div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-spinner am-icon-pulse"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span></code></pre></div>
				<h2 id="gu-ding-kuan-du">固定宽度 <a href="#gu-ding-kuan-du" class="doc-anchor"></a></h2>
				<p>FontAwesome 在绘制图标的时候不同图标宽度有差异， 添加 <code>.am-icon-fw</code> 将图标设置为固定的宽度，解决宽度不一致问题（<strong>v2.3 新增</strong>）。</p>
				<div class="doc-example">
					<ul>
						<li><i class="am-icon-fw am-icon-qq"></i> QQ</li>
						<li><i class="am-icon-fw am-icon-skype"></i> Skype</li>
						<li><i class="am-icon-fw am-icon-github"></i> GitHub</li>
						<li><i class="am-icon-fw am-icon-cc-amex"></i> Amex</li>
					</ul>
				</div>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">ul</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-qq am-icon-fw"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span> QQ<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-skype am-icon-fw"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span> Skype<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-github am-icon-fw"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span> GitHub<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-cc-amex am-icon-fw"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span> Amex<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h2 id="fu-zhi-tu-biao">复制图标 <a href="#fu-zhi-tu-biao" class="doc-anchor"></a></h2>
				<p>鼠标移到图标上会显示两个小按钮：</p>
				<ul>
					<li><code>class</code>:复制 class 名称，用于可修改 DOM 结构的场景，如点击 <code>copy</code> 图标旁的 <code>class</code> 按钮复制结果为 <code>am-icon-copy</code>；</li>
					<li><code>style</code>:复制 Icon 样式，用于无法修改 DOM 结构通过样式添加 Icon 的场景，如点击 <code>copy</code> 图标旁的 <code>style</code> 按钮复制结果为</li>
				</ul>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
{
   .am-icon-font;
   content:@fa-var-copy;
}
						</code>
					</pre>
				</div>
				<h2 id="cun-zai-wen-ti">存在问题 <a href="#cun-zai-wen-ti" class="doc-anchor"></a></h2>
				<h3 id="guan-yu-bu-fen-qi-pa-yong-hu-dai-li-bu-xian-shi-zi-ti-tu-biao">关于部分奇葩用户代理不显示字体图标 <a href="#guan-yu-bu-fen-qi-pa-yong-hu-dai-li-bu-xian-shi-zi-ti-tu-biao" class="doc-anchor"></a></h3>
				<p>以酷派为代表的部分安卓手机自带浏览器、微信/QQ WebView 等用户代理无法正常显示 Icon Font，原因可能是这些用户代理无法正确处理伪元素 <code>content</code> 的五位数的 Icon Font 十六进制编码，详情参考 <a href="http://www.cnblogs.com/ljack/p/3751678.html">Iconfont 在移动端遇到问题的探讨</a>，可以通过<a href="http://www.w3cmark.com/demo/iconfont.html">这个页面</a>进行测试。</p>
				<p>解决方式有两种：</p>
				<ul>
					<li><del><strong>将 Icon Font 编码限制在 4 位</strong>：Amaze UI 直接使用 Font Awesome，不可能去调整近 500 个图标的编码。</del></li>
					<li><strong>将 Icon Font 的编码直接以内容的形式写进 HTML</strong>。</li>
				</ul>
				<div class="doc-example"><span>&#xf09b; What a fuck.</span></div>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">span</span>&gt;</span>&amp;#xf09b; What a fuck.<span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span></code></pre></div>
				<p>Amaze UI 的定位是面向现代浏览器，虽然对 IE 8/9 这些浏览器提供了有限支持，但这都是在不改变基础架构、不耗费过多精力的前提下。安卓碎片化严重，更恶心的是一些厂商还随意修改浏览器内核，Amaze UI 不可能做到全部兼容，也不可能为极个别的用户代理调整架构、耗费过多精力。</p>
				<p>云适配内部有数千个网站在使用 Amaze UI，截止目前还没有接到过图标不显示的反馈。<strong>显然，遇到这些问题的用户需要权衡处理这个问题的成本与收益。</strong></p>
				<p><strong>v2.3 update</strong>:</p>
				<p>有用户在评论中说以下写法可以解决图标不显示的问题，<code>v2.3</code> 中已经调整为以下写法，遇到过问题的用户可以测试一下。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-comment">/*安卓手机端Icon不能正确显示的处理办法：*/</span>
<span class="hljs-attr_selector">[class*='am-icon-']</span><span class="hljs-pseudo">:before</span> <span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">display</span>:<span class="hljs-value"> inline-block</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">font</span>:<span class="hljs-value"> normal normal normal <span class="hljs-number">14px</span>/<span class="hljs-number">1</span> FontAwesome</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">font-size</span>:<span class="hljs-value"> inherit</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">text-rendering</span>:<span class="hljs-value"> auto</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-font-smoothing</span>:<span class="hljs-value"> antialiased</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-moz-osx-font-smoothing</span>:<span class="hljs-value"> grayscale</span></span>;
}</span>
						</code>
					</pre>
				</div>
				<h2 id="suo-you-tu-biao-lie-biao">所有图标列表 <a href="#suo-you-tu-biao-lie-biao" class="doc-anchor"></a></h2>
				<div class="doc-example">
					<section id="new-4-5"><h2 class="doc-icon-hd">Font Awesome 4.5 新增字体（Amaze UI 2.5 中搭载）</h2></section>
					<section id="new-4-4"><h2 class="doc-icon-hd">Font Awesome 4.4 新增字体（Amaze UI 2.5 中搭载）</h2></section>
					<section id="new-4-3"><h2 class="doc-icon-hd">Font Awesome 4.3 新增字体（Amaze UI 2.2 中搭载）</h2></section>
					<section id="new"><h2 class="doc-icon-hd">40 New Icons in 4.2</h2></section>
					<section id="web-application"><h2 class="doc-icon-hd">Web Application Icons</h2></section>
					<section id="file-type"><h2 class="doc-icon-hd">File Type Icons</h2></section>
					<section id="spinner">
						<h2 class="doc-icon-hd">Spinner Icons</h2>
						<div class="am-alert am-alert-success"><i class="am-icon-info-circle lg li"></i> These icons work great with the <code>am-icon-spin</code> class. Check out the <a href="http://fontawesome.io/examples/#spinning" class="alert-link">spinning icons example</a>.</div>
					</section>
					<section id="form-control"><h2 class="doc-icon-hd">Form Control Icons</h2></section>
					<section id="payment"><h2 class="doc-icon-hd">Payment Icons</h2></section>
					<section id="chart"><h2 class="doc-icon-hd">Chart Icons</h2></section>
					<section id="currency"><h2 class="doc-icon-hd">Currency Icons</h2></section>
					<section id="text-editor"><h2 class="doc-icon-hd">Text Editor Icons</h2></section>
					<section id="directional"><h2 class="doc-icon-hd">Directional Icons</h2></section>
					<section id="video-player"><h2 class="doc-icon-hd">Video Player Icons</h2></section>
					<section id="brand">
						<h2 class="doc-icon-hd">Brand Icons</h2>
						<div class="am-alert am-alert-success"><ul class="margin-bottom-none padding-left-lg"><li>All brand icons are trademarks of their respective owners.</li><li>The use of these trademarks does not indicate endorsement of the trademark holder by Font Awesome, nor vice versa.</li></ul></div>
						<div class="am-alert am-alert-warning"><h4><i class="am-icon-warning"></i> Warning!</h4>Apparently, Adblock Plus can remove Font Awesome brand icons with their "Remove Social Media Buttons" setting. We will not use hacks to force them to display. Please <a href="https://adblockplus.org/en/bugs" class="alert-link">report an issue with Adblock Plus</a> if you believe this to be an error. To work around this, you'll need to modify the social icon class names.</div>
					</section>
					<section id="medical"><h2 class="doc-icon-hd">Medical Icons</h2></section>
				</div>
				<hr class="doc-divider">
				<h1 id="accordion-zhe-die-mian-ban">Accordion 折叠面板 <a href="#accordion-zhe-die-mian-ban" class="doc-anchor"></a></h1>
				<hr>
				<p>手风琴折叠面板组件。</p>
				<h2 id="shi-yong-fang-fa-1">使用方法 <a href="#shi-yong-fang-fa-1" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
				<p>首先，引入 Handlebars 库及 <code>amui.widget.helper.js</code>（可参考 <a href="#">Amaze UI HTML 模板</a> 里的 <code>widget.html</code> 文件）。</p>
				<p>接下来有两种方式来渲染数据。</p>
				<p><strong>第一种，将组件调用代码写在模板里面：</strong></p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">script</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text/x-handlebars-template"</span> <span class="hljs-attribute">id</span>=<span class="hljs-value">"my-tpl"</span>&gt;</span><span class="handlebars"><span class="xml">
   </span><span class="hljs-expression">{{&gt;<span class="hljs-variable">accordion</span> <span class="hljs-variable">accordionData</span>}}</span><span class="xml">
</span></span><span class="hljs-tag">&lt;/<span class="hljs-title">script</span>&gt;</span>
						</code>
					</pre>
				</div>
				<p>然后获取模板内容，传入数据渲染并插入到页面中。</p>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<p>渲染出来的 HTML 如下：</p>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<p>如果使用的组件较多或者还有组件以外的自定义模板，建议使用上面的方法，将模板分离出来，便于维护。</p>
				<p><strong>第二种，直接将组件调用代码传给 Handlebars：</strong></p>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="zhu-yi-shi-xiang">注意事项 <a href="#zhu-yi-shi-xiang" class="doc-anchor"></a></h2>
				<ul><li><strong>不要在 <code>.am-accordion-bd</code> 上添加上下 <code>padding</code>/<code>margin</code>/<code>border</code> 样式</strong>。</li></ul>
				<hr class="doc-divider">
				<h1 id="duoshuo">Duoshuo <a href="#duoshuo" class="doc-anchor"></a></h1>
				<hr>
				<p>多说评论系统。</p>
				<div class="am-alert am-alert-danger">请大家使用的时候把 <code>data-ds-short-name="amazeui"</code> 中的 <code>amazeui</code> 换成自己在<a href="http://official.duoshuo.com/login/">多说注册</a> 的网站 ID，不然你们的评论都跑到 Amaze UI 这边来了。</div>
				<div class="am-alert am-alert-warning">本组件由<a href="http://dev.duoshuo.com/">多说</a>提供服务，更多细节参加<a href="http://dev.duoshuo.com/docs">官方文档</a>。</div>
				<h2 id="shi-yong-fang-fa-2">使用方法 <a href="#shi-yong-fang-fa-2" class="doc-anchor"></a></h2>
				<p>设置多说域名即可，其他参数可选。</p>
				<h2 id="api">API <a href="#api" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="javascript">
{
   <span class="hljs-string">"id"</span>:<span class="hljs-string">""</span>,
   <span class="hljs-string">"className"</span>:<span class="hljs-string">""</span>,
   <span class="hljs-string">"theme"</span>:<span class="hljs-string">""</span>,
   <span class="hljs-string">"options"</span>:{<span class="hljs-string">"shortName"</span>:<span class="hljs-string">""</span>},
   <span class="hljs-string">"content"</span>:{
      <span class="hljs-string">"threadKey"</span>:<span class="hljs-string">""</span>,
      <span class="hljs-string">"title"</span>:<span class="hljs-string">""</span>,
      <span class="hljs-string">"url"</span>:<span class="hljs-string">""</span>
   }
}
						</code>
					</pre>
				</div>
				<hr class="doc-divider">
				<h1 id="figure-dan-zhang-tu-pian">Figure 单张图片 <a href="#figure-dan-zhang-tu-pian" class="doc-anchor"></a></h1>
				<hr>
				<p>Figure 组件，用于放置单张图片。多图请使用 <a href="doc/widget/gallery.jsp">Gallery</a>。</p>
				<h2 id="shi-yong-fang-fa-3">使用方法 <a href="#shi-yong-fang-fa-3" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-1">直接使用 <a href="#zhi-jie-shi-yong-1" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-1">使用 Handlebars <a href="#shi-yong-handlebars-1" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>figure</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-1">云适配 WebIDE <a href="#yun-gua-pei-webide-1" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">ODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-1">数据接口 <a href="#shu-ju-jie-kou-1" class="doc-anchor"></a></h2>
				<p>如果觉得图片体积太大耗费流量，可以 <code>img</code> 里传缩略图， <code>rel</code> 里传大图地址。</p>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="footer-ye-jiao">Footer 页脚 <a href="#footer-ye-jiao" class="doc-anchor"></a></h1>
				<hr>
				<p>用于页面底部显示版本切换、版权等信息。</p>
				<h2 id="shi-yong-fang-fa-4">使用方法 <a href="#shi-yong-fang-fa-4" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-2">直接使用 <a href="#zhi-jie-shi-yong-2" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-2">使用 Handlebars <a href="#shi-yong-handlebars-2" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>footer</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-2">云适配 WebIDE <a href="#yun-gua-pei-webide-2" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<p><strong>数据说明：</strong></p>
				<ul>
					<li><code>switchName</code>：可写：手机版等，默认 <code>云适配版</code>；</li>
					<li><code>owner</code>：网站名字；</li>
					<li><code>slogan</code>：弹出层广告语；</li>
					<li><code>companyInfo</code>：填写公司相关信息，此为一对象数组，每一条信息通过对detail赋值来实现！</li>
				</ul>
				<h3 id="add-to-homescreen">Add to Homescreen <a href="#add-to-homescreen" class="doc-anchor"></a></h3>
				<ul><li>目前仅支持 iOS，需要在 header 里设置 icon。</li></ul>
				<p>参考链接：</p>
				<ul>
					<li><a href="https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html">Safari Web Content Guide:Configuring Web Applications</a></li>
					<li><a href="https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/IconMatrix.html#//apple_ref/doc/uid/TP40006556-CH27-SW1">iOS Human Interface Guidelines:Icon and Image Sizes</a></li>
					<li><a href="https://developers.google.com/chrome/mobile/docs/installtohomescreen">Add to Homescreen - Google Chrome Mobile -- Google Developers</a></li>
					<li><a href="http://mathiasbynens.be/notes/touch-icons">Everything you always wanted to know about touch icons</a></li>
				</ul>
				<p>添加到桌面图标功能默认开启，可以通过设置以下代码禁用：</p>
				<div class="doc-code demo-highlight"><pre><code class="javascript"><span class="hljs-built_in">window</span>.AMUI_NO_ADD2HS=<span class="hljs-literal">true</span>;</code></pre></div>
				<h2 id="shu-ju-jie-kou-2">数据接口 <a href="#shu-ju-jie-kou-2" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="gallery-tu-pian-hua-lang">Gallery 图片画廊 <a href="#gallery-tu-pian-hua-lang" class="doc-anchor"></a></h1>
				<hr>
				<p>图片画廊组件，用于展示图片为主体的内容。</p>
				<p><strong>演示图标版权归<a href="http://www.bing.com/">微软 Bing</a> 所有。</strong></p>
				<h2 id="shi-yong-fang-fa-5">使用方法 <a href="#shi-yong-fang-fa-5" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-3">直接使用 <a href="#zhi-jie-shi-yong-3" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-3">使用 Handlebars <a href="#shi-yong-handlebars-3" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>gallery</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-3">云适配 WebIDE <a href="#yun-gua-pei-webide-3" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="zhi-ding-suo-lue-tu">指定缩略图 <a href="#zhi-ding-suo-lue-tu" class="doc-anchor"></a></h2>
				<p>基于节省流量考虑，可以指定缩略图，用户点击放大的时候再显示大图。</p>
				<h3 id="shi-yong-codedata-relcode">使用 <code>data-rel</code> <a href="#shi-yong-codedata-relcode" class="doc-anchor"></a></h3>
				<p>将大图放在 <code>&lt;img&gt;</code> 的 <code>data-rel</code> 属性上。</p>
				<div class="doc-example">
					<ul class="am-avg-sm-2 am-gallery am-gallery-imgbordered" data-am-widget="gallery" data-am-gallery="{pureview:1}">
						<li>
							<div class="am-gallery-item">
								<img src="doc/image/bing-7.jpg" alt="远方有一个地方 那里种有我们的梦想" data-rel="doc/image/bing-8.jpg">
								<h3 class="am-gallery-title">远方有一个地方 那里种有我们的梦想</h3>
								<div class="am-gallery-desc">2375-09-26</div>
							</div>
						</li>
						<li>
							<div class="am-gallery-item">
								<img src="doc/image/bing-10.jpg" alt="某天也许会相遇 相遇在这个好地方" data-rel="doc/image/bing-9.jpg">
								<h3 class="am-gallery-title">某天也许会相遇 相遇在这个好地方</h3>
								<div class="am-gallery-desc">2375-09-26</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h3 id="shi-yong-lian-jie">使用链接 <a href="#shi-yong-lian-jie" class="doc-anchor"></a></h3>
				<p>设置 <code>target</code>:<code>data-am-gallery='{pureview:{target:&#39;a&#39;}}'</code>。</p>
				<p>从可访性的角度而言，这种方式更好一些：用户再禁用 JavaScript 以后仍然可以打开链接查看大图。</p>
				<div class="doc-example">
					<ul class="am-avg-sm-2 am-gallery am-gallery-imgbordered" data-am-widget="gallery" data-am-gallery="{pureview:{target:'a'}}">
						<li>
							<div class="am-gallery-item">
								<a href="doc/image/bing-8.jpg" title="远方有一个地方 那里种有我们的梦想">
									<ins>
										<img src="doc/image/bing-7.jpg">
										<h3 class="am-gallery-title">远方有一个地方 那里种有我们的梦想</h3>
										<div class="am-gallery-desc">2375-09-26</div>
									</ins>
								</a>
							</div>
						</li>
						<li>
							<div class="am-gallery-item">
								<a href="doc/image/bing-9.jpg" title="某天也许会相遇 相遇在这个好地方">
									<ins>
										<img src="doc/image/bing-10.jpg">
										<h3 class="am-gallery-title">某天也许会相遇 相遇在这个好地方</h3>
										<div class="am-gallery-desc">2375-09-26</div>
									</ins>
								</a>
							</div>
						</li>
					</ul>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h2 id="bu-shi-yong-wei-xin-tu-pian-cha-kan-qi">不使用微信图片查看器 <a href="#bu-shi-yong-wei-xin-tu-pian-cha-kan-qi" class="doc-anchor"></a></h2>
				<p>如果在微信中打开时不想调用微信的图片查看器，可以通过以下选项关闭：</p>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">ul</span> <span class="hljs-attribute">data-am-widget</span>=<span class="hljs-value">"gallery"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-gallery am-avg-sm-2 am-gallery-imgbordered"</span> <span class="hljs-attribute">data-am-gallery</span>=<span class="hljs-value">"{pureview:{weChatImagePreview:false}}"</span>&gt;</span></code></pre></div>
				<div class="doc-example">
					<ul class="am-avg-sm-2 am-gallery am-gallery-imgbordered" data-am-widget="gallery" data-am-gallery="{pureview:{weChatImagePreview:false}}">
						<li>
							<div class="am-gallery-item">
								<a href="doc/image/bing-8.jpg" title="远方有一个地方 那里种有我们的梦想">
									<ins>
										<img src="doc/image/bing-7.jpg">
										<h3 class="am-gallery-title">远方有一个地方 那里种有我们的梦想</h3>
										<div class="am-gallery-desc">2375-09-26</div>
									</ins>
								</a>
							</div>
						</li>
						<li>
							<div class="am-gallery-item">
								<a href="doc/image/bing-9.jpg" title="某天也许会相遇 相遇在这个好地方">
									<ins>
										<img src="doc/image/bing-10.jpg">
										<h3 class="am-gallery-title">某天也许会相遇 相遇在这个好地方</h3>
										<div class="am-gallery-desc">2375-09-26</div>
									</ins>
								</a>
							</div>
						</li>
					</ul>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-3">数据接口 <a href="#shu-ju-jie-kou-3" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="gotop-hui-dao-ding-bu">GoTop 回到顶部 <a href="#gotop-hui-dao-ding-bu" class="doc-anchor"></a></h1>
				<hr>
				<p>回到顶部组件。<code>fixed</code> 主题会根据滚动条位置设定图标的显隐（大于 50px 时才显示）。</p>
				<h2 id="shi-yong-fang-fa-6">使用方法 <a href="#shi-yong-fang-fa-6" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-4">直接使用 <a href="#zhi-jie-shi-yong-4" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-4">使用 Handlebars <a href="#shi-yong-handlebars-4" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>gotop</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-4">云适配 WebIDE <a href="#yun-gua-pei-webide-4" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-4">数据接口 <a href="#shu-ju-jie-kou-4" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="header">Header <a href="#header" class="doc-anchor"></a></h1>
				<hr>
				<p>页头组件，为移动页面顶部的导航条设计。</p>
				<h2 id="ding-bu-gu-ding">顶部固定 <a href="#ding-bu-gu-ding" class="doc-anchor"></a></h2>
				<p>在默认样式的基础上添加 <code>.am-header-fixed</code>。</p>
				<p><strong>默认样式：</strong></p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.am-header-fixed</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">position</span>:<span class="hljs-value">fixed</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">top</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">left</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">right</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">100%</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">z-index</span>:<span class="hljs-value"><span class="hljs-number">1010</span></span></span>;
}</span>
						</code>
					</pre>
				</div>
				<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
				<p>如果页面中有固定顶部的 Header，JS 会在 <code>&lt;body&gt;</code> 上添加 <code>.am-with-fixed-header</code>，这个 class 下面默认设置了 <code>padding-top:49px</code>，可以根据具体情况做调整。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="css">
<span class="hljs-class">.am-with-fixed-header</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">padding-top</span>:<span class="hljs-value">@am-header-height</span></span>;
}</span>
						</code>
					</pre>
				</div>
				<h2 id="shi-yong-fang-fa-7">使用方法 <a href="#shi-yong-fang-fa-7" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-5">直接使用 <a href="#zhi-jie-shi-yong-5" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-5">使用 Handlebars <a href="#shi-yong-handlebars-5" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>header</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-5">云适配 WebIDE <a href="#yun-gua-pei-webide-5" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-5">数据接口 <a href="#shu-ju-jie-kou-5" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="intro-jian-jie-zu-jian">Intro 简介组件 <a href="#intro-jian-jie-zu-jian" class="doc-anchor"></a></h1>
				<hr>
				<p>简介组件，常用于放置包含图片和文字的企业介绍信息等。</p>
				<h2 id="shi-yong-fang-fa-8">使用方法 <a href="#shi-yong-fang-fa-8" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-6">直接使用 <a href="#zhi-jie-shi-yong-6" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-6">使用 Handlebars <a href="#shi-yong-handlebars-6" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>intro</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-6">云适配 WebIDE <a href="#yun-gua-pei-webide-6" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-6">数据接口 <a href="#shu-ju-jie-kou-6" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="list-nei-rong-lie-biao">List 内容列表 <a href="#list-nei-rong-lie-biao" class="doc-anchor"></a></h1>
				<hr>
				<p>内容列表组件。</p>
				<h2 id="shi-yong-fang-fa-9">使用方法 <a href="#shi-yong-fang-fa-9" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-7">直接使用 <a href="#zhi-jie-shi-yong-7" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-7">使用 Handlebars <a href="#shi-yong-handlebars-7" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>list_news</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-7">云适配 WebIDE <a href="#yun-gua-pei-webide-7" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-7">数据接口 <a href="#shu-ju-jie-kou-7" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="map-di-tu">Map 地图 <a href="#map-di-tu" class="doc-anchor"></a></h1>
				<hr>
				<p><strong>本组件调用百度地图极速版 API，适用于触控设备，使用鼠标无法进行拖放等操作。</strong></p>
				<p>如果通过地址定位不准确，可以选择使用经纬度定位，设置经纬度定位以后，地址定位会被忽略。</p>
				<p><strong>经纬度获取：</strong>打开<a href="http://api.map.baidu.com/lbsapi/getpoint/index.html">百度地图坐标拾取系统</a>，在地图中找准要标识的位置，点击右上角【复制】按钮即可获取经纬度（逗号前面的为经度，后面的为纬度）。</p>
				<h2 id="shi-yong-fang-fa-10">使用方法 <a href="#shi-yong-fang-fa-10" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-8">直接使用 <a href="#zhi-jie-shi-yong-8" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的配置信息替换成自己的信息。</li>
				</ul>
				<h3 id="shi-yong-handlebars-8">使用 Handlebars <a href="#shi-yong-handlebars-8" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>map</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-8">云适配 WebIDE <a href="#yun-gua-pei-webide-8" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面，设置名称、坐标等信息；</li>
					<li>本组件无需采集数据。</li>
				</ul>
				<h2 id="api-1">API <a href="#api-1" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="mechat">MeChat <a href="#mechat" class="doc-anchor"></a></h1>
				<hr>
				<p><a href="http://mechat.im/">美洽</a>在线客服模块（右下角的咨询图标）。</p>
				<h2 id="shi-yong-shuo-ming">使用说明 <a href="#shi-yong-shuo-ming" class="doc-anchor"></a></h2>
				<p>使用本模块需注册美洽账号并获取帐号ID信息，具体如下。</p>
				<h3 id="mei-you-mei-qia-zhang-hao-de-yong-hu-">没有美洽帐号的用户： <a href="#mei-you-mei-qia-zhang-hao-de-yong-hu-" class="doc-anchor"></a></h3>
				<h4 id="zhu-ce-yong-hu">注册用户 <a href="#zhu-ce-yong-hu" class="doc-anchor"></a></h4>
				<p>用户填写表单并提交，云适配通过接口发送相关数据到美洽平台。</p>
				<h4 id="ti-jiao-fan-hui">提交返回 <a href="#ti-jiao-fan-hui" class="doc-anchor"></a></h4>
				<p>美洽注册成功，返回相应配置，云适配渲染界面，提示添加成功。</p>
				<h3 id="yi-you-mei-qia-zhang-hao-de-yong-hu-">已有美洽帐号的用户： <a href="#yi-you-mei-qia-zhang-hao-de-yong-hu-" class="doc-anchor"></a></h3>
				<h4 id="zhu-ce-yong-hu-1">注册用户 <a href="#zhu-ce-yong-hu-1" class="doc-anchor"></a></h4>
				<p>用户填写表单并提交，云适配通过接口发送相关数据到美洽平台。</p>
				<h4 id="ti-jiao-fan-hui-1">提交返回 <a href="#ti-jiao-fan-hui-1" class="doc-anchor"></a></h4>
				<p>美洽返回相应配置，云适配渲染界面，提示用户输入相应帐号密码。</p>
				<h4 id="zai-ci-ti-jiao">再次提交 <a href="#zai-ci-ti-jiao" class="doc-anchor"></a></h4>
				<p>用户提交，云适配通过接口发送相关数据到美洽平台，美洽返回相应配置， 云适配渲染界面，提示绑定成功。</p>
				<h2 id="api-2">API <a href="#api-2" class="doc-anchor"></a></h2>
				<p>API由美洽提供。</p>
				<p>1：注册接口：<a href="http://open.mechatim.com/cgi-bin/create/unit2?appid=T4v1KpVM7QOvzxgbQ9">http://open.mechatim.com/cgi-bin/create/unit2?appid=T4v1KpVM7QOvzxgbQ9</a></p>
				<pre>
功能：邮箱未注册则注册，返回已添加页面配置。已注册则返回密码验证页面配置。
参数{
   unitname:企业名字，
   email:企业邮箱
}
返回{
   errcode:&#39;0&#39;--表示成功，
   unitid:用于生成植入网站JS，
   form:{
      url:&#39;----&#39;,
      type:&#39;POST&#39;,
      desc:&#39;&#39;,
      fields:{}
   }
}
				</pre>
				<p>2：验证接口：<a href="http://open.mechatim.com/cgi-bin/check/unit2?appid=T4v1KpVM7QOvzxgbQ9">http://open.mechatim.com/cgi-bin/check/unit2?appid=T4v1KpVM7QOvzxgbQ9</a></p>
				<pre>
功能：验证密码，正确则返回绑定成功页面配置。
参数{
   email:企业邮箱,
   password:密码
}
返回：{
   errcode:&#39;0&#39;--表示成功，
   unitid:用于生成植入网站JS，
   form:{
      url:&#39;----&#39;,
      type:&#39;POST&#39;,
      desc:&#39;&#39;,
      fields:{}
   }
}
				</pre>
				<hr class="doc-divider">
				<h1 id="menu-cai-dan">Menu 菜单 <a href="#menu-cai-dan" class="doc-anchor"></a></h1>
				<hr>
				<p>菜单组件。</p>
				<h2 id="shi-yong-fang-fa-11">使用方法 <a href="#shi-yong-fang-fa-11" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-9">直接使用 <a href="#zhi-jie-shi-yong-9" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-9">使用 Handlebars <a href="#shi-yong-handlebars-9" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>menu</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-9">云适配 WebIDE <a href="#yun-gua-pei-webide-9" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-8">数据接口 <a href="#shu-ju-jie-kou-8" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="navbar-gong-ju-lan">Navbar 工具栏 <a href="#navbar-gong-ju-lan" class="doc-anchor"></a></h1>
				<hr>
				<p>底部工具栏组件。</p>
				<h2 id="shi-yong-fang-fa-12">使用方法 <a href="#shi-yong-fang-fa-12" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-10">直接使用 <a href="#zhi-jie-shi-yong-10" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-10">使用 Handlebars <a href="#shi-yong-handlebars-10" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>navbar</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-10">云适配 WebIDE <a href="#yun-gua-pei-webide-10" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-9">数据接口 <a href="#shu-ju-jie-kou-9" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="pagination-fen-ye">Pagination 分页 <a href="#pagination-fen-ye" class="doc-anchor"></a></h1>
				<hr>
				<p><strong><em>本组件样式有待改善!</em></strong></p>
				<p>分页组件。</p>
				<h2 id="shi-yong-fang-fa-13">使用方法 <a href="#shi-yong-fang-fa-13" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-11">直接使用 <a href="#zhi-jie-shi-yong-11" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-11">使用 Handlebars <a href="#shi-yong-handlebars-11" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>pagination</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-11">云适配 WebIDE <a href="#yun-gua-pei-webide-11" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-gou">数据结构 <a href="#shu-ju-jie-gou" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="paragraph-duan-luo">Paragraph 段落 <a href="#paragraph-duan-luo" class="doc-anchor"></a></h1>
				<hr>
				<p>文本段落组件，可用于放置文本、图片、链接等。</p>
				<p><strong>演示图标版权归<a href="http://www.bing.com/">微软 Bing</a> 所有。</strong></p>
				<h2 id="shi-yong-fang-fa-14">使用方法 <a href="#shi-yong-fang-fa-14" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-12">直接使用 <a href="#zhi-jie-shi-yong-12" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-12">使用 Handlebars <a href="#shi-yong-handlebars-12" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>paragraph</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-12">云适配 WebIDE <a href="#yun-gua-pei-webide-12" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-10">数据接口 <a href="#shu-ju-jie-kou-10" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="slider">Slider <a href="#slider" class="doc-anchor"></a></h1>
				<hr>
				<p>图片轮播模块，更多细节<a href="doc/plugin/slider.jsp">参见 JS 插件中的介绍</a>。</p>
				<p><strong>演示图标版权归<a href="http://www.bing.com/">微软 Bing</a> 所有。</strong></p>
				<h2 id="shi-yong-fang-fa-15">使用方法 <a href="#shi-yong-fang-fa-15" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-13">直接使用 <a href="#zhi-jie-shi-yong-13" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-13">使用 Handlebars <a href="#shi-yong-handlebars-13" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>slider</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-13">云适配 WebIDE <a href="#yun-gua-pei-webide-13" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-11">数据接口 <a href="#shu-ju-jie-kou-11" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="slider-can-shu-shuo-ming">Slider 参数说明 <a href="#slider-can-shu-shuo-ming" class="doc-anchor"></a></h2>
				<p>注意：通过模块传递的JSON字符串参数无法传递 callback，如需传递 callback 函数，请手动启动 slider：</p>
				<ul>
					<li>添加 <code>am-slider-manual</code> 类名，禁用模块默认的初始化函数；</li>
					<li>在自定义脚本里调用 slider：</li>
				</ul>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="javascript">
$(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   $(<span class="hljs-string">'.am-slider-manual'</span>).flexslider({
     <span class="hljs-comment">//options</span>
   });
});
						</code>
					</pre>
				</div>
				<h2 id="chang-jian-wen-ti">常见问题 <a href="#chang-jian-wen-ti" class="doc-anchor"></a></h2>
				<h3 id="zai-yi-xie-liu-lan-qi-shang-chu-xian-shan-tui-wen-ti-">在一些浏览器上出现闪退问题？ <a href="#zai-yi-xie-liu-lan-qi-shang-chu-xian-shan-tui-wen-ti-" class="doc-anchor"></a></h3>
				<p>示例代码中的引号做了<strong>不必要</strong>的 encode，导致解析参数时出错，解决方法是把 <code>&amp;quot;</code> 替换成 <code>'</code>。<strong>从 2015.05.15 开始，通过 <code>Copy</code> 按钮拷贝的代码已经自动替换引号</strong>。</p>
				<p>由于 Handlebars.js 的安全机制，暂时无法在显示层面修复。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="xml">
<span class="hljs-comment">&lt;!--问题代码--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">data-am-widget</span>=<span class="hljs-value">"slider"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-slider am-slider-d3"</span> <span class="hljs-attribute">data-am-slider</span>=<span class="hljs-value">'{&amp;quot;controlNav&amp;quot;:&amp;quot;thumbnails&amp;quot;,&amp;quot;directionNav&amp;quot;:false}'</span>&gt;</span>
<span class="hljs-comment">&lt;!--正确代码--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">data-am-widget</span>=<span class="hljs-value">"slider"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-slider am-slider-d3"</span> <span class="hljs-attribute">data-am-slider</span>=<span class="hljs-value">'{"controlNav":"thumbnails","directionNav":false}'</span>&gt;</span>
						</code>
					</pre>
				</div>
				<h3 id="ru-he-she-zhi-kuan-gao-">如何设置宽、高？ <a href="#ru-he-she-zhi-kuan-gao-" class="doc-anchor"></a></h3>
				<p>组件本身不提供设置宽、高的接口，宽度是容器的 <code>100%</code>，高度由 slide 里的内容决定。如果需要手动设置宽、高，请通过 CSS 设置容器的宽、高实现。</p>
				<hr class="doc-divider">
				<h1 id="tabs-xuan-xiang-qia">Tabs 选项卡 <a href="#tabs-xuan-xiang-qia" class="doc-anchor"></a></h1>
				<hr>
				<p>选项卡组件。</p>
				<h2 id="shi-yong-fang-fa-16">使用方法 <a href="#shi-yong-fang-fa-16" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-14">直接使用 <a href="#zhi-jie-shi-yong-14" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-14">使用 Handlebars <a href="#shi-yong-handlebars-14" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>tabs</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-14">云适配 WebIDE <a href="#yun-gua-pei-webide-14" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-12">数据接口 <a href="#shu-ju-jie-kou-12" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="chang-jian-wen-ti-1">常见问题 <a href="#chang-jian-wen-ti-1" class="doc-anchor"></a></h2>
				<h3 id="ru-he-jin-yong-hong-kong-cao-zuo-">如何禁用触控操作？ <a href="#ru-he-jin-yong-hong-kong-cao-zuo-" class="doc-anchor"></a></h3>
				<p>在容器上添加 <code>data-am-tabs-noswipe='1'</code>。</p>
				<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">data-am-widget</span>=<span class="hljs-value">"tabs"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-tabs am-tabs-default"</span> <span class="hljs-attribute">data-am-tabs-noswipe</span>=<span class="hljs-value">"1"</span>&gt;</span></code></pre></div>
				<hr class="doc-divider">
				<h1 id="titlebar-biao-ti-lan">Titlebar 标题栏 <a href="#titlebar-biao-ti-lan" class="doc-anchor"></a></h1>
				<hr>
				<p>标题栏组件，常用作页头、标题等。</p>
				<h2 id="shi-yong-fang-fa-17">使用方法 <a href="#shi-yong-fang-fa-17" class="doc-anchor"></a></h2>
				<h3 id="zhi-jie-shi-yong-15">直接使用 <a href="#zhi-jie-shi-yong-15" class="doc-anchor"></a></h3>
				<ul>
					<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
					<li>将示例代码中的内容替换为自己的内容。</li>
				</ul>
				<h3 id="shi-yong-handlebars-15">使用 Handlebars <a href="#shi-yong-handlebars-15" class="doc-anchor"></a></h3>
				<p>本组件 Handlebars partial 名称为 <code>titlebar</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
				<h3 id="yun-gua-pei-webide-15">云适配 WebIDE <a href="#yun-gua-pei-webide-15" class="doc-anchor"></a></h3>
				<ul>
					<li>将组件拖入编辑界面；</li>
					<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
				</ul>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<h2 id="shu-ju-jie-kou-13">数据接口 <a href="#shu-ju-jie-kou-13" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
				<hr class="doc-divider">
				<h1 id="wechatpay">WechatPay <a href="#wechatpay" class="doc-anchor"></a></h1>
				<hr>
				<p>微信JS SDK 应用示例。<strong>微信支付 99% 是后端的工作，如果项目中需要微信支付，请把重心放在后端。</strong></p>
				<p><strong>微信 JS SDK 脚本及权限验证配置请从后端返回</strong>。相关支持请联系微信官方或参考<a href="http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html">官方文档</a>。</p>
				<p>通过JS SDK 发起微信支付请求只能在微信中才能执行，请扫描二维码在微信内查看效果。</p>
				<div id="doc-wechat-pay-qr"></div>
				<hr>
				<h2 id="api-3">API <a href="#api-3" class="doc-anchor"></a></h2>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="javascript">
{
   <span class="hljs-string">"id"</span>:<span class="hljs-string">""</span>,
   <span class="hljs-string">"className"</span>:<span class="hljs-string">""</span>,
   <span class="hljs-string">"theme"</span>:<span class="hljs-string">""</span>,
   <span class="hljs-string">"options"</span>:{},
   <span class="hljs-string">"content"</span>:{
      <span class="hljs-comment">//订单信息及支付签名</span>
      <span class="hljs-string">"order"</span>:{
         <span class="hljs-string">"timestamp"</span>:<span class="hljs-string">""</span>,<span class="hljs-comment">//支付签名时间戳</span>
         <span class="hljs-string">"nonceStr"</span>:<span class="hljs-string">""</span>,<span class="hljs-comment">//支付签名随机串</span>
         <span class="hljs-string">"package"</span>:<span class="hljs-string">""</span>,<span class="hljs-comment">//统一支付接口返回的 prepay_id参数值</span>
         <span class="hljs-string">"signType"</span>:<span class="hljs-string">""</span>,<span class="hljs-comment">//加密类型</span>
         <span class="hljs-string">"paySign"</span>:<span class="hljs-string">""</span><span class="hljs-comment">//支付签名</span>
      },
      <span class="hljs-string">"title"</span>:<span class="hljs-string">""</span><span class="hljs-comment">//按钮文字</span>
   }
}
						</code>
					</pre>
				</div>
				<h2 id="wei-xin-js-sdk-diao-yong-zhi-fu-jie-kou-yao-dian">微信 JS SDK 调用支付接口要点 <a href="#wei-xin-js-sdk-diao-yong-zhi-fu-jie-kou-yao-dian" class="doc-anchor"></a></h2>
				<h3 id="js-sdk-quan-xian-yan-zheng">JS SDK 权限验证 <a href="#js-sdk-quan-xian-yan-zheng" class="doc-anchor"></a></h3>
				<p>所有需要使用JS-SDK的页面必须先注入配置信息，否则将无法调用（同一个url仅需调用一次，对于变化 URL 的 SPA 的 Web App 可在每次 URL 变化时进行调用），具体文档在<a href="http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html">微信支付 API</a> ，签名和其他配置参数在服务端实现逻辑。</p>
				<p>详细步骤见<a href="http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html#JSSDK.E4.BD.BF.E7.94.A8.E6.AD.A5.E9.AA.A4">微信官网文档</a>。</p>
				<div class="doc-code demo-highlight">
					<pre>
						<code class="javascript">
wx.config({
   debug:<span class="hljs-literal">true</span>,
   appId:<span class="hljs-string">''</span>,<span class="hljs-comment">//必填，公众号的唯一标识</span>
   timestamp:<span class="hljs-string">''</span>,<span class="hljs-comment">//必填，生成签名的时间戳</span>
   nonceStr:<span class="hljs-string">''</span>,<span class="hljs-comment">//必填，生成签名的随机串</span>
   signature:<span class="hljs-string">''</span>,<span class="hljs-comment">//必填，微信签名</span>
   jsApiList:[<span class="hljs-string">'chooseWXPay'</span>]<span class="hljs-comment">//必填，需要使用的JS接口列表</span>
});
						</code>
					</pre>
				</div>
				<h3 id="shi-yong-wei-xin-zhi-fu-tong-yi-xia-dan-jie-kou-sheng-cheng-ding-dan-xin-xi">使用微信支付统一下单接口生成订单信息 <a href="#shi-yong-wei-xin-zhi-fu-tong-yi-xia-dan-jie-kou-sheng-cheng-ding-dan-xin-xi" class="doc-anchor"></a></h3>
				<p>详见<a href="http://pay.weixin.qq.com/wiki/doc/api/index.php?chapter=9_1">微信支付统一下单接口文档</a></p>
				<h3 id="sheng-cheng-zhi-fu-qian-ming">生成支付签名 <a href="#sheng-cheng-zhi-fu-qian-ming" class="doc-anchor"></a></h3>
				<p>详见<a href="http://pay.weixin.qq.com/wiki/doc/api/index.php?chapter=4_3">微信支付签名算法</a></p>
				<h3 id="fa-qi-zhi-fu-qing-qiu">发起支付请求 <a href="#fa-qi-zhi-fu-qing-qiu" class="doc-anchor"></a></h3>
				<pre>
wx.chooseWXPay({
   timestamp:0,//支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
   nonceStr:&#39;&#39;,//支付签名随机串，不长于 32 位
   package:&#39;&#39;,//统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
   signType:&#39;MD5&#39;,//签名方式，默认为&#39;SHA1&#39;，使用新版支付需传入&#39;MD5&#39;
   paySign:&#39;&#39;,//支付签名
});
				</pre>
				<hr class="doc-divider">
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/js/zepto.min-1.1.4.js"></script>
<script type="text/javascript" src="_/js/handlebars.min-4.0.5.js"></script>
<script type="text/javascript" src="doc/image/main.js"></script>
<script type="text/javascript">
$(function(){
	if(window.ZeroClipboard){
		$(".doc-icon-list li").each(function(o,a){
			$(a).find("a").on("click",function(o){
				o.preventDefault();
			});
			$(a).on("mouseenter",function(){
				$(a).addClass("copy-active");
			}).on("mouseleave",function(){
				window.setTimeout(function(){
					$(a).removeClass("copy-active");
				},3000);
			});
			var n=$(this).find("i").attr("class");
			var i="<span class=\"demo-icon-actions\"><i class=\"am-badge am-badge-primary demo-copy-icon\" data-clipboard-text=\""+n+\"" title=\"复制 Icon Class\">class</i><i class=\"am-badge am-badge-success demo-copy-icon\" data-clipboard-text=\"{\n  .am-icon-font;\n  content:@fa-var-"+n.replace("am-icon-","")+";\n}\" title=\"复制 Icon Style\">style</i>";
			$(this).append($(i));
		});
		var o=new ZeroClipboard($(".demo-copy-icon"));
		o.on("aftercopy",function(o){
			console&&console.log("Copied to clipboard:\n"+o.data["text/plain"]);
		});
	}
});
!function(e){
	var r=e.AMUI.qrcode;
	e(function(){
		e("#doc-wechat-pay-qr").html(new r({
			render:"canvas",
			correctLevel:0,
			text:"http://amazeui.orgdocs/widget/wechatpay",
			width:200,
			height:200,
			background:"#FFF",
			foreground:"#000"
		}));
	});
}(window.jQuery);
!function(i){
	if(!i){
		throw new Error("jQuery or Zepto.js is required.");
	}
	i(function(){
		var e=i("#dbg-sidebar"),a=i("<li class=\"am-nav-divider\">UI 组件</li>"),n=i("<li class=\"am-nav-divider\">Web 组件</li>"),r=e.find(e.find(".md-toc>li")),d=e.find(".md-toc>li>a");
		a.insertBefore(r.first()),n.insertBefore(r.eq(7)),d.on("click",function(){
			r.removeClass("am-active");
			i(this).parent("li").addClass("am-active");
		});
		i("#doc-ide-content").find("h1[id]").each(function(e,a){
			var n=i(a).attr("id");
			i(a).append(i("<a></a>",{name:n.replace(/(-{1}.+)/g,"")}));
		});
	});
}(window.jQuery||window.Zepto);
</script>
</body>
</html>