<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Panel|Amaze UI</title>
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
						<li><a href="#ji-ben-yang-shi">基本样式</a></li>
						<li><a href="#dai-biao-ti-de-mian-ban">带标题的面板</a></li>
						<li><a href="#mian-ban-yan-se">面板颜色</a></li>
						<li><a href="#mian-ban-ye-jiao">面板页脚</a></li>
						<li>
							<a href="#zu-he-shi-yong">组合使用</a>
							<ul class="am-collapse">
								<li><a href="#mian-ban-qian-tao-biao-ge">面板嵌套表格</a></li>
								<li><a href="#mian-ban-qian-tao-lie-biao">面板嵌套列表</a></li>
							</ul>
						</li>
						<li><a href="#mian-ban-qun-zu">面板群组</a></li>
					</ul>
				</div>
			</div>
			<h1 id="panel">Panel <a href="#panel" class="doc-anchor"></a></h1>
			<hr>
			<p>面板组件带有轮廓、常用来放置带标题和文字的内容块。</p>
			<h2 id="ji-ben-yang-shi">基本样式 <a href="#ji-ben-yang-shi" class="doc-anchor"></a></h2>
			<p>默认的 <code>.am-panel</code> 提供基本的阴影和边距，默认边框添加 <code>.am-panel-default</code>，内容放在 <code>.am-panel-bd</code> 里面。</p>
			<div class="doc-example"><div class="am-panel am-panel-default"><div class="am-panel-bd">这是一个基本的面板组件。</div></div></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-panel am-panel-default"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-panel-bd"</span>&gt;</span>这是一个基本的面板组件。<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
			<h2 id="dai-biao-ti-de-mian-ban">带标题的面板 <a href="#dai-biao-ti-de-mian-ban" class="doc-anchor"></a></h2>
			<p><code>.am-panel-hd</code> 用来放置标题，建议使用 <code>h1</code> - <code>h6</code> 并添加 <code>.am-panel-title</code> class，更加语义化。</p>
			<div class="doc-example">
				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">面板标题</div>
					<div class="am-panel-bd">面板内容</div>
				</div>
				<section class="am-panel am-panel-default">
					<header class="am-panel-hd"><h3 class="am-panel-title">面板标题</h3></header>
					<div class="am-panel-bd">面板内容</div>
				</section>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="mian-ban-yan-se">面板颜色 <a href="#mian-ban-yan-se" class="doc-anchor"></a></h2>
			<p>添加不同的一下类可以设置不同的颜色。</p>
			<ul>
				<li><code>.am-panel-primary</code></li>
				<li><code>.am-panel-secondary</code></li>
				<li><code>.am-panel-success</code></li>
				<li><code>.am-panel-warning</code></li>
				<li><code>.am-panel-danger</code></li>
			</ul>
			<div class="doc-example">
				<div class="am-panel am-panel-primary">
					<div class="am-panel-hd"><h3 class="am-panel-title">面板标题</h3></div>
					<div class="am-panel-bd">面板内容</div>
				</div>
				<div class="am-panel am-panel-secondary">
					<div class="am-panel-hd"><h3 class="am-panel-title">面板标题</h3></div>
					<div class="am-panel-bd">面板内容</div>
				</div>
				<div class="am-panel am-panel-success">
					<div class="am-panel-hd"><h3 class="am-panel-title">面板标题</h3></div>
					<div class="am-panel-bd">面板内容</div>
				</div>
				<div class="am-panel am-panel-warning">
					<div class="am-panel-hd"><h3 class="am-panel-title">面板标题</h3></div>
					<div class="am-panel-bd">面板内容</div>
				</div>
				<div class="am-panel am-panel-danger">
					<div class="am-panel-hd"><h3 class="am-panel-title">面板标题</h3></div>
					<div class="am-panel-bd">面板内容</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="mian-ban-ye-jiao">面板页脚 <a href="#mian-ban-ye-jiao" class="doc-anchor"></a></h2>
			<p>面板页脚 <code>.am-panel-footer</code>，用于放置次要信息。页脚不会继承 <code>.am-panel-primary</code> - <code>.am-panel-danger</code> 等颜色样式。</p>
			<div class="doc-example">
				<section class="am-panel am-panel-default">
					<main class="am-panel-bd">面板内容</main>
					<footer class="am-panel-footer">面板页脚</footer>
				</section>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="zu-he-shi-yong">组合使用 <a href="#zu-he-shi-yong" class="doc-anchor"></a></h2>
			<h3 id="mian-ban-qian-tao-biao-ge">面板嵌套表格 <a href="#mian-ban-qian-tao-biao-ge" class="doc-anchor"></a></h3>
			<p>将没有边框的表格 (<code>.am-table</code>) 直接放在 <code>.am-panel</code> 下面（不是放在 <code>.am-panel-bd</code> 里面）。</p>
			<div class="doc-example">
				<div class="am-panel am-panel-default">
					<div class="am-panel-hd"><h3 class="am-panel-title">面板标题</h3></div>
					<div class="am-panel-bd">这里是面板其他内容。</div>
					<table class="am-table">
						<thead>
							<tr>
								<th>名称</th>
								<th>网址</th>
								<th>创建时间</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Amaze UI</td>
								<td>amazeui.org</td>
								<td>2014-01-01</td>
							</tr>
							<tr>
								<td>Amaze UI</td>
								<td>amazeui.org</td>
								<td>2014-01-01</td>
							</tr>
							<tr>
								<td>Amaze UI</td>
								<td>amazeui.org</td>
								<td>2014-01-01</td>
							</tr>
						</tbody>
					</table>
					<div class="am-panel-footer">面板页脚</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="mian-ban-qian-tao-lie-biao">面板嵌套列表 <a href="#mian-ban-qian-tao-lie-biao" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-panel am-panel-default">
					<div class="am-panel-hd"><h3 class="am-panel-title">面板标题</h3></div>
					<div class="am-panel-bd">这里是面板其他内容。</div>
					<ul class="am-list am-list-static">
						<li>每个人都有一个死角， 自己走不出来，别人也闯不进去。</li>
						<li>我把最深沉的秘密放在那里。</li>
						<li>你不懂我，我不怪你。</li>
						<li>每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</li>
					</ul>
					<div class="am-panel-footer">...</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="mian-ban-qun-zu">面板群组 <a href="#mian-ban-qun-zu" class="doc-anchor"></a></h2>
			<p>将多个面板放在 <code>.am-panel-group</code> 里面，可结合 JS 制作折叠面板（手风琴面板）。</p>
			<div class="doc-example">
				<div class="am-panel-group">
					<section class="am-panel am-panel-default">
						<header class="am-panel-hd">面板标题</header>
						<main class="am-panel-bd">面板内容</main>
					</section>
					<section class="am-panel am-panel-default">
						<header class="am-panel-hd">面板标题</header>
						<div class="am-panel-collapse"><main class="am-panel-bd">面板内容</main></div>
					</section>
					<section class="am-panel am-panel-default">
						<header class="am-panel-hd">面板标题</header>
						<main class="am-panel-bd">面板内容</main>
					</section>
				</div>
			</div>
			<div class="ds-thread" data-thread-key="59c8f9539aeb173594922001abdcf1e8" data-title="CSS - Panel|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>