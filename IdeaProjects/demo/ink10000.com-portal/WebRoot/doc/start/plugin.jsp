<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用 - Javascript|Amaze UI</title>
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
						<li><a href="#ji-ben-bian-ma-gui-fan">基本编码规范</a></li>
						<li><a href="#dai-ma-zhi-liang-kong-zhi-gong-ju">代码质量控制工具</a></li>
						<li><a href="#jquery-zepto-js-shi-yong-gui-fan">jQuery / Zepto.js 使用规范</a></li>
						<li><a href="#dai-ma-ge-shi">代码格式</a></li>
						<li>
							<a href="#ming-ming-gui-fan">命名规范</a>
							<ul class="am-collapse">
								<li><a href="#ji-ben-yuan-ze">基本原则</a></li>
								<li><a href="#html-data-api">HTML Data API</a></li>
								<li><a href="#javascript">JavaScript</a></li>
							</ul>
						</li>
						<li><a href="#jie-kou-ming-ming-gui-fan">接口命名规范</a></li>
						<li>
							<a href="#zhu-shi-gui-fan">注释规范</a>
							<ul class="am-collapse">
								<li><a href="#zong-yuan-ze">总原则</a></li>
								<li><a href="#shi-yao-shi-hou-xu-yao-tian-jia-zhu-shi">什么时候需要添加注释</a></li>
								<li><a href="#zhu-shi-shu-xie-gui-fan">注释书写规范</a></li>
							</ul>
						</li>
						<li>
							<a href="#wen-dang-gui-fan">文档规范</a>
							<ul class="am-collapse">
								<li><a href="#readme-md">README.md</a></li>
								<li><a href="#history-md">HISTORY.md</a></li>
							</ul>
						</li>
						<li><a href="#can-kao-lian-jie">参考链接</a></li>
					</ul>
				</div>
			</div>
			<h1 id="amaze-ui-javascript-gui-fan">Amaze UI JavaScript 规范 <a href="#amaze-ui-javascript-gui-fan" class="doc-anchor"></a></h1>
			<hr>
			<h2 id="ji-ben-bian-ma-gui-fan">基本编码规范 <a href="#ji-ben-bian-ma-gui-fan" class="doc-anchor"></a></h2>
			<ul>
				<li><a href="#">AllMobilize JavaScript Style Guide</a></li>
				<li><a href="#">CMD 模块定义规范</a></li>
			</ul>
			<h2 id="dai-ma-zhi-liang-kong-zhi-gong-ju">代码质量控制工具 <a href="#dai-ma-zhi-liang-kong-zhi-gong-ju" class="doc-anchor"></a></h2>
			<p>Amaze UI 使用 <a href="#">JSHint</a> 和 <a href="#">JSCS</a> 控制代码质量。</p><p>详细设置参见 <a href="#">.jshintrc</a>、<a href="#">.jscsrc</a>。</p>
			<p>（部分直接使用第三方库的代码未通过质量控制工具检测。）</p>
			<h2 id="jquery-zepto-js-shi-yong-gui-fan">jQuery / Zepto.js 使用规范 <a href="#jquery-zepto-js-shi-yong-gui-fan" class="doc-anchor"></a></h2>
			<p>为提高代码执行效率，为二者兼容提供可能，在使用 jQuery / Zepto.js 时做以下约定：</p>
			<ul>
				<li>存放 jQuery / Zepto 对象的变量以 <code>$</code> 开头；</li>
				<li>禁止使用 <code>slideUp/Down()</code> <code>fadeIn/fadeOut()</code> 等方法；</li>
				<li>尽量不使用 <code>animate()</code> 方法；</li>
				<li>使用和 Zepto.js 兼容的基本选择符，不使用效率较低且与 Zepto.js 不兼容的选择符。</li>
			</ul>
			<p><strong>问题：</strong></p>
			<ul>
				<li><strong>自定义事件命名空间：</strong> Zepto.js 不支持 <code>.</code> 语法，只能使用 <code>:</code> 语法。</li>
				<li><a href="#">http://zeptojs.com/#event</a></li>
				<li><a href="#">http://api.jquery.com/event.namespace/</a></li>
			</ul>
			<h2 id="dai-ma-ge-shi">代码格式 <a href="#dai-ma-ge-shi" class="doc-anchor"></a></h2>
			<ul>
				<li><strong>缩进 2 个空格</strong>；</li>
				<li><strong>使用多 <code>var</code> 模式声明变量</strong>：更容易维护，比如要删除第一个变量或者最后一个变量时，多 <code>var</code> 模式直接删除即可，单 <code>var</code> 还要去修改别的行（<strong><code>for</code> 循环例外</strong>）；</li>
			</ul>
			<p><strong><em>Valid</em></strong></p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">var</span> x=<span class="hljs-number">1</span>;
<span class="hljs-keyword">var</span> y=<span class="hljs-number">2</span>;
<span class="hljs-keyword">for</span>(<span class="hljs-keyword">var</span> i=<span class="hljs-number">0</span>,j=arr.length;i&lt;j;i++){}
					</code>
				</pre>
			</div>
			<p><strong><em>Invalid</em></strong></p>
			<div class="doc-code demo-highlight"><pre><code class="javascript"><span class="hljs-keyword">var</span> x=<span class="hljs-number">1</span>,y=<span class="hljs-number">2</span>;</code></pre></div>	
			<h2 id="ming-ming-gui-fan">命名规范 <a href="#ming-ming-gui-fan" class="doc-anchor"></a></h2>
			<h3 id="ji-ben-yuan-ze">基本原则 <a href="#ji-ben-yuan-ze" class="doc-anchor"></a></h3>
			<ol>
				<li>文件和目录名只能包含 <code>[a-z\d\-]</code>，并以英文字母开头</li>
				<li>首选合适的英文单词</li>
				<li>Data API 命名使用小写、用连字符连接、添加 <code>am</code> 命名空间，如 <code>data-am-trigger</code></li>
				<li>事件名使用小写字母，包含模块名及 <code>amui</code> 命名空间名，使用 <code>:</code> 连接（Zepto 不支持使用 <code>.</code> 链接的自定义事件），如 <code>.trigger(&#39;open:modal:amui&#39;)</code></li>
				<li>
					符合规范
					<ul>
						<li>常量全大写 <code>UPPERCASE_WORD</code></li>
						<li>变量驼峰 <code>camelName</code></li>
						<li>类名驼峰，并且首字母要大写 <code>CamelName</code></li>
					</ul>
				</li>
			</ol>
			<h3 id="html-data-api">HTML Data API <a href="#html-data-api" class="doc-anchor"></a></h3>
			<ul>
				<li>基本:<code>data-am-{组件名}</code>，如 <code>data-am-modal</code>、<code>data-am-navbar-qrcode</code></li>
				<li>传参:<code>data-am-modal='{key1:&#39;val1&#39;, key2:false}'</code>，core.js 中增加一个专门解析参数的函数</li>
			</ul>
			<h3 id="javascript">JavaScript <a href="#javascript" class="doc-anchor"></a></h3>
			<ul>
				<li>自定义事件命名：<code>{自定义事件名}:{组件名}:{后缀}</code>，Zepto 不支持 <code>.</code> 分隔的自定义事件语法，官方示例中使用 <code>:</code> 分隔，如 <code>closed:modal:amui</code>。Zepto 中没有 <a href="#">event.namespace</a>，这样的命名方式只用于清晰区分不同模块的自定义事件。另外，按照 Zepto 官方示例，应该写成 <code>amui:modal:closed</code>，为跟 jQuery 的写法统一，颠倒顺序书写。</li>
				<li>
					默认绑定事件：事件名（内置事件，非自定义事件）采用 <code>{事件名}.{组件名}.{命名空间}</code>，如 <code>$(document).on(&#39;click.modal.amui&#39;,...</code>。
					<ul>
						<li>取消所有默认绑定事件： <code>$(document).off(&#39;.amui&#39;,...</code></li>
						<li>取消特定组件的默认绑定事件： <code>$(document).off(&#39;.modal.amui&#39;,...</code></li>
					</ul>
				</li>
			</ul>
			<h2 id="jie-kou-ming-ming-gui-fan">接口命名规范 <a href="#jie-kou-ming-ming-gui-fan" class="doc-anchor"></a></h2>
			<p>通过接口规范，统一模块对外接口的命名，形成一致的编写习惯。</p><p><strong>规则：</strong></p>
			<ul>
				<li><strong>可读性强，见名晓义。</strong></li>
				<li>尽量不与 jQuery 社区已有的习惯冲突。</li>
				<li>尽量写全。不用缩写，除非是下面列表中约定的。（变量以表达清楚为目标，uglify 会完成压缩体积工作）</li>
			</ul>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>常用词</th>
						<th>说明</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>options</td>
						<td>表示选项，与 jQuery 社区保持一致，不要用 config, opts 等</td>
					</tr>
					<tr>
						<td>active</td>
						<td>表示当前，不要用 current 等</td>
					</tr>
					<tr>
						<td>index</td>
						<td>表示索引，不要用 idx 等</td>
					</tr>
					<tr>
						<td>trigger</td>
						<td>触点元素</td>
					</tr>
					<tr>
						<td>triggerType</td>
						<td>触发类型、方式</td>
					</tr>
					<tr>
						<td>context</td>
						<td>表示传入的 this 对象</td>
					</tr>
					<tr>
						<td>object</td>
						<td>推荐写全，不推荐简写为 o, obj 等</td>
					</tr>
					<tr>
						<td>element</td>
						<td>推荐写全，不推荐简写为 el, elem 等</td>
					</tr>
					<tr>
						<td>length</td>
						<td>不要写成 len, l</td>
					</tr>
					<tr>
						<td>prev</td>
						<td>previous 的缩写</td>
					</tr>
					<tr>
						<td>next</td>
						<td>next 下一个</td>
					</tr>
					<tr>
						<td>constructor</td>
						<td>不能写成 ctor</td>
					</tr>
					<tr>
						<td>easing</td>
						<td>表示动画平滑函数</td>
					</tr>
					<tr>
						<td>min</td>
						<td>minimize 的缩写</td>
					</tr>
					<tr>
						<td>max</td>
						<td>maximize 的缩写</td>
					</tr>
					<tr>
						<td>DOM</td>
						<td>不要写成 dom, Dom</td>
					</tr>
					<tr>
						<td>.hbs</td>
						<td>使用 hbs 后缀表示模版</td>
					</tr>
					<tr>
						<td>btn</td>
						<td>button 的缩写</td>
					</tr>
					<tr>
						<td>link</td>
						<td>超链接</td>
					</tr>
					<tr>
						<td>title</td>
						<td>主要文本</td>
					</tr>
					<tr>
						<td>img</td>
						<td>图片路径（img标签src属性）</td>
					</tr>
					<tr>
						<td>dataset</td>
						<td>html5 data-xxx 数据接口</td>
					</tr>
					<tr>
						<td>theme</td>
						<td>主题</td>
					</tr>
					<tr>
						<td>className</td>
						<td>类名</td>
					</tr>
					<tr>
						<td>classNameSpace</td>
						<td>class 命名空间</td>
					</tr>
				</tbody>
			</table>
			<h2 id="zhu-shi-gui-fan">注释规范 <a href="#zhu-shi-gui-fan" class="doc-anchor"></a></h2>
			<h3 id="zong-yuan-ze">总原则 <a href="#zong-yuan-ze" class="doc-anchor"></a></h3>
			<ul>
				<li><strong>As short as possible（如无必要，勿增注释）</strong>：尽量提高代码本身的清晰性、可读性。</li>
				<li><strong>As long as necessary（如有必要，尽量详尽）</strong>：合理的注释、空行排版等，可以让代码更易阅读、更具美感。</li>
			</ul>
			<p>总之，注释的目的是： <strong>提高代码的可读性，从而提高代码的可维护性。</strong></p>
			<h3 id="shi-yao-shi-hou-xu-yao-tian-jia-zhu-shi">什么时候需要添加注释 <a href="#shi-yao-shi-hou-xu-yao-tian-jia-zhu-shi" class="doc-anchor"></a></h3>
			<ul><li>某段代码的写法，需要注释说明 why 时：</li></ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-comment">//Using loop is more efficient than `rest=slice.call(arguments, 1)`.</span>
<span class="hljs-keyword">for</span>(var i=<span class="hljs-number">1</span>,len=<span class="hljs-built_in">arguments</span>.length;i&lt;len;i++){
   rest[i-<span class="hljs-number">1</span>]=<span class="hljs-built_in">arguments</span>[i];
}
					</code>
				</pre>
			</div>
			<ul><li>添加上注释，能让代码结构更清晰时：</li></ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
init:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">selector,context,rootjQuery</span>)</span>{
   <span class="hljs-keyword">var</span> match,elem,ret,doc;
   <span class="hljs-comment">//Handle $(""), $(null), or $(undefined)</span>
   <span class="hljs-keyword">if</span>(!selector){
      ...
   }
   <span class="hljs-comment">//Handle $(DOMElement)</span>
   <span class="hljs-keyword">if</span>(selector.nodeType){
      ...
   }
   <span class="hljs-comment">//The body element only exists once, optimize finding it</span>
   <span class="hljs-keyword">if</span>(<span class="hljs-keyword">typeof</span> selector===<span class="hljs-string">"string"</span>){
      ...
   }
}
					</code>
				</pre>
			</div>
			<ul><li>有借鉴、使用第三方代码，需要说明时：</li></ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-comment">//Inspired by https://github.com/jquery/jquery/blob/master/src/core.js</span>
<span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">ready</span>(<span class="hljs-params"></span>)</span>{
   ...
}
					</code>
				</pre>
			</div>
			<ul><li>文件最后空一行，可以保证在 combo 合并后，源码的层次清晰。</li></ul>
			<h3 id="zhu-shi-shu-xie-gui-fan">注释书写规范 <a href="#zhu-shi-shu-xie-gui-fan" class="doc-anchor"></a></h3>
			<ol>
				<li>源码中的注释，推荐用英文。</li>
				<li>含有中文时，标点符号用中文全角。</li>
				<li>中英文夹杂时， <strong>英文与中文之间要用一个空格分开</strong>。</li>
				<li>注释标识符与注释内容要用一个空格分开：<code>// 注释</code> 与 <code>/* 注释 */</code>。</li>
			</ol>
			<h2 id="wen-dang-gui-fan">文档规范 <a href="#wen-dang-gui-fan" class="doc-anchor"></a></h2>
			<h3 id="readme-md">README.md <a href="#readme-md" class="doc-anchor"></a></h3>
			<p>每个组件必须有 README.md 文件，用来描述组件的基本情况。</p>
			<pre>
# 模块名称
-----
该模块的概要介绍。
------
# 使用说明
如何使用该模块，可以根据组件的具体特征，合理组织。
# API
需要提供 API 说明，属性、方法、事件等。
# 使用示例
			</pre>
			<h3 id="history-md">HISTORY.md <a href="#history-md" class="doc-anchor"></a></h3>
			<p>记录组件的变更，最好和 <code>issues</code> 进行关联。请阅读<a href="#">历史记录书写规范</a>。</p>
			<h2 id="can-kao-lian-jie">参考链接 <a href="#can-kao-lian-jie" class="doc-anchor"></a></h2>
			<p>Amaze UI 的编码规范参考了社区里一些先行者的做法，在此致谢！</p>
			<ul>
				<li><a href="#">注释规范</a></li>
				<li><a href="#">编码风格</a></li>
				<li><a href="#">编码与文档的讨论</a></li>
				<li><a href="#">常用词命名统一表</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="a1aa973404f06dc395753df7e9b485b3" data-title="开始使用 - Javascript|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>