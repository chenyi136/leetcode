<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Pagination 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="pagination-fen-ye">Pagination 分页 <a href="#pagination-fen-ye" class="doc-anchor"></a></h1>
			<hr>
			<p><strong><em>本组件样式有待改善!</em></strong></p>
			<p>分页组件。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#pagination-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#pagination-demo-default-0">default（扁平按钮）</a></li>
								<li><a href="#pagination-demo-select-0">select（上下页+选择框）</a></li>
							</ul>
						</li>
						<li>
							<a href="#shi-yong-fang-fa">使用方法</a>
							<ul class="am-collapse">
								<li><a href="#zhi-jie-shi-yong">直接使用</a></li>
								<li><a href="#shi-yong-handlebars">使用 Handlebars</a></li>
								<li><a href="#yun-gua-pei-webide">云适配 WebIDE</a></li>
							</ul>
						</li>
						<li><a href="#shu-ju-jie-gou">数据结构</a></li>
					</ul>
				</div>
			</div>
			<h2 id="pagination-demo">组件演示</h2>
			<h3 id="pagination-demo-default-0">default（扁平按钮）</h3>
			<div class="doc-example" data-url="doc/widget/pagination_default_0.jsp">
				<ul class="am-pagination am-pagination-default" data-am-widget="pagination">
					<li class="am-pagination-first"><a href="#">第一页</a></li>
					<li class="am-pagination-prev"><a href="#">上一页</a></li>
					<li><a href="#">1</a></li>
					<li class="am-active"><a href="#" class="am-active">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li class="am-pagination-next"><a href="#">下一页</a></li>
					<li class="am-pagination-last"><a href="#">最末页</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="pagination-demo-select-0">select（上下页+选择框）</h3>
			<div class="doc-example" data-url="doc/widget/pagination_select_0.jsp">
				<ul class="am-pagination am-pagination-select" data-am-widget="pagination">
					<li class="am-pagination-prev"><a href="#">上一页</a></li>
					<li class="am-pagination-select">
						<select>
							<option value="#">1 / 3</option>
							<option value="#">2 / 3</option>
							<option value="#">3 / 3</option>
						</select>
					</li>
					<li class="am-pagination-next"><a href="#">下一页</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的内容替换为自己的内容。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>pagination</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-gou">数据结构 <a href="#shu-ju-jie-gou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="7ae01a98c19a5e0ed1f716d325098fdd" data-title="Pagination 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>