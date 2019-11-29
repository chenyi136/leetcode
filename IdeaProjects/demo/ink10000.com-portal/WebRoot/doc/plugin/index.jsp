<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件|Amaze UI</title>
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
							<a href="#ji-ben-shi-yong">基本使用</a>
							<ul class="am-collapse">
								<li><a href="#ji-yu-jquery">基于 jQuery</a></li>
								<li><a href="#zu-jian-diao-yong">组件调用</a></li>
								<li><a href="#jquery-he-zepto-js-de-yi-xie-chai-yi">jQuery 和 Zepto.js 的一些差异</a></li>
							</ul>
						</li>
						<li>
							<a href="#gao-ji-shi-yong">高级使用</a>
							<ul class="am-collapse">
								<li><a href="#mo-ren-chu-shi-hua-shi-jian-jie-kou">默认初始化事件接口</a></li>
								<li><a href="#zi-ding-yi-shi-jian">自定义事件</a></li>
								<li><a href="#mutationobserver">MutationObserver</a></li>
								<li><a href="#mo-kuai-hua-kai-fa">模块化开发</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="javascript">JavaScript <a href="#javascript" class="doc-anchor"></a></h1>
			<hr>
			<h2 id="ji-ben-shi-yong">基本使用 <a href="#ji-ben-shi-yong" class="doc-anchor"></a></h2>
			<h3 id="ji-yu-jquery">基于 jQuery <a href="#ji-yu-jquery" class="doc-anchor"></a></h3>
			<p>从 2.0 开始，Amaze UI JavaScript 组件转向基于 <a href="#">jQuery</a> 开发，使用时确保在 Amaze UI 的脚本之前引入了 jQuery 最新正式版。</p>
			<h3 id="zu-jian-diao-yong">组件调用 <a href="#zu-jian-diao-yong" class="doc-anchor"></a></h3>
			<p>组件的调用方式普通 jQuery 插件一样，具体细节请查看各个组件的文档。</p>
			<h3 id="jquery-he-zepto-js-de-yi-xie-chai-yi">jQuery 和 Zepto.js 的一些差异 <a href="#jquery-he-zepto-js-de-yi-xie-chai-yi" class="doc-anchor"></a></h3>
			<p>jQuery 和 Zepto.js 表面看起来差不多，其实一些细节上差异很大，同时支持 jQuery 和 Zepto.js 是一件吃力不讨好的事情，这应该也是 <a href="#">Foundation 5 放弃支持 Zepto</a> 的一个原因。（<a href="#">下面列举的差异 Demo</a>）</p>
			<h4 id="codewidthcodecodeheightcode"><code>width()</code>/<code>height()</code> <a href="#codewidthcodecodeheightcode" class="doc-anchor"></a></h4>
			<ul>
				<li>Zepto.js:由盒模型（<code>box-sizing</code>）决定</li>
				<li>jQuery:忽略盒模型，始终返回内容区域的宽/高（不包含 <code>padding</code>、<code>border</code>）</li>
			</ul>
			<p>jQuery <a href="#">官方的说明</a>：</p>
			<blockquote><p>Note that <code>.width()</code> will always return the content width, regardless of the value of the CSS <code>box-sizing</code> property. As of jQuery 1.8, this may require retrieving the CSS width plus <code>box-sizing</code> property and then subtracting any potential border and padding on each element when the element has <code>box-sizing:border-box</code>. To avoid this penalty, use <code>.css('width')</code> rather than <code>.width()</code>.</p></blockquote>
			<p>解决方式就是在 jQuery 中使用 <code>.css(&#39;width&#39;)</code>，而不是 <code>.width()</code>。</p>
			<p><strong>这点上 jQuery 的处理方式是值得商榷的</strong>，比如下面的例子，<code>$(&#39;.box&#39;).css(&#39;height&#39;)</code> 仍然返回 <code>20px</code>，<strong>这不是扯蛋么</strong>：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">style</span>&gt;</span><span class="css">
   <span class="hljs-class">.box</span><span class="hljs-rules">{
      <span class="hljs-rule"><span class="hljs-attribute">padding</span>:<span class="hljs-value"><span class="hljs-number">10px</span></span></span>;
      <span class="hljs-rule"><span class="hljs-attribute">height</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
      <span class="hljs-rule"><span class="hljs-attribute">box-sizing</span>:<span class="hljs-value">border-box</span></span>;
   }</span>
</span><span class="hljs-tag">&lt;/<span class="hljs-title">style</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"box"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h5 id="bian-kuang-san-jiao-xing-kuan-gao-de-huo-qu">边框三角形宽高的获取 <a href="#bian-kuang-san-jiao-xing-kuan-gao-de-huo-qu" class="doc-anchor"></a></h5>
			<p>假设用下面的 HTML 和 CSS 画了一个小三角形：</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"caret"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.caret</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">height</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">border-width</span>:<span class="hljs-value"><span class="hljs-number">0</span> <span class="hljs-number">20px</span> <span class="hljs-number">20px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">border-style</span>:<span class="hljs-value">none dotted solid</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">border-color</span>:<span class="hljs-value">transparent transparent blue</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<ul>
				<li>jQuery 使用 <code>.width()</code> 和 <code>.css(&#39;width&#39;)</code> 都返回 <code>0</code>，高度也一样；</li>
				<li>Zepto 使用 <code>.width()</code> 返回 <code>40</code>，使用 <code>.css(&#39;width&#39;)</code> 返回 <code>0px</code>。</li>
			</ul>
			<p>所以，这种场景，<strong>jQuery 使用 <code>.outerWidth()</code>/<code>.outerHeight()</code>；Zepto 使用 <code>.width()</code>/<code>.height()</code></strong>。</p>
			<h4 id="codeoffsetcode"><code>offset()</code> <a href="#codeoffsetcode" class="doc-anchor"></a></h4>
			<ul>
				<li>Zepto.js:返回 <code>top</code>、<code>left</code>、<code>width</code>、<code>height</code></li>
				<li>jQuery:返回 <code>width</code>、<code>height</code></li>
			</ul>
			<h4 id="codehtmlstring-attributescode"><code>$(htmlString, attributes)</code> <a href="#codehtmlstring-attributescode" class="doc-anchor"></a></h4>
			<ul>
				<li><a href="#">jQuery 文档</a></li>
				<li><a href="#">Zepto 文档</a></li>
			</ul>
			<h5 id="dom-cao-zuo-qu-bie">DOM 操作区别 <a href="#dom-cao-zuo-qu-bie" class="doc-anchor"></a></h5>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-keyword">var</span> $list=$(<span class="hljs-string">'&lt;ul&gt;&lt;li&gt;jQuery 插入&lt;/li&gt;&lt;/ul&gt;'</span>,{id:<span class="hljs-string">'insert-by-jquery'</span>});
   $list.appendTo($(<span class="hljs-string">'body'</span>));
});
					</code>
				</pre>
			</div>
			<p>jQuery 操作 <code>ul</code> 上的 <code>id</code> 不会被添加；Zepto 可以在 <code>ul</code> 上添加 <code>id</code>。</p>
			<h5 id="shi-jian-hong-fa-qu-bie">事件触发区别 <a href="#shi-jian-hong-fa-qu-bie" class="doc-anchor"></a></h5>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$script=$(<span class="hljs-string">'&lt;script/&gt;'</span>,{src:<span class="hljs-string">'http://cdn.amazeui.org/amazeui/1.0.1/js/amazeui.min.js'</span>,id:<span class="hljs-string">'ui-jquery'</span>});
$script.appendTo($(<span class="hljs-string">'body'</span>));
$script.on(<span class="hljs-string">'load'</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-built_in">console</span>.log(<span class="hljs-string">'jQ script loaded'</span>);
});
					</code>
				</pre>
			</div>
			<p>使用 jQuery 时 <code>load</code> 事件的处理函数<strong>不会</strong>执行；使用 Zepto 时 <code>load</code> 事件的处理函数<strong>会</strong>执行。</p>
			<p><strong>其他参考链接：</strong></p>
			<ul>
				<li><a href="#">jQuery 市场份额</a></li>
				<li><a href="#">jQuery vs Zepto 性能比较</a></li>
			</ul>
			<h2 id="gao-ji-shi-yong">高级使用 <a href="#gao-ji-shi-yong" class="doc-anchor"></a></h2>
			<h3 id="mo-ren-chu-shi-hua-shi-jian-jie-kou">默认初始化事件接口 <a href="#mo-ren-chu-shi-hua-shi-jian-jie-kou" class="doc-anchor"></a></h3>
			<p>Amaze UI 通过特定的 HTML 来绑定事件，多数 JS 组件通过 HTML 标记就可以实现调用。</p>
			<p>默认的初始化事件都在 <code>xx.amui.data-api</code> 命名空间下，用户可以自行关闭。</p>
			<p>关闭所有默认事件：</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-built_in">document</span>).off(<span class="hljs-string">'.data-api'</span>);</code></pre></div>
			<p>关闭特定组件的默认事件：</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-built_in">document</span>).off(<span class="hljs-string">'.modal.amui.data-api'</span>);</code></pre></div>
			<h3 id="zi-ding-yi-shi-jian">自定义事件 <a href="#zi-ding-yi-shi-jian" class="doc-anchor"></a></h3>
			<p>一些组件提供了自定义事件，命名的方式为 <code>{事件名称}.{组件名称}.amui</code>，用户可以查看组件文档了解、使用这些事件。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-string">'#myAlert'</span>).on(<span class="hljs-string">'close.alert.amui'</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>) </span>{
   <span class="hljs-comment">//do something</span>
});
					</code>
				</pre>
			</div>
			<h3 id="mutationobserver">MutationObserver <a href="#mutationobserver" class="doc-anchor"></a></h3>
			<p>双向数据绑定很酷？<a href="#">Mutation Observer</a> 才是（或即将成为）幕后的英雄。</p>
			<p>Amaze UI 2.1 中实验性地引入了 <code>MutationObserver</code>，<strong>请谨慎使用</strong>。</p>
			<h4 id="codedata-am-observecode"><code>data-am-observe</code> <a href="#codedata-am-observecode" class="doc-anchor"></a></h4>
			<p>在元素上添加 <code>data-am-observe</code> 属性以后，动态插入该元素的 Amaze UI JS 插件会自动初始化（<a href="doc/plugin/scrollspy.jsp">演示</a>）， 支持的插件包括 Button、Dropdown、Slider、Popover、ScrollSpy、Tabs。</p>
			<h4 id="code-domobserveoptions-callbackcode"><code>$().DOMObserve(options,callback)</code> <a href="#code-domobserveoptions-callbackcode" class="doc-anchor"></a></h4>
			<ul>
				<li><code>options</code>:监视的属性（<a href="#">具体参见</a>），默认为 <code>{childList:true, subtree:true}</code>；</li>
				<li><code>callback(mutations, observer)</code>:DOM 发生变化时的处理函数，第一个参数为存储 <a href="#">MutationRecord</a> 对象的数组，第二个参数为 MutationObserver 实例本身。</li>
			</ul>
			<div class="doc-example">
				<p id="js-do-actions">
					<button class="am-btn am-btn-primary" data-insert>插入 p 元素</button>
					<button class="am-btn am-btn-secondary" data-addclass>添加 Class</button>
					<button class="am-btn am-btn-warning" data-remove>移除 p 元素</button>
				</p>
				<div id="js-do-demo"><p>DOM 变化监视演示，打开控制台查看 log</p></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p><strong>参考链接：</strong></p>
			<ul>
				<li><a href="#">MDN - MutationObserver</a>；</li>
				<li><a href="#">CIU - Mutation Observer 浏览器支持</a></li>
				<li><a href="#">Polyfill - MutationObserver.js</a></li>
			</ul>
			<h3 id="mo-kuai-hua-kai-fa">模块化开发 <a href="#mo-kuai-hua-kai-fa" class="doc-anchor"></a></h3>
			<p>关于前端模块化，Amaze UI 1.0 的时候曾做过一个<a href="#">关于前端 JS 模块化的调查</a>，截止 2014.11.13 共 1869 个投票：</p>
			<ul>
				<li>CMD - Sea.js 23.86% (446 votes)</li>
				<li>AMD - RequireJS 24.51% (458 votes)</li>
				<li>CommonJS - Browserify9.58% (179 votes)</li>
				<li>其他加载工具（或者自行开发的） 8.19% (153 votes)</li>
				<li>什么是 JS 模块化？可以吃吗？ 34% (633 votes)</li>
			</ul>
			<div class="am-progress">
				<div style="width:23.8%;" class="am-progress-bar" data-am-popover="{content:'CMD - Sea.js',trigger:'hover focus'}">CMD</div>
				<div style="width:24.5%;" class="am-progress-bar am-progress-bar-secondary" data-am-popover="{content:'AMD - RequireJS',trigger:'hover focus'}">AMD</div>
				<div style="width:9.5%;" class="am-progress-bar am-progress-bar-success" data-am-popover="{content:'CommonJS - Browserify',trigger:'hover focus'}">CJS</div>
				<div style="width:8.2%;" class="am-progress-bar am-progress-bar-warning" data-am-popover="{content:'其他加载工具（或者自行开发的）',trigger:'hover focus'}">other</div>
				<div style="width:34%;" class="am-progress-bar am-progress-bar-danger" data-am-popover="{content:'什么是 JS 模块化？可以吃吗？',trigger:'hover focus'}">unknown</div>
			</div>
			<p>显然，<strong>模块化是必然趋势</strong>，<a href="#">ES6</a> 将原生支持模块化。</p>
			<p>Amaze UI 2.0 按照 <a href="#">CommonJS</a> 规范来组织模块（前端也像 Node.js 一样编写模块）。最终如何打包，用户可以自行选择。</p>
			<ul>
				<li><a href="#">Browserify</a>：结合 NPM，实现前端模块管理。很多前端模块都已经发布到 NPM，可以抛弃 Bower 这类功能很单一的工具了；</li>
				<li><a href="#">Duo</a>：除管理本地模块以外，还可以从 GitHub 上直接获取开源项目，支持 Javascript、HTML、CSS；</li>
				<li><a href="#">gulp-amd-bundler</a>：把按照 CJS 编写的模块打包成 AMD 模块;</li>
				<li><a href="#">Webpack</a>。</li>
			</ul>
			<p><a href="#">SPM</a> 貌似不支持直接通过源码提取依赖，使用 Sea.js 的用户可能需要自行修改打包工具。</p>
			<p><strong>建议阅读的文章：</strong></p>
			<ul>
				<li><a href="#">前端模块化开发那点历史</a></li>
				<li><a href="#">Writing Modular JavaScript With AMD, CommonJS &amp; ES Harmony</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="0662c5d517a7f4330f6b6e7665187d02" data-title="JS 插件|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	var t=$("#js-do-demo");
	t.DOMObserve({childList:!0,attributes:!0,subtree:!0},function(t,o){
		console.log(o.constructor===window.MutationObserver);
		console.log("#js-do-demo 的 DOM 发生变化鸟："+t[0].type);
	});
	$("#js-do-actions").find("button").on("click",function(o){
		var e=$(o.target);
		e.is("[data-insert]")?t.append("<p>插入了一个 p</p>"):e.is("[data-remove]")?t.find("p").last().remove():t.addClass("am-text-danger");
	});
});
</script>
</body>
</html>