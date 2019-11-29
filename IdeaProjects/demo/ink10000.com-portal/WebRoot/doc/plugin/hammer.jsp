<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Hammer|Amaze UI</title>
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
							<a href="#diao-yong-fang-shi">调用方式</a>
							<ul class="am-collapse">
								<li><a href="#code-hammercode">$().hammer()</a></li>
								<li><a href="#hammer-dui-xiang">Hammer 对象</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="hammer-js">Hammer.js <a href="#hammer-js" class="doc-anchor"></a></h1>
			<hr>
			<p>几经尝试，Amaze UI 最终选择了 <a href="#">Hammer.js 2.0</a> 作为触控操作库，更多细节参见<a href="#">官方文档</a>。</p>
			<h2 id="diao-yong-fang-shi">调用方式 <a href="#diao-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="code-hammercode"><code>$().hammer()</code> <a href="#code-hammercode" class="doc-anchor"></a></h3>
			<p>可以通过插件的形式调用 Hammer.js。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(element).hammer(options).on(<span class="hljs-string">'pan'</span>,myPanHandler);</code></pre></div>
			<p>Hammer 实例存储在 <code>$(element).data(&#39;hammer&#39;)</code> 上。</p>
			<h3 id="hammer-dui-xiang">Hammer 对象 <a href="#hammer-dui-xiang" class="doc-anchor"></a></h3>
			<p>可以通过 <code>$.AMUI.Hammer</code> 访问 <code>Hammer</code> 对象。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">var</span> Hammer=$.AMUI.Hammer;
<span class="hljs-keyword">var</span> hammertime=<span class="hljs-keyword">new</span> Hammer(myElement,myOptions);
hammertime.on(<span class="hljs-string">'pan'</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">e</span>)</span>{
   <span class="hljs-built_in">console</span>.log(e);
});
					</code>
				</pre>
			</div>
			<p><strong>Hammer.js 略显复杂，后续会增加更多使用说明。</strong></p>
			<div class="ds-thread" data-thread-key="0596eda95f464f1305e590ca671a7e47" data-title="JS 插件 - Hammer|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>