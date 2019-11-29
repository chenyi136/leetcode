<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Duoshuo 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="duoshuo">Duoshuo <a href="#duoshuo" class="doc-anchor"></a></h1>
			<hr>
			<p>多说评论系统。</p>
			<div class="am-alert am-alert-danger">请大家使用的时候把 <code>data-ds-short-name=&quot;amazeui&quot;</code> 中的 <code>amazeui</code> 换成自己在<a href="#">多说注册</a> 的网站 ID，不然你们的评论都跑到 Amaze UI 这边来了。</div>
			<div class="am-alert am-alert-warning">本组件由<a href="#">多说</a>提供服务，更多细节参加<a href="#">官方文档</a>。</div>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#duoshuo-demo">组件演示</a>
							<ul class="am-collapse"><li><a href="#duoshuo-demo-default-0">default（默认）</a></li></ul>
						</li>
						<li><a href="#shi-yong-fang-fa">使用方法</a></li>
						<li><a href="#api">API</a></li>
					</ul>
				</div>
			</div>
			<h2 id="duoshuo-demo">组件演示</h2>
			<h3 id="duoshuo-demo-default-0">default（默认）</h3>
			<div class="doc-example" data-url="doc/widget/duoshuo_default_0.jsp"><div class="am-duoshuo am-duoshuo-default" data-am-widget="duoshuo" data-ds-short-name="amazeui"><div class="ds-thread"></div></div></div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<p>设置多说域名即可，其他参数可选。</p>
			<h2 id="api">API <a href="#api" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="18ff22c1adae4dce83ea7125dc04afca" data-title="Duoshuo 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>