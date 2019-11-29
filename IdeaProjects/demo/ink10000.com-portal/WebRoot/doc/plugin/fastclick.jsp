<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String[] data = new String[] { " contenteditable" };%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Fastclick|Amaze UI</title>
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
						<li><a href="#wei-shi-yao-cun-zai-yan-chi-">为什么存在延迟？</a></li>
						<li><a href="#jian-rong-xing">兼容性</a></li>
						<li><a href="#bu-ying-yong-fastclick-de-chang-jing">不应用 FastClick 的场景</a></li>
						<li><a href="#shi-yong-fang-fa">使用方法</a></li>
						<li>
							<a href="#chang-jian-wen-ti">常见问题</a>
							<ul class="am-collapse"><li><a href="#shi-yong-fastclick-yi-hou-codecontenteditablecode-zai-hong-mo-ping-shang-shi-xiao-ru-he-chu-li-">使用 FastClick 以后 contenteditable 在触摸屏上失效，如何处理？</a></li></ul>
						</li>
						<li><a href="#licence">Licence</a></li>
					</ul>
				</div>
			</div>
			<h1 id="fastclick">FastClick <a href="#fastclick" class="doc-anchor"></a></h1>
			<hr>
			<p><strong><code>v2.4</code> 重要变更：</strong></p>
			<p><strong>由于引入 FastClick 以后会产生一些问题，从 <code>v2.4</code> 开始移除，需要的用户请直接从 <a href="#">FastClick 官方项目</a>获取。</strong></p>
			<p>处理移动端 <code>click</code> 事件 300 毫秒延迟， 由 <a href="#">FT Labs</a> 开发（<a href="#">项目地址</a>）。</p>
			<h2 id="wei-shi-yao-cun-zai-yan-chi-">为什么存在延迟？ <a href="#wei-shi-yao-cun-zai-yan-chi-" class="doc-anchor"></a></h2>
			<p>根据 <a href="#">Google 开发者文档</a>：</p>
			<blockquote><p>...mobile browsers will wait approximately 300ms from the time that you tap the button to fire the click event. The reason for this is that the browser is waiting to see if you are actually performing a double tap.</p></blockquote>
			<p>从点击屏幕上的元素到触发元素的 <code>click</code> 事件，移动浏览器会有大约 300 毫秒的等待时间。为什么这么设计呢？ 因为它想看看你是不是要进行双击（double tap）操作。</p>
			<h2 id="jian-rong-xing">兼容性 <a href="#jian-rong-xing" class="doc-anchor"></a></h2>
			<ul>
				<li>Mobile Safari on iOS 3 and upwards</li>
				<li>Chrome on iOS 5 and upwards</li>
				<li>Chrome on Android (ICS)</li>
				<li>Opera Mobile 11.5 and upwards</li>
				<li>Android Browser since Android 2</li>
				<li>PlayBook OS 1 and upwards</li>
			</ul>
			<h2 id="bu-ying-yong-fastclick-de-chang-jing">不应用 FastClick 的场景 <a href="#bu-ying-yong-fastclick-de-chang-jing" class="doc-anchor"></a></h2>
			<ul>
				<li>桌面浏览器；</li>
				<li>如果 <a href="#">viewport meta 标签</a> 中设置了 <code>width=device-width</code>， Android 上的 Chrome 32+ 会禁用 300ms 延时；</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"viewport"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"width=device-width,initial-scale=1"</span>&gt;</span></code></pre></div>
			<ul>
				<li>viewport meta 标签如果设置了 <code>user-scalable=no</code>，Android 上的 Chrome（所有版本）都会禁用 300ms 延迟。</li>
				<li>IE10 中，可以使用 css 属性 <code>-ms-touch-action:none</code> 禁止元素双击缩放（<a href="#">参考文章</a>）。</li>
			</ul>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<p><strong>Amaze UI 默认已经初始化 FastClick。</strong></p>
			<p>如有需要，用户可以通过 <code>$.AMUI.FastClick</code> 调用。</p>
			<p>jQuery / Zepto.js:</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   $.AMUI.FastClick.attach(<span class="hljs-built_in">document</span>.body);
});
					</code>
				</pre>
			</div>
			<p>CommonJS:</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">var</span> attachFastClick=<span class="hljs-built_in">require</span>(<span class="hljs-string">'fastclick'</span>);
attachFastClick(<span class="hljs-built_in">document</span>.body);
					</code>
				</pre>
			</div>
			<h2 id="chang-jian-wen-ti">常见问题 <a href="#chang-jian-wen-ti" class="doc-anchor"></a></h2>
			<h3 id="shi-yong-fastclick-yi-hou-codecontenteditablecode-zai-hong-mo-ping-shang-shi-xiao-ru-he-chu-li-">使用 FastClick 以后 <code>contenteditable</code> 在触摸屏上失效，如何处理？ <a href="#shi-yong-fastclick-yi-hou-codecontenteditablecode-zai-hong-mo-ping-shang-shi-xiao-ru-he-chu-li-" class="doc-anchor"></a></h3>
			<p>在需要启动编辑功能的元素上添加 <code>.needsclick</code> class 即可（<a href="#">在线演示</a>）。</p>
			<div class="doc-example">
				<div class="needsclick"<%=data[0]%>>
					<p>请使用触屏访问，然后尝试编辑下面的内容</p>
					<p>编我改我写我……</p>
				</div>
				<hr>
				<div<%=data[0]%>>没有加 <code>needsclick</code> class，触摸屏加载 FastClick 以后注定无法编辑。</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="licence">Licence <a href="#licence" class="doc-anchor"></a></h2>
			<ul>
				<li>@copyright The Financial Times Limited [All Rights Reserved]</li>
				<li>@license MIT License</li>
			</ul>
			<div class="ds-thread" data-thread-key="131d7c9f8583da5db0c57056a8638d0c" data-title="JS 插件 - Fastclick|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>