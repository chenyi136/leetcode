<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Code|Amaze UI</title>
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
						<li><a href="#xing-nei-dai-ma">行内代码</a></li>
						<li><a href="#dai-ma-pian-duan">代码片段</a></li>
						<li><a href="#dai-ma-kuai-gao-du">代码块高度</a></li>
						<li>
							<a href="#can-kao-lian-jie">参考链接</a>
							<ul class="am-collapse"><li><a href="#qing-liang-ji-de-dai-ma-gao-liang-cha-jian">轻量级的代码高亮插件</a></li></ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="code">Code <a href="#code" class="doc-anchor"></a></h1>
			<p>定义代码样式。</p>
			<h2 id="xing-nei-dai-ma">行内代码 <a href="#xing-nei-dai-ma" class="doc-anchor"></a></h2>
			<p>使用 <code>&lt;code&gt;</code> 标签的代码。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">code</span>&gt;</span>code here<span class="hljs-tag">&lt;/<span class="hljs-title">code</span>&gt;</span></code></pre></div>
			<h2 id="dai-ma-pian-duan">代码片段 <a href="#dai-ma-pian-duan" class="doc-anchor"></a></h2>
			<p>放在 <code>&lt;pre&gt;</code> 里面的代码片段。</p>
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
			<h2 id="dai-ma-kuai-gao-du">代码块高度 <a href="#dai-ma-kuai-gao-du" class="doc-anchor"></a></h2>
			<p>添加 <code>.am-pre-scrollable</code> 限制代码块高度，默认为 <code>24rem</code>。</p>
			<div class="doc-example">
				<pre style="background-color:#F8F8F8;color:#555;" class="am-pre-scrollable">
span.l-1{-webkit-animation-delay:1s;animation-delay:1s;-ms-animation-delay:1s;-moz-animation-delay:1s;}
span.l-2{-webkit-animation-delay:0.8s;animation-delay:0.8s;-ms-animation-delay:0.8s;-moz-animation-delay:0.8s;}
span.l-3{-webkit-animation-delay:0.6s;animation-delay:0.6s;-ms-animation-delay:0.6s;-moz-animation-delay:0.6s;}
span.l-4{-webkit-animation-delay:0.4s;animation-delay:0.4s;-ms-animation-delay:0.4s;-moz-animation-delay:0.4s;}
span.l-5{-webkit-animation-delay:0.2s;animation-delay:0.2s;-ms-animation-delay:0.2s;-moz-animation-delay:0.2s;}
span.l-6{-webkit-animation-delay:0;animation-delay:0;-ms-animation-delay:0;-moz-animation-delay:0;}
@-webkit-keyframes loader{
   0%{-webkit-transform:translateX(-30px);opacity:0;}
   25%{opacity:1;}
   50%{-webkit-transform:translateX(30px);opacity:0;}
   100%{opacity:0;}
}
@-moz-keyframes loader{
   0%{-moz-transform:translateX(-30px);opacity:0;}
   25%{opacity:1;}
   50%{-moz-transform:translateX(30px);opacity:0;}
   100%{opacity:0;}
}
@-keyframes loader{
   0%{-transform:translateX(-30px);opacity:0;}
   25%{opacity:1;}
   50%{-transform:translateX(30px);opacity:0;}
   100%{opacity:0;}
}
@-ms-keyframes loader{
   0%{-ms-transform:translateX(-30px);opacity:0;}
   25%{opacity:1;}
   50%{-ms-transform:translateX(30px);opacity:0;}
   100%{opacity:0;}
}
			</pre>
		</div>
		<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
		<h2 id="can-kao-lian-jie">参考链接 <a href="#can-kao-lian-jie" class="doc-anchor"></a></h2>
		<h3 id="qing-liang-ji-de-dai-ma-gao-liang-cha-jian">轻量级的代码高亮插件 <a href="#qing-liang-ji-de-dai-ma-gao-liang-cha-jian" class="doc-anchor"></a></h3>
		<ul>
			<li><a href="#">google-code-prettify</a></li>
			<li><a href="#">highlight.js</a></li>
			<li><a href="#">Rainbow</a></li>
		</ul>
		<div class="ds-thread" data-thread-key="f24e5f611f9bddced7f6cb9a38c6a49b" data-title="CSS - Code|Amaze UI" id="ds-thread"></div></div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>