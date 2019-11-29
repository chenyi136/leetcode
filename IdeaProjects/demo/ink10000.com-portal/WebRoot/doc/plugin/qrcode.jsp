<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Qrcode|Amaze UI</title>
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
						<li><a href="#yan-shi">演示</a></li>
						<li><a href="#api">API</a></li>
					</ul>
				</div>
			</div>
			<h1 id="qrcode">QRCode <a href="#qrcode" class="doc-anchor"></a></h1>
			<hr>
			<p>二维码生成工具（<a href="#">via</a>，JS 相关的二维码生成工具大多基于 <a href="#">QR Code Generator 项目</a>）。</p>
			<h2 id="yan-shi">演示 <a href="#yan-shi" class="doc-anchor"></a></h2>
			<div class="doc-example">
				<div class="am-input-group">
					<input type="text" class="am-form-field" id="doc-qr-text">
					<span class="am-input-group-btn"><button type="button" class="am-btn am-btn-default" id="doc-gen-qr">生成</button></span>
				</div>
				<div class="am-text-center" id="doc-qrcode"></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="api">API <a href="#api" class="doc-anchor"></a></h2>
			<ul>
				<li><code>$(element).qrcode(options)</code>:根据指定 <code>options</code> 生成二维码并插入到 <code>$(element)</code> 中 <span class="am-badge am-badge-danger">v2.4.1</span>；</li>
				<li>
					<p><code>v2.4.1</code> 以前的版本可以通过 <code>$.AMUI.qrcode</code> 调用构造函数。</p>
					<div class="doc-code demo-highlight">
						<pre>
							<code class="javascript">
<span class="hljs-keyword">var</span> QRCode=$.AMUI.qrcode;
$(element).html(<span class="hljs-keyword">new</span> QRCode({text:<span class="hljs-string">'xxx'</span>}));
							</code>
						</pre>
					</div>
				</li>
			</ul>
			<p>如果直接传递字符串，按照默认参数生成该字符串的二维码。</p>
			<p>默认参数及说明：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
{
   text:<span class="hljs-string">""</span>,<span class="hljs-comment">//要生产二维码的文字</span>
   render:<span class="hljs-string">""</span>,<span class="hljs-comment">//渲染方式，默认的选择顺序为`canvas`-&gt;`svg`-&gt;`table`</span>
   width:<span class="hljs-number">256</span>,<span class="hljs-comment">//二维码宽度`px`</span>
   height:<span class="hljs-number">256</span>,<span class="hljs-comment">//二维码高度`px`</span>
   correctLevel:<span class="hljs-number">3</span>,<span class="hljs-comment">//纠错级别，可取0、1、2、3，数字越大说明所需纠错级别越大</span>
   background:<span class="hljs-string">"#ffffff"</span>,<span class="hljs-comment">//背景色</span>
   foreground:<span class="hljs-string">"#000000"</span><span class="hljs-comment">//前景色</span>
}
					</code>
				</pre>
			</div>
			<div class="ds-thread" data-thread-key="f760abd9f9911f2874408493c4c65a2e" data-title="JS 插件 - Qrcode|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	function o(o){
		$qr.empty().qrcode(o);
	}
	var c=$("#doc-qr-text");
	$qr=$("#doc-qrcode"),c.val(location.href),o(location.href);
	$("#doc-gen-qr").on("click",function(){
		o(c.val());
	});
	c.on("focusout",function(){
		o(c.val());
	});
});
</script>
</body>
</html>