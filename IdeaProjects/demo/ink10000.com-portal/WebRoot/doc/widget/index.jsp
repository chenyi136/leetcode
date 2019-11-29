<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Web 组件|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li><a href="#web-zu-jian-yan-shi">Web 组件演示</a></li>
						<li>
							<a href="#shi-yong-chang-jing">使用场景</a>
							<ul class="am-collapse">
								<li><a href="#shi-yong-mo-ban">使用模板</a></li>
								<li><a href="#bu-shi-yong-mo-ban">不使用模板</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="web-zu-jian">Web 组件 <a href="#web-zu-jian" class="doc-anchor"></a></h1>
			<hr>
			<p>Amaze UI Web 组件把一些常见的网页组件拆分成不同的部分，进行类似 Web Components 的封装（<a href="#">Web 组件简介</a>、<a href="#">开发规范</a>）。</p>
			<ul><li><strong>文档中提及的「云适配 WebIDE」为云适配开发的网站适配工具，<a href="#">详情请点击访问</a>。</strong></li></ul>
			<div class="am-alert am-alert-danger"><strong>注意：</strong>Web 组件不考虑 IE 8/9 支持。</div>
			<h2 id="web-zu-jian-yan-shi">Web 组件演示 <a href="#web-zu-jian-yan-shi" class="doc-anchor"></a></h2>
			<p>Amaze UI 目前封装了 10 余个主要面向移动端的 Web 组件（<a href="doc/widget/index_m.jsp">独立窗口中浏览 Demo</a>）。</p>
			<iframe src="doc/widget/index_m.jsp" id="doc-widget-frame"></iframe>
			<h2 id="shi-yong-chang-jing">使用场景 <a href="#shi-yong-chang-jing" class="doc-anchor"></a></h2>
			<h3 id="shi-yong-mo-ban">使用模板 <a href="#shi-yong-mo-ban" class="doc-anchor"></a></h3>
			<p>通过模板（hbs）将数据和 HTML 分离，这是 Web 组件的价值之一。用户可以在不同的开发环境中使用 Web 组件。</p>
			<h4 id="chun-liu-lan-qi-huan-jing">纯浏览器环境 <a href="#chun-liu-lan-qi-huan-jing" class="doc-anchor"></a></h4>
			<p>Amaze UI 提供的开发模板中，包含一个 <code>widget.html</code> 文件，里面展示了 Widget 在纯浏览器环境中的使用。</p>
			<p><strong>要点如下：</strong></p>
			<ol>
				<li>引入 Handlebars 模板 <code>handlebars.min.js</code>；</li>
				<li>引入 Amaze UI Widget helper <code>amui.widget.helper.js</code>；</li>
				<li>根据需求编写模板 <code>&lt;script type='text/x-handlebars-template' id='amz-tpl'&gt;{{&gt;slider slider}}&lt;/script&gt;</code>；</li>
				<li>传入数据，编译模板并插入页面中。</li>
			</ol>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-keyword">var</span> $tpl=$(<span class="hljs-string">'#amz-tpl'</span>);
   <span class="hljs-keyword">var</span> source=$tpl.text();
   <span class="hljs-keyword">var</span> template=Handlebars.compile(source);
   <span class="hljs-keyword">var</span> data={};
   <span class="hljs-keyword">var</span> html=template(data);
   $tpl.before(html);
});
					</code>
				</pre>
			</div>
			<h4 id="node-js-huan-jing">Node.js 环境 <a href="#node-js-huan-jing" class="doc-anchor"></a></h4>
			<p>可以结合 <a href="#">Express.js</a>、<a href="#">hbs</a> 使用。</p>
			<p>用户了可以直接使用打包好的模块 <a href="#">Amaze UI Widget hbs helper</a>，<a href="#">example</a> 里有完整的使用示例。</p>
			<p>当然，你也可以自由调用：</p>
			<p><strong>首先</strong>，把 Web 组件的模板注册为 <code>partial</code>。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-comment">//...</span>
<span class="hljs-keyword">var</span> hbs=<span class="hljs-built_in">require</span>(<span class="hljs-string">'hbs'</span>);
app.set(<span class="hljs-string">'view engine'</span>,<span class="hljs-string">'hbs'</span>);
hbs.registerPartials(widgetDir+<span class="hljs-string">'/slider/src'</span>);
					</code>
				</pre>
			</div>
			<p><strong>然后</strong>， 在页面模板中调用 <code>partial</code>，其中 <code>data</code> 为组件对应的数据。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">{{&gt;slider data}}</code></pre></div>
			<h4 id="php">PHP <a href="#php" class="doc-anchor"></a></h4>
			<p>参考以下链接：</p>
			<ul>
				<li><a href="#">https://github.com/zordius/lightncandy</a></li>
				<li><a href="#">https://github.com/XaminProject/handlebars.php</a></li>
				<li><a href="#">http://www.sitepoint.com/sharing-templates-between-php-and-javascript/</a></li>
			</ul>
			<h4 id="java">Java <a href="#java" class="doc-anchor"></a></h4>
			<ul>
				<li><a href="#">Handlebars.java</a></li>
				<li><a href="#">When Handlebars.js met Handlebars.java</a></li>
			</ul>
			<h4 id="bi-xu-de-helper">必须的 helper <a href="#bi-xu-de-helper" class="doc-anchor"></a></h4>
			<p>无论你在上面那种环境中使用 Web 组件，都必须注册下面的 helper（我们提供的 <code>amui.widget.helper.js</code> 和 Node.js 模块中已经注册）:</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">hbs</span>)</span>{
   hbs.registerHelper(<span class="hljs-string">"ifCond"</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">v1,operator,v2,options</span>)</span>{
   <span class="hljs-keyword">switch</span>(operator){
      <span class="hljs-keyword">case</span> <span class="hljs-string">"=="</span>:<span class="hljs-keyword">return</span> (v1==v2)?options.fn(<span class="hljs-keyword">this</span>):options.inverse(<span class="hljs-keyword">this</span>);
      <span class="hljs-keyword">case</span> <span class="hljs-string">"!="</span>:<span class="hljs-keyword">return</span> (v1!=v2)?options.fn(<span class="hljs-keyword">this</span>):options.inverse(<span class="hljs-keyword">this</span>);
      <span class="hljs-keyword">case</span> <span class="hljs-string">"==="</span>:<span class="hljs-keyword">return</span> (v1===v2)?options.fn(<span class="hljs-keyword">this</span>):options.inverse(<span class="hljs-keyword">this</span>);
      <span class="hljs-keyword">case</span> <span class="hljs-string">"!=="</span>:<span class="hljs-keyword">return</span> (v1!==v2)?options.fn(<span class="hljs-keyword">this</span>):options.inverse(<span class="hljs-keyword">this</span>);
      <span class="hljs-keyword">case</span> <span class="hljs-string">"&amp;&amp;"</span>:<span class="hljs-keyword">return</span> (v1&amp;&amp;v2)?options.fn(<span class="hljs-keyword">this</span>):options.inverse(<span class="hljs-keyword">this</span>);
      <span class="hljs-keyword">case</span> <span class="hljs-string">"||"</span>:<span class="hljs-keyword">return</span> (v1||v2)?options.fn(<span class="hljs-keyword">this</span>):options.inverse(<span class="hljs-keyword">this</span>);
      <span class="hljs-keyword">case</span> <span class="hljs-string">"&lt;"</span>:<span class="hljs-keyword">return</span> (v1&lt;v2)?options.fn(<span class="hljs-keyword">this</span>):options.inverse(<span class="hljs-keyword">this</span>);
      <span class="hljs-keyword">case</span> <span class="hljs-string">"&lt;="</span>:<span class="hljs-keyword">return</span> (v1&lt;=v2)?options.fn(<span class="hljs-keyword">this</span>):options.inverse(<span class="hljs-keyword">this</span>);
      <span class="hljs-keyword">case</span> <span class="hljs-string">"&gt;"</span>:<span class="hljs-keyword">return</span> (v1&gt;v2)?options.fn(<span class="hljs-keyword">this</span>):options.inverse(<span class="hljs-keyword">this</span>);
      <span class="hljs-keyword">case</span> <span class="hljs-string">"&gt;="</span>:<span class="hljs-keyword">return</span> (v1&gt;=v2)?options.fn(<span class="hljs-keyword">this</span>):options.inverse(<span class="hljs-keyword">this</span>);
      <span class="hljs-keyword">default</span>:<span class="hljs-keyword">return</span> <span class="hljs-built_in">eval</span>(<span class="hljs-string">""</span>+v1+operator+v2)?options.fn(<span class="hljs-keyword">this</span>):options.inverse(<span class="hljs-keyword">this</span>);
   }
})(Handlebars);
					</code>
				</pre>
			</div>
			<h3 id="bu-shi-yong-mo-ban">不使用模板 <a href="#bu-shi-yong-mo-ban" class="doc-anchor"></a></h3>
			<p>不使用模板似乎就失去了 Web 组件的核心价值，但有用户可能真想这么用。</p>
			<p>这就回归到最原始的网页书写方式了：</p>
			<ol>
				<li>引入 Amaze UI 的 CSS 和 JS 文件；</li>
				<li>按照 Web 组件的模板组织 HTML（可以点击左侧菜单进入组件演示页面拷贝示例代码，当然，你也可以使用其他模板引擎，只要渲染出来的结构符合跟 Web 组件相同就行）。</li>
			</ol>
			<div class="ds-thread" data-thread-key="0eaf4906e8c227dae503596e9600bbb4" data-title="Web 组件|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>