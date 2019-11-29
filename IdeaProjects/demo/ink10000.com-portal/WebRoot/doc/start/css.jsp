<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用 - Html-css|Amaze UI</title>
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
						<li><a href="#ji-ben-gui-fan">基本规范</a></li>
						<li>
							<a href="#htmlcss-bian-xie-zhu-yi-shi-xiang">HTML/CSS 编写注意事项</a>
							<ul class="am-collapse">
								<li><a href="#ji-ben-yuan-ze">基本原则</a></li>
								<li><a href="#mo-kuai-hua-bian-xie-shi-jian">模块化编写实践</a></li>
								<li><a href="#ming-ming-zhu-yi-shi-xiang">命名注意事项</a></li>
								<li><a href="#css-bian-xie-zhu-yi-shi-xiang">CSS 编写注意事项</a></li>
							</ul>
						</li>
						<li><a href="#can-kao-lian-jie">参考链接</a></li>
					</ul>
				</div>
			</div>
			<h1 id="amaze-ui-htmlcss-gui-fan">Amaze UI HTML/CSS 规范 <a href="#amaze-ui-htmlcss-gui-fan" class="doc-anchor"></a></h1>
			<hr>
			<h2 id="ji-ben-gui-fan">基本规范 <a href="#ji-ben-gui-fan" class="doc-anchor"></a></h2>
			<ul><li><a href="#">AllMobilize HTML/CSS Style Guide</a></li></ul>
			<h2 id="htmlcss-bian-xie-zhu-yi-shi-xiang">HTML/CSS 编写注意事项 <a href="#htmlcss-bian-xie-zhu-yi-shi-xiang" class="doc-anchor"></a></h2>
			<h3 id="ji-ben-yuan-ze">基本原则 <a href="#ji-ben-yuan-ze" class="doc-anchor"></a></h3>
			<ul>
				<li>以 <code>am</code> 为命名空间</li>
				<li>关注分离，将 HTML、CSS 解耦；模块化编码。</li>
			</ul>
			<h3 id="mo-kuai-hua-bian-xie-shi-jian">模块化编写实践 <a href="#mo-kuai-hua-bian-xie-shi-jian" class="doc-anchor"></a></h3>
			<ul>
				<li><p><strong>语义化的模块名</strong>，通过模块名应该能一眼就看出模块的是干什么的。</p></li>
				<li><p><strong>模块内部的类名继承自父级</strong>。</p></li>
			</ul>
			<p>如：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-box"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">h2</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-box-hd"</span>&gt;</span>About the Site<span class="hljs-tag">&lt;/<span class="hljs-title">h2</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">p</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-box-bd"</span>&gt;</span>This is my blog where I talk about only the bestest things in the whole wide world.<span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>上面的代码中，模块的名为 <code>box</code>，模块最外层使用 <code>{命名空间}-{模块名}</code> 的方式命名 Class。模块子元素以在此基础上进行命名。如果不继承父级的类名，很容易造成命名冲突。</p>
			<ul><li><strong>充分考虑结构的语义化</strong>。</li></ul>
			<p>虽然在 Class 的命名上已经做到的了关注分离，编写样式不再依赖具体的元素名称，但仍应该考虑语义化，根据元素设计的目的来使用元素。是段落的，你就用 <code>&lt;p&gt;</code>；是标题的，就用 <code>&lt;h1&gt;~&lt;h6&gt;</code>；是引用的，就用 <code>&lt;blockquote&gt;</code>， 而不是简单粗暴的用 <code>&lt;div&gt;</code>、<code>&lt;span&gt;</code>。语义化的目的，一方面是抽去 CSS 以后，页面还是一个结构良好、可读的页面；另一方面，这也是 SEO 的最基本要求。</p>
			<ul><li><strong>避免不必要的 CSS 选择符嵌套。</strong>Class 已经模块化命名，从类名上已经可以清晰的分辨元素的从属，一般情况下也不会造成类名冲突，没有必要再进行选择器嵌套，保持 css 结构清晰，提高渲染效率。特殊情况可以嵌套（如提高权重、主题之间代码隔离），但应避免过多层级。</li></ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-comment">/* 推荐写法 */</span>
<span class="hljs-class">.am-box</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">border</span>:<span class="hljs-value"><span class="hljs-number">1px</span> solid <span class="hljs-hexcolor">#333</span></span></span>;
}</span>
<span class="hljs-class">.am-box-hd</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">margin</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">padding</span>:<span class="hljs-value"><span class="hljs-number">5px</span> <span class="hljs-number">10px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">border-bottom</span>:<span class="hljs-value"><span class="hljs-number">1px</span> solid <span class="hljs-hexcolor">#333</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">background-color</span>:<span class="hljs-value"><span class="hljs-hexcolor">#CCC</span></span></span>;
}</span>
<span class="hljs-class">.am-box-bd</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">margin</span>:<span class="hljs-value"><span class="hljs-number">10px</span></span></span>;
}</span>
<span class="hljs-comment">/* 不推荐写法 */</span>
<span class="hljs-class">.am-box</span> <span class="hljs-class">.am-box-hd</span><span class="hljs-rules">{}</span>
<span class="hljs-class">.am-box</span> <span class="hljs-class">.am-box-bd</span><span class="hljs-rules">{}</span>
					</code>
				</pre>
			</div>
			<ul><li><strong>与 JS 交互时，在模块 HTML 结构的最外一层添加状态，而非给模块每个子元素单独添加元素</strong>。给最外层添加状态类以后，整个模块的样式都能控制，减少操作，提高性能。</li></ul>
			<p>比如，可以这样写：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-box am-box-active"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">h3</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-box-title"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">h3</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">p</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-box-content"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>但不要这样写（效率更低）：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-box"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">h3</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-box-title am-box-title-active"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">h3</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">p</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-box-content am-box-content-active"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="ming-ming-zhu-yi-shi-xiang">命名注意事项 <a href="#ming-ming-zhu-yi-shi-xiang" class="doc-anchor"></a></h3>
			<ul><li><strong>语义化，望文见义</strong></li></ul>
			<p>如 <code>am-tab</code>、<code>am-nav</code>，不要使用 <code>red</code>、<code>left</code> 等表象的词命名。</p>
			<ul>
				<li>
					<strong>模块状态：</strong>
					<code>{命名空间}-{模块名}-{状态描述}</code>
				</li>
			</ul>
			<p>常用状态有：hover, current, selected, disabled, focus, blur, checked, success, error 等</p>
			<ul>
				<li>
					<strong>子模块：</strong>
					<code>{命名空间}-{模块名}-{子模块名}</code>
				</li>
			</ul>
			<p>常用模块名有：bd(body)，cnt(content)，hd(header)，text(txt)，img(images/pic)，title，item，cell 等， 词义表达组件要实现的功能。</p>
			<ul><li><strong>模块嵌套：</strong></li></ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">ul</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-nav"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-nav-item"</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>nav Triggle Link<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">ul</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-subnav"</span>&gt;</span>
            <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-subnav-item"</span>&gt;</span>
               <span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>subNav Triggle Link<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
                  <span class="hljs-tag">&lt;<span class="hljs-title">ul</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-list"</span>&gt;</span>
					</code>
				</pre>
			</div>
			<ul><li><strong>统一命名风格</strong>（使用相同名词命名不同组件的子元素）：如 am-tab-hd, am-modal-hd，便于理解。</li></ul>
			<h3 id="css-bian-xie-zhu-yi-shi-xiang">CSS 编写注意事项 <a href="#css-bian-xie-zhu-yi-shi-xiang" class="doc-anchor"></a></h3>
			<h4 id="bu-yao-tian-jia-liu-lan-qi-han-shang-qian-zhui">不要添加浏览器厂商前缀 <a href="#bu-yao-tian-jia-liu-lan-qi-han-shang-qian-zhui" class="doc-anchor"></a></h4>
			<p>Amaze UI 2.x 开始使用 <a href="#">Autoprefixer</a> 自动添加浏览器厂商前缀，编写 CSS 时<strong>不要添加浏览器前缀</strong>，直接使用标准的 CSS 编写（也不要使用 mixins.less 里的前缀 mixin）。</p>
			<p><strong>特别说明</strong>：</p>
			<ul><li><strong>一些浏览器的私有属性可以添加浏览器前缀：</strong><code>-moz-appearance</code>, <code>-webkit-appearance</code> 等</li></ul>
			<p>更多使用问题参见 <a href="#">Autoprefixer FAQ</a>。</p>
			<h4 id="xu-yao-te-bie-zhu-yi-de-class">需要特别注意的 Class <a href="#xu-yao-te-bie-zhu-yi-de-class" class="doc-anchor"></a></h4>
			<p>Amaze UI 中有两个表示状态的 class：</p>
			<ul>
				<li><code>.am-active</code> - 激活</li>
				<li><code>.am-disabled</code> - 禁用</li>
			</ul>
			<p><strong>不要单独使用、直接在里面编写样式！！！</strong></p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
/* 可以嵌套用 */
.am-nav .am-active{}
/* 可以堆叠用 */
.am-btn.am-active{}
/* 绝不要单独用！！！ */
.am-active{
   color:red;
}
					</code>
				</pre>
			</div>
			<h2 id="can-kao-lian-jie">参考链接 <a href="#can-kao-lian-jie" class="doc-anchor"></a></h2>
			<ul>
				<li><a href="#">模块化组织规范</a></li>
				<li><a href="#">Decoupling HTML From CSS</a></li>
				<li><a href="#">HTML Symbol Entities Reference</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="f4c768bf3ca90a552ddfc7ddf97b2b85" data-title="开始使用 - Html-css|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>