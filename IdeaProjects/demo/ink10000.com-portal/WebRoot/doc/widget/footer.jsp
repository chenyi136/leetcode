<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Footer 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="footer-ye-jiao">Footer 页脚 <a href="#footer-ye-jiao" class="doc-anchor"></a></h1>
			<hr>
			<p>用于页面底部显示版本切换、版权等信息。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#footer-demo">组件演示</a>
							<ul class="am-collapse"><li><a href="#footer-demo-default-0">default（默认）</a></li></ul>
						</li>
						<li>
							<a href="#shi-yong-fang-fa">使用方法</a>
							<ul class="am-collapse">
								<li><a href="#zhi-jie-shi-yong">直接使用</a></li>
								<li><a href="#shi-yong-handlebars">使用 Handlebars</a></li>
								<li><a href="#yun-gua-pei-webide">云适配 WebIDE</a></li>
								<li><a href="#add-to-homescreen">Add to Homescreen</a></li>
							</ul>
						</li>
						<li><a href="#shu-ju-jie-kou">数据接口</a></li>
					</ul>
				</div>
			</div>
			<h2 id="footer-demo">组件演示</h2>
			<h3 id="footer-demo-default-0">default（默认）</h3>
			<div class="doc-example" data-url="doc/widget/footer_default_0.jsp">
				<footer class="am-footer am-footer-default" data-am-widget="footer" data-am-footer>
					<div class="am-footer-switch">
						<span class="am-footer-ysp" data-am-modal="{target:'#am-switch-mode'}" data-rel="mobile">云适配版</span>
						<span class="am-footer-divider">|</span>
						<a href="javascript:;" class="am-footer-desktop" data-rel="desktop" id="godesktop">电脑版</a>
					</div>
					<div class="am-footer-miscs">
						<p>由 <a href="#">诺亚方舟</a> 提供技术支持</p>
						<p>CopyRight©2014 AllMobilize Inc.</p>
						<p>京ICP备13033158</p>
					</div>
				</footer>
				<div class="am-modal am-modal-no-btn am-switch-mode-m am-switch-mode-m-default" id="am-footer-modal">
					<div class="am-modal-dialog">
						<div class="am-modal-hd am-modal-footer-hd"><a href="javascript:;" class="am-close am-close-spin" data-am-modal-close data-dismiss="modal">×</a></div>
						<div class="am-modal-bd">您正在浏览的是 <span class="am-switch-mode-owner">云适配</span> <span class="am-switch-mode-slogan">为您当前手机订制的移动网站。</span></div>
					</div>
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
			<p>本组件 Handlebars partial 名称为 <code>footer</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<p><strong>数据说明：</strong></p>
			<ul>
				<li><code>switchName</code>：可写：手机版等，默认 <code>云适配版</code>；</li>
				<li><code>owner</code>：网站名字；</li>
				<li><code>slogan</code>：弹出层广告语；</li>
				<li><code>companyInfo</code>：填写公司相关信息，此为一对象数组，每一条信息通过对detail赋值来实现！</li>
			</ul>
			<h3 id="add-to-homescreen">Add to Homescreen <a href="#add-to-homescreen" class="doc-anchor"></a></h3>
			<ul><li>目前仅支持 iOS，需要在 header 里设置 icon。</li></ul>
			<p>参考链接：</p>
			<ul>
				<li><a href="#">Safari Web Content Guide:Configuring Web Applications</a></li>
				<li><a href="#">iOS Human Interface Guidelines:Icon and Image Sizes</a></li>
				<li><a href="#">Add to Homescreen - Google Chrome Mobile -- Google Developers</a></li>
				<li><a href="#">Everything you always wanted to know about touch icons</a></li>
			</ul>
			<p>添加到桌面图标功能默认开启，可以通过设置以下代码禁用：</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="80d19f71d6123a2e234aa83ace0e6a6e" data-title="Footer 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>