<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Typography|Amaze UI</title>
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
							<a href="#zi-ti">字体</a>
							<ul class="am-collapse">
								<li><a href="#zi-ti-ding-yi">字体定义</a></li>
								<li><a href="#zi-ti-fu-zhu-class">字体辅助 Class</a></li>
								<li><a href="#webkit-fan-ju-chi">Webkit 反锯齿</a></li>
								<li><a href="#zi-ti-xiang-guan-lian-jie">字体相关链接</a></li>
							</ul>
						</li>
						<li>
							<a href="#yuan-su-ji-ben-yang-shi">元素基本样式</a>
							<ul class="am-collapse">
								<li><a href="#biao-ti-codelth1gt-lth6gtcode">标题 &lt;h1&gt; - &lt;h6&gt;</a></li>
								<li><a href="#duan-luo-codeltpgtcode">段落 &lt;p&gt;</a></li>
								<li><a href="#fen-ge-xian-codelthrgtcode">分隔线 &lt;hr&gt;</a></li>
								<li><a href="#yin-yong-codeltblockquotegtcode">引用 &lt;blockquote&gt;</a></li>
								<li><a href="#dai-ma-kuai-codeltpregtcode">代码块 &lt;pre&gt;</a></li>
								<li><a href="#lie-biao-ulol">列表 ul/ol</a></li>
								<li><a href="#ding-yi-lie-biao">定义列表</a></li>
								<li><a href="#biao-ge-codelttablegtcode">表格 &lt;table&gt;</a></li>
								<li><a href="#tu-pian-codeltimggtcode">图片 &lt;img&gt;</a></li>
								<li><a href="#qi-ta-yuan-su">其他元素</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="typography-wen-zi-pai-ban">Typography 文字排版 <a href="#typography-wen-zi-pai-ban" class="doc-anchor"></a></h1>
			<hr>
			<p>很多设计师喜欢用英文，因为中文排版真的不太容易搞。中文字符多、不同字符的笔画差异也很大，使用英文时高大上的设计稿，替换成中文以后，可能会大打折扣。</p>
			<p>网页设计中，针对中文排版的研究很少，没有太多现成的结论供参考。Amaze UI 只能根据一些经验，在字体设置、字号上做一些更适合中文的设置。</p>
			<h2 id="zi-ti">字体 <a href="#zi-ti" class="doc-anchor"></a></h2>
			<p>Amaze UI 主要使用非衬线字体（sans-serif），在 <code>&lt;code&gt;</code>、<code>&lt;pre&gt;</code> 等元素上则设置了等宽字体（monospace）。</p>
			<h3 id="zi-ti-ding-yi">字体定义 <a href="#zi-ti-ding-yi" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-tag">body</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">font-family</span>:<span class="hljs-value"><span class="hljs-string">"Segoe UI"</span>,<span class="hljs-string">"Lucida Grande"</span>,Helvetica,Arial,<span class="hljs-string">"Microsoft YaHei"</span>,FreeSans,Arimo,<span class="hljs-string">"Droid Sans"</span>,<span class="hljs-string">"wenquanyi micro hei"</span>,<span class="hljs-string">"Hiragino Sans GB"</span>,<span class="hljs-string">"Hiragino Sans GB W3"</span>,Arial,sans-serif</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<ul>
				<li><strong>Segoe UI</strong> - Windows UI 字体（从 Windows Vista 开始使用）；</li>
				<li><strong>Helvetica Neue</strong> 是 iOS7 及 OSX 10.10 UI 字体（在部分文字垂直居中的场景有一些小问题，暂时先使用 <code>Lucida Grande</code>）；</li>
				<li>有些 Windows 用户安装了丽黑字体，丽黑字体在 Windows 上渲染出来很模糊，所以把微软雅黑放在苹果丽黑之前；</li>
				<li><strong>FreeSans</strong> - 包括 Ubuntu 之类的 Linux 分发版包含的字体。</li>
			</ul>
			<h3 id="zi-ti-fu-zhu-class">字体辅助 Class <a href="#zi-ti-fu-zhu-class" class="doc-anchor"></a></h3>
			<p>在 Amaze UI 的实践中，<code>font-family</code> 设置只在 Base 样式中出现了一两次。在具体项目中，我们也不建议到处设置 <code>font-family</code>，虽然 Amaze UI 提供了设置字体的辅助 class。</p>
			<ul>
				<li><code>.am-sans-serif</code> <strong>非衬线字体</strong>，Amaze UI 主要使用的。</li>
				<li><code>.am-serif</code> <strong>衬线字体</strong>，中文显示宋体，Amaze UI 中未使用。</li>
				<li><code>.am-kai</code> <strong>数字英文显示衬线字体，中文显示楷体</strong>。和 <code>.am-serif</code> 的区别仅在于中文字体，Amaze UI 中把 <code>&lt;blockquote&gt;</code> 的字体设置成了 <code>.am-kai</code>。</li>
				<li><code>.am-monospace</code> <strong>等宽字体</strong>，Amaze UI 源代码中使用。</li>
			</ul>
			<p>下面为几种字体系列的演示：</p>
			<div class="doc-example">
				<p>The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
				<p class="am-serif">The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
				<p class="am-kai">The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
				<p class="am-monospace">The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span>...<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">p</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-serif"</span>&gt;</span>...<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">p</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-kai"</span>&gt;</span>...<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">p</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-monospace"</span>&gt;</span>...<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>严格来说，楷体属于手写体系列（cursive），不过英文的手写字过于花哨，所以在 <code>.am-kai</code> 中英文使用 <code>serif</code>。关于五种字体的定义，可以查看 <a href="#">W3C 文档</a>。</p>
			<h3 id="webkit-fan-ju-chi">Webkit 反锯齿 <a href="#webkit-fan-ju-chi" class="doc-anchor"></a></h3>
			<p>另外，在 Webkit 浏览器下还设置了反锯齿平滑渲染，渲染出来要纤细一些，其他内核的浏览器上看着稍粗一些。</p>
			<p><strong>2014.10.10 update:</strong> OSX 平台的 Firefox 从 v25 增加了 <code>-moz-osx-font-smoothing</code>，实现类似 Webkit 的字体渲染效果。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-tag">body</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-font-smoothing</span>:<span class="hljs-value">antialiased</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-moz-osx-font-smoothing</span>:<span class="hljs-value">grayscale</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<p>如果你不喜欢，可以重置成浏览器的默认平滑字体。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-tag">body</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-font-smoothing</span>:<span class="hljs-value">subpixel-antialiased</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-moz-osx-font-smoothing</span>:<span class="hljs-value">auto</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<div class="doc-example">
				<h3>开启反锯齿 <code>-webkit-font-smoothing:antialiased;</code></h3>
				<p>The quick brown fox jumps over the lazy dog.<br>千万不要因为走的太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
				<br>
				<div style="-webkit-font-smoothing:subpixel-antialiased;-moz-osx-font-smoothing:auto;">
					<h3>未开启反锯齿 <code>-webkit-font-smoothing:subpixel-antialiased;</code></h3>
					<p>The quick brown fox jumps over the lazy dog.<br>千万不要因为走的太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
				</div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">h3</span>&gt;</span>-webkit-font-smoothing:antialiased;<span class="hljs-tag">&lt;/<span class="hljs-title">h3</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span>
   The quick brown fox jumps over the lazy dog. <span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
   千万不要因为走的太久，而忘记了我们为什么出发。 <span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
   千萬不要因為走得太久，而忘記了我們為什麼出發。
<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">style</span>=<span class="hljs-value">"-webkit-font-smoothing:subpixel-antialiased;-moz-osx-font-smoothing:auto;"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">h3</span>&gt;</span>-webkit-font-smoothing:subpixel-antialiased;<span class="hljs-tag">&lt;/<span class="hljs-title">h3</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span>
      The quick brown fox jumps over the lazy dog. <span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
      千万不要因为走的太久，而忘记了我们为什么出发。 <span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
      千萬不要因為走得太久，而忘記了我們為什麼出發。
   <span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>参考链接：</p>
			<ul>
				<li><a href="#">-webkit-font-smoothing</a></li>
				<li><a href="#">Better font-rendering on OSX</a></li>
			</ul>
			<h3 id="zi-ti-xiang-guan-lian-jie">字体相关链接 <a href="#zi-ti-xiang-guan-lian-jie" class="doc-anchor"></a></h3>
			<p><strong>主流系统中附带的字体</strong></p>
			<ul>
				<li><a href="#">List of Microsoft Windows fonts</a></li>
				<li><a href="#">List of typefaces included with OS X</a></li>
				<li><a href="#">Common fonts to all versions of Windows &amp; Mac equivalents</a></li>
				<li><a href="#">OS X：Mavericks 附带的字体</a></li>
				<li><a href="#">OS X：Mountain Lion 附带的字体</a></li>
				<li><a href="#">iOS 7：字体列表</a></li>
				<li><a href="#">iOS 6：字体列表</a></li>
				<li><a href="#">Windows UI 设计文档</a></li>
				<li><a href="#">Supported UI Fonts in Windows Phone</a></li>
				<li><a href="#">Typography|Android Developers</a></li>
			</ul>
			<p><strong>中文排版相关开源项目</strong></p>
			<ul>
				<li><a href="#">「漢字標準格式」——印刷品般的漢字網頁排版框架</a></li>
				<li><a href="#">Entry.css - 可配置的、更适合阅读的中文文章样式库</a></li>
			</ul>
			<h2 id="yuan-su-ji-ben-yang-shi">元素基本样式 <a href="#yuan-su-ji-ben-yang-shi" class="doc-anchor"></a></h2>
			<h3 id="biao-ti-codelth1gt-lth6gtcode">标题 <code>&lt;h1&gt; - &lt;h6&gt;</code> <a href="#biao-ti-codelth1gt-lth6gtcode" class="doc-anchor"></a></h3>
			<p><code>&lt;h1&gt; - &lt;h6&gt;</code> 保持粗体，设置了边距；<code>&lt;h1&gt;</code> 为正常字号的 <code>1.5</code> 倍；<code>&lt;h2&gt;</code> 为正常字号的 <code>1.25</code> 倍；其他保持正常字号。</p>
			<div class="doc-example">
				<h1>h1 标题1</h1>
				<h2>h2 标题2</h2>
				<h3>h3 标题3</h3>
				<h4>h4 标题4</h4>
				<h5>h5 标题5</h5>
				<h6>h6 标题6</h6>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">h1</span>&gt;</span>h1 标题1<span class="hljs-tag">&lt;/<span class="hljs-title">h1</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">h2</span>&gt;</span>h2 标题2<span class="hljs-tag">&lt;/<span class="hljs-title">h2</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">h3</span>&gt;</span>h3 标题3<span class="hljs-tag">&lt;/<span class="hljs-title">h3</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">h4</span>&gt;</span>h4 标题4<span class="hljs-tag">&lt;/<span class="hljs-title">h4</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">h5</span>&gt;</span>h5 标题5<span class="hljs-tag">&lt;/<span class="hljs-title">h5</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">h6</span>&gt;</span>h6 标题6<span class="hljs-tag">&lt;/<span class="hljs-title">h6</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="duan-luo-codeltpgtcode">段落 <code>&lt;p&gt;</code> <a href="#duan-luo-codeltpgtcode" class="doc-anchor"></a></h3>
			<div class="doc-example"><p>无论走到哪里，都应该记住，过去都是假的，回忆是一条没有尽头的路，一切以往的春天都不复存在，就连那最坚韧而又狂乱的爱情归根结底也不过是一种转瞬即逝的现实。</p></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span>无论走到哪里，都应该记住，过去都是假的，回忆是一条没有尽头的路，一切以往的春天都不复存在，就连那最坚韧而又狂乱的爱情归根结底也不过是一种转瞬即逝的现实。<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span></code></pre></div>
			<h3 id="fen-ge-xian-codelthrgtcode">分隔线 <code>&lt;hr&gt;</code> <a href="#fen-ge-xian-codelthrgtcode" class="doc-anchor"></a></h3>
			<div class="doc-example"><hr></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">hr</span>&gt;</span></code></pre></div>
			<h3 id="yin-yong-codeltblockquotegtcode">引用 <code>&lt;blockquote&gt;</code> <a href="#yin-yong-codeltblockquotegtcode" class="doc-anchor"></a></h3>
			<p>来源放到 <code>&lt;small&gt;</code> 元素里面。</p>
			<div class="doc-example">
				<blockquote>
					<p>无论走到哪里，都应该记住，过去都是假的，回忆是一条没有尽头的路，一切以往的春天都不复存在，就连那最坚韧而又狂乱的爱情归根结底也不过是一种转瞬即逝的现实。</p>
					<small>马尔克斯 ——《百年孤独》</small>
				</blockquote>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">blockquote</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span>无论走到哪里，都应该记住，过去都是假的，回忆是一条没有尽头的路，一切以往的春天都不复存在，就连那最坚韧而又狂乱的爱情归根结底也不过是一种转瞬即逝的现实。<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">small</span>&gt;</span>马尔克斯 ——《百年孤独》<span class="hljs-tag">&lt;/<span class="hljs-title">small</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">blockquote</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="dai-ma-kuai-codeltpregtcode">代码块 <code>&lt;pre&gt;</code> <a href="#dai-ma-kuai-codeltpregtcode" class="doc-anchor"></a></h3>
			<p>更多细节查看 <a href="doc/css/code.jsp">Code</a>。</p>
			<div class="doc-example">
				<pre style="background-color:#F8F8F8;color:#555;">
window.addEventListener("load",function(){
   FastClick.attach(document.body);
},false);
				</pre>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">pre</span>&gt;</span>
window.addEventListener("load",function(){
   FastClick.attach(document.body);
},false);
<span class="hljs-tag">&lt;/<span class="hljs-title">pre</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="lie-biao-ulol">列表 ul/ol <a href="#lie-biao-ulol" class="doc-anchor"></a></h3>
			<p><strong>无序列表（<code>&lt;ul&gt;</code>）：</strong></p>
			<div class="doc-example">
				<ul>
					<li>条目 #1</li>
					<li>
						条目 #2
						<ul>
							<li>条目 #1</li>
							<li>
								条目 #2
								<ul>
									<li>条目 #1</li>
									<li>条目 #2</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>条目 #3</li>
					<li>条目 #4</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p><strong>有序列表（<code>&lt;ol&gt;</code>）：</strong></p>
			<div class="doc-example">
				<ol>
					<li>条目 #1</li>
					<li>
						条目 #2
						<ol>
							<li>条目 #1</li>
							<li>
								条目 #2
								<ol>
									<li>条目 #1</li>
									<li>条目 #2</li>
								</ol>
							</li>
						</ol>
					</li>
					<li>条目 #3</li>
					<li>条目 #4</li>
				</ol>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="ding-yi-lie-biao">定义列表 <a href="#ding-yi-lie-biao" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<dl>
					<dt>响应式网页设计</dt>
					<dd>自适应网页设计（英语：Responsive web design，通常缩写为RWD）是一种网页设计的技术做法，该设计可使网站在多种浏览设备（从桌面电脑显示器到移动电话或其他移动产品设备）上阅读和导航，同时减少缩放、平移和滚动。</dd>
					<dt>响应式网页设计（RWD）的元素</dt>
					<dd>采用 RWD 设计的网站 使用 CSS3 Media queries，即一种对 @media 规则的扩展，以及流式的基于比例的网格和自适应大小的图像以适应不同大小的设备。</dd>
				</dl>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">dl</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">dt</span>&gt;</span>响应式网页设计<span class="hljs-tag">&lt;/<span class="hljs-title">dt</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">dd</span>&gt;</span>自适应网页设计（英语：Responsive web design，通常缩写为RWD）是一种网页设计的技术做法，该设计可使网站在多种浏览设备（从桌面电脑显示器到移动电话或其他移动产品设备）上阅读和导航，同时减少缩放、平移和滚动。<span class="hljs-tag">&lt;/<span class="hljs-title">dd</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">dt</span>&gt;</span>响应式网页设计（RWD）的元素<span class="hljs-tag">&lt;/<span class="hljs-title">dt</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">dd</span>&gt;</span>采用 RWD 设计的网站 使用 CSS3 Media queries，即一种对 @media 规则的扩展，以及流式的基于比例的网格和自适应大小的图像以适应不同大小的设备。<span class="hljs-tag">&lt;/<span class="hljs-title">dd</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">dl</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="biao-ge-codelttablegtcode">表格 <code>&lt;table&gt;</code> <a href="#biao-ge-codelttablegtcode" class="doc-anchor"></a></h3>
			<p>这里只是 normalize 以后的样式，更多样式查看 <a href="doc/css/table.jsp">Table 组件</a>。</p>
			<div class="doc-example">
				<table>
					<caption>表格标题</caption>
					<thead>
						<tr>
							<th>表头 #1</th>
							<th>表头 #2</th>
							<th>表头 #3</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>数据 #1</td>
							<td>数据 #2</td>
							<td>数据 #3</td>
						</tr>
						<tr>
							<td>数据 #1</td>
							<td>数据 #2</td>
							<td>数据 #3</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td>表页脚 #1</td>
							<td>表页脚 #2</td>
							<td>表页脚 #3</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="tu-pian-codeltimggtcode">图片 <code>&lt;img&gt;</code> <a href="#tu-pian-codeltimggtcode" class="doc-anchor"></a></h3>
			<p>更多样式查看 <a href="doc/css/image.jsp">Image 组件</a>。</p>
			<div class="doc-example"><img src="doc/image/bing-1.jpg" class="am-img-responsive"></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">img</span> <span class="hljs-attribute">src</span>=<span class="hljs-value">"doc/image/bing-1.jpg"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-img-responsive"</span>&gt;</span></code></pre></div>
			<h3 id="qi-ta-yuan-su">其他元素 <a href="#qi-ta-yuan-su" class="doc-anchor"></a></h3>
			<table class="am-table am-table-bordered am-table-striped am-table-hover">
				<thead>
					<tr>
						<th>元素</th>
						<th>基本样式</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>&lt;a&gt;</code></td>
						<td><a href="#">这是一个超链接</a></td>
					</tr>
					<tr>
						<td><code>&lt;em&gt;</code></td>
						<td><em>我在 em 元素里</em></td>
					</tr>
					<tr>
						<td><code>&lt;strong&gt;</code></td>
						<td><strong>strong 元素，壮吧</strong></td>
					</tr>
					<tr>
						<td><code>&lt;code&gt;</code></td>
						<td><code>行内代码</code></td>
					</tr>
					<tr>
						<td><code>&lt;del&gt;</code></td>
						<td><del>在我的胸口划一刀</del></td>
					</tr>
					<tr>
						<td><code>&lt;ins&gt;</code></td>
						<td><ins>强势插入的元素</ins></td>
					</tr>
					<tr>
						<td><code>&lt;mark&gt;</code></td>
						<td><mark>我被贴上 mark 标签了</mark></td>
					</tr>
					<tr>
						<td><code>&lt;q&gt;</code></td>
						<td><q>我在 q 元素里面 <q>q 元素里面的 q元素</q> q 元素</q></td>
					</tr>
					<tr>
						<td><code>&lt;abbr&gt;</code></td>
						<td>响应式设计缩写 <abbr>RWD</abbr></td>
					</tr>
					<tr>
						<td><code>&lt;dfn&gt;</code></td>
						<td>定义一个东西 <dfn>DLNA</dfn></td>
					</tr>
					<tr>
						<td><code>&lt;small&gt;</code></td>
						<td><small>我比别人小一些</small></td>
					</tr>
				</tbody>
			</table>
			<div class="ds-thread" data-thread-key="f9b92c63bb075fb50d64f55232a17f08" data-title="CSS - Typography|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>