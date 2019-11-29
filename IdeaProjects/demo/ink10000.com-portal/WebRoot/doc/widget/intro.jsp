<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Intro 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="intro-jian-jie-zu-jian">Intro 简介组件 <a href="#intro-jian-jie-zu-jian" class="doc-anchor"></a></h1>
			<hr>
			<p>简介组件，常用于放置包含图片和文字的企业介绍信息等。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#intro-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#intro-demo-default-0">default（More 在上）</a></li>
								<li><a href="#intro-demo-default-1">default（More 在下）</a></li>
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
					</ul>
				</div>
			</div>
			<h2 id="intro-demo">组件演示</h2>
			<h3 id="intro-demo-default-0">default（More 在上）</h3>
			<div class="doc-example" data-url="doc/widget/intro_default_0.jsp">
				<div class="am-intro am-intro-default am-cf" data-am-widget="intro">
					<div class="am-intro-hd">
						<h2 class="am-intro-title">你好小娜</h2>
						<a href="#" class="am-intro-more am-intro-more-top">更多细节</a>
					</div>
					<div class="am-g am-intro-bd">
						<div class="am-u-sm-5 am-intro-left"><img src="doc/image/cortana.png"></div>
						<div class="am-u-sm-7 am-intro-right">
							<p>Cortana 恐怕是用户急于更新到 WP8.1 Update 开发者预览版的原因之一</p>
							<p>Cortana 中国版特有的新图标（面团，带眼睛，可在 Cortana 设置中切换回圆圈），使用的是中文语言，也同样支持 Cortana 笔记本。</p>
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="intro-demo-default-1">default（More 在下）</h3>
			<div class="doc-example" data-url="doc/widget/intro_default_1.jsp">
				<div class="am-intro am-intro-default am-cf" data-am-widget="intro">
					<div class="am-intro-hd"><h2 class="am-intro-title">你好小娜</h2></div>
					<div class="am-g am-intro-bd">
						<div class="am-u-sm-5 am-intro-left"><img src="doc/image/cortana.png"></div>
						<div class="am-u-sm-7 am-intro-right">
							<p>Cortana 恐怕是用户急于更新到 WP8.1 Update 开发者预览版的原因之一</p>
							<p>Cortana 中国版特有的新图标（面团，带眼睛，可在 Cortana 设置中切换回圆圈），使用的是中文语言，也同样支持 Cortana 笔记本。</p>
						</div>
					</div>
					<div class="am-intro-more-bottom"><a href="#" class="am-btn am-btn-default">更多细节</a></div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的内容替换为自己的内容。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>intro</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="775c37b283e4ca79a46c6a507eec5f3b" data-title="Intro 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>