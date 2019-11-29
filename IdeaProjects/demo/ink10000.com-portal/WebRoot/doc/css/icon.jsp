<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Icon|Amaze UI</title>
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
							<a href="#shi-yong-fang-fa">使用方法</a>
							<ul class="am-collapse">
								<li><a href="#tian-jia-class">添加 Class</a></li>
								<li><a href="#shi-yong-mixin">使用 Mixin</a></li>
								<li><a href="#xiu-gai-zi-ti-lu-jing">修改字体路径</a></li>
							</ul>
						</li>
						<li><a href="#tu-biao-da-xiao">图标大小</a></li>
						<li><a href="#icon-button">Icon button</a></li>
						<li><a href="#xuan-zhuan-dong-hua">旋转动画</a></li>
						<li><a href="#gu-ding-kuan-du">固定宽度</a></li>
						<li><a href="#fu-zhi-tu-biao">复制图标</a></li>
						<li>
							<a href="#cun-zai-wen-ti">存在问题</a>
							<ul class="am-collapse"><li><a href="#guan-yu-bu-fen-qi-pa-yong-hu-dai-li-bu-xian-shi-zi-ti-tu-biao">关于部分奇葩用户代理不显示字体图标</a></li></ul>
						</li>
						<li><a href="#suo-you-tu-biao-lie-biao">所有图标列表</a></li>
					</ul>
				</div>
			</div>
			<h1 id="icon">Icon <a href="#icon" class="doc-anchor"></a></h1>
			<hr>
			<p>Amaze UI Icon 组件目前使用了 <a href="#">Font Awesome</a>（Amaze UI 2.2.0 中升级至 4.3.0），涵盖除部分国内社交网站图标以外的其他常见图标。</p>
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
			<p>
				<del>字体图标目前引了 <a href="#">Staticfile CDN</a> 上的文件（支持 HTTPS），可以自行替换：</del>
				<strong>编译好的 CSS 中已经替换为本地文件。</strong>
			</p>
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
				<a href="#" class="am-icon-btn am-primary am-icon-qq"></a>
				<a href="#" class="am-icon-btn am-secondary am-icon-drupal"></a>
				<a href="#" class="am-icon-btn am-success am-icon-shield"></a>
				<a href="#" class="am-icon-btn am-warning am-icon-warning"></a>
				<a href="#" class="am-icon-btn am-danger am-icon-youtube"></a>
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
			<p>以酷派为代表的部分安卓手机自带浏览器、微信/QQ WebView 等用户代理无法正常显示 Icon Font，原因可能是这些用户代理无法正确处理伪元素 <code>content</code> 的五位数的 Icon Font 十六进制编码，详情参考 <a href="#">Iconfont 在移动端遇到问题的探讨</a>，可以通过<a href="#">这个页面</a>进行测试。</p>
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
<span class="hljs-comment">/* 安卓手机端Icon不能正确显示的处理办法：*/</span>
<span class="hljs-attr_selector">[class*='am-icon-']</span><span class="hljs-pseudo">:before</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">display</span>:<span class="hljs-value">inline-block</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">font</span>:<span class="hljs-value">normal normal normal <span class="hljs-number">14px</span>/<span class="hljs-number">1</span> FontAwesome</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">font-size</span>:<span class="hljs-value">inherit</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">text-rendering</span>:<span class="hljs-value">auto</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-font-smoothing</span>:<span class="hljs-value">antialiased</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-moz-osx-font-smoothing</span>:<span class="hljs-value">grayscale</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<h2 id="suo-you-tu-biao-lie-biao">所有图标列表 <a href="#suo-you-tu-biao-lie-biao" class="doc-anchor"></a></h2>
			<div class="doc-example">
				<section>
					<h2 class="doc-icon-hd">Font Awesome 4.5 新增字体（Amaze UI 2.5 中搭载）</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-bluetooth"></i> bluetooth</li>
						<li><i class="am-icon-bluetooth-b"></i> bluetooth-b</li>
						<li><i class="am-icon-codiepie"></i> codiepie</li>
						<li><i class="am-icon-credit-card-alt"></i> credit-card-alt</li>
						<li><i class="am-icon-edge"></i> edge</li>
						<li><i class="am-icon-fort-awesome"></i> fort-awesome</li>
						<li><i class="am-icon-hashtag"></i> hashtag</li>
						<li><i class="am-icon-mixcloud"></i> mixcloud</li>
						<li><i class="am-icon-modx"></i> modx</li>
						<li><i class="am-icon-pause-circle"></i> pause-circle</li>
						<li><i class="am-icon-pause-circle-o"></i> pause-circle-o</li>
						<li><i class="am-icon-percent"></i> percent</li>
						<li><i class="am-icon-product-hunt"></i> product-hunt</li>
						<li><i class="am-icon-reddit-alien"></i> reddit-alien</li>
						<li><i class="am-icon-scribd"></i> scribd</li>
						<li><i class="am-icon-shopping-bag"></i> shopping-bag</li>
						<li><i class="am-icon-shopping-basket"></i> shopping-basket</li>
						<li><i class="am-icon-stop-circle"></i> stop-circle</li>
						<li><i class="am-icon-stop-circle-o"></i> stop-circle-o</li>
						<li><i class="am-icon-usb"></i> usb</li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Font Awesome 4.4 新增字体（Amaze UI 2.5 中搭载）</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-500px"></i> 500px</li>
						<li><i class="am-icon-amazon"></i> amazon</li>
						<li><i class="am-icon-balance-scale"></i> balance-scale</li>
						<li><i class="am-icon-battery-0"></i> battery-0 <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-battery-1"></i> battery-1 <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-battery-2"></i> battery-2 <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-battery-3"></i> battery-3 <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-battery-4"></i> battery-4 <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-battery-empty"></i> battery-empty</li>
						<li><i class="am-icon-battery-full"></i> battery-full</li>
						<li><i class="am-icon-battery-half"></i> battery-half</li>
						<li><i class="am-icon-battery-quarter"></i> battery-quarter</li>
						<li><i class="am-icon-battery-three-quarters"></i> battery-three-quarters</li>
						<li><i class="am-icon-black-tie"></i> black-tie</li>
						<li><i class="am-icon-calendar-check-o"></i> calendar-check-o</li>
						<li><i class="am-icon-calendar-minus-o"></i> calendar-minus-o</li>
						<li><i class="am-icon-calendar-plus-o"></i> calendar-plus-o</li>
						<li><i class="am-icon-calendar-times-o"></i> calendar-times-o</li>
						<li><i class="am-icon-cc-diners-club"></i> cc-diners-club</li>
						<li><i class="am-icon-cc-jcb"></i> cc-jcb</li>
						<li><i class="am-icon-chrome"></i> chrome</li>
						<li><i class="am-icon-clone"></i> clone</li>
						<li><i class="am-icon-commenting"></i> commenting</li>
						<li><i class="am-icon-commenting-o"></i> commenting-o</li>
						<li><i class="am-icon-contao"></i> contao</li>
						<li><i class="am-icon-creative-commons"></i> creative-commons</li>
						<li><i class="am-icon-expeditedssl"></i> expeditedssl</li>
						<li><i class="am-icon-firefox"></i> firefox</li>
						<li><i class="am-icon-fonticons"></i> fonticons</li>
						<li><i class="am-icon-genderless"></i> genderless</li>
						<li><i class="am-icon-get-pocket"></i> get-pocket</li>
						<li><i class="am-icon-gg"></i> gg</li>
						<li><i class="am-icon-gg-circle"></i> gg-circle</li>
						<li><i class="am-icon-hand-grab-o"></i> hand-grab-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-hand-lizard-o"></i> hand-lizard-o</li>
						<li><i class="am-icon-hand-paper-o"></i> hand-paper-o</li>
						<li><i class="am-icon-hand-peace-o"></i> hand-peace-o</li>
						<li><i class="am-icon-hand-pointer-o"></i> hand-pointer-o</li>
						<li><i class="am-icon-hand-rock-o"></i> hand-rock-o</li>
						<li><i class="am-icon-hand-scissors-o"></i> hand-scissors-o</li>
						<li><i class="am-icon-hand-spock-o"></i> hand-spock-o</li>
						<li><i class="am-icon-hand-stop-o"></i> hand-stop-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-hourglass"></i> hourglass</li>
						<li><i class="am-icon-hourglass-1"></i> hourglass-1 <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-hourglass-2"></i> hourglass-2 <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-hourglass-3"></i> hourglass-3 <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-hourglass-end"></i> hourglass-end</li>
						<li><i class="am-icon-hourglass-half"></i> hourglass-half</li>
						<li><i class="am-icon-hourglass-o"></i> hourglass-o</li>
						<li><i class="am-icon-hourglass-start"></i> hourglass-start</li>
						<li><i class="am-icon-houzz"></i> houzz</li>
						<li><i class="am-icon-i-cursor"></i> i-cursor</li>
						<li><i class="am-icon-industry"></i> industry</li>
						<li><i class="am-icon-internet-explorer"></i> internet-explorer</li>
						<li><i class="am-icon-map"></i> map</li>
						<li><i class="am-icon-map-o"></i> map-o</li>
						<li><i class="am-icon-map-pin"></i> map-pin</li>
						<li><i class="am-icon-map-signs"></i> map-signs</li>
						<li><i class="am-icon-mouse-pointer"></i> mouse-pointer</li>
						<li><i class="am-icon-object-group"></i> object-group</li>
						<li><i class="am-icon-object-ungroup"></i> object-ungroup</li>
						<li><i class="am-icon-odnoklassniki"></i> odnoklassniki</li>
						<li><i class="am-icon-odnoklassniki-square"></i> odnoklassniki-square</li>
						<li><i class="am-icon-opencart"></i> opencart</li>
						<li><i class="am-icon-opera"></i> opera</li>
						<li><i class="am-icon-optin-monster"></i> optin-monster</li>
						<li><i class="am-icon-registered"></i> registered</li>
						<li><i class="am-icon-safari"></i> safari</li>
						<li><i class="am-icon-sticky-note"></i> sticky-note</li>
						<li><i class="am-icon-sticky-note-o"></i> sticky-note-o</li>
						<li><i class="am-icon-television"></i> television</li>
						<li><i class="am-icon-trademark"></i> trademark</li>
						<li><i class="am-icon-tripadvisor"></i> tripadvisor</li>
						<li><i class="am-icon-tv"></i> tv <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-vimeo"></i> vimeo</li>
						<li><i class="am-icon-wikipedia-w"></i> wikipedia-w</li>
						<li><i class="am-icon-y-combinator"></i> y-combinator</li>
						<li><i class="am-icon-yc"></i> yc <span class="text-muted">(alias)</span></li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Font Awesome 4.3 新增字体（Amaze UI 2.2 中搭载）</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-bed"></i> bed</li>
						<li><i class="am-icon-buysellads"></i> buysellads</li>
						<li><i class="am-icon-cart-arrow-down"></i> cart-arrow-down</li>
						<li><i class="am-icon-cart-plus"></i> cart-plus</li>
						<li><i class="am-icon-connectdevelop"></i> connectdevelop</li>
						<li><i class="am-icon-dashcube"></i> dashcube</li>
						<li><i class="am-icon-diamond"></i> diamond</li>
						<li><i class="am-icon-facebook-official"></i> facebook-official</li>
						<li><i class="am-icon-forumbee"></i> forumbee</li>
						<li><i class="am-icon-heartbeat"></i> heartbeat</li>
						<li><i class="am-icon-hotel"></i> hotel <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-leanpub"></i> leanpub</li>
						<li><i class="am-icon-mars"></i> mars</li>
						<li><i class="am-icon-mars-double"></i> mars-double</li>
						<li><i class="am-icon-mars-stroke"></i> mars-stroke</li>
						<li><i class="am-icon-mars-stroke-h"></i> mars-stroke-h</li>
						<li><i class="am-icon-mars-stroke-v"></i> mars-stroke-v</li>
						<li><i class="am-icon-medium"></i> medium</li>
						<li><i class="am-icon-mercury"></i> mercury</li>
						<li><i class="am-icon-motorcycle"></i> motorcycle</li>
						<li><i class="am-icon-neuter"></i> neuter</li>
						<li><i class="am-icon-pinterest-p"></i> pinterest-p</li>
						<li><i class="am-icon-sellsy"></i> sellsy</li>
						<li><i class="am-icon-server"></i> server</li>
						<li><i class="am-icon-ship"></i> ship</li>
						<li><i class="am-icon-shirtsinbulk"></i> shirtsinbulk</li>
						<li><i class="am-icon-simplybuilt"></i> simplybuilt</li>
						<li><i class="am-icon-skyatlas"></i> skyatlas</li>
						<li><i class="am-icon-street-view"></i> street-view</li>
						<li><i class="am-icon-subway"></i> subway</li>
						<li><i class="am-icon-train"></i> train</li>
						<li><i class="am-icon-transgender"></i> transgender</li>
						<li><i class="am-icon-transgender-alt"></i> transgender-alt</li>
						<li><i class="am-icon-user-plus"></i> user-plus</li>
						<li><i class="am-icon-user-secret"></i> user-secret</li>
						<li><i class="am-icon-user-times"></i> user-times</li>
						<li><i class="am-icon-venus"></i> venus</li>
						<li><i class="am-icon-venus-double"></i> venus-double</li>
						<li><i class="am-icon-venus-mars"></i> venus-mars</li>
						<li><i class="am-icon-viacoin"></i> viacoin</li>
						<li><i class="am-icon-whatsapp"></i> whatsapp</li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">40 New Icons in 4.2</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-angellist"></i> angellist</li>
						<li><i class="am-icon-area-chart"></i> area-chart</li>
						<li><i class="am-icon-at"></i> at</li>
						<li><i class="am-icon-bell-slash"></i> bell-slash</li>
						<li><i class="am-icon-bell-slash-o"></i> bell-slash-o</li>
						<li><i class="am-icon-bicycle"></i> bicycle</li>
						<li><i class="am-icon-binoculars"></i> binoculars</li>
						<li><i class="am-icon-birthday-cake"></i> birthday-cake</li>
						<li><i class="am-icon-bus"></i> bus</li>
						<li><i class="am-icon-calculator"></i> calculator</li>
						<li><i class="am-icon-cc"></i> cc</li>
						<li><i class="am-icon-cc-amex"></i> cc-amex</li>
						<li><i class="am-icon-cc-discover"></i> cc-discover</li>
						<li><i class="am-icon-cc-mastercard"></i> cc-mastercard</li>
						<li><i class="am-icon-cc-paypal"></i> cc-paypal</li>
						<li><i class="am-icon-cc-stripe"></i> cc-stripe</li>
						<li><i class="am-icon-cc-visa"></i> cc-visa</li>
						<li><i class="am-icon-copyright"></i> copyright</li>
						<li><i class="am-icon-eyedropper"></i> eyedropper</li>
						<li><i class="am-icon-futbol-o"></i> futbol-o</li>
						<li><i class="am-icon-google-wallet"></i> google-wallet</li>
						<li><i class="am-icon-ils"></i> ils</li>
						<li><i class="am-icon-ioxhost"></i> ioxhost</li>
						<li><i class="am-icon-lastfm"></i> lastfm</li>
						<li><i class="am-icon-lastfm-square"></i> lastfm-square</li>
						<li><i class="am-icon-line-chart"></i> line-chart</li>
						<li><i class="am-icon-meanpath"></i> meanpath</li>
						<li><i class="am-icon-newspaper-o"></i> newspaper-o</li>
						<li><i class="am-icon-paint-brush"></i> paint-brush</li>
						<li><i class="am-icon-paypal"></i> paypal</li>
						<li><i class="am-icon-pie-chart"></i> pie-chart</li>
						<li><i class="am-icon-plug"></i> plug</li>
						<li><i class="am-icon-shekel"></i> shekel <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-sheqel"></i> sheqel <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-slideshare"></i> slideshare</li>
						<li><i class="am-icon-soccer-ball-o"></i> soccer-ball-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-toggle-off"></i> toggle-off</li>
						<li><i class="am-icon-toggle-on"></i> toggle-on</li>
						<li><i class="am-icon-trash"></i> trash</li>
						<li><i class="am-icon-tty"></i> tty</li>
						<li><i class="am-icon-twitch"></i> twitch</li>
						<li><i class="am-icon-wifi"></i> wifi</li>
						<li><i class="am-icon-yelp"></i> yelp</li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Web Application Icons</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-adjust"></i> adjust</li>
						<li><i class="am-icon-anchor"></i> anchor</li>
						<li><i class="am-icon-archive"></i> archive</li>
						<li><i class="am-icon-area-chart"></i> area-chart</li>
						<li><i class="am-icon-arrows"></i> arrows</li>
						<li><i class="am-icon-arrows-h"></i> arrows-h</li>
						<li><i class="am-icon-arrows-v"></i> arrows-v</li>
						<li><i class="am-icon-asterisk"></i> asterisk</li>
						<li><i class="am-icon-at"></i> at</li>
						<li><i class="am-icon-automobile"></i> automobile <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-ban"></i> ban</li>
						<li><i class="am-icon-bank"></i> bank <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-bar-chart"></i> bar-chart</li>
						<li><i class="am-icon-bar-chart-o"></i> bar-chart-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-barcode"></i> barcode</li>
						<li><i class="am-icon-bars"></i> bars</li>
						<li><i class="am-icon-beer"></i> beer</li>
						<li><i class="am-icon-bell"></i> bell</li>
						<li><i class="am-icon-bell-o"></i> bell-o</li>
						<li><i class="am-icon-bell-slash"></i> bell-slash</li>
						<li><i class="am-icon-bell-slash-o"></i> bell-slash-o</li>
						<li><i class="am-icon-bicycle"></i> bicycle</li>
						<li><i class="am-icon-binoculars"></i> binoculars</li>
						<li><i class="am-icon-birthday-cake"></i> birthday-cake</li>
						<li><i class="am-icon-bolt"></i> bolt</li>
						<li><i class="am-icon-bomb"></i> bomb</li>
						<li><i class="am-icon-book"></i> book</li>
						<li><i class="am-icon-bookmark"></i> bookmark</li>
						<li><i class="am-icon-bookmark-o"></i> bookmark-o</li>
						<li><i class="am-icon-briefcase"></i> briefcase</li>
						<li><i class="am-icon-bug"></i> bug</li>
						<li><i class="am-icon-building"></i> building</li>
						<li><i class="am-icon-building-o"></i> building-o</li>
						<li><i class="am-icon-bullhorn"></i> bullhorn</li>
						<li><i class="am-icon-bullseye"></i> bullseye</li>
						<li><i class="am-icon-bus"></i> bus</li>
						<li><i class="am-icon-cab"></i> cab <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-calculator"></i> calculator</li>
						<li><i class="am-icon-calendar"></i> calendar</li>
						<li><i class="am-icon-calendar-o"></i> calendar-o</li>
						<li><i class="am-icon-camera"></i> camera</li>
						<li><i class="am-icon-camera-retro"></i> camera-retro</li>
						<li><i class="am-icon-car"></i> car</li>
						<li><i class="am-icon-caret-square-o-down"></i> caret-square-o-down</li>
						<li><i class="am-icon-caret-square-o-left"></i> caret-square-o-left</li>
						<li><i class="am-icon-caret-square-o-right"></i> caret-square-o-right</li>
						<li><i class="am-icon-caret-square-o-up"></i> caret-square-o-up</li>
						<li><i class="am-icon-cc"></i> cc</li>
						<li><i class="am-icon-certificate"></i> certificate</li>
						<li><i class="am-icon-check"></i> check</li>
						<li><i class="am-icon-check-circle"></i> check-circle</li>
						<li><i class="am-icon-check-circle-o"></i> check-circle-o</li>
						<li><i class="am-icon-check-square"></i> check-square</li>
						<li><i class="am-icon-check-square-o"></i> check-square-o</li>
						<li><i class="am-icon-child"></i> child</li>
						<li><i class="am-icon-circle"></i> circle</li>
						<li><i class="am-icon-circle-o"></i> circle-o</li>
						<li><i class="am-icon-circle-o-notch"></i> circle-o-notch</li>
						<li><i class="am-icon-circle-thin"></i> circle-thin</li>
						<li><i class="am-icon-clock-o"></i> clock-o</li>
						<li><i class="am-icon-close"></i> close <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-cloud"></i> cloud</li>
						<li><i class="am-icon-cloud-download"></i> cloud-download</li>
						<li><i class="am-icon-cloud-upload"></i> cloud-upload</li>
						<li><i class="am-icon-code"></i> code</li>
						<li><i class="am-icon-code-fork"></i> code-fork</li>
						<li><i class="am-icon-coffee"></i> coffee</li>
						<li><i class="am-icon-cog"></i> cog</li>
						<li><i class="am-icon-cogs"></i> cogs</li>
						<li><i class="am-icon-comment"></i> comment</li>
						<li><i class="am-icon-comment-o"></i> comment-o</li>
						<li><i class="am-icon-comments"></i> comments</li>
						<li><i class="am-icon-comments-o"></i> comments-o</li>
						<li><i class="am-icon-compass"></i> compass</li>
						<li><i class="am-icon-copyright"></i> copyright</li>
						<li><i class="am-icon-credit-card"></i> credit-card</li>
						<li><i class="am-icon-crop"></i> crop</li>
						<li><i class="am-icon-crosshairs"></i> crosshairs</li>
						<li><i class="am-icon-cube"></i> cube</li>
						<li><i class="am-icon-cubes"></i> cubes</li>
						<li><i class="am-icon-cutlery"></i> cutlery</li>
						<li><i class="am-icon-dashboard"></i> dashboard <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-database"></i> database</li>
						<li><i class="am-icon-desktop"></i> desktop</li>
						<li><i class="am-icon-dot-circle-o"></i> dot-circle-o</li>
						<li><i class="am-icon-download"></i> download</li>
						<li><i class="am-icon-edit"></i> edit <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-ellipsis-h"></i> ellipsis-h</li>
						<li><i class="am-icon-ellipsis-v"></i> ellipsis-v</li>
						<li><i class="am-icon-envelope"></i> envelope</li>
						<li><i class="am-icon-envelope-o"></i> envelope-o</li>
						<li><i class="am-icon-envelope-square"></i> envelope-square</li>
						<li><i class="am-icon-eraser"></i> eraser</li>
						<li><i class="am-icon-exchange"></i> exchange</li>
						<li><i class="am-icon-exclamation"></i> exclamation</li>
						<li><i class="am-icon-exclamation-circle"></i> exclamation-circle</li>
						<li><i class="am-icon-exclamation-triangle"></i> exclamation-triangle</li>
						<li><i class="am-icon-external-link"></i> external-link</li>
						<li><i class="am-icon-external-link-square"></i> external-link-square</li>
						<li><i class="am-icon-eye"></i> eye</li>
						<li><i class="am-icon-eye-slash"></i> eye-slash</li>
						<li><i class="am-icon-eyedropper"></i> eyedropper</li>
						<li><i class="am-icon-fax"></i> fax</li>
						<li><i class="am-icon-female"></i> female</li>
						<li><i class="am-icon-fighter-jet"></i> fighter-jet</li>
						<li><i class="am-icon-file-archive-o"></i> file-archive-o</li>
						<li><i class="am-icon-file-audio-o"></i> file-audio-o</li>
						<li><i class="am-icon-file-code-o"></i> file-code-o</li>
						<li><i class="am-icon-file-excel-o"></i> file-excel-o</li>
						<li><i class="am-icon-file-image-o"></i> file-image-o</li>
						<li><i class="am-icon-file-movie-o"></i> file-movie-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-file-pdf-o"></i> file-pdf-o</li>
						<li><i class="am-icon-file-photo-o"></i> file-photo-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-file-picture-o"></i> file-picture-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-file-powerpoint-o"></i> file-powerpoint-o</li>
						<li><i class="am-icon-file-sound-o"></i> file-sound-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-file-video-o"></i> file-video-o</li>
						<li><i class="am-icon-file-word-o"></i> file-word-o</li>
						<li><i class="am-icon-file-zip-o"></i> file-zip-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-film"></i> film</li>
						<li><i class="am-icon-filter"></i> filter</li>
						<li><i class="am-icon-fire"></i> fire</li>
						<li><i class="am-icon-fire-extinguisher"></i> fire-extinguisher</li>
						<li><i class="am-icon-flag"></i> flag</li>
						<li><i class="am-icon-flag-checkered"></i> flag-checkered</li>
						<li><i class="am-icon-flag-o"></i> flag-o</li>
						<li><i class="am-icon-flash"></i> flash <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-flask"></i> flask</li>
						<li><i class="am-icon-folder"></i> folder</li>
						<li><i class="am-icon-folder-o"></i> folder-o</li>
						<li><i class="am-icon-folder-open"></i> folder-open</li>
						<li><i class="am-icon-folder-open-o"></i> folder-open-o</li>
						<li><i class="am-icon-frown-o"></i> frown-o</li>
						<li><i class="am-icon-futbol-o"></i> futbol-o</li>
						<li><i class="am-icon-gamepad"></i> gamepad</li>
						<li><i class="am-icon-gavel"></i> gavel</li>
						<li><i class="am-icon-gear"></i> gear <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-gears"></i> gears <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-gift"></i> gift</li>
						<li><i class="am-icon-glass"></i> glass</li>
						<li><i class="am-icon-globe"></i> globe</li>
						<li><i class="am-icon-graduation-cap"></i> graduation-cap</li>
						<li><i class="am-icon-group"></i> group <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-hdd-o"></i> hdd-o</li>
						<li><i class="am-icon-headphones"></i> headphones</li>
						<li><i class="am-icon-heart"></i> heart</li>
						<li><i class="am-icon-heart-o"></i> heart-o</li>
						<li><i class="am-icon-history"></i> history</li>
						<li><i class="am-icon-home"></i> home</li>
						<li><i class="am-icon-image"></i> image <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-inbox"></i> inbox</li>
						<li><i class="am-icon-info"></i> info</li>
						<li><i class="am-icon-info-circle"></i> info-circle</li>
						<li><i class="am-icon-institution"></i> institution <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-key"></i> key</li>
						<li><i class="am-icon-keyboard-o"></i> keyboard-o</li>
						<li><i class="am-icon-language"></i> language</li>
						<li><i class="am-icon-laptop"></i> laptop</li>
						<li><i class="am-icon-leaf"></i> leaf</li>
						<li><i class="am-icon-legal"></i> legal <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-lemon-o"></i> lemon-o</li>
						<li><i class="am-icon-level-down"></i> level-down</li>
						<li><i class="am-icon-level-up"></i> level-up</li>
						<li><i class="am-icon-life-bouy"></i> life-bouy <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-life-buoy"></i> life-buoy <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-life-ring"></i> life-ring</li>
						<li><i class="am-icon-life-saver"></i> life-saver <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-lightbulb-o"></i> lightbulb-o</li>
						<li><i class="am-icon-line-chart"></i> line-chart</li>
						<li><i class="am-icon-location-arrow"></i> location-arrow</li>
						<li><i class="am-icon-lock"></i> lock</li>
						<li><i class="am-icon-magic"></i> magic</li>
						<li><i class="am-icon-magnet"></i> magnet</li>
						<li><i class="am-icon-mail-forward"></i> mail-forward <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-mail-reply"></i> mail-reply <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-mail-reply-all"></i> mail-reply-all <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-male"></i> male</li>
						<li><i class="am-icon-map-marker"></i> map-marker</li>
						<li><i class="am-icon-meh-o"></i> meh-o</li>
						<li><i class="am-icon-microphone"></i> microphone</li>
						<li><i class="am-icon-microphone-slash"></i> microphone-slash</li>
						<li><i class="am-icon-minus"></i> minus</li>
						<li><i class="am-icon-minus-circle"></i> minus-circle</li>
						<li><i class="am-icon-minus-square"></i> minus-square</li>
						<li><i class="am-icon-minus-square-o"></i> minus-square-o</li>
						<li><i class="am-icon-mobile"></i> mobile</li>
						<li><i class="am-icon-mobile-phone"></i> mobile-phone <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-money"></i> money</li>
						<li><i class="am-icon-moon-o"></i> moon-o</li>
						<li><i class="am-icon-mortar-board"></i> mortar-board <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-music"></i> music</li>
						<li><i class="am-icon-navicon"></i> navicon <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-newspaper-o"></i> newspaper-o</li>
						<li><i class="am-icon-paint-brush"></i> paint-brush</li>
						<li><i class="am-icon-paper-plane"></i> paper-plane</li>
						<li><i class="am-icon-paper-plane-o"></i> paper-plane-o</li>
						<li><i class="am-icon-paw"></i> paw</li>
						<li><i class="am-icon-pencil"></i> pencil</li>
						<li><i class="am-icon-pencil-square"></i> pencil-square</li>
						<li><i class="am-icon-pencil-square-o"></i> pencil-square-o</li>
						<li><i class="am-icon-phone"></i> phone</li>
						<li><i class="am-icon-phone-square"></i> phone-square</li>
						<li><i class="am-icon-photo"></i> photo <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-picture-o"></i> picture-o</li>
						<li><i class="am-icon-pie-chart"></i> pie-chart</li>
						<li><i class="am-icon-plane"></i> plane</li>
						<li><i class="am-icon-plug"></i> plug</li>
						<li><i class="am-icon-plus"></i> plus</li>
						<li><i class="am-icon-plus-circle"></i> plus-circle</li>
						<li><i class="am-icon-plus-square"></i> plus-square</li>
						<li><i class="am-icon-plus-square-o"></i> plus-square-o</li>
						<li><i class="am-icon-power-off"></i> power-off</li>
						<li><i class="am-icon-print"></i> print</li>
						<li><i class="am-icon-puzzle-piece"></i> puzzle-piece</li>
						<li><i class="am-icon-qrcode"></i> qrcode</li>
						<li><i class="am-icon-question"></i> question</li>
						<li><i class="am-icon-question-circle"></i> question-circle</li>
						<li><i class="am-icon-quote-left"></i> quote-left</li>
						<li><i class="am-icon-quote-right"></i> quote-right</li>
						<li><i class="am-icon-random"></i> random</li>
						<li><i class="am-icon-recycle"></i> recycle</li>
						<li><i class="am-icon-refresh"></i> refresh</li>
						<li><i class="am-icon-remove"></i> remove <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-reorder"></i> reorder <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-reply"></i> reply</li>
						<li><i class="am-icon-reply-all"></i> reply-all</li>
						<li><i class="am-icon-retweet"></i> retweet</li>
						<li><i class="am-icon-road"></i> road</li>
						<li><i class="am-icon-rocket"></i> rocket</li>
						<li><i class="am-icon-rss"></i> rss</li>
						<li><i class="am-icon-rss-square"></i> rss-square</li>
						<li><i class="am-icon-search"></i> search</li>
						<li><i class="am-icon-search-minus"></i> search-minus</li>
						<li><i class="am-icon-search-plus"></i> search-plus</li>
						<li><i class="am-icon-send"></i> send <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-send-o"></i> send-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-share"></i> share</li>
						<li><i class="am-icon-share-alt"></i> share-alt</li>
						<li><i class="am-icon-share-alt-square"></i> share-alt-square</li>
						<li><i class="am-icon-share-square"></i> share-square</li>
						<li><i class="am-icon-share-square-o"></i> share-square-o</li>
						<li><i class="am-icon-shield"></i> shield</li>
						<li><i class="am-icon-shopping-cart"></i> shopping-cart</li>
						<li><i class="am-icon-sign-in"></i> sign-in</li>
						<li><i class="am-icon-sign-out"></i> sign-out</li>
						<li><i class="am-icon-signal"></i> signal</li>
						<li><i class="am-icon-sitemap"></i> sitemap</li>
						<li><i class="am-icon-sliders"></i> sliders</li>
						<li><i class="am-icon-smile-o"></i> smile-o</li>
						<li><i class="am-icon-soccer-ball-o"></i> soccer-ball-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-sort"></i> sort</li>
						<li><i class="am-icon-sort-alpha-asc"></i> sort-alpha-asc</li>
						<li><i class="am-icon-sort-alpha-desc"></i> sort-alpha-desc</li>
						<li><i class="am-icon-sort-amount-asc"></i> sort-amount-asc</li>
						<li><i class="am-icon-sort-amount-desc"></i> sort-amount-desc</li>
						<li><i class="am-icon-sort-asc"></i> sort-asc</li>
						<li><i class="am-icon-sort-desc"></i> sort-desc</li>
						<li><i class="am-icon-sort-down"></i> sort-down <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-sort-numeric-asc"></i> sort-numeric-asc</li>
						<li><i class="am-icon-sort-numeric-desc"></i> sort-numeric-desc</li>
						<li><i class="am-icon-sort-up"></i> sort-up <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-space-shuttle"></i> space-shuttle</li>
						<li><i class="am-icon-spinner"></i> spinner</li>
						<li><i class="am-icon-spoon"></i> spoon</li>
						<li><i class="am-icon-square"></i> square</li>
						<li><i class="am-icon-square-o"></i> square-o</li>
						<li><i class="am-icon-star"></i> star</li>
						<li><i class="am-icon-star-half"></i> star-half</li>
						<li><i class="am-icon-star-half-empty"></i> star-half-empty <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-star-half-full"></i> star-half-full <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-star-half-o"></i> star-half-o</li>
						<li><i class="am-icon-star-o"></i> star-o</li>
						<li><i class="am-icon-suitcase"></i> suitcase</li>
						<li><i class="am-icon-sun-o"></i> sun-o</li>
						<li><i class="am-icon-support"></i> support <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-tablet"></i> tablet</li>
						<li><i class="am-icon-tachometer"></i> tachometer</li>
						<li><i class="am-icon-tag"></i> tag</li>
						<li><i class="am-icon-tags"></i> tags</li>
						<li><i class="am-icon-tasks"></i> tasks</li>
						<li><i class="am-icon-taxi"></i> taxi</li>
						<li><i class="am-icon-terminal"></i> terminal</li>
						<li><i class="am-icon-thumb-tack"></i> thumb-tack</li>
						<li><i class="am-icon-thumbs-down"></i> thumbs-down</li>
						<li><i class="am-icon-thumbs-o-down"></i> thumbs-o-down</li>
						<li><i class="am-icon-thumbs-o-up"></i> thumbs-o-up</li>
						<li><i class="am-icon-thumbs-up"></i> thumbs-up</li>
						<li><i class="am-icon-ticket"></i> ticket</li>
						<li><i class="am-icon-times"></i> times</li>
						<li><i class="am-icon-times-circle"></i> times-circle</li>
						<li><i class="am-icon-times-circle-o"></i> times-circle-o</li>
						<li><i class="am-icon-tint"></i> tint</li>
						<li><i class="am-icon-toggle-down"></i> toggle-down <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-toggle-left"></i> toggle-left <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-toggle-off"></i> toggle-off</li>
						<li><i class="am-icon-toggle-on"></i> toggle-on</li>
						<li><i class="am-icon-toggle-right"></i> toggle-right <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-toggle-up"></i> toggle-up <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-trash"></i> trash</li>
						<li><i class="am-icon-trash-o"></i> trash-o</li>
						<li><i class="am-icon-tree"></i> tree</li>
						<li><i class="am-icon-trophy"></i> trophy</li>
						<li><i class="am-icon-truck"></i> truck</li>
						<li><i class="am-icon-tty"></i> tty</li>
						<li><i class="am-icon-umbrella"></i> umbrella</li>
						<li><i class="am-icon-university"></i> university</li>
						<li><i class="am-icon-unlock"></i> unlock</li>
						<li><i class="am-icon-unlock-alt"></i> unlock-alt</li>
						<li><i class="am-icon-unsorted"></i> unsorted <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-upload"></i> upload</li>
						<li><i class="am-icon-user"></i> user</li>
						<li><i class="am-icon-users"></i> users</li>
						<li><i class="am-icon-video-camera"></i> video-camera</li>
						<li><i class="am-icon-volume-down"></i> volume-down</li>
						<li><i class="am-icon-volume-off"></i> volume-off</li>
						<li><i class="am-icon-volume-up"></i> volume-up</li>
						<li><i class="am-icon-warning"></i> warning <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-wheelchair"></i> wheelchair</li>
						<li><i class="am-icon-wifi"></i> wifi</li>
						<li><i class="am-icon-wrench"></i> wrench</li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">File Type Icons</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-file"></i> file</li>
						<li><i class="am-icon-file-archive-o"></i> file-archive-o</li>
						<li><i class="am-icon-file-audio-o"></i> file-audio-o</li>
						<li><i class="am-icon-file-code-o"></i> file-code-o</li>
						<li><i class="am-icon-file-excel-o"></i> file-excel-o</li>
						<li><i class="am-icon-file-image-o"></i> file-image-o</li>
						<li><i class="am-icon-file-movie-o"></i> file-movie-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-file-o"></i> file-o</li>
						<li><i class="am-icon-file-pdf-o"></i> file-pdf-o</li>
						<li><i class="am-icon-file-photo-o"></i> file-photo-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-file-picture-o"></i> file-picture-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-file-powerpoint-o"></i> file-powerpoint-o</li>
						<li><i class="am-icon-file-sound-o"></i> file-sound-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-file-text"></i> file-text</li>
						<li><i class="am-icon-file-text-o"></i> file-text-o</li>
						<li><i class="am-icon-file-video-o"></i> file-video-o</li>
						<li><i class="am-icon-file-word-o"></i> file-word-o</li>
						<li><i class="am-icon-file-zip-o"></i> file-zip-o <span class="text-muted">(alias)</span></li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Spinner Icons</h2>
					<div class="am-alert am-alert-success"><i class="am-icon-info-circle lg li"></i> These icons work great with the <code>am-icon-spin</code> class. Check out the <a href="#" class="alert-link">spinning icons example</a>.</div>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-circle-o-notch"></i> circle-o-notch</li>
						<li><i class="am-icon-cog"></i> cog</li>
						<li><i class="am-icon-gear"></i> gear <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-refresh"></i> refresh</li>
						<li><i class="am-icon-spinner"></i> spinner</li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Form Control Icons</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-check-square"></i> check-square</li>
						<li><i class="am-icon-check-square-o"></i> check-square-o</li>
						<li><i class="am-icon-circle"></i> circle</li>
						<li><i class="am-icon-circle-o"></i> circle-o</li>
						<li><i class="am-icon-dot-circle-o"></i> dot-circle-o</li>
						<li><i class="am-icon-minus-square"></i> minus-square</li>
						<li><i class="am-icon-minus-square-o"></i> minus-square-o</li>
						<li><i class="am-icon-plus-square"></i> plus-square</li>
						<li><i class="am-icon-plus-square-o"></i> plus-square-o</li>
						<li><i class="am-icon-square"></i> square</li>
						<li><i class="am-icon-square-o"></i> square-o</li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Payment Icons</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-cc-amex"></i> cc-amex</li>
						<li><i class="am-icon-cc-discover"></i> cc-discover</li>
						<li><i class="am-icon-cc-mastercard"></i> cc-mastercard</li>
						<li><i class="am-icon-cc-paypal"></i> cc-paypal</li>
						<li><i class="am-icon-cc-stripe"></i> cc-stripe</li>
						<li><i class="am-icon-cc-visa"></i> cc-visa</li>
						<li><i class="am-icon-credit-card"></i> credit-card</li>
						<li><i class="am-icon-google-wallet"></i> google-wallet</li>
						<li><i class="am-icon-paypal"></i> paypal</li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Chart Icons</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-area-chart"></i> area-chart</li>
						<li><i class="am-icon-bar-chart"></i> bar-chart</li>
						<li><i class="am-icon-bar-chart-o"></i> bar-chart-o <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-line-chart"></i> line-chart</li>
						<li><i class="am-icon-pie-chart"></i> pie-chart</li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Currency Icons</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-bitcoin"></i> bitcoin <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-btc"></i> btc</li>
						<li><i class="am-icon-cny"></i> cny <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-dollar"></i> dollar <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-eur"></i> eur</li>
						<li><i class="am-icon-euro"></i> euro <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-gbp"></i> gbp</li>
						<li><i class="am-icon-ils"></i> ils</li>
						<li><i class="am-icon-inr"></i> inr</li>
						<li><i class="am-icon-jpy"></i> jpy</li>
						<li><i class="am-icon-krw"></i> krw</li>
						<li><i class="am-icon-money"></i> money</li>
						<li><i class="am-icon-rmb"></i> rmb <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-rouble"></i> rouble <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-rub"></i> rub</li>
						<li><i class="am-icon-ruble"></i> ruble <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-rupee"></i> rupee <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-shekel"></i> shekel <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-sheqel"></i> sheqel <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-try"></i> try</li>
						<li><i class="am-icon-turkish-lira"></i> turkish-lira <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-usd"></i> usd</li>
						<li><i class="am-icon-won"></i> won <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-yen"></i> yen <span class="text-muted">(alias)</span></li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Text Editor Icons</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-align-center"></i> align-center</li>
						<li><i class="am-icon-align-justify"></i> align-justify</li>
						<li><i class="am-icon-align-left"></i> align-left</li>
						<li><i class="am-icon-align-right"></i> align-right</li>
						<li><i class="am-icon-bold"></i> bold</li>
						<li><i class="am-icon-chain"></i> chain <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-chain-broken"></i> chain-broken</li>
						<li><i class="am-icon-clipboard"></i> clipboard</li>
						<li><i class="am-icon-columns"></i> columns</li>
						<li><i class="am-icon-copy"></i> copy <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-cut"></i> cut <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-dedent"></i> dedent <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-eraser"></i> eraser</li>
						<li><i class="am-icon-file"></i> file</li>
						<li><i class="am-icon-file-o"></i> file-o</li>
						<li><i class="am-icon-file-text"></i> file-text</li>
						<li><i class="am-icon-file-text-o"></i> file-text-o</li>
						<li><i class="am-icon-files-o"></i> files-o</li>
						<li><i class="am-icon-floppy-o"></i> floppy-o</li>
						<li><i class="am-icon-font"></i> font</li>
						<li><i class="am-icon-header"></i> header</li>
						<li><i class="am-icon-indent"></i> indent</li>
						<li><i class="am-icon-italic"></i> italic</li>
						<li><i class="am-icon-link"></i> link</li>
						<li><i class="am-icon-list"></i> list</li>
						<li><i class="am-icon-list-alt"></i> list-alt</li>
						<li><i class="am-icon-list-ol"></i> list-ol</li>
						<li><i class="am-icon-list-ul"></i> list-ul</li>
						<li><i class="am-icon-outdent"></i> outdent</li>
						<li><i class="am-icon-paperclip"></i> paperclip</li>
						<li><i class="am-icon-paragraph"></i> paragraph</li>
						<li><i class="am-icon-paste"></i> paste <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-repeat"></i> repeat</li>
						<li><i class="am-icon-rotate-left"></i> rotate-left <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-rotate-right"></i> rotate-right <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-save"></i> save <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-scissors"></i> scissors</li>
						<li><i class="am-icon-strikethrough"></i> strikethrough</li>
						<li><i class="am-icon-subscript"></i> subscript</li>
						<li><i class="am-icon-superscript"></i> superscript</li>
						<li><i class="am-icon-table"></i> table</li>
						<li><i class="am-icon-text-height"></i> text-height</li>
						<li><i class="am-icon-text-width"></i> text-width</li>
						<li><i class="am-icon-th"></i> th</li>
						<li><i class="am-icon-th-large"></i> th-large</li>
						<li><i class="am-icon-th-list"></i> th-list</li>
						<li><i class="am-icon-underline"></i> underline</li>
						<li><i class="am-icon-undo"></i> undo</li>
						<li><i class="am-icon-unlink"></i> unlink <span class="text-muted">(alias)</span></li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Directional Icons</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-angle-double-down"></i> angle-double-down</li>
						<li><i class="am-icon-angle-double-left"></i> angle-double-left</li>
						<li><i class="am-icon-angle-double-right"></i> angle-double-right</li>
						<li><i class="am-icon-angle-double-up"></i> angle-double-up</li>
						<li><i class="am-icon-angle-down"></i> angle-down</li>
						<li><i class="am-icon-angle-left"></i> angle-left</li>
						<li><i class="am-icon-angle-right"></i> angle-right</li>
						<li><i class="am-icon-angle-up"></i> angle-up</li>
						<li><i class="am-icon-arrow-circle-down"></i> arrow-circle-down</li>
						<li><i class="am-icon-arrow-circle-left"></i> arrow-circle-left</li>
						<li><i class="am-icon-arrow-circle-o-down"></i> arrow-circle-o-down</li>
						<li><i class="am-icon-arrow-circle-o-left"></i> arrow-circle-o-left</li>
						<li><i class="am-icon-arrow-circle-o-right"></i> arrow-circle-o-right</li>
						<li><i class="am-icon-arrow-circle-o-up"></i> arrow-circle-o-up</li>
						<li><i class="am-icon-arrow-circle-right"></i> arrow-circle-right</li>
						<li><i class="am-icon-arrow-circle-up"></i> arrow-circle-up</li>
						<li><i class="am-icon-arrow-down"></i> arrow-down</li>
						<li><i class="am-icon-arrow-left"></i> arrow-left</li>
						<li><i class="am-icon-arrow-right"></i> arrow-right</li>
						<li><i class="am-icon-arrow-up"></i> arrow-up</li>
						<li><i class="am-icon-arrows"></i> arrows</li>
						<li><i class="am-icon-arrows-alt"></i> arrows-alt</li>
						<li><i class="am-icon-arrows-h"></i> arrows-h</li>
						<li><i class="am-icon-arrows-v"></i> arrows-v</li>
						<li><i class="am-icon-caret-down"></i> caret-down</li>
						<li><i class="am-icon-caret-left"></i> caret-left</li>
						<li><i class="am-icon-caret-right"></i> caret-right</li>
						<li><i class="am-icon-caret-square-o-down"></i> caret-square-o-down</li>
						<li><i class="am-icon-caret-square-o-left"></i> caret-square-o-left</li>
						<li><i class="am-icon-caret-square-o-right"></i> caret-square-o-right</li>
						<li><i class="am-icon-caret-square-o-up"></i> caret-square-o-up</li>
						<li><i class="am-icon-caret-up"></i> caret-up</li>
						<li><i class="am-icon-chevron-circle-down"></i> chevron-circle-down</li>
						<li><i class="am-icon-chevron-circle-left"></i> chevron-circle-left</li>
						<li><i class="am-icon-chevron-circle-right"></i> chevron-circle-right</li>
						<li><i class="am-icon-chevron-circle-up"></i> chevron-circle-up</li>
						<li><i class="am-icon-chevron-down"></i> chevron-down</li>
						<li><i class="am-icon-chevron-left"></i> chevron-left</li>
						<li><i class="am-icon-chevron-right"></i> chevron-right</li>
						<li><i class="am-icon-chevron-up"></i> chevron-up</li>
						<li><i class="am-icon-hand-o-down"></i> hand-o-down</li>
						<li><i class="am-icon-hand-o-left"></i> hand-o-left</li>
						<li><i class="am-icon-hand-o-right"></i> hand-o-right</li>
						<li><i class="am-icon-hand-o-up"></i> hand-o-up</li>
						<li><i class="am-icon-long-arrow-down"></i> long-arrow-down</li>
						<li><i class="am-icon-long-arrow-left"></i> long-arrow-left</li>
						<li><i class="am-icon-long-arrow-right"></i> long-arrow-right</li>
						<li><i class="am-icon-long-arrow-up"></i> long-arrow-up</li>
						<li><i class="am-icon-toggle-down"></i> toggle-down <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-toggle-left"></i> toggle-left <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-toggle-right"></i> toggle-right <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-toggle-up"></i> toggle-up <span class="text-muted">(alias)</span></li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Video Player Icons</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-arrows-alt"></i> arrows-alt</li>
						<li><i class="am-icon-backward"></i> backward</li>
						<li><i class="am-icon-compress"></i> compress</li>
						<li><i class="am-icon-eject"></i> eject</li>
						<li><i class="am-icon-expand"></i> expand</li>
						<li><i class="am-icon-fast-backward"></i> fast-backward</li>
						<li><i class="am-icon-fast-forward"></i> fast-forward</li>
						<li><i class="am-icon-forward"></i> forward</li>
						<li><i class="am-icon-pause"></i> pause</li>
						<li><i class="am-icon-play"></i> play</li>
						<li><i class="am-icon-play-circle"></i> play-circle</li>
						<li><i class="am-icon-play-circle-o"></i> play-circle-o</li>
						<li><i class="am-icon-step-backward"></i> step-backward</li>
						<li><i class="am-icon-step-forward"></i> step-forward</li>
						<li><i class="am-icon-stop"></i> stop</li>
						<li><i class="am-icon-youtube-play"></i> youtube-play</li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Brand Icons</h2>
					<div class="am-alert am-alert-success">
						<ul class="margin-bottom-none padding-left-lg">
							<li>All brand icons are trademarks of their respective owners.</li>
							<li>The use of these trademarks does not indicate endorsement of the trademark holder by Font Awesome, nor vice versa.</li>
						</ul>
					</div>
					<div class="am-alert am-alert-warning"><h4><i class="am-icon-warning"></i> Warning!</h4>Apparently, Adblock Plus can remove Font Awesome brand icons with their "Remove Social Media Buttons" setting. We will not use hacks to force them to display. Please <a href="#" class="alert-link">report an issue with Adblock Plus</a> if you believe this to be an error. To work around this, you'll need to modify the social icon class names.</div>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-adn"></i> adn</li>
						<li><i class="am-icon-android"></i> android</li>
						<li><i class="am-icon-angellist"></i> angellist</li>
						<li><i class="am-icon-apple"></i> apple</li>
						<li><i class="am-icon-behance"></i> behance</li>
						<li><i class="am-icon-behance-square"></i> behance-square</li>
						<li><i class="am-icon-bitbucket"></i> bitbucket</li>
						<li><i class="am-icon-bitbucket-square"></i> bitbucket-square</li>
						<li><i class="am-icon-bitcoin"></i> bitcoin <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-btc"></i> btc</li>
						<li><i class="am-icon-cc-amex"></i> cc-amex</li>
						<li><i class="am-icon-cc-discover"></i> cc-discover</li>
						<li><i class="am-icon-cc-mastercard"></i> cc-mastercard</li>
						<li><i class="am-icon-cc-paypal"></i> cc-paypal</li>
						<li><i class="am-icon-cc-stripe"></i> cc-stripe</li>
						<li><i class="am-icon-cc-visa"></i> cc-visa</li>
						<li><i class="am-icon-codepen"></i> codepen</li>
						<li><i class="am-icon-css3"></i> css3</li>
						<li><i class="am-icon-delicious"></i> delicious</li>
						<li><i class="am-icon-deviantart"></i> deviantart</li>
						<li><i class="am-icon-digg"></i> digg</li>
						<li><i class="am-icon-dribbble"></i> dribbble</li>
						<li><i class="am-icon-dropbox"></i> dropbox</li>
						<li><i class="am-icon-drupal"></i> drupal</li>
						<li><i class="am-icon-empire"></i> empire</li>
						<li><i class="am-icon-facebook"></i> facebook</li>
						<li><i class="am-icon-facebook-square"></i> facebook-square</li>
						<li><i class="am-icon-flickr"></i> flickr</li>
						<li><i class="am-icon-foursquare"></i> foursquare</li>
						<li><i class="am-icon-ge"></i> ge <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-git"></i> git</li>
						<li><i class="am-icon-git-square"></i> git-square</li>
						<li><i class="am-icon-github"></i> github</li>
						<li><i class="am-icon-github-alt"></i> github-alt</li>
						<li><i class="am-icon-github-square"></i> github-square</li>
						<li><i class="am-icon-gittip"></i> gittip</li>
						<li><i class="am-icon-google"></i> google</li>
						<li><i class="am-icon-google-plus"></i> google-plus</li>
						<li><i class="am-icon-google-plus-square"></i> google-plus-square</li>
						<li><i class="am-icon-google-wallet"></i> google-wallet</li>
						<li><i class="am-icon-hacker-news"></i> hacker-news</li>
						<li><i class="am-icon-html5"></i> html5</li>
						<li><i class="am-icon-instagram"></i> instagram</li>
						<li><i class="am-icon-ioxhost"></i> ioxhost</li>
						<li><i class="am-icon-joomla"></i> joomla</li>
						<li><i class="am-icon-jsfiddle"></i> jsfiddle</li>
						<li><i class="am-icon-lastfm"></i> lastfm</li>
						<li><i class="am-icon-lastfm-square"></i> lastfm-square</li>
						<li><i class="am-icon-linkedin"></i> linkedin</li>
						<li><i class="am-icon-linkedin-square"></i> linkedin-square</li>
						<li><i class="am-icon-linux"></i> linux</li>
						<li><i class="am-icon-maxcdn"></i> maxcdn</li>
						<li><i class="am-icon-meanpath"></i> meanpath</li>
						<li><i class="am-icon-openid"></i> openid</li>
						<li><i class="am-icon-pagelines"></i> pagelines</li>
						<li><i class="am-icon-paypal"></i> paypal</li>
						<li><i class="am-icon-pied-piper"></i> pied-piper</li>
						<li><i class="am-icon-pied-piper-alt"></i> pied-piper-alt</li>
						<li><i class="am-icon-pinterest"></i> pinterest</li>
						<li><i class="am-icon-pinterest-square"></i> pinterest-square</li>
						<li><i class="am-icon-qq"></i> qq</li>
						<li><i class="am-icon-ra"></i> ra <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-rebel"></i> rebel</li>
						<li><i class="am-icon-reddit"></i> reddit</li>
						<li><i class="am-icon-reddit-square"></i> reddit-square</li>
						<li><i class="am-icon-renren"></i> renren</li>
						<li><i class="am-icon-share-alt"></i> share-alt</li>
						<li><i class="am-icon-share-alt-square"></i> share-alt-square</li>
						<li><i class="am-icon-skype"></i> skype</li>
						<li><i class="am-icon-slack"></i> slack</li>
						<li><i class="am-icon-slideshare"></i> slideshare</li>
						<li><i class="am-icon-soundcloud"></i> soundcloud</li>
						<li><i class="am-icon-spotify"></i> spotify</li>
						<li><i class="am-icon-stack-exchange"></i> stack-exchange</li>
						<li><i class="am-icon-stack-overflow"></i> stack-overflow</li>
						<li><i class="am-icon-steam"></i> steam</li>
						<li><i class="am-icon-steam-square"></i> steam-square</li>
						<li><i class="am-icon-stumbleupon"></i> stumbleupon</li>
						<li><i class="am-icon-stumbleupon-circle"></i> stumbleupon-circle</li>
						<li><i class="am-icon-tencent-weibo"></i> tencent-weibo</li>
						<li><i class="am-icon-trello"></i> trello</li>
						<li><i class="am-icon-tumblr"></i> tumblr</li>
						<li><i class="am-icon-tumblr-square"></i> tumblr-square</li>
						<li><i class="am-icon-twitch"></i> twitch</li>
						<li><i class="am-icon-twitter"></i> twitter</li>
						<li><i class="am-icon-twitter-square"></i> twitter-square</li>
						<li><i class="am-icon-vimeo-square"></i> vimeo-square</li>
						<li><i class="am-icon-vine"></i> vine</li>
						<li><i class="am-icon-vk"></i> vk</li>
						<li><i class="am-icon-wechat"></i> wechat <span class="text-muted">(alias)</span></li>
						<li><i class="am-icon-weibo"></i> weibo</li>
						<li><i class="am-icon-weixin"></i> weixin</li>
						<li><i class="am-icon-windows"></i> windows</li>
						<li><i class="am-icon-wordpress"></i> wordpress</li>
						<li><i class="am-icon-xing"></i> xing</li>
						<li><i class="am-icon-xing-square"></i> xing-square</li>
						<li><i class="am-icon-yahoo"></i> yahoo</li>
						<li><i class="am-icon-yelp"></i> yelp</li>
						<li><i class="am-icon-youtube"></i> youtube</li>
						<li><i class="am-icon-youtube-play"></i> youtube-play</li>
						<li><i class="am-icon-youtube-square"></i> youtube-square</li>
					</ul>
				</section>
				<section>
					<h2 class="doc-icon-hd">Medical Icons</h2>
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 doc-icon-list">
						<li><i class="am-icon-ambulance"></i> ambulance</li>
						<li><i class="am-icon-h-square"></i> h-square</li>
						<li><i class="am-icon-hospital-o"></i> hospital-o</li>
						<li><i class="am-icon-medkit"></i> medkit</li>
						<li><i class="am-icon-plus-square"></i> plus-square</li>
						<li><i class="am-icon-stethoscope"></i> stethoscope</li>
						<li><i class="am-icon-user-md"></i> user-md</li>
						<li><i class="am-icon-wheelchair"></i> wheelchair</li>
					</ul>
				</section>
			</div>
			<div class="ds-thread" data-thread-key="40f954740d6fff9f233876f4f2ead918" data-title="CSS - Icon|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>