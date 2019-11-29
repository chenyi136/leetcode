<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js m"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js m"><!--<![endif]-->
<head>
	<title>Web 组件 Demo|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="am-page" id="mobile-index">
	<header class="demo-header"><h1>Web Components Demos</h1></header>
	<div id="widget-list">
		<ul class="am-list m-widget-list">
			<li>
				<a href="javascript:;" data-rel="accordion">
					<img src="doc/image/accordion.png" class="widget-icon">
					<span class="widget-name">Accordion</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="divider">
					<img src="doc/image/divider.png" class="widget-icon">
					<span class="widget-name">Divider</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="duoshuo">
					<img src="doc/image/duoshuo.png" class="widget-icon">
					<span class="widget-name">Duoshuo</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="figure">
					<img src="doc/image/figure.png" class="widget-icon">
					<span class="widget-name">Figure</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="footer">
					<img src="doc/image/footer.png" class="widget-icon">
					<span class="widget-name">Footer</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="gallery">
					<img src="doc/image/gallery.png" class="widget-icon">
					<span class="widget-name">Gallery</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="gotop">
					<img src="doc/image/gotop.png" class="widget-icon">
					<span class="widget-name">Gotop</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="header">
					<img src="doc/image/header.png" class="widget-icon">
					<span class="widget-name">Header</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="intro">
					<img src="doc/image/intro.png" class="widget-icon">
					<span class="widget-name">Intro</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="list_news">
					<img src="doc/image/news.png" class="widget-icon">
					<span class="widget-name">List</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="map">
					<img src="doc/image/map.png" class="widget-icon">
					<span class="widget-name">Map</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="mechat">
					<img src="doc/image/mechat.png" class="widget-icon">
					<span class="widget-name">Mechat</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="menu">
					<img src="doc/image/menu.png" class="widget-icon">
					<span class="widget-name">Menu</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="navbar">
					<img src="doc/image/navbar.png" class="widget-icon">
					<span class="widget-name">Navbar</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="pagination">
					<img src="doc/image/pagination.png" class="widget-icon">
					<span class="widget-name">Pagination</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="paragraph">
					<img src="doc/image/paragraph.png" class="widget-icon">
					<span class="widget-name">Paragraph</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="slider">
					<img src="doc/image/slider.png" class="widget-icon">
					<span class="widget-name">Slider</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="tabs">
					<img src="doc/image/tabs.png" class="widget-icon">
					<span class="widget-name">Tabs</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="titlebar">
					<img src="doc/image/titlebar.png" class="widget-icon">
					<span class="widget-name">Titlebar</span>
				</a>
			</li>
			<li>
				<a href="javascript:;" data-rel="wechatpay">
					<img src="doc/image/wechat.png" class="widget-icon">
					<span class="widget-name">WeChat Pay</span>
				</a>
			</li>
		</ul>
	</div>
</div>
<div class="am-page" id="demo-list-page">
	<header class="demo-header widget-hd">
		<span class="am-icon-chevron-left" id="btn-back"></span>
		<h1>Amaze UI</h1>
	</header>
	<div id="demo-list"><div id="demo-scroller"><ul class="am-list widget-list"><li></li></ul></div></div>
</div>
<script type="text/x-handlebars-template" id="tpl-demo-list">
	<ul class="am-list widget-list">
		{{#each this}}<li><a href="{{demoURL}}">{{demoName}}</a></li>{{/each}}
	</ul>
</script>
<script type="text/javascript" src="_/js/handlebars.min-4.0.5.js"></script>
<script type="text/javascript" src="_/js/plugin/fastclick.min-1.0.6.js"></script>
<script type="text/javascript" src="doc/image/widget.js"></script>
</body>
</html>