<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Paragraph 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="paragraph-duan-luo">Paragraph 段落 <a href="#paragraph-duan-luo" class="doc-anchor"></a></h1>
			<hr>
			<p>文本段落组件，可用于放置文本、图片、链接等。</p>
			<p><strong>演示图标版权归<a href="#">微软 Bing</a> 所有。</strong></p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#paragraph-demo">组件演示</a>
							<ul class="am-collapse"><li><a href="#paragraph-demo-default-0">default（默认）</a></li></ul>
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
					</ul>
				</div>
			</div>
			<h2 id="paragraph-demo">组件演示</h2>
			<h3 id="paragraph-demo-default-0">default（默认）</h3>
			<div class="doc-example" data-url="doc/widget/paragraph_default_0.jsp">
				<article class="am-paragraph am-paragraph-default" data-am-widget="paragraph" data-am-paragraph="{tableScrollable:true,pureview:true}">
					<img src="doc/image/bing-1.jpg">
					<p class="paragraph-default-p">南极洲又称<a href="#">第七大陆</a>，是地球上最后一个被发现、唯一没有土著人居住的大陆。</p>
					<p>南极大陆为通常所说的南大洋（太平洋、印度洋和大西洋的南部水域）所包围，它与南美洲最近的距离为965公里，距新西兰2000公里、距澳大利亚2500公里、距南非3800公里、距中国北京的距离约有12000公里。南极大陆的总面积为1390万平方公里，相当于中国和印巴次大陆面积的总和，居世界各洲第五位。</p>
					<img src="doc/image/bing-2.jpg">
					<p>整个南极大陆被一个巨大的冰盖所覆盖，平均海拔为2350米。南极洲是由冈瓦纳大陆分离解体而成，是世界上最高的大陆。南极横断山脉将南极大陆分成东西两部分。这两部分在地理和地质上差别很大。</p>
					<img src="doc/image/bing-3.jpg">
					<p>东南极洲是一块很古老的大陆，据科学家推算,已有几亿年的历史。它的中心位于难接近点，从任何海边到难接近点的距离都很远。东南极洲平均海拔高度2500米，最大高度4800 米。在东南极洲有南极大陆最大的活火山，即位于罗斯岛上的埃里伯斯火山，海拔高度3795米，有四个喷火口</p>
				</article>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的内容替换为自己的内容。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>paragraph</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="279c815948ecfec996dfdf0b29d98721" data-title="Paragraph 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>