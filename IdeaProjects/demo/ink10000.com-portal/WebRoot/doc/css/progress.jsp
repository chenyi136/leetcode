<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Progress|Amaze UI</title>
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
						<li><a href="#jin-du-tiao-yan-se">进度条颜色</a></li>
						<li><a href="#jin-du-tiao-gao-du">进度条高度</a></li>
						<li><a href="#jin-du-tiao-tiao-wen">进度条条纹</a></li>
						<li><a href="#jin-du-tiao-dong-hua">进度条动画</a></li>
						<li><a href="#jin-du-tiao-dui-die">进度条堆叠</a></li>
					</ul>
				</div>
			</div>
			<h1 id="progress">Progress <a href="#progress" class="doc-anchor"></a></h1>
			<hr>
			<p>进度条组件，<code>.am-progress</code> 为容器，<code>.am-progress-bar</code> 为进度显示信息。</p>
			<h2 id="ji-ben-yang-shi">基本样式 <a href="#ji-ben-yang-shi" class="doc-anchor"></a></h2>
			<div class="doc-example">
				<div class="am-progress"><div style="width:30%;" class="am-progress-bar"></div></div>
				<div class="am-progress"><div style="width:40%;" class="am-progress-bar">40%</div></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="jin-du-tiao-yan-se">进度条颜色 <a href="#jin-du-tiao-yan-se" class="doc-anchor"></a></h2>
			<p>进度条默认为全局主色，在进度条上添加相应的类可设置的颜色：</p>
			<ul>
				<li><code>.am-progress-bar-secondary</code></li>
				<li><code>.am-progress-bar-success</code></li>
				<li><code>.am-progress-bar-warning</code></li>
				<li><code>.am-progress-bar-danger</code></li>
			</ul>
			<div class="doc-example">
				<div class="am-progress"><div style="width:15%;" class="am-progress-bar"></div></div>
				<div class="am-progress"><div style="width:30%;" class="am-progress-bar am-progress-bar-secondary"></div></div>
				<div class="am-progress"><div style="width:45%;" class="am-progress-bar am-progress-bar-success"></div></div>
				<div class="am-progress"><div style="width:60%;" class="am-progress-bar am-progress-bar-warning"></div></div>
				<div class="am-progress"><div style="width:75%;" class="am-progress-bar am-progress-bar-danger"></div></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="jin-du-tiao-gao-du">进度条高度 <a href="#jin-du-tiao-gao-du" class="doc-anchor"></a></h2>
			<p>在 <code>.am-progress</code> 添加 <code>.am-progress-xs</code> <code>.am-progress-sm</code> 可以设置进度条高度。</p>
			<div class="doc-example">
				<div class="am-progress am-progress-xs"><div style="width:80%;" class="am-progress-bar"></div></div>
				<div class="am-progress am-progress-sm"><div style="width:60%;" class="am-progress-bar"></div></div>
				<div class="am-progress"><div style="width:40%;" class="am-progress-bar"></div></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="jin-du-tiao-tiao-wen">进度条条纹 <a href="#jin-du-tiao-tiao-wen" class="doc-anchor"></a></h2>
			<p>在进度条容器上添加 <code>.am-progress-striped</code> 显示条纹效果，可结合进度条颜色 class 使用。</p>
			<div class="doc-example">
				<div class="am-progress am-progress-striped"><div style="width:80%;" class="am-progress-bar am-progress-bar-danger"></div></div>
				<div class="am-progress am-progress-striped"><div style="width:60%;" class="am-progress-bar am-progress-bar-warning"></div></div>
				<div class="am-progress am-progress-striped"><div style="width:45%;" class="am-progress-bar am-progress-bar-success"></div></div>
				<div class="am-progress am-progress-striped"><div style="width:30%;" class="am-progress-bar am-progress-bar-secondary"></div></div>
				<div class="am-progress am-progress-striped"><div style="width:15%;" class="am-progress-bar"></div></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="jin-du-tiao-dong-hua">进度条动画 <a href="#jin-du-tiao-dong-hua" class="doc-anchor"></a></h2>
			<p>进度条容器上添加 <code>.am-active</code> 激活进度条动画（CSS Animation）。</p>
			<div class="doc-example"><div class="am-progress am-progress-striped am-progress-sm am-active"><div style="width:57%;" class="am-progress-bar am-progress-bar-secondary"></div></div></div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="jin-du-tiao-dui-die">进度条堆叠 <a href="#jin-du-tiao-dui-die" class="doc-anchor"></a></h2>
			<div class="doc-example">
				<div class="am-progress">
					<div style="width:65%;" class="am-progress-bar">Male</div>
					<div style="width:15%;" class="am-progress-bar am-progress-bar-success">Female</div>
					<div style="width:20%;" class="am-progress-bar am-progress-bar-warning">Other</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="55cb3cc6d13854b91e2e3aa0c15217df" data-title="CSS - Progress|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>