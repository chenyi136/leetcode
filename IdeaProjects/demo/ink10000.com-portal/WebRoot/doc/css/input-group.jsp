<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Input-group|Amaze UI</title>
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
								<li><a href="#shu-ru-kuang-yu-biao-qian">输入框与标签</a></li>
								<li><a href="#fu-xuan-dan-xuan-kuang-yu-shu-ru-kuang">复选/单选框与输入框</a></li>
								<li><a href="#shu-ru-kuang-jie-he-button">输入框结合 Button</a></li>
							</ul>
						</li>
						<li>
							<a href="#yang-shi-bian-huan">样式变换</a>
							<ul class="am-collapse">
								<li><a href="#chi-cun">尺寸</a></li>
								<li><a href="#yan-se">颜色</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="input-group">Input Group <a href="#input-group" class="doc-anchor"></a></h1>
			<hr>
			<p>Input group 基于 Form 组件和 Button 组件扩展，依赖这两个组件。</p>
			<p>在容器上添加 <code>.am-input-group</code>，在标签文字上添加 <code>.am-input-group-label</code>，具体请查看示例代码。</p>
			<h2 id="ji-ben-shi-yong">基本使用 <a href="#ji-ben-shi-yong" class="doc-anchor"></a></h2>
			<h3 id="shu-ru-kuang-yu-biao-qian">输入框与标签 <a href="#shu-ru-kuang-yu-biao-qian" class="doc-anchor"></a></h3>
			<p>下面的代码中演示了结合 Icon 组件及添加文字的样式。</p>
			<div class="doc-example">
				<div class="am-input-group">
					<span class="am-input-group-label"><i class="am-icon-user am-icon-fw"></i></span>
					<input type="text" class="am-form-field" placeholder="Username">
				</div>
				<div class="am-input-group">
					<span class="am-input-group-label"><i class="am-icon-lock am-icon-fw"></i></span>
					<input type="text" class="am-form-field" placeholder="Password">
				</div>
				<div class="am-input-group">
					<input type="text" class="am-form-field">
					<span class="am-input-group-label">.00</span>
				</div>
				<div class="am-input-group">
					<span class="am-input-group-label">$</span>
					<input type="text" class="am-form-field">
					<span class="am-input-group-label">.00</span>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="fu-xuan-dan-xuan-kuang-yu-shu-ru-kuang">复选/单选框与输入框 <a href="#fu-xuan-dan-xuan-kuang-yu-shu-ru-kuang" class="doc-anchor"></a></h3>
			<p>将单选框与复选框放入 <code>.am-input-group-label</code> 内。</p>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-lg-6">
						<div class="am-input-group">
							<span class="am-input-group-label"><input type="checkbox"></span>
							<input type="text" class="am-form-field">
						</div>
					</div>
					<div class="am-u-lg-6">
						<div class="am-input-group">
							<span class="am-input-group-label"><input type="radio"></span>
							<input type="text" class="am-form-field">
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="shu-ru-kuang-jie-he-button">输入框结合 Button <a href="#shu-ru-kuang-jie-he-button" class="doc-anchor"></a></h3>
			<p>需要用 <code>.am-input-group-btn</code> 包住按钮，而不是 <code>.am-input-group-label</code>。</p>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-lg-6">
						<div class="am-input-group">
							<span class="am-input-group-btn"><button type="button" class="am-btn am-btn-default"><span class="am-icon-search"></span></button></span>
							<input type="text" class="am-form-field">
						</div>
					</div>
					<div class="am-u-lg-6">
						<div class="am-input-group">
							<input type="text" class="am-form-field">
							<span class="am-input-group-btn"><button type="button" class="am-btn am-btn-default">手气还行</button></span>
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="yang-shi-bian-huan">样式变换 <a href="#yang-shi-bian-huan" class="doc-anchor"></a></h2>
			<h3 id="chi-cun">尺寸 <a href="#chi-cun" class="doc-anchor"></a></h3>
			<p>在 <code>.am-input-group</code> 添加标明尺寸的 class 即可。</p>
			<p>包含 <code>.am-input-group-lg</code>、<code>.am-input-group-sm</code>。</p>
			<div class="doc-example">
				<div class="am-input-group am-input-group-lg">
					<span class="am-input-group-label">@</span>
					<input type="text" class="am-form-field" placeholder="Large Username">
				</div>
				<div class="am-input-group">
					<span class="am-input-group-label">@</span>
					<input type="text" class="am-form-field" placeholder="Default Username">
				</div>
				<div class="am-input-group am-input-group-sm">
					<span class="am-input-group-label">@</span>
					<input type="text" class="am-form-field" placeholder="Small Username">
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="yan-se">颜色 <a href="#yan-se" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-input-group am-input-group-primary">
					<span class="am-input-group-label"><i class="am-icon-user am-icon-fw"></i></span>
					<input type="text" class="am-form-field" placeholder="你的大名">
				</div>
				<div class="am-input-group am-input-group-secondary">
					<span class="am-input-group-label"><i class="am-icon-credit-card am-icon-fw"></i></span>
					<input type="text" class="am-form-field" placeholder="你的银行卡号">
				</div>
				<div class="am-input-group am-input-group-success">
					<span class="am-input-group-label"><i class="am-icon-money am-icon-fw"></i></span>
					<input type="text" class="am-form-field" placeholder="你的银行卡密码">
				</div>
				<div class="am-input-group am-input-group-warning">
					<span class="am-input-group-label"><i class="am-icon-bank am-icon-fw"></i></span>
					<input type="text" class="am-form-field" placeholder="开户行">
				</div>
				<div class="am-input-group am-input-group-danger">
					<span class="am-input-group-label"><i class="am-icon-location-arrow am-icon-fw"></i></span>
					<input type="text" class="am-form-field" placeholder="你所在城市">
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p>使用按钮时除了在容器上设置颜色 class 外，还需要设置按钮的样式。</p>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-lg-6">
						<div class="am-input-group am-input-group-danger">
							<span class="am-input-group-label"><input type="checkbox"></span>
							<input type="text" class="am-form-field">
						</div>
					</div>
					<div class="am-u-lg-6">
						<div class="am-input-group am-input-group-primary">
							<span class="am-input-group-btn"><button type="button" class="am-btn am-btn-primary"><span class="am-icon-search"></span></button></span>
							<input type="text" class="am-form-field">
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="864fd7b458d3d5b1f6ce8cb5c9cbcb9e" data-title="CSS - Input-group|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>