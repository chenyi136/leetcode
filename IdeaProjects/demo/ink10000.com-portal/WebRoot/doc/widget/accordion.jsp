<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Accordion 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
	<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
	<section id="amz-main">
		<div class="am-g am-g-fixed">
			<jsp:include page="/doc/menu_widget.jsp"/>
			<div class="am-u-md-9 col-md-9 doc-content">
				<h1 id="accordion-zhe-die-mian-ban">Accordion 折叠面板 <a href="#accordion-zhe-die-mian-ban" class="doc-anchor"></a></h1>
				<hr>
				<p>手风琴折叠面板组件。</p>
				<div class="doc-toc">
					<h2><span>目录</span></h2>
					<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#accordion-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#accordion-demo-default-0">default（圆角灰边）</a></li>
								<li><a href="#accordion-demo-basic-0">basic（极简无边框）</a></li>
								<li><a href="#accordion-demo-gapped-0">gapped（扁平分离边框）</a></li>
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
						<li><a href="#shu-ju-jie-kou">数据接口</a></li>
						<li><a href="#zhu-yi-shi-xiang">注意事项</a></li>
					</ul>
				</div>
			</div>
			<h2 id="accordion-demo">组件演示</h2>
			<h3 id="accordion-demo-default-0">default（圆角灰边）</h3>
			<div class="doc-example" data-url="doc/widget/accordion_default_0.jsp">
				<section class="am-accordion am-accordion-default" data-am-widget="accordion" data-am-accordion="{'multiple':true}">
					<dl class="am-accordion-item am-active am-disabled">
						<dt class="am-accordion-title">就这样恣意的活着</dt>
						<dd class="am-accordion-bd am-collapse am-in"><div class="am-accordion-content">置身人群中<br>你只需要被淹没 享受 沉默<br>退到人群后<br>你只需给予双手 微笑 等候</div></dd>
					</dl>
					<dl class="am-accordion-item">
						<dt class="am-accordion-title">让生命去等候，去等候，去等候，去等候</dt>
						<dd class="am-accordion-bd am-collapse"><div class="am-accordion-content">走在忠孝东路<br>徘徊在茫然中<br>在我的人生旅途<br>选择了多少错误<br>我在睡梦中惊醒<br>感叹悔言无尽<br>恨我不能说服自己<br>接受一切教训<br>让生命去等候<br>等候下一个漂流<br>让生命去等候<br>等候下一个伤口</div></dd>
					</dl>
					<dl class="am-accordion-item">
						<dt class="am-accordion-title">我就这样告别山下的家</dt>
						<dd class="am-accordion-bd am-collapse"><div class="am-accordion-content">我就这样告别山下的家，我实在不愿轻易让眼泪留下。我以为我并不差不会害怕，我就这样自己照顾自己长大。我不想因为现实把头低下，我以为我并不差能学会虚假。怎样才能够看穿面具里的谎话？别让我的真心散的像沙。如果有一天我变得更复杂，还能不能唱出歌声里的那幅画？</div></dd>
					</dl>
				</section>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="accordion-demo-basic-0">basic（极简无边框）</h3>
			<div class="doc-example" data-url="doc/widget/accordion_basic_0.jsp">
				<section class="am-accordion am-accordion-basic" data-am-widget="accordion" data-am-accordion>
					<dl class="am-accordion-item am-active">
						<dt class="am-accordion-title">就这样恣意的活着</dt>
						<dd class="am-accordion-bd am-collapse am-in"><div class="am-accordion-content">置身人群中<br>你只需要被淹没 享受 沉默<br>退到人群后<br>你只需给予双手 微笑 等候</div></dd>
					</dl>
					<dl class="am-accordion-item">
						<dt class="am-accordion-title">让生命去等候，去等候，去等候，去等候</dt>
						<dd class="am-accordion-bd am-collapse"><div class="am-accordion-content">走在忠孝东路<br>徘徊在茫然中<br>在我的人生旅途<br>选择了多少错误<br>我在睡梦中惊醒<br>感叹悔言无尽<br>恨我不能说服自己<br>接受一切教训<br>让生命去等候<br>等候下一个漂流<br>让生命去等候<br>等候下一个伤口</div></dd>
					</dl>
					<dl class="am-accordion-item">
						<dt class="am-accordion-title">我就这样告别山下的家</dt>
						<dd class="am-accordion-bd am-collapse"><div class="am-accordion-content">我就这样告别山下的家，我实在不愿轻易让眼泪留下。我以为我并不差不会害怕，我就这样自己照顾自己长大。我不想因为现实把头低下，我以为我并不差能学会虚假。怎样才能够看穿面具里的谎话？别让我的真心散的像沙。如果有一天我变得更复杂，还能不能唱出歌声里的那幅画？</div></dd>
					</dl>
				</section>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="accordion-demo-gapped-0">gapped（扁平分离边框）</h3>
			<div class="doc-example" data-url="doc/widget/accordion_gapped_0.jsp">
				<section class="am-accordion am-accordion-gapped" data-am-widget="accordion" data-am-accordion>
					<dl class="am-accordion-item am-active">
						<dt class="am-accordion-title">就这样恣意的活着</dt>
						<dd class="am-accordion-bd am-collapse am-in"><div class="am-accordion-content">置身人群中<br>你只需要被淹没 享受 沉默<br>退到人群后<br>你只需给予双手 微笑 等候</div></dd>
					</dl>
					<dl class="am-accordion-item">
						<dt class="am-accordion-title">让生命去等候，去等候，去等候，去等候</dt>
						<dd class="am-accordion-bd am-collapse"><div class="am-accordion-content">走在忠孝东路<br>徘徊在茫然中<br>在我的人生旅途<br>选择了多少错误<br>我在睡梦中惊醒<br>感叹悔言无尽<br>恨我不能说服自己<br>接受一切教训<br>让生命去等候<br>等候下一个漂流<br>让生命去等候<br>等候下一个伤口</div></dd>
					</dl>
					<dl class="am-accordion-item">
						<dt class="am-accordion-title">我就这样告别山下的家</dt>
						<dd class="am-accordion-bd am-collapse"><div class="am-accordion-content">我就这样告别山下的家，我实在不愿轻易让眼泪留下。我以为我并不差不会害怕，我就这样自己照顾自己长大。我不想因为现实把头低下，我以为我并不差能学会虚假。怎样才能够看穿面具里的谎话？别让我的真心散的像沙。如果有一天我变得更复杂，还能不能唱出歌声里的那幅画？</div></dd>
					</dl>
				</section>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的内容替换为自己的内容。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>首先，引入 Handlebars 库及 <code>amui.widget.helper.js</code>（可参考 <a href="#">Amaze UI HTML 模板</a> 里的 <code>widget.html</code> 文件）。</p>
			<p>接下来有两种方式来渲染数据。</p>
			<p><strong>第一种，将组件调用代码写在模板里面：</strong></p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">script</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">'text/x-handlebars-template'</span> <span class="hljs-attribute">id</span>=<span class="hljs-value">'my-tpl'</span>&gt;</span><span class="handlebars"><span class="xml"></span><span class="hljs-expression">{{&gt;<span class="hljs-variable">accordion</span> <span class="hljs-variable">accordionData</span>}}</span><span class="xml"></span></span><span class="hljs-tag">&lt;/<span class="hljs-title">script</span>&gt;</span></code></pre></div>
			<p>然后获取模板内容，传入数据渲染并插入到页面中。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<p>渲染出来的 HTML 如下：</p>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p>如果使用的组件较多或者还有组件以外的自定义模板，建议使用上面的方法，将模板分离出来，便于维护。</p>
			<p><strong>第二种，直接将组件调用代码传给 Handlebars：</strong></p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="zhu-yi-shi-xiang">注意事项 <a href="#zhu-yi-shi-xiang" class="doc-anchor"></a></h2>
			<ul><li><strong>不要在 <code>.am-accordion-bd</code> 上添加上下 <code>padding</code>/<code>margin</code>/<code>border</code> 样式</strong>。</li></ul>
			<div class="ds-thread" data-thread-key="363127ea682178763eda0b1b1a70230b" data-title="Accordion 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>