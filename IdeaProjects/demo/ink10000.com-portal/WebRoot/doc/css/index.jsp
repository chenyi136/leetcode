<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS|Amaze UI</title>
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
							<a href="#css-gai-shu">CSS 概述</a>
							<ul class="am-collapse"><li><a href="#liu-lan-qi-qian-zhui">浏览器前缀</a></li></ul>
						</li>
						<li><a href="#xiang-ying-shi-duan-dian">响应式断点</a></li>
						<li><a href="#shi-yong-html5">使用 HTML5</a></li>
						<li><a href="#yi-dong-you-xian">移动优先</a></li>
						<li>
							<a href="#guo-qing-guo-qing">国情国情</a>
							<ul class="am-collapse">
								<li><a href="#xuan-ran-yin-qing">渲染引擎</a></li>
								<li><a href="#fang-zhenlang-caozhu-dai">防（zhēn）狼（cāo）术（dài）</a></li>
							</ul>
						</li>
						<li>
							<a href="#class-ming-ming-shuo-ming">Class 命名说明</a>
							<ul class="am-collapse">
								<li><a href="#guan-zhu-fen-chi">关注分离</a></li>
								<li><a href="#duo-lei-zheng-classitis">“多类症”（Classitis）</a></li>
								<li><a href="#xuan-ze-fu-shu-xie">选择符书写</a></li>
							</ul>
						</li>
						<li><a href="#yi-dian-jin-ji">一点禁忌</a></li>
						<li><a href="#jin-yong-xiang-ying-shi">禁用响应式</a></li>
						<li>
							<a href="#guan-yu-ming-ming-kong-jian">关于命名空间</a>
							<ul class="am-collapse">
								<li><a href="#mu-de-fang-yu-yu-wu-qin-ru-">目的：防御与无侵入！</a></li>
								<li><a href="#he-qu-he-cong-">何去何从？</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="css">CSS <a href="#css" class="doc-anchor"></a></h1>
			<hr>
			<h2 id="css-gai-shu">CSS 概述 <a href="#css-gai-shu" class="doc-anchor"></a></h2>
			<p>Amaze UI CSS 大致分为四部分。</p>
			<div class="am-g">
				<div class="am-u-md-6">
					<div class="am-panel am-panel-default">
						<div class="am-panel-hd">基础（默认）样式</div>
						<div class="am-panel-bd">使用 normalize.css 统一浏览器差异， 以及一些基础的元素样式。</div>
					</div>
				</div>
				<div class="am-u-md-6">
					<div class="am-panel am-panel-default">
						<div class="am-panel-hd">布局样式</div>
						<div class="am-panel-bd">包含用于布局的 Grid、AVG Grid，以及一些辅助 Class。</div>
					</div>
				</div>
				<div class="am-u-md-6">
					<div class="am-panel am-panel-default">
						<div class="am-panel-hd">元素样式</div>
						<div class="am-panel-bd">对 <code>code</code>、<code>form</code>、<code>table</code> 等 HTML 元素定义更多的样式。</div>
					</div>
				</div>
				<div class="am-u-md-6">
					<div class="am-panel am-panel-default">
						<div class="am-panel-hd">页面组件</div>
						<div class="am-panel-bd">定义网页中常用的、多个元素组合在一起的组件样式，如分页、面包屑导航等。</div>
					</div>
				</div>
			</div>
			<h3 id="liu-lan-qi-qian-zhui">浏览器前缀 <a href="#liu-lan-qi-qian-zhui" class="doc-anchor"></a></h3>
			<p>Amaze UI 2.0 开始移除了所有标准属性的浏览器前缀，构建时通过 <a href="#">AutoPrefixer</a> 自动添加。</p>
			<p>当前的 AutoPrefixer 浏览器支持设置为：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
[
   <span class="hljs-string">"ie &gt;=8"</span>,
   <span class="hljs-string">"ie_mob &gt;=10"</span>,
   <span class="hljs-string">"ff &gt;=30"</span>,
   <span class="hljs-string">"chrome &gt;=34"</span>,
   <span class="hljs-string">"safari &gt;=7"</span>,
   <span class="hljs-string">"opera &gt;=23"</span>,
   <span class="hljs-string">"ios &gt;=7"</span>,
   <span class="hljs-string">"android &gt;=2.3"</span>,
   <span class="hljs-string">"bb &gt;=10"</span>
]
					</code>
				</pre>
			</div>
			<h2 id="xiang-ying-shi-duan-dian">响应式断点 <a href="#xiang-ying-shi-duan-dian" class="doc-anchor"></a></h2>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>尺寸</th>
						<th class="am-text-nowrap">class 简写</th>
						<th>断点区间</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>small</td>
						<td><code>sm</code></td>
						<td>0 - 640px</td>
						<td>处理绝大数手机的横竖屏模式（<a href="#">Galaxy Note 2 的视口为 360 * 640</a>）</td>
					</tr>
					<tr>
						<td>medium</td>
						<td><code>md</code></td>
						<td>641px - 1024px</td>
						<td>平板的横竖屏模式</td>
					</tr>
					<tr>
						<td>large</td>
						<td><code>lg</code></td>
						<td>1025px +</td>
						<td>桌面设备</td>
					</tr>
				</tbody>
			</table>
			<p>目前 Amaze UI 对大于 1025px 的屏幕并没有做划分，虽然现在大屏显示器越来越多，但是设计一个过宽的网页对用户来说并不友好，用户眼睛左右移动的区间太大，浏览起来比较累。当然，一些特殊类型（购物、视频等）的网站例外。</p>
			<p>LESS 变量中定义了一些 Media Query 变量，使用 LESS 的用户可以引入该文件，直接使用这些变量。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
						<span class="hljs-at_rule">@<span class="hljs-keyword">screen:</span>~<span class="hljs-string">"only screen"</span></span>;
						<span class="hljs-at_rule">@<span class="hljs-keyword">landscape:</span>~<span class="hljs-string">"@{screen} and (orientation:landscape)"</span></span>;
						<span class="hljs-at_rule">@<span class="hljs-keyword">portrait:</span>~<span class="hljs-string">"@{screen} and (orientation:portrait)"</span></span>;
						<span class="hljs-at_rule">@<span class="hljs-keyword">small-up:</span>~<span class="hljs-string">"@{screen}"</span></span>;
						<span class="hljs-at_rule">@<span class="hljs-keyword">small-only:</span>~<span class="hljs-string">"@{screen} and (max-width:@{breakpoint-small-max})"</span></span>;
						<span class="hljs-at_rule">@<span class="hljs-keyword">medium-up:</span>~<span class="hljs-string">"@{screen} and (min-width:@{breakpoint-medium-min})"</span></span>;
						<span class="hljs-at_rule">@<span class="hljs-keyword">medium-only:</span>~<span class="hljs-string">"@{screen} and (min-width:@{breakpoint-medium-min}) and (max-width:@{breakpoint-medium-max})"</span></span>;
						<span class="hljs-at_rule">@<span class="hljs-keyword">large-up:</span>~<span class="hljs-string">"@{screen} and (min-width:@{breakpoint-large-min})"</span></span>;
						<span class="hljs-at_rule">@<span class="hljs-keyword">large-only:</span>~<span class="hljs-string">"@{screen} and (min-width:@{breakpoint-large-min}) and (max-width:@{breakpoint-large-max})"</span></span>;</code>
				</pre>
			</div>
			<h2 id="shi-yong-html5">使用 HTML5 <a href="#shi-yong-html5" class="doc-anchor"></a></h2>
			<p>Amaze UI 在 HTML5 下开发，没有测试其他 DOCTYPE，使用之前确保你的 HTML 第一行是 <code>&lt;!doctype html&gt;</code>。</p>
			<p>建议使用的 HTML head:</p>
			<p><strong>参考链接</strong>：</p>
			<ul>
				<li><a href="#">HTML5 Boilerplate</a></li>
				<li><a href="#">Google Web Starter Kit</a></li>
			</ul>
			<h2 id="yi-dong-you-xian">移动优先 <a href="#yi-dong-you-xian" class="doc-anchor"></a></h2>
			<p>Amaze UI 以移动优先的理念开发，需要在 <code>meta</code> 中设置相关 <code>viewport</code> 属性。</p>
			<p><code>width=device-width, initial-scale=1</code> 是必须的，而且我们认为好的设计是不需要用户去操作窗口缩放的，所以加上了 <code>maximum-scale=1, user-scalable=no</code>。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"viewport"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"</span>&gt;</span></code></pre></div>
			<h2 id="guo-qing-guo-qing">国情国情 <a href="#guo-qing-guo-qing" class="doc-anchor"></a></h2>
			<p>不可否认，这是一个神奇的国度，一切合理与不合理都可以用国情来解释。前端开发也不例外。</p>
			<h3 id="xuan-ran-yin-qing">渲染引擎 <a href="#xuan-ran-yin-qing" class="doc-anchor"></a></h3>
			<p>国内不少 <code>X 核</code> 浏览器，对于前端开发者，他们更多时候可能充当了 Troublemaker 的角色，不过也会有让人眼前一亮的一刻。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">name</span>=<span class="hljs-value">"renderer"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"webkit"</span>&gt;</span></code></pre></div>
			<p>这行代码可以指定网页使用 <code>webkit</code> 引擎渲染，当然，只对 <a href="#">360 浏览器 6.5+ 有效</a>。就这点而言，我希望所有所有的小白都去用 360 浏览器，那该有多好...</p>
			<h3 id="fang-zhenlang-caozhu-dai">防（zhēn）狼（cāo）术（dài） <a href="#fang-zhenlang-caozhu-dai" class="doc-anchor"></a></h3>
			<p>如果你的网站不想被剥去外衣、往赤裸的身体上贴广告，就加上<a href="#">下面的代码</a>。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">meta</span> <span class="hljs-attribute">http-equiv</span>=<span class="hljs-value">"Cache-Control"</span> <span class="hljs-attribute">content</span>=<span class="hljs-value">"no-siteapp"</span>&gt;</span></code></pre></div>
			<h2 id="class-ming-ming-shuo-ming">Class 命名说明 <a href="#class-ming-ming-shuo-ming" class="doc-anchor"></a></h2>
			<h3 id="guan-zhu-fen-chi">关注分离 <a href="#guan-zhu-fen-chi" class="doc-anchor"></a></h3>
			<p>Amaze UI CSS class 命名遵循关注分离、松耦合的原则，同时注重易于理解、理解，在参考 <a href="#">BEM 命名法</a> 的基础上，采用更优雅的书写方式。</p>
			<p>下面的代码直观展示了 Amaze UI CSS class 命名规范。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-post</span><span class="hljs-rules">{}</span> <span class="hljs-comment">/*Block*/</span>
<span class="hljs-class">.am-post-title</span><span class="hljs-rules">{}</span> <span class="hljs-comment">/*Element*/</span>
<span class="hljs-class">.am-post-meta</span><span class="hljs-rules">{}</span> <span class="hljs-comment">/*Element*/</span>
<span class="hljs-class">.am-post-sticky</span><span class="hljs-rules">{}</span> <span class="hljs-comment">/*Generic Modifier - status*/</span>
<span class="hljs-class">.am-post-active</span><span class="hljs-rules">{}</span> <span class="hljs-comment">/*Generic Modifier - status*/</span>
<span class="hljs-class">.am-post-title-highlight</span><span class="hljs-rules">{}</span> <span class="hljs-comment">/*Element Modifier*/</span>
					</code>
				</pre>
			</div>
			<h4 id="guan-zhu-fen-chi-shi-li">关注分离示例 <a href="#guan-zhu-fen-chi-shi-li" class="doc-anchor"></a></h4>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">article</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-post"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">h2</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-post-title"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">h2</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">p</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-post-meta"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">main</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-post-content"</span>&gt;</span>
      ...
   <span class="hljs-tag">&lt;/<span class="hljs-title">main</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">article</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>上面的代码中，可以直接使用下面的样式控制元素：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
.am-post &gt; h2{
   ...
}
.am-post &gt; p{
   ...
}
					</code>
				</pre>
			</div>
			<p>乍看是没什么问题，这两个选择符也不会影响到 <code>&lt;main&gt;</code> 里面的元素，但是如果更改了 HTML 标签， 就必须同时修改 CSS 选择符，无疑加大了维护的工作量。所以，给相应元素加上 class 是关注分离一个不错的选择。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">article</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-post"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">h1</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-post-title"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">h1</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-post-meta"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">main</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-post-content"</span>&gt;</span>
      ...
   <span class="hljs-tag">&lt;/<span class="hljs-title">main</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">article</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h4 id="guan-zhu-fen-chi-fan-mo-shi">关注分离反模式 <a href="#guan-zhu-fen-chi-fan-mo-shi" class="doc-anchor"></a></h4>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">ul</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-nav"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-nav-item"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-nav-item"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-nav-item"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>上面是一个导航代码片段，我们给 <code>&lt;li&gt;</code> 都加上了 <code>.am-nav-item</code> class，表面是遵循关注分离，其实是一种反模式，因为 <code>&lt;ul&gt;</code> 里面肯定是要放 <code>&lt;li&gt;</code> 的，在没有其它更复杂的元素在里面的情况下，给 <code>&lt;li&gt;</code> 加 class 显然是多余的。</p>
			<p>所以， <strong>关注分离并不是简单地给每个元素都加上 class</strong>，还需结合实际情况区别对待。</p>
			<p>相关阅读：</p>
			<ul><li><a href="#">Decoupling HTML From CSS</a></li></ul>
			<h3 id="duo-lei-zheng-classitis">“多类症”（Classitis） <a href="#duo-lei-zheng-classitis" class="doc-anchor"></a></h3>
			<p>当 HTML 源代码满眼望去都是 class 时，是不是很抓狂？</p>
			<p>不过为了实现代码复用，减少重复冗余，难免要把代码拆分在不同的 class 下面。我们只能寻找一个平衡点，避免过细的拆分，减少不必要的 class。</p>
			<h3 id="xuan-ze-fu-shu-xie">选择符书写 <a href="#xuan-ze-fu-shu-xie" class="doc-anchor"></a></h3>
			<p>虽然使用 LESS 编写样式可以很方便的嵌套，但是我们不建议过度嵌套选择符，有些嵌套是没有必要的。</p>
			<p>同时，我们也不建议把多个选择器堆叠在一起。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
.ui.form .fields.error .field .ui.selection.dropdown .menu .item:hover{
   ...
}
					</code>
				</pre>
			</div>
			<p>看看上面来自 <a href="#">Semantic UI</a> 的选择符，威武霸气吧，整行都是选择符，class 加 class，n 层嵌套，我只想呵呵...</p>
			<p><strong>选择符嵌套在必要的情况下一般不超过三层；选择符叠加一般不多于两个</strong>。</p>
			<h2 id="yi-dian-jin-ji">一点禁忌 <a href="#yi-dian-jin-ji" class="doc-anchor"></a></h2>
			<p>我们崇尚自由，但并不是百无禁忌。</p>
			<p>Amaze UI 中有两个表示状态的 class：</p>
			<ul>
				<li><code>.am-active</code> - 激活</li>
				<li><code>.am-disabled</code> - 禁用</li>
			</ul>
			<p><strong>不要单独使用、直接在里面编写样式</strong>！！！</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
/*可以嵌套用 */
.am-nav .am-active{
   ...
}
/*可以堆叠用 */
.am-btn.am-active{
   ...
}
/*绝不要单独用！！！ */
.am-active{
   color:red;
}
/*当然，如果你想给自己找点乐，那就随便了*/
					</code>
				</pre>
			</div>
			<h2 id="jin-yong-xiang-ying-shi">禁用响应式 <a href="#jin-yong-xiang-ying-shi" class="doc-anchor"></a></h2>
			<p>不喜欢响应式？可以尝试禁用：</p>
			<ul><li>删除 <code>head</code> 里的视口设置 <code>meta</code> 标签；</li></ul>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-comment">&lt;!--&lt;meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"&gt;--&gt;</span></code></pre></div>
			<ul><li>固定容器 <code>.am-container</code> 宽度（可以自己添加一个 class，不一定要使用内置的）：</li></ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-container</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">980px</span> <span class="hljs-important">!important</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">max-width</span>:<span class="hljs-value">none</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<ul><li>使用网格系统时，只添加 <code>.am-u-sm-*</code> class，移除其他断点的 class。</li></ul>
			<p>至此，布局层的响应式被禁用了（<a href="#">参考示例</a>）。</p>
			<p>不过，这仅仅是个开始，一些组件的样式细节可能还需要调整，只能陪你到这了……</p>
			<h2 id="guan-yu-ming-ming-kong-jian">关于命名空间 <a href="#guan-yu-ming-ming-kong-jian" class="doc-anchor"></a></h2>
			<div class="am-alert am-alert-danger">似乎有些人看着 <code>.am</code> 有些不顺眼，在这里专门做一下说明。</div>
			<p>可能有人不知道命名空间是什么东西，和 <a href="#">YUI</a> 中的 <code>yui</code>、<a href="#">Pure</a> 中的 <code>pure</code> 一样，Amaze UI 里的 <code>am</code> 就是命名空间。</p>
			<p>命名空间使类名变得冗长，可为什么还要加呢？</p>
			<h3 id="mu-de-fang-yu-yu-wu-qin-ru-">目的：防御与无侵入！ <a href="#mu-de-fang-yu-yu-wu-qin-ru-" class="doc-anchor"></a></h3>
			<p>更直白的话说，<strong>我不犯人，也不让人犯我</strong>。</p>
			<p>CSS 多基于 Class 应用样式，我们不愿看到：</p>
			<ul>
				<li><strong>多个框架共存</strong>时，按照我们的 CSS 编写的 HTML 结构应用了其他框架的样式；</li>
				<li><strong>从第三方抓取的 HTML</strong> 存在 class 相同的元素，意外地应用了 Amaze UI 的样式；</li>
				<li><strong>用户编写自己的代码时，意外的覆盖了框架中的样式；</strong></li>
				<li><strong>多人协作开发</strong>时，发生命名冲突，样式相互影响；__</li>
				<li><strong>第三方服务</strong>（如分享按钮、评论组件）会向页面中插入一些样式，可能会意外的应用到我们编写的结构；</li>
				<li>……</li>
			</ul>
			<p>Amaze UI 内部在用，平台上的开发者也在用，命名空间能够有效地减少这些问题。</p>
			<p>仅限于此，与品牌宣传什么的扯不上关系。</p>
			<h3 id="he-qu-he-cong-">何去何从？ <a href="#he-qu-he-cong-" class="doc-anchor"></a></h3>
			<dl>
				<dt>命名空间会被删除吗？</dt>
				<dd>一般不会，不过也说不定，不过那也是很久很久以后的事。</dd>
				<dt>我真的不喜欢命名空间这个东西，怎么办？</dt>
				<dd>未来版本会尝试自定义命名空间的可能性。你也可以尝试自己在编译的过程中把命名空间去掉，前端编译工具那么多，何不试试？不然葱油拌？还是飘香拌?</dd>
			</dl>
			<p>妹子只能说这么多了，再往下就只能说：你不懂我，我不怪你。</p>
			<div class="ds-thread" data-thread-key="433bf729f4a00ef4e5bec55241cbac77" data-title="CSS|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>