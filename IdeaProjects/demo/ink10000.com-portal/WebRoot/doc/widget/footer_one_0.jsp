<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>页脚 - one（简约风格）|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view">
		<footer class="am-footer am-footer-one" data-am-widget="footer" data-am-footer>
			<div class="am-footer-switch">
				<span class="am-footer-ysp" data-am-modal="{target:'#am-switch-mode'}" data-rel="mobile">云适配版</span>
				<span class="am-footer-divider">|</span>
				<a href="javascript:;" class="am-footer-desktop" data-rel="desktop" id="godesktop">电脑版</a>
			</div>
			<div class="am-footer-miscs">
				<p>由 <a href="#">云适配</a> 提供技术支持</p>
				<p>CopyRight©2014 AllMobilize Inc.</p>
				<p>京ICP备13033158</p>
			</div>
		</footer>
		<div class="am-modal am-modal-no-btn am-switch-mode-m am-switch-mode-m-one" id="am-footer-modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd am-modal-footer-hd"><a href="javascript:;" class="am-close am-close-spin" data-am-modal-close data-dismiss="modal">&times;</a></div>
				<div class="am-modal-bd">您正在浏览的是 <span class="am-switch-mode-owner">云适配</span> <span class="am-switch-mode-slogan">为您当前手机订制的移动网站。</span></div>
			</div>
		</div>
	</div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/footer_default_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next"><a href="doc/widget/gallery_default_0.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="63e3ee62909a2d570ab8181aee9ff120" data-title="页脚 - one（简约风格）|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>