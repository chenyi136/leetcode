<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Pagination|Amaze UI</title>
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
						<li>
							<a href="#dui-qi-fang-shi">对齐方式</a>
							<ul class="am-collapse">
								<li><a href="#ju-zhong-dui-qi">居中对齐</a></li>
								<li><a href="#you-dui-qi">右对齐</a></li>
							</ul>
						</li>
						<li><a href="#zuo-you-fen-bu">左右分布</a></li>
						<li><a href="#jie-he-tu-biao-shi-yong">结合图标使用</a></li>
					</ul>
				</div>
			</div>
			<h1 id="pagination">Pagination <a href="#pagination" class="doc-anchor"></a></h1>
			<hr>
			<p>分页组件，<code>&lt;ul&gt;</code> / <code>&lt;ol&gt;</code> 添加 <code>.am-pagination</code> class， 包含一系列 <code>&lt;li&gt;</code>。</p>
			<p>在 <code>&lt;li&gt;</code> 上添加状态 class：</p>
			<ul>
				<li><code>.am-disabled</code> - 禁用（不可用）</li>
				<li><code>.am-active</code> - 激活</li>
			</ul>
			<h2 id="ji-ben-yang-shi">基本样式 <a href="#ji-ben-yang-shi" class="doc-anchor"></a></h2>
			<div class="doc-example">
				<ul class="am-pagination">
					<li class="am-disabled"><a href="#">&laquo;</a></li>
					<li class="am-active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
				<ul class="am-pagination">
					<li><a href="#">&laquo; Prev</a></li>
					<li><a href="#">Next &raquo;</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="dui-qi-fang-shi">对齐方式 <a href="#dui-qi-fang-shi" class="doc-anchor"></a></h2>
			<p>默认为左对齐。</p>
			<h3 id="ju-zhong-dui-qi">居中对齐 <a href="#ju-zhong-dui-qi" class="doc-anchor"></a></h3>
			<p>在默认样式的基础上添加 <code>.am-pagination-centered</code> class。</p>
			<div class="doc-example">
				<ul class="am-pagination am-pagination-centered">
					<li class="am-disabled"><a href="#">&laquo;</a></li>
					<li class="am-active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="you-dui-qi">右对齐 <a href="#you-dui-qi" class="doc-anchor"></a></h3>
			<p>在默认样式的基础上添加 <code>.am-pagination-right</code> class。</p>
			<div class="doc-example">
				<ul class="am-pagination am-pagination-right">
					<li class="am-disabled"><a href="#">&laquo;</a></li>
					<li class="am-active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="zuo-you-fen-bu">左右分布 <a href="#zuo-you-fen-bu" class="doc-anchor"></a></h2>
			<p>添加 <code>.am-pagination-prev</code> 及 <code>.am-pagination-next</code> 到 <code>&lt;li&gt;</code>，创建一个仅包含 <code>上一页</code> 和 <code>下一页</code> 的分页组件。</p>
			<div class="doc-example">
				<ul class="am-pagination">
					<li class="am-pagination-prev"><a href="#">&laquo; Prev</a></li>
					<li class="am-pagination-next"><a href="#">Next &raquo;</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="jie-he-tu-biao-shi-yong">结合图标使用 <a href="#jie-he-tu-biao-shi-yong" class="doc-anchor"></a></h2>
			<p>将文字部分用图标替换即可。</p>
			<div class="doc-example">
				<ul class="am-pagination">
					<li><a href="#"><span class="am-icon-angle-double-left"></span></a></li>
					<li><span>...</span></li>
					<li><a href="#"><span class="am-icon-angle-double-right"></span></a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p><strong>注意：</strong> <code>&lt;li&gt;</code> 里面的非链接文字需要使用 <code>&lt;span&gt;</code> 包裹。</p>
			<p><strong>Tips:</strong> 使用 MongoDB 的同学可以试试 <a href="#">mongoose-paginater</a>。</p>
			<div class="ds-thread" data-thread-key="dc4c15be42297f007c3b87e73ef0fcc7" data-title="CSS - Pagination|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>