<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Thumbnail|Amaze UI</title>
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
								<li><a href="#jie-he-wang-ge-shi-yong">结合网格使用</a></li>
								<li><a href="#jie-he-avg-grid-shi-yong">结合 AVG Grid 使用</a></li>
							</ul>
						</li>
						<li><a href="#biao-ti">标题</a></li>
						<li><a href="#tu-wen-hun-pai">图文混排</a></li>
					</ul>
				</div>
			</div>
			<h1 id="thumbnail">Thumbnail <a href="#thumbnail" class="doc-anchor"></a></h1>
			<hr>
			<p>Thumbnail 组件主要用于显示图片列表及图文混排列表。</p>
			<p><strong>演示图标版权归<a href="#">微软 Bing</a> 所有。</strong></p>
			<h2 id="ji-ben-yang-shi">基本样式 <a href="#ji-ben-yang-shi" class="doc-anchor"></a></h2>
			<p>在 <code>&lt;img&gt;</code> 添加 <code>.am-thumbnail</code> 类；也可以在 <code>&lt;img&gt;</code> 外面添加一个容器，如 <code>&lt;div&gt;</code>、<code>&lt;figure&gt;</code>、<code>&lt;a&gt;</code> 等，再将 class 添加到容器上。</p>
			<h3 id="jie-he-wang-ge-shi-yong">结合网格使用 <a href="#jie-he-wang-ge-shi-yong" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-sm-4"><img src="doc/image/bing-1.jpg" class="am-thumbnail"></div>
					<div class="am-u-sm-4"><a href="#" class="am-thumbnail"><img src="doc/image/bing-2.jpg"></a></div>
					<div class="am-u-sm-4"><figure class="am-thumbnail"><img src="doc/image/bing-3.jpg"></figure></div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="jie-he-avg-grid-shi-yong">结合 AVG Grid 使用 <a href="#jie-he-avg-grid-shi-yong" class="doc-anchor"></a></h3>
			<p>添加 AVG Grid class 同时添加 <code>.am-thumbnails</code>。</p>
			<div class="doc-example">
				<ul class="am-avg-sm-3 am-thumbnails">
					<li><img src="doc/image/bing-1.jpg" class="am-thumbnail"></li>
					<li><a href="#" class="am-thumbnail"><img src="doc/image/bing-1.jpg"></a></li>
					<li><figure class="am-thumbnail"><img src="doc/image/bing-1.jpg"></figure></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="biao-ti">标题 <a href="#biao-ti" class="doc-anchor"></a></h2>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-sm-4">
						<div class="am-thumbnail">
							<img src="doc/image/bing-1.jpg">
							<h3 class="am-thumbnail-caption">图片标题 #1</h3>
						</div>
					</div>
					<div class="am-u-sm-4">
						<a href="#" class="am-thumbnail">
							<img src="doc/image/bing-1.jpg">
							<span style="display:block;" class="am-thumbnail-caption">图片标题 #2</span>
						</a>
					</div>
					<div class="am-u-sm-4">
						<figure class="am-thumbnail">
							<img src="doc/image/bing-1.jpg">
							<figcaption class="am-thumbnail-caption">图片标题 #3</figcaption>
						</figure>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="tu-wen-hun-pai">图文混排 <a href="#tu-wen-hun-pai" class="doc-anchor"></a></h2>
			<p>在<code>am-thumbnail</code>内加入<code>.am-caption</code>可以添加任何类型的HTML内容标题、段落、或按钮。</p>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-sm-6">
						<div class="am-thumbnail">
							<img src="doc/image/bing-6.jpg">
							<div class="am-thumbnail-caption">
								<h3>百年孤独选</h3>
								<p>无论走到哪里，都应该记住，过去都是假的，回忆是一条没有尽头的路，一切以往的春天都不复存在，就连那最坚韧而又狂乱的爱情归根结底也不过是一种转瞬即逝的现实。</p>
								<p>
									<button class="am-btn am-btn-primary">孤独</button>
									<button class="am-btn am-btn-default">百年</button>
								</p>
							</div>
						</div>
					</div>
					<div class="am-u-sm-6">
						<div class="am-thumbnail">
							<img src="doc/image/bing-6.jpg">
							<div class="am-thumbnail-caption">
								<h3>百年孤独选</h3>
								<p>无论走到哪里，都应该记住，过去都是假的，回忆是一条没有尽头的路，一切以往的春天都不复存在，就连那最坚韧而又狂乱的爱情归根结底也不过是一种转瞬即逝的现实。</p>
								<p>
									<button class="am-btn am-btn-primary">孤独</button>
									<button class="am-btn am-btn-default">百年</button>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="127e565e43834b8b94c19fafd1050f66" data-title="CSS - Thumbnail|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>