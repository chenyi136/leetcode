<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Button|Amaze UI</title>
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
							<a href="#ji-ben-shi-yong">基本使用</a>
							<ul class="am-collapse">
								<li><a href="#mo-ren-yang-shi">默认样式</a></li>
								<li><a href="#yuan-jiao-an-niu">圆角按钮</a></li>
								<li><a href="#tuo-yuan-xing-an-niu">椭圆形按钮</a></li>
							</ul>
						</li>
						<li>
							<a href="#an-niu-zhuang-tai">按钮状态</a>
							<ul class="am-collapse">
								<li><a href="#ji-huo-zhuang-tai">激活状态</a></li>
								<li><a href="#jin-yong-zhuang-tai">禁用状态</a></li>
							</ul>
						</li>
						<li><a href="#an-niu-chi-cun">按钮尺寸</a></li>
						<li><a href="#kuai-ji-xian-shi">块级显示</a></li>
						<li><a href="#an-niu-icon">按钮 Icon</a></li>
					</ul>
				</div>
			</div>
			<h1 id="button">Button <a href="#button" class="doc-anchor"></a></h1>
			<hr>
			<h2 id="ji-ben-shi-yong">基本使用 <a href="#ji-ben-shi-yong" class="doc-anchor"></a></h2>
			<h3 id="mo-ren-yang-shi">默认样式 <a href="#mo-ren-yang-shi" class="doc-anchor"></a></h3>
			<p>在要应用按钮样式的元素上添加 <code>.am-btn</code>，再设置相应的颜色。</p>
			<ul>
				<li><code>.am-btn-default</code> - 默认，灰色按钮</li>
				<li><code>.am-btn-primary</code> - 蓝色按钮</li>
				<li><code>.am-btn-secondary</code> - 浅蓝色按钮</li>
				<li><code>.am-btn-success</code> - 绿色按钮</li>
				<li><code>.am-btn-warning</code> - 橙色按钮</li>
				<li><code>.am-btn-danger</code> - 红色按钮</li>
				<li><code>.am-btn-link</code></li>
			</ul>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-default">默认样式</button>
				<button type="button" class="am-btn am-btn-primary">主色按钮</button>
				<button type="button" class="am-btn am-btn-secondary">次色按钮</button>
				<button type="button" class="am-btn am-btn-success">绿色按钮</button>
				<button type="button" class="am-btn am-btn-warning">橙色按钮</button>
				<button type="button" class="am-btn am-btn-danger">红色按钮</button>
				<a class="am-btn am-btn-link">链接</a>
				<a href="#" class="am-btn am-btn-danger">应用按钮样式的链接</a>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default"</span>&gt;</span>默认样式<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary"</span>&gt;</span>主色按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-secondary"</span>&gt;</span>次色按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-success"</span>&gt;</span>绿色按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-warning"</span>&gt;</span>橙色按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-danger"</span>&gt;</span>红色按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-link"</span>&gt;</span>链接<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-danger"</span>&gt;</span>应用按钮样式的链接<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="yuan-jiao-an-niu">圆角按钮 <a href="#yuan-jiao-an-niu" class="doc-anchor"></a></h3>
			<p>在默认样式的基础上添加 <code>.am-radius</code> class.</p>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-default am-radius">默认样式</button>
				<button type="button" class="am-btn am-btn-primary am-radius">主色按钮</button>
				<button type="button" class="am-btn am-btn-secondary am-radius">次色按钮</button>
				<button type="button" class="am-btn am-btn-success am-radius">绿色按钮</button>
				<button type="button" class="am-btn am-btn-warning am-radius">橙色按钮</button>
				<button type="button" class="am-btn am-btn-danger am-radius">红色按钮</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-radius am-btn-default"</span>&gt;</span>默认样式<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<h3 id="tuo-yuan-xing-an-niu">椭圆形按钮 <a href="#tuo-yuan-xing-an-niu" class="doc-anchor"></a></h3>
			<p>在默认样式的基础上添加 <code>.am-round</code> class.</p>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-default am-round">默认样式</button>
				<button type="button" class="am-btn am-btn-primary am-round">主色按钮</button>
				<button type="button" class="am-btn am-btn-secondary am-round">次色按钮</button>
				<button type="button" class="am-btn am-btn-success am-round">绿色按钮</button>
				<button type="button" class="am-btn am-btn-warning am-round">橙色按钮</button>
				<button type="button" class="am-btn am-btn-danger am-round">红色按钮</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-round am-btn-default"</span>&gt;</span>默认样式<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<h2 id="an-niu-zhuang-tai">按钮状态 <a href="#an-niu-zhuang-tai" class="doc-anchor"></a></h2>
			<h3 id="ji-huo-zhuang-tai">激活状态 <a href="#ji-huo-zhuang-tai" class="doc-anchor"></a></h3>
			<p>在按钮上添加 <code>.am-active</code> class。</p>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-primary am-active">激活状态</button>
				<button type="button" class="am-btn am-btn-default am-active">激活状态</button>
				<br>
				<a href="#" class="am-btn am-btn-primary am-active">链接按钮激活状态</a>
				<a href="#" class="am-btn am-btn-default am-active">链接按钮激活状态</a>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-active"</span>&gt;</span>激活状态<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-active"</span>&gt;</span>激活状态<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-active"</span> <span class="hljs-attribute">role</span>=<span class="hljs-value">"button"</span>&gt;</span>链接按钮激活状态<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-active"</span> <span class="hljs-attribute">role</span>=<span class="hljs-value">"button"</span>&gt;</span>链接按钮激活状态<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="jin-yong-zhuang-tai">禁用状态 <a href="#jin-yong-zhuang-tai" class="doc-anchor"></a></h3>
			<p>在按钮上设置 <code>disabled</code> 属性或者添加 <code>.am-disabled</code> class。</p>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-primary" disabled="disabled">禁用状态</button>
				<button type="button" class="am-btn am-btn-default" disabled="disabled">禁用状态</button>
				<br>
				<a href="#" class="am-btn am-btn-primary am-disabled">链接按钮禁用状态</a>
				<a href="#" class="am-btn am-btn-default am-disabled">链接按钮禁用状态</a>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary"</span> <span class="hljs-attribute">disabled</span>=<span class="hljs-value">"disabled"</span>&gt;</span>禁用状态<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default"</span> <span class="hljs-attribute">disabled</span>=<span class="hljs-value">"disabled"</span>&gt;</span>禁用状态<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-disabled"</span>&gt;</span>链接按钮禁用状态<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-disabled"</span>&gt;</span>链接按钮禁用状态<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
					</code>
				</pre>
			</div>
			<div class="am-alert am-alert-warning">IE9 会把设置了 <code>disabled</code> 属性的 <code>button</code> 元素文字渲染成灰色并加上白色阴影，CSS 无法控制这个默认样式。</div>
			<h2 id="an-niu-chi-cun">按钮尺寸 <a href="#an-niu-chi-cun" class="doc-anchor"></a></h2>
			<ul>
				<li><code>.am-btn-xl</code></li>
				<li><code>.am-btn-lg</code></li>
				<li><code>.am-btn-default</code></li>
				<li><code>.am-btn-sm</code></li>
				<li><code>.am-btn-xs</code></li>
			</ul>
			<div class="doc-example">
				<button class="am-btn am-btn-xl am-btn-default">按钮 - xl</button>
				<button class="am-btn am-btn-lg am-btn-default">按钮 - lg</button>
				<button class="am-btn am-btn-default">按钮默认大小</button>
				<button class="am-btn am-btn-sm am-btn-default">按钮 - sm</button>
				<button class="am-btn am-btn-xs am-btn-default">按钮 - xs</button>
				<br>
				<button class="am-btn am-btn-xl am-btn-primary">按钮 - xl</button>
				<button class="am-btn am-btn-lg am-btn-primary">按钮 - lg</button>
				<button class="am-btn am-btn-primary">按钮默认大小</button>
				<button class="am-btn am-btn-sm am-btn-primary">按钮 - sm</button>
				<button class="am-btn am-btn-xs am-btn-primary">按钮 - xs</button>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-btn-xl"</span>&gt;</span>按钮 - xl<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-btn-lg"</span>&gt;</span>按钮 - lg<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default"</span>&gt;</span>按钮默认大小<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-btn-sm"</span>&gt;</span>按钮 - sm<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-btn-xs"</span>&gt;</span>按钮 - xs<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">br</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-xl"</span>&gt;</span>按钮 - xl<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-lg"</span>&gt;</span>按钮 - lg<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary"</span>&gt;</span>按钮默认大小<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-sm"</span>&gt;</span>按钮 - sm<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-xs"</span>&gt;</span>按钮 - xs<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h2 id="kuai-ji-xian-shi">块级显示 <a href="#kuai-ji-xian-shi" class="doc-anchor"></a></h2>
			<p>添加 <code>.am-btn-block</code> class。</p>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-block am-btn-primary">块级显示的按钮</button>
				<button type="button" class="am-btn am-btn-block am-btn-default">块级显示的按钮</button>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-btn-block"</span>&gt;</span>块级显示的按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default am-btn-block"</span>&gt;</span>块级显示的按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h2 id="an-niu-icon">按钮 Icon <a href="#an-niu-icon" class="doc-anchor"></a></h2>
			<p>使用 Icon 之前需先引入 <a href="doc/css/icon.jsp">Icon 组件</a>。</p>
			<div class="doc-example">
				<button class="am-btn am-btn-default"><i class="am-icon-cog"></i> 设置</button>
				<a href="#" class="am-btn am-btn-warning"><i class="am-icon-shopping-cart"></i> 结账</a>
				<button class="am-btn am-btn-default"><i class="am-icon-spin am-icon-spinner"></i> 加载中</button>
				<button class="am-btn am-btn-primary">下载片片 <i class="am-icon-cloud-download"></i></button>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-cog"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span>设置<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-warning"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-shopping-cart"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span>结账<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-default"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-spinner am-icon-spin"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span>加载中<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary"</span>&gt;</span>下载片片<span class="hljs-tag">&lt;<span class="hljs-title">i</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-cloud-download"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">i</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
					</code>
				</pre>
			</div>
			<div class="ds-thread" data-thread-key="980651d99c95d96440cb87e20df03481" data-title="CSS - Button|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>