<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Gallery 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="gallery-tu-pian-hua-lang">Gallery 图片画廊 <a href="#gallery-tu-pian-hua-lang" class="doc-anchor"></a></h1>
			<hr>
			<p>图片画廊组件，用于展示图片为主体的内容。</p>
			<p><strong>演示图标版权归<a href="#">微软 Bing</a> 所有。</strong></p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#gallery-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#gallery-demo-default-0">default（2列）</a></li>
								<li><a href="#gallery-demo-default-1">default（3列）</a></li>
								<li><a href="#gallery-demo-overlay-0">overlay（浮层标题）</a></li>
								<li><a href="#gallery-demo-bordered-0">bordered（容器边框）</a></li>
								<li><a href="#gallery-demo-imgbordered-0">imgbordered（图片边框）</a></li>
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
						<li>
							<a href="#zhi-ding-suo-lue-tu">指定缩略图</a>
							<ul class="am-collapse">
								<li><a href="#shi-yong-codedata-relcode">使用 data-rel</a></li>
								<li><a href="#shi-yong-lian-jie">使用链接</a></li>
							</ul>
						</li>
						<li><a href="#bu-shi-yong-wei-xin-tu-pian-cha-kan-qi">不使用微信图片查看器</a></li>
						<li><a href="#shu-ju-jie-kou">数据接口</a></li>
					</ul>
				</div>
			</div>
			<h2 id="gallery-demo">组件演示</h2>
			<h3 id="gallery-demo-default-0">default（2列）</h3>
			<div class="doc-example" data-url="doc/widget/gallery_default_0.jsp">
				<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery am-gallery-default" data-am-widget="gallery" data-am-gallery="{pureview:true}">
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-1.jpg">
								<ins>
									<img src="doc/image/bing-1.jpg" alt="远方有一个地方 那里种有我们的梦想">
									<h3 class="am-gallery-title">远方有一个地方 那里种有我们的梦想</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-2.jpg">
								<ins>
									<img src="doc/image/bing-2.jpg" alt="某天也许会相遇 相遇在这个好地方">
									<h3 class="am-gallery-title">某天也许会相遇 相遇在这个好地方</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-3.jpg">
								<ins>
									<img src="doc/image/bing-3.jpg" alt="不要太担心 只因为我相信">
									<h3 class="am-gallery-title">不要太担心 只因为我相信</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-4.jpg">
								<ins>
									<img src="doc/image/bing-4.jpg" alt="终会走过这条遥远的道路">
									<h3 class="am-gallery-title">终会走过这条遥远的道路</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="gallery-demo-default-1">default（3列）</h3>
			<div class="doc-example" data-url="doc/widget/gallery_default_1.jsp">
				<ul class="am-avg-sm-3 am-avg-md-3 am-avg-lg-4 am-gallery am-gallery-default" data-am-widget="gallery" data-am-gallery="{pureview:true}">
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-1.jpg">
								<ins>
									<img src="doc/image/bing-1.jpg" alt="远方有一个地方 那里种有我们的梦想">
									<h3 class="am-gallery-title">远方有一个地方 那里种有我们的梦想</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-2.jpg">
								<ins>
									<img src="doc/image/bing-2.jpg" alt="某天也许会相遇 相遇在这个好地方">
									<h3 class="am-gallery-title">某天也许会相遇 相遇在这个好地方</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-3.jpg">
								<ins>
									<img src="doc/image/bing-3.jpg" alt="不要太担心 只因为我相信">
									<h3 class="am-gallery-title">不要太担心 只因为我相信</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-4.jpg">
								<ins>
									<img src="doc/image/bing-4.jpg" alt="终会走过这条遥远的道路">
									<h3 class="am-gallery-title">终会走过这条遥远的道路</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="gallery-demo-overlay-0">overlay（浮层标题）</h3>
			<div class="doc-example" data-url="doc/widget/gallery_overlay_0.jsp">
				<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery am-gallery-overlay" data-am-widget="gallery" data-am-gallery="{pureview:true}">
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-1.jpg">
								<ins>
									<img src="doc/image/bing-1.jpg" alt="远方有一个地方 那里种有我们的梦想">
									<h3 class="am-gallery-title">远方有一个地方 那里种有我们的梦想</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-2.jpg">
								<ins>
									<img src="doc/image/bing-2.jpg" alt="某天也许会相遇 相遇在这个好地方">
									<h3 class="am-gallery-title">某天也许会相遇 相遇在这个好地方</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-3.jpg">
								<ins>
									<img src="doc/image/bing-3.jpg" alt="不要太担心 只因为我相信">
									<h3 class="am-gallery-title">不要太担心 只因为我相信</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-4.jpg">
								<ins>
									<img src="doc/image/bing-4.jpg" alt="终会走过这条遥远的道路">
									<h3 class="am-gallery-title">终会走过这条遥远的道路</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="gallery-demo-bordered-0">bordered（容器边框）</h3>
			<div class="doc-example" data-url="doc/widget/gallery_bordered_0.jsp">
				<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery am-gallery-bordered" data-am-widget="gallery" data-am-gallery>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-1.jpg">
								<ins>
									<img src="doc/image/bing-1.jpg" alt="远方有一个地方 那里种有我们的梦想">
									<h3 class="am-gallery-title">远方有一个地方 那里种有我们的梦想</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-2.jpg">
								<ins>
									<img src="doc/image/bing-2.jpg" alt="某天也许会相遇 相遇在这个好地方">
									<h3 class="am-gallery-title">某天也许会相遇 相遇在这个好地方</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-3.jpg">
								<ins>
									<img src="doc/image/bing-3.jpg" alt="不要太担心 只因为我相信">
									<h3 class="am-gallery-title">不要太担心 只因为我相信</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-4.jpg">
								<ins>
									<img src="doc/image/bing-4.jpg" alt="终会走过这条遥远的道路">
									<h3 class="am-gallery-title">终会走过这条遥远的道路</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="gallery-demo-imgbordered-0">imgbordered（图片边框）</h3>
			<div class="doc-example" data-url="doc/widget/gallery_imgbordered_0.jsp">
				<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery am-gallery-imgbordered" data-am-widget="gallery" data-am-gallery>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-1.jpg">
								<ins>
									<img src="doc/image/bing-1.jpg" alt="远方有一个地方 那里种有我们的梦想">
									<h3 class="am-gallery-title">远方有一个地方 那里种有我们的梦想</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-2.jpg">
								<ins>
									<img src="doc/image/bing-2.jpg" alt="某天也许会相遇 相遇在这个好地方">
									<h3 class="am-gallery-title">某天也许会相遇 相遇在这个好地方</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-3.jpg">
								<ins>
									<img src="doc/image/bing-3.jpg" alt="不要太担心 只因为我相信">
									<h3 class="am-gallery-title">不要太担心 只因为我相信</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-4.jpg">
								<ins>
									<img src="doc/image/bing-4.jpg" alt="终会走过这条遥远的道路">
									<h3 class="am-gallery-title">终会走过这条遥远的道路</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
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
			<p>本组件 Handlebars partial 名称为 <code>gallery</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="zhi-ding-suo-lue-tu">指定缩略图 <a href="#zhi-ding-suo-lue-tu" class="doc-anchor"></a></h2>
			<p>基于节省流量考虑，可以指定缩略图，用户点击放大的时候再显示大图。</p>
			<h3 id="shi-yong-codedata-relcode">使用 <code>data-rel</code> <a href="#shi-yong-codedata-relcode" class="doc-anchor"></a></h3>
			<p>将大图放在 <code>&lt;img&gt;</code> 的 <code>data-rel</code> 属性上。</p>
			<div class="doc-example">
				<ul class="am-gallery am-avg-sm-2 am-gallery-imgbordered" data-am-widget="gallery" data-am-gallery="{pureview:1}">
					<li>
						<div class="am-gallery-item">
							<img src="doc/image/bing-7.jpg" alt="远方有一个地方 那里种有我们的梦想" data-rel="doc/image/bing-8.jpg">
							<h3 class="am-gallery-title">远方有一个地方 那里种有我们的梦想</h3>
							<div class="am-gallery-desc">2375-09-26</div>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<img src="doc/image/bing-10.jpg" alt="某天也许会相遇 相遇在这个好地方" data-rel="doc/image/bing-9.jpg">
							<h3 class="am-gallery-title">某天也许会相遇 相遇在这个好地方</h3>
							<div class="am-gallery-desc">2375-09-26</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="shi-yong-lian-jie">使用链接 <a href="#shi-yong-lian-jie" class="doc-anchor"></a></h3>
			<p>设置 <code>target</code>:<code>data-am-gallery=&quot;{pureview:{target:';a'}}&quot;</code>。</p>
			<p>从可访性的角度而言，这种方式更好一些：用户再禁用 JavaScript 以后仍然可以打开链接查看大图。</p>
			<div class="doc-example">
				<ul class="am-gallery am-avg-sm-2 am-gallery-imgbordered" data-am-widget="gallery" data-am-gallery="{pureview:{target:'a'}}">
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-8.jpg" title="远方有一个地方 那里种有我们的梦想">
								<ins>
									<img src="doc/image/bing-7.jpg" alt="远方有一个地方 那里种有我们的梦想">
									<h3 class="am-gallery-title">远方有一个地方 那里种有我们的梦想</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-9.jpg" title="某天也许会相遇 相遇在这个好地方">
								<ins>
									<img src="doc/image/bing-10.jpg" alt="某天也许会相遇 相遇在这个好地方">
									<h3 class="am-gallery-title">某天也许会相遇 相遇在这个好地方</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="bu-shi-yong-wei-xin-tu-pian-cha-kan-qi">不使用微信图片查看器 <a href="#bu-shi-yong-wei-xin-tu-pian-cha-kan-qi" class="doc-anchor"></a></h2>
			<p>如果在微信中打开时不想调用微信的图片查看器，可以通过以下选项关闭：</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">ul</span> <span class="hljs-attribute">data-am-widget</span>=<span class="hljs-value">&quot;gallery&quot;</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">&quot;am-gallery am-avg-sm-2 am-gallery-imgbordered&quot;</span> <span class="hljs-attribute">data-am-gallery</span>=<span class="hljs-value">&quot;{pureview:{weChatImagePreview:false}}&quot;</span>&gt;</span></code></pre></div>
			<div class="doc-example">
				<ul class="am-gallery am-avg-sm-2 am-gallery-imgbordered" data-am-widget="gallery" data-am-gallery="{pureview:{weChatImagePreview:false}}">
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-8.jpg">
								<ins>
									<img src="doc/image/bing-7.jpg" alt="远方有一个地方 那里种有我们的梦想">
									<h3 class="am-gallery-title">111远方有一个地方 那里种有我们的梦想</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
					<li>
						<div class="am-gallery-item">
							<a href="doc/image/bing-9.jpg">
								<ins>
									<img src="doc/image/bing-10.jpg" alt="某天也许会相遇 相遇在这个好地方">
									<h3 class="am-gallery-title">某天也许会相遇 相遇在这个好地方</h3>
									<div class="am-gallery-desc">2375-09-26</div>
								</ins>
							</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="6b2e03b9f09e9314ad2e5ca78a261509" data-title="Gallery 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>