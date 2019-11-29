<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - List|Amaze UI</title>
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
							<a href="#ji-ben-yang-shi">基本样式</a>
							<ul class="am-collapse">
								<li><a href="#lian-jie-lie-biao">链接列表</a></li>
								<li><a href="#wen-zi-chao-chu-jie-duan-wei-">文字超出截断为「...」</a></li>
								<li><a href="#chun-wen-zi-lie-biao">纯文字列表</a></li>
							</ul>
						</li>
						<li>
							<a href="#yang-shi-bian-huan">样式变换</a>
							<ul class="am-collapse">
								<li><a href="#lie-biao-bian-kuang">列表边框</a></li>
								<li><a href="#ban-ma-wen">斑马纹</a></li>
							</ul>
						</li>
						<li>
							<a href="#zu-he-shi-yong">组合使用</a>
							<ul class="am-collapse">
								<li><a href="#tian-jia-badge">添加 Badge</a></li>
								<li><a href="#tian-jia-icon">添加 ICON</a></li>
								<li><a href="#yu-panel-zu-he">与 Panel 组合</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="list">List <a href="#list" class="doc-anchor"></a></h1>
			<hr>
			<h2 id="ji-ben-yang-shi">基本样式 <a href="#ji-ben-yang-shi" class="doc-anchor"></a></h2>
			<h3 id="lian-jie-lie-biao">链接列表 <a href="#lian-jie-lie-biao" class="doc-anchor"></a></h3>
			<p>使用 <code>&lt;ul&gt;</code> 结构嵌套链接列表，添加 <code>.am-list</code>。</p>
			<div class="doc-example">
				<ul class="am-list">
					<li><a href="#">每个人都有一个死角， 自己走不出来，别人也闯不进去。</a></li>
					<li><a href="#">我把最深沉的秘密放在那里。</a></li>
					<li><a href="#">你不懂我，我不怪你。</a></li>
					<li><a href="#">每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="wen-zi-chao-chu-jie-duan-wei-">文字超出截断为「...」 <a href="#wen-zi-chao-chu-jie-duan-wei-" class="doc-anchor"></a></h3>
			<p>在 <code>&lt;a&gt;</code> 上添加 <code>.am-text-truncate</code> class 可以实现文字超出一行时截断为 <code>...</code>。</p>
			<div class="doc-example"><ul class="am-list"><li><a href="#" class="am-text-truncate">每个人都有一个死角， 自己走不出来，别人也闯不进去。我把最深沉的秘密放在那里。每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</a></li></ul></div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="chun-wen-zi-lie-biao">纯文字列表 <a href="#chun-wen-zi-lie-biao" class="doc-anchor"></a></h3>
			<p>在 <code>.am-list</code> 的基础上添加 <code>.am-list-static</code>。</p>
			<div class="doc-example">
				<ul class="am-list am-list-static">
					<li>每个人都有一个死角， 自己走不出来，别人也闯不进去。</li>
					<li>我把最深沉的秘密放在那里。</li>
					<li>你不懂我，我不怪你。</li>
					<li>每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="yang-shi-bian-huan">样式变换 <a href="#yang-shi-bian-huan" class="doc-anchor"></a></h2>
			<h3 id="lie-biao-bian-kuang">列表边框 <a href="#lie-biao-bian-kuang" class="doc-anchor"></a></h3>
			<p>在容器上添加 <code>.am-list-border</code> class。</p>
			<div class="doc-example">
				<ul class="am-list am-list-static am-list-border">
					<li>每个人都有一个死角， 自己走不出来，别人也闯不进去。</li>
					<li>我把最深沉的秘密放在那里。</li>
					<li>你不懂我，我不怪你。</li>
					<li>每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</li>
				</ul>
				<ul class="am-list am-list-border">
					<li><a href="#">每个人都有一个死角， 自己走不出来，别人也闯不进去。</a></li>
					<li><a href="#">我把最深沉的秘密放在那里。</a></li>
					<li><a href="#">你不懂我，我不怪你。</a></li>
					<li><a href="#">每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="ban-ma-wen">斑马纹 <a href="#ban-ma-wen" class="doc-anchor"></a></h3>
			<p>添加 <code>.am-list-striped</code> class。</p>
			<div class="doc-example">
				<ul class="am-list am-list-static am-list-border am-list-striped">
					<li>每个人都有一个死角， 自己走不出来，别人也闯不进去。</li>
					<li>我把最深沉的秘密放在那里。</li>
					<li>你不懂我，我不怪你。</li>
					<li>每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="zu-he-shi-yong">组合使用 <a href="#zu-he-shi-yong" class="doc-anchor"></a></h2>
			<h3 id="tian-jia-badge">添加 Badge <a href="#tian-jia-badge" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<ul class="am-list am-list-static am-list-border">
					<li><span class="am-badge am-badge-success">YES</span><span class="am-badge am-badge-danger">NO</span> 每个人都有一个死角， 自己走不出来，别人也闯不进去。</li>
					<li><span class="am-badge">17</span> 我把最深沉的秘密放在那里。</li>
					<li><span class="am-badge">5</span>你不懂我，我不怪你。</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="tian-jia-icon">添加 ICON <a href="#tian-jia-icon" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<ul class="am-list am-list-static am-list-border">
					<li><i class="am-icon-home am-icon-fw"></i> 每个人都有一个死角， 自己走不出来，别人也闯不进去。</li>
					<li><i class="am-icon-book am-icon-fw"></i> 我把最深沉的秘密放在那里。</li>
					<li><i class="am-icon-pencil am-icon-fw"></i>你不懂我，我不怪你。</li>
				</ul>
				<ul class="am-list am-list-border">
					<li><a href="#"><i class="am-icon-home am-icon-fw"></i> 每个人都有一个死角， 自己走不出来，别人也闯不进去。</a></li>
					<li><a href="#"><i class="am-icon-book am-icon-fw"></i> 我把最深沉的秘密放在那里。</a></li>
					<li><a href="#"><i class="am-icon-pencil am-icon-fw"></i>你不懂我，我不怪你。</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="yu-panel-zu-he">与 Panel 组合 <a href="#yu-panel-zu-he" class="doc-anchor"></a></h3>
			<p>见 <a href="doc/css/panel.jsp">Panel 组件</a>。</p>
			<div class="ds-thread" data-thread-key="ed898ec934d78987010268634f95b0c5" data-title="CSS - List|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>