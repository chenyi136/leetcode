<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用 - Faq|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="0"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_start.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#shi-yong-wen-ti">使用问题</a>
							<ul class="am-collapse">
								<li><a href="#shi-yong-shi-yu-dao-wen-ti-ru-he-zhun-que-ding-wei-">使用时遇到问题如何准确定位？</a></li>
								<li><a href="#mian-fei-ma-">免费吗？</a></li>
								<li><a href="#amaze-ui-mu-qian-mei-you-xx-zu-jian-you-mei-you-tui-jian-de-">Amaze UI 目前没有 xx 组件，有没有推荐的？</a></li>
								<li><a href="#ai-shang-yi-pi-ye-ma-ke-ni-de-jia-li-mei-you-cao-yuan-">「爱上一匹野马，可你的家里没有草原…」？</a></li>
								<li><a href="#kao-bei-ye-mian-zhong-de-shi-li-dai-ma-nian-tie-yi-hou-mei-you-xiao-guo-">拷贝页面中的示例代码粘贴以后没有效果？</a></li>
								<li><a href="#js-dong-tai-cha-ru-de-dom-shi-jian-shi-xiao-">JS 动态插入的 DOM 事件失效？</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="chang-jian-wen-ti">常见问题 <a href="#chang-jian-wen-ti" class="doc-anchor"></a></h1>
			<hr>
			<h2 id="shi-yong-wen-ti">使用问题 <a href="#shi-yong-wen-ti" class="doc-anchor"></a></h2>
			<h3 id="shi-yong-shi-yu-dao-wen-ti-ru-he-zhun-que-ding-wei-">使用时遇到问题如何准确定位？ <a href="#shi-yong-shi-yu-dao-wen-ti-ru-he-zhun-que-ding-wei-" class="doc-anchor"></a></h3>
			<p>推荐使用 Chrome 开发者工具：</p>
			<ul>
				<li><a href="#">Chrome 开发者工具官方文档</a></li>
				<li><a href="#">使用 Chrome 开发者工具进行 JavaScript 问题定位与调试</a></li>
				<li><a href="#">Google Chrome浏览器开发工具详细教程</a></li>
			</ul>
			<p>也可以 Firebug 等工具。</p>
			<h3 id="mian-fei-ma-">免费吗？ <a href="#mian-fei-ma-" class="doc-anchor"></a></h3>
			<p>MIT License，写得很清楚。至于看见广告什么的，都是浮云……</p>
			<h3 id="amaze-ui-mu-qian-mei-you-xx-zu-jian-you-mei-you-tui-jian-de-">Amaze UI 目前没有 xx 组件，有没有推荐的？ <a href="#amaze-ui-mu-qian-mei-you-xx-zu-jian-you-mei-you-tui-jian-de-" class="doc-anchor"></a></h3>
			<p>首先，<strong>确保查看了每个栏目的下面的左侧菜单的每个链接</strong>。如果你的窗口比较小， <strong>左侧的菜单是可以向下滚动</strong>，点小三角或者使用鼠标滚轮上下滚动。</p>
			<p><strong>真的没找到？</strong>那真是没有，参见<a href="doc/start/collection.jsp">插件收集</a></p>
			<h3 id="ai-shang-yi-pi-ye-ma-ke-ni-de-jia-li-mei-you-cao-yuan-">「爱上一匹野马，可你的家里没有草原…」？ <a href="#ai-shang-yi-pi-ye-ma-ke-ni-de-jia-li-mei-you-cao-yuan-" class="doc-anchor"></a></h3>
			<p>Amaze UI 2.x 依赖 jQuery，请在 Amaze UI 的 JS 文件之前引入 jQuery（推荐使用最新版）。</p>
			<h3 id="kao-bei-ye-mian-zhong-de-shi-li-dai-ma-nian-tie-yi-hou-mei-you-xiao-guo-">拷贝页面中的示例代码粘贴以后没有效果？ <a href="#kao-bei-ye-mian-zhong-de-shi-li-dai-ma-nian-tie-yi-hou-mei-you-xiao-guo-" class="doc-anchor"></a></h3>
			<ul><li>确保页面中已经引入了 jQuery 以及 Amaze UI 的 CSS、JS，<code>path/to/</code> 替换相应的路径。</li></ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">link</span> <span class="hljs-attribute">rel</span>=<span class="hljs-value">"stylesheet"</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text/css"</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"path/to/css/amazeui.min.css"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">script</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text/javascript"</span> <span class="hljs-attribute">src</span>=<span class="hljs-value">"http://code.jquery.com/jquery-2.1.3.min.js"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">script</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">script</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text/javascript"</span> <span class="hljs-attribute">src</span>=<span class="hljs-value">"path/to/js/amazeui.min.js"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">script</span>&gt;</span>
					</code>
				</pre>
			</div>
			<ul><li>如果已经引入，请查看 Amaze UI CSS、JS 文件顶部的版本信息，确保引入的版本和示例要求的版本匹配。</li></ul>
			<h3 id="js-dong-tai-cha-ru-de-dom-shi-jian-shi-xiao-">JS 动态插入的 DOM 事件失效？ <a href="#js-dong-tai-cha-ru-de-dom-shi-jian-shi-xiao-" class="doc-anchor"></a></h3>
			<p>很多用户遇到<a href="#">各种「事件失效」问题</a>，在这里做一个统一回答。</p>
			<blockquote><p>Amaze UI 一般在 jQuery <a href="#">ready</a> 事件里面初始化默认接口，动态插入的 DOM 已经是在 <code>ready</code> 事件之后，自然不会绑定相应事件。</p><p>一些插件通过<strong>事件委托</strong>可以解决动态插入 DOM 的事件绑定问题，但并不是所有插件都可以这样，有的用户操作没有定位到要绑定事件的 DOM 上，比如窗口滚动。</p></blockquote>
			<p>Amaze UI jQuery 安装传统 website 的思路开发，也就是假定 JS 执行之前 DOM 已经渲染完成。如果是通过 Ajax 或者其他方式动态插入的 DOM，就需要手动调用相关接口初始化插件。</p>
			<ul>
				<li>
					<p><strong>JS 插件</strong></p>
					<p>假设动态插入了一个图片轮播，可以在插入完成以后执行下面的代码初始化：</p>
					<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'#my-slider'</span>).flexslider();</code></pre></div>
				</li>
				<li>
					<p><strong>Web 组件</strong></p>
					<p>有交互行为的 Web 组件提供了初始化的接口，假如动态插入了一个 Figure 组件，可以执行以下代码进行初始化：</p>
					<div class="doc-code demo-highlight"><pre><code class="javascript">AMUI.figure.init();</code></pre></div>
				</li>
			</ul>
			<p>更多用户遇到并提出的实际问题，请<a href="#">点此查看</a>。</p>
			<div class="ds-thread" data-thread-key="8b681e1b34ca68a08539981b73a3bc84" data-title="开始使用 - Faq|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>