<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Grid|Amaze UI</title>
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
								<li><a href="#ji-ben-gai-nian">基本概念</a></li>
								<li><a href="#xian-zhi-xing-de-kuan-du">限制行的宽度</a></li>
								<li><a href="#quan-kuan-de-xing">全宽的行</a></li>
								<li><a href="#duo-xing-wang-ge">多行网格</a></li>
								<li><a href="#bu-zu-12-fen-de-wang-ge">不足 12 份的网格</a></li>
							</ul>
						</li>
						<li>
							<a href="#jin-jie-shi-yong">进阶使用</a>
							<ul class="am-collapse">
								<li><a href="#xiang-ying-shi-fu-zhu-class">响应式辅助 Class</a></li>
								<li><a href="#lie-bian-ju">列边距</a></li>
								<li><a href="#ju-zhong-de-lie">居中的列</a></li>
								<li><a href="#lie-pai-xu">列排序</a></li>
								<li><a href="#yi-chu-lie-nei-bian-ju">移除列内边距</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="grid">Grid <a href="#grid" class="doc-anchor"></a></h1>
			<hr>
			<p>Amaze UI 使用了 <code>12</code> 列的响应式网格系统。使用时需在外围容器上添加 <code>.am-g</code> class，在列上添加 <code>.am-u-[sm|md|lg]-[1-12]</code> class，然后根据不同的屏幕需求设置不同的宽度（<code>u</code> 可以理解为 <code>unit</code>， 比较贴合网格数字的含义，参考了 <a href="#">Pure CSS</a> 的网格命名。）。</p>
			<p>响应式断点如下：</p>
			<table class="am-table am-table-bordered am-table-striped">
				<thead>
					<tr>
						<th style="width:100px;">Class</th>
						<th>区间</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>am-u-sm-*</code></td>
						<td><code>0 - 640px</code></td>
					</tr>
					<tr>
						<td><code>am-u-md-*</code></td>
						<td><code>641px - 1024px</code></td>
					</tr>
					<tr>
						<td><code>am-u-lg-*</code></td>
						<td><code>1025px +</code></td>
					</tr>
				</tbody>
			</table>
			<p>Amaze UI 以 <strong>移动优先</strong> 的理念开发， <strong>如果不设置大屏的网格，应用到小屏幕的样式会继承到更大的屏幕上</strong>。</p>
			<div class="am-alert am-alert-warning"><strong>注意：</strong>为了方便查看效果，演示中的网格加了红色边框，实际中没有。 <code>.doc-am-g</code> 为辅助 Demo 显示添加的 class，实际使用时不需要。</div>
			<h2 id="ji-ben-shi-yong">基本使用 <a href="#ji-ben-shi-yong" class="doc-anchor"></a></h2>
			<h3 id="ji-ben-gai-nian">基本概念 <a href="#ji-ben-gai-nian" class="doc-anchor"></a></h3>
			<p>在 <code>&lt;table&gt;</code> 中，行用 <code>&lt;tr&gt;</code> 划分，列用 <code>&lt;td&gt;</code> 划分，行和列组合在一起形成行，网格中也类似：</p>
			<ul>
				<li><strong>行</strong> - <code>.am-g</code>:网格中的行，用于包裹列，清除列的浮动；</li>
				<li><strong>列</strong> - <code>.am-u-xx-n</code>:网格中的列，<code>xx</code> 为视口区间，<code>n</code> 为该列所占的份数，如 <code>n</code> 为 <code>3</code> 时表示这一列占整行宽度的 <code>3/12</code>，即 <code>1/4</code>。</li>
			</ul>
			<p><strong>示例 1：一个基本的网格</strong></p>
			<p>下面的示例中，行包含两列，第一列占 <code>4</code> 份，第二列占 <code>8</code> 份，我们只设置了 <code>.am-u-sm-n</code> 这个 class，意味着无论视口多大，都保持这个比例的划分。</p>
			<div class="doc-example">
				<div class="am-g doc-am-g">
					<div class="am-u-sm-4">4</div>
					<div class="am-u-sm-8">8</div>
				</div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-4"</span>&gt;</span>4<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-8"</span>&gt;</span>8<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p><strong>示例 2：不同区间不同的划分比例</strong></p>
			<p>下面的示例中，<code>sm</code> 区间两列是等分的，<code>md</code> 区间为 <code>1:2</code> 划分，<code>lg</code> 区间为 <code>1:3</code>。</p>
			<div class="doc-example">
				<div class="am-g doc-am-g">
					<div class="am-u-sm-6 am-u-md-4 am-u-lg-3">sm-6 md-4 lg-3</div>
					<div class="am-u-sm-6 am-u-md-8 am-u-lg-9">sm-6 md-8 lg-9</div>
				</div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g doc-am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6 am-u-md-4 am-u-lg-3"</span>&gt;</span>sm-6 md-4 lg-3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6 am-u-md-8 am-u-lg-9"</span>&gt;</span>sm-6 md-8 lg-9<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="xian-zhi-xing-de-kuan-du">限制行的宽度 <a href="#xian-zhi-xing-de-kuan-du" class="doc-anchor"></a></h3>
			<p>Amaze UI 中， 行 <code>.am-g</code> 的宽度被设置为 <code>100%</code>， 未限定最大宽度，会随着窗口自动缩放。</p>
			<p>可以在行上添加 <code>.am-g-fixed</code> class，将最大宽度限制为 <code>1000px</code>（虽然显示器分辨率越来越高，但基于用户体验考虑，仍然选择这个值），也可以根据自己的需求设置一个最大宽度限制。</p>
			<p>源代码中的相关 CSS 为：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-g</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">margin</span>:<span class="hljs-value"><span class="hljs-number">0</span> auto</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">100%</span></span></span>;
}</span>
<span class="hljs-class">.am-g-fixed</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">max-width</span>:<span class="hljs-value"><span class="hljs-number">1000px</span></span></span>;
}</span>
					</code>
				</pre>
			</div>
			<p><strong>示例 3：限制宽度的网格</strong> （<a href="#">查看演示</a>）</p>
			<p>请在宽度大于 <code>1000px</code> 中的窗口中查看。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">h2</span>&gt;</span>没有限制宽度的网格<span class="hljs-tag">&lt;/<span class="hljs-title">h2</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-4"</span>&gt;</span>4<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-8"</span>&gt;</span>8<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">h2</span>&gt;</span>限制宽度的网格<span class="hljs-tag">&lt;/<span class="hljs-title">h2</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-4"</span>&gt;</span>4<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-8"</span>&gt;</span>8<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>通过 <code>.am-g</code> + <code>.am-g-fixed</code> 限制行的宽度，<strong>网格并不需要容器</strong>，这可能和某些框架不太一样。</p>
			<h3 id="quan-kuan-de-xing">全宽的行 <a href="#quan-kuan-de-xing" class="doc-anchor"></a></h3>
			<p>有时某些可能是全宽的，按照上面的逻辑，应该使用下面的代码来实现：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-12"</span>&gt;</span>全宽限制最大宽度的行<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>是的，这样用也没问题，不过不觉得有点冗余么？这时候<strong>容器 <code>.am-container</code></strong>就派上用场了：</p>
			<p><code>.am-container</code> 和网格列设置了相同的左右 <code>padding</code>，可以和网格内容对齐。</p>
			<p><strong>示例 4：容器</strong></p>
			<p>蓝色边框的是 <code>.am-container</code>。</p>
			<div class="doc-example">
				<div class="am-container">I'm in the .am-container.</div>
				<div class="am-g am-g-fixed doc-am-g">
					<div class="am-u-sm-6">.am-u-sm-6</div>
					<div class="am-u-sm-6">.am-u-sm-6</div>
				</div>
				<div class="am-container">
					<div class="am-g doc-am-g">
						<div class="am-u-sm-6">.am-u-sm-6</div>
						<div class="am-u-sm-6">.am-u-sm-6</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!--没有使用网格的内容--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-container"</span>&gt;</span>I'm in the .am-container.<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--网格行限制宽度--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--当然，如果你觉得嵌套一层也无所谓的话，这样用也可以--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-container"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p><code>.am-container</code> 的样式为：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-container</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">margin-right</span>:<span class="hljs-value">auto</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">margin-left</span>:<span class="hljs-value">auto</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">padding-right</span>:<span class="hljs-value"><span class="hljs-number">1rem</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">padding-left</span>:<span class="hljs-value"><span class="hljs-number">1rem</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">100%</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">max-width</span>:<span class="hljs-value"><span class="hljs-number">1000px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-box-sizing</span>:<span class="hljs-value">border-box</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-moz-box-sizing</span>:<span class="hljs-value">border-box</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">box-sizing</span>:<span class="hljs-value">border-box</span></span>;
}</span>
<span class="hljs-at_rule">@<span class="hljs-keyword">media</span> only screen and (min-width:<span class="hljs-number">641px</span>) </span>{
   <span class="hljs-class">.am-container</span><span class="hljs-rules">{
      <span class="hljs-rule"><span class="hljs-attribute">padding-right</span>:<span class="hljs-value"><span class="hljs-number">1.5rem</span></span></span>;
      <span class="hljs-rule"><span class="hljs-attribute">padding-left</span>:<span class="hljs-value"><span class="hljs-number">1.5rem</span></span></span>;
   }</span>
}
					</code>
				</pre>
			</div>
			<h3 id="duo-xing-wang-ge">多行网格 <a href="#duo-xing-wang-ge" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>或者</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-fixed"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>上面两种写法的都没有问题，但出于对每行样式控制的方便程度考虑，推荐第一种。</p>
			<h3 id="bu-zu-12-fen-de-wang-ge">不足 12 份的网格 <a href="#bu-zu-12-fen-de-wang-ge" class="doc-anchor"></a></h3>
			<p>网格拆分时使用了非整数的百分比（100/12 * n），浏览器在计算的时候会有一些差异，最终所有列的宽度和可能没有达到 100%，导致网格右侧会有很小的空隙。因此，向右浮动最后一列，以填满行的右边（如下面示例中的第一行）。</p>
			<p>实际使用中，如果行的网格数不足 <code>12</code>，需要在最后一列上添加 <code>.am-u-end</code>。</p>
			<p><strong>示例 5：不足 12 份的网格</strong></p>
			<div class="doc-example">
				<div class="am-g doc-am-g">
					<div class="am-u-sm-3">3</div>
					<div class="am-u-sm-3">3</div>
					<div class="am-u-sm-3">3</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-3">3</div>
					<div class="am-u-sm-3">3</div>
					<div class="am-u-sm-3 am-u-end">3</div>
				</div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!--未添加.am-u-end的情形--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--添加.am-u-end后--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3 am-u-end"</span>&gt;</span>3<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p><strong>至此，网格的基本使用就介绍完了。</strong>如果已经满足需求，那施主就请回吧，该摇一摇，或撸啊撸，请自便。</p>
			<p>如非要往下看，出现头昏眼花等各种不适，后果自负，请自备郝思嘉速效救心丸……</p>
			<h2 id="jin-jie-shi-yong">进阶使用 <a href="#jin-jie-shi-yong" class="doc-anchor"></a></h2>
			<h3 id="xiang-ying-shi-fu-zhu-class">响应式辅助 Class <a href="#xiang-ying-shi-fu-zhu-class" class="doc-anchor"></a></h3>
			<p>Amaze UI 中内置了一些辅助响应式的 class，详见<a href="doc/css/utility.jsp">辅助类-辅助 Class</a>。</p>
			<p><strong>示例 6：响应式辅助类控制元素显隐</strong></p>
			<p>调整浏览器窗口以查看响应式效果。</p>
			<div class="doc-example">
				<div class="am-g doc-am-g">
					<div class="am-u-lg-3">
						<span class="am-show-md-down">sm-full</span>
						<span class="am-show-lg-only">lg-3</span>
					</div>
					<div class="am-u-lg-6">
						<span class="am-show-md-down">sm-full</span>
						<span class="am-show-lg-only">lg-6</span>
					</div>
					<div class="am-u-lg-3">
						<span class="am-show-md-down">sm-full</span>
						<span class="am-show-lg-only">lg-3</span>
					</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-6 am-u-lg-2">
						<span class="am-show-md-down">6</span>
						<span class="am-hide-md-down">2</span>
					</div>
					<div class="am-u-sm-6 am-u-lg-8">
						<span class="am-show-md-down">6</span>
						<span class="am-hide-md-down">8</span>
					</div>
					<div class="am-u-sm-12 am-u-lg-2">
						<span class="am-show-md-down">full</span>
						<span class="am-hide-md-down">2</span>
					</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-3">3</div>
					<div class="am-u-sm-9">9</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-lg-4">
						<span class="am-show-md-down">full</span>
						<span class="am-hide-md-down">4</span>
					</div>
					<div class="am-u-lg-8">
						<span class="am-show-md-down">full</span>
						<span class="am-hide-md-down">8</span>
					</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-6 am-u-lg-5">
						<span class="am-show-md-down">6</span>
						<span class="am-hide-md-down">5</span>
					</div>
					<div class="am-u-sm-6 am-u-lg-7">
						<span class="am-show-md-down">6</span>
						<span class="am-hide-md-down">7</span>
					</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-lg-6">
						<span class="am-show-md-down">full</span>
						<span class="am-hide-md-down">6</span>
					</div>
					<div class="am-u-lg-6">
						<span class="am-show-md-down">full</span>
						<span class="am-hide-md-down">6</span>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="lie-bian-ju">列边距 <a href="#lie-bian-ju" class="doc-anchor"></a></h3>
			<p>添加 <code>am-u-sm-offset-*</code>、<code>am-u-md-offset-*</code>、<code>am-u-lg-offset-*</code> 设置列的左边距。</p>
			<p><strong>示例 7：列边距啪啪啪</strong></p>
			<div class="doc-example">
				<div class="am-g doc-am-g">
					<div class="am-u-sm-1">1</div>
					<div class="am-u-sm-11">11</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-1">1</div>
					<div class="am-u-sm-10 am-u-sm-offset-1">10, offset 1</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-1">1</div>
					<div class="am-u-sm-9 am-u-sm-offset-2">9, offset 2</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-1">1</div>
					<div class="am-u-sm-8 am-u-sm-offset-3">8, offset 3</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-1">1</div>
					<div class="am-u-sm-7 am-u-sm-offset-4">7, offset 4</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-1">1</div>
					<div class="am-u-sm-6 am-u-sm-offset-5">6, offset 5</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-1">1</div>
					<div class="am-u-sm-5 am-u-sm-offset-6">5, offset 6</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-1">1</div>
					<div class="am-u-sm-4 am-u-sm-offset-7">4, offset 7</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-1">1</div>
					<div class="am-u-sm-3 am-u-sm-offset-8">3, offset 8</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-1">1</div>
					<div class="am-u-sm-2 am-u-sm-offset-9">2, offset 9</div>
				</div>
				<div class="am-g doc-am-g">
					<div class="am-u-sm-1">1</div>
					<div class="am-u-sm-1 am-u-sm-offset-10">1, offset 10</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="ju-zhong-de-lie">居中的列 <a href="#ju-zhong-de-lie" class="doc-anchor"></a></h3>
			<p>添加 <code>.am-u-xx-centered</code> 实现列居中：</p>
			<ul>
				<li>如果始终的设为居中，只需要添加 <code>.am-u-sm-centered</code>（移动优先，继承）；</li>
				<li>某些区间不居中添加， <code>.am-u-xx-uncentered</code>。</li>
			</ul>
			<p><strong>示例 8：居中， To be or not to be</strong></p>
			<div class="doc-example">
				<div class="am-g doc-am-g"><div class="am-u-sm-centered am-u-sm-3">3 centered</div></div>
				<div class="am-g doc-am-g"><div class="am-u-lg-centered am-u-sm-6">6 centered</div></div>
				<div class="am-g doc-am-g"><div class="am-u-sm-centered am-u-lg-uncentered am-u-sm-9">9 md-down-centered</div></div>
				<div class="am-g doc-am-g"><div class="am-u-sm-centered am-u-sm-11">11 centered</div></div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!--.am-u-sm-centered始终居中--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-3 am-u-sm-centered"</span>&gt;</span>3 centered<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--.am-u-lg-centered大于1024时居中--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6 am-u-lg-centered"</span>&gt;</span>6 centered<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--大于1024时不居中--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-9 am-u-sm-centered am-u-lg-uncentered"</span>&gt;</span>9 md-down-centered <span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-comment">&lt;!--始终居中--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-11 am-u-sm-centered"</span>&gt;</span>11 centered<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="lie-pai-xu">列排序 <a href="#lie-pai-xu" class="doc-anchor"></a></h3>
			<p>出于 SEO 考虑，有时会有一些结构和表现不一致的情况，比如一个主要内容 + 边栏的布局，结构中主要内容在前、边栏在后，但表现中需要把边栏放在左边，主要内容放在右边，可以通过 <code>.am-u-xx-push-*</code> / <code>.am-u-xx-pull-*</code> 来实现。</p>
			<p><strong>示例 9：结构与表现表里不一</strong></p>
			<p>改变浏览器窗口宽度查看效果。</p>
			<div class="doc-example">
				<div class="am-g doc-am-g">
					<div class="am-u-md-8 am-u-md-push-4 am-u-lg-reset-order">8 main</div>
					<div class="am-u-md-4 am-u-md-pull-8 am-u-lg-reset-order">4 sidebar</div>
				</div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!--结构中 main在前，sidebar在后，通过push/pull在medium区间将sidebar显示到左侧，main显示到右侧large区间 reset回结构排序--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-md-8 am-u-md-push-4 am-u-lg-reset-order"</span>&gt;</span>8 main<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-md-4 am-u-md-pull-8 am-u-lg-reset-order"</span>&gt;</span>4 sidebar<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="yi-chu-lie-nei-bian-ju">移除列内边距 <a href="#yi-chu-lie-nei-bian-ju" class="doc-anchor"></a></h3>
			<p>有同学提出列默认的内边距在某些场景太大，这时 <code>.am-g-collapse</code> 就派上用场了。</p>
			<p><strong>示例 10:没有内边距的列</strong></p>
			<p>在行 <code>.am-g</code> 上添加 <code>.am-g-collapse</code>，移除列的内边距（<code>padding</code>）。</p>
			<div class="doc-example">
				<div class="am-g am-g-collapse doc-am-g">
					<div class="am-u-sm-6">.am-u-sm-6</div>
					<div class="am-u-sm-6">.am-u-sm-6</div>
				</div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-g am-g-collapse"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-u-sm-6"</span>&gt;</span>.am-u-sm-6<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<div class="ds-thread" data-thread-key="9ad0c6bfa61afa98f060fba21de515cd" data-title="CSS - Grid|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>