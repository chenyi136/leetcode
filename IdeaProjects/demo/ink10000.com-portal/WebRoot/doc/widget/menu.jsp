<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Menu 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="menu-cai-dan">Menu 菜单 <a href="#menu-cai-dan" class="doc-anchor"></a></h1>
			<hr>
			<p>菜单组件。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#menu-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#menu-demo-default-0">default（横排）</a></li>
								<li><a href="#menu-demo-dropdown1-0">dropdown1（自定图标）</a></li>
								<li><a href="#menu-demo-dropdown1-1">dropdown1（图片图标）</a></li>
								<li><a href="#menu-demo-dropdown1-2">dropdown1（文字触发）</a></li>
								<li><a href="#menu-demo-dropdown2-0">dropdown2（下拉横排）</a></li>
								<li><a href="#menu-demo-slide1-0">slide1（指示箭头一级下滑1）</a></li>
								<li><a href="#menu-demo-offcanvas1-0">offcanvas1（侧滑左侧）</a></li>
								<li><a href="#menu-demo-offcanvas1-1">offcanvas1（侧滑右侧）</a></li>
								<li><a href="#menu-demo-offcanvas2-0">offcanvas2（侧滑横排）</a></li>
								<li><a href="#menu-demo-stack-0">stack（垂直菜单）</a></li>
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
			<h2 id="menu-demo">组件演示</h2>
			<div class="am-alert am-alert-danger"><p>本组件针对移动端设计，由于视口宽度原因在本页显示有偏差，请点击演示右上角的 [ <span class="am-icon-file-code-o">New Win</span>] 在新窗口中查看。</p></div>
			<h3 id="menu-demo-default-0">default（横排）</h3>
			<div class="doc-example" data-url="doc/widget/menu_default_0.jsp">
				<nav class="am-menu am-menu-default" data-am-widget="menu">
					<a href="javascript:;" class="am-menu-toggle"><i class="am-menu-toggle-icon am-icon-bars"></i></a>
					<ul class="am-avg-sm-3 am-menu-nav">
						<li class="am-parent">
							<a href="#">公司</a>
							<ul class="am-avg-sm-2 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">进入栏目 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">人物</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">趋势</a>
							<ul class="am-avg-sm-4 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">泥煤 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">投融资</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li><a href="#">创业公司</a></li>
						<li><a href="#">创业人物</a></li>
					</ul>
				</nav>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="menu-demo-dropdown1-0">dropdown1（自定图标）</h3>
			<div class="doc-example" data-url="doc/widget/menu_dropdown1_0.jsp">
				<nav class="am-menu am-menu-dropdown1" data-am-widget="menu" data-am-menu-collapse>
					<a href="javascript:;" class="am-menu-toggle"><i class="am-menu-toggle-icon am-icon-list"></i></a>
					<ul class="am-avg-sm-1 am-collapse am-menu-nav">
						<li class="am-parent">
							<a href="#">公司</a>
							<ul class="am-avg-sm-2 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">进入栏目 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">人物</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">趋势</a>
							<ul class="am-avg-sm-4 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">泥煤 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">投融资</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li><a href="#">创业公司</a></li>
						<li><a href="#">创业人物</a></li>
					</ul>
				</nav>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="menu-demo-dropdown1-1">dropdown1（图片图标）</h3>
			<div class="doc-example" data-url="doc/widget/menu_dropdown1_1.jsp">
				<nav class="am-menu am-menu-dropdown1" data-am-widget="menu" data-am-menu-collapse>
					<a href="javascript:;" class="am-menu-toggle"><img src="data:image/svg+xml;charset=utf-8,&lt;svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 42 26' fill='%23fff'&gt;&lt;rect width='4' height='4'/&gt;&lt;rect x='8' y='1' width='34' height='2'/&gt;&lt;rect y='11' width='4' height='4'/&gt;&lt;rect x='8' y='12' width='34' height='2'/&gt;&lt;rect y='22' width='4' height='4'/&gt;&lt;rect x='8' y='23' width='34' height='2'/&gt;&lt;/svg&gt;"></a>
					<ul class="am-avg-sm-1 am-collapse am-menu-nav">
						<li class="am-parent">
							<a href="#">公司</a>
							<ul class="am-avg-sm-2 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">进入栏目 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">人物</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">趋势</a>
							<ul class="am-avg-sm-4 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">泥煤 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">投融资</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li><a href="#">创业公司</a></li>
						<li><a href="#">创业人物</a></li>
					</ul>
				</nav>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="menu-demo-dropdown1-2">dropdown1（文字触发）</h3>
			<div class="doc-example" data-url="doc/widget/menu_dropdown1_2.jsp">
				<nav class="am-menu am-menu-dropdown1" data-am-widget="menu" data-am-menu-collapse>
					<a href="javascript:;" class="am-menu-toggle">
						<span class="am-menu-toggle-title">菜单</span>
						<i class="am-menu-toggle-icon am-icon-angle-right"></i>
					</a>
					<ul class="am-avg-sm-1 am-collapse am-menu-nav">
						<li class="am-parent">
							<a href="#">公司</a>
							<ul class="am-avg-sm-2 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">进入栏目 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">人物</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">趋势</a>
							<ul class="am-avg-sm-4 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">泥煤 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">投融资</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li><a href="#">创业公司</a></li>
						<li><a href="#">创业人物</a></li>
					</ul>
				</nav>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="menu-demo-dropdown2-0">dropdown2（下拉横排）</h3>
			<div class="doc-example" data-url="doc/widget/menu_dropdown2_0.jsp">
				<nav class="am-menu am-menu-dropdown2" data-am-widget="menu" data-am-menu-collapse>
					<a href="javascript:;" class="am-menu-toggle"><i class="am-menu-toggle-icon am-icon-bars"></i></a>
					<ul class="am-avg-sm-4 am-collapse am-menu-nav">
						<li class="am-parent">
							<a href="#">公司</a>
							<ul class="am-avg-sm-2 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">进入栏目 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">人物</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">趋势</a>
							<ul class="am-avg-sm-4 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">泥煤 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">投融资</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li><a href="#">创业公司</a></li>
						<li><a href="#">创业人物</a></li>
					</ul>
				</nav>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="menu-demo-slide1-0">slide1（指示箭头一级下滑1）</h3>
			<div class="doc-example" data-url="doc/widget/menu_slide1_0.jsp">
				<nav class="am-menu am-menu-slide1" data-am-widget="menu" data-am-menu-collapse>
					<a href="javascript:;" class="am-menu-toggle"><i class="am-menu-toggle-icon am-icon-bars"></i></a>
					<ul class="am-avg-sm-4 am-collapse am-menu-nav">
						<li class="am-parent">
							<a href="#">公司</a>
							<ul class="am-avg-sm-2 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">进入栏目 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">人物</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">趋势</a>
							<ul class="am-avg-sm-4 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">泥煤 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">投融资</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li><a href="#">创业公司</a></li>
						<li><a href="#">创业人物</a></li>
					</ul>
				</nav>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="menu-demo-offcanvas1-0">offcanvas1（侧滑左侧）</h3>
			<div class="doc-example" data-url="doc/widget/menu_offcanvas1_0.jsp">
				<nav class="am-menu am-menu-offcanvas1" data-am-widget="menu" data-am-menu-offcanvas>
					<a href="javascript:;" class="am-menu-toggle"><i class="am-menu-toggle-icon am-icon-bars"></i></a>
					<div class="am-offcanvas">
						<div class="am-offcanvas-bar">
							<ul class="am-avg-sm-1 am-menu-nav">
								<li class="am-parent">
									<a href="#">公司</a>
									<ul class="am-avg-sm-2 am-collapse am-menu-sub">
										<li><a href="#">公司</a></li>
										<li><a href="#">人物</a></li>
										<li><a href="#">趋势</a></li>
										<li><a href="#">投融资</a></li>
										<li><a href="#">创业公司</a></li>
										<li><a href="#">创业人物</a></li>
										<li class="am-menu-nav-channel"><a href="#">进入栏目 »</a></li>
									</ul>
								</li>
								<li class="am-parent">
									<a href="#">人物</a>
									<ul class="am-avg-sm-3 am-collapse am-menu-sub">
										<li><a href="#">公司</a></li>
										<li><a href="#">人物</a></li>
										<li><a href="#">趋势</a></li>
										<li><a href="#">投融资</a></li>
										<li><a href="#">创业公司</a></li>
										<li><a href="#">创业人物</a></li>
									</ul>
								</li>
								<li class="am-parent">
									<a href="#">趋势</a>
									<ul class="am-avg-sm-4 am-collapse am-menu-sub">
										<li><a href="#">公司</a></li>
										<li><a href="#">人物</a></li>
										<li><a href="#">趋势</a></li>
										<li><a href="#">投融资</a></li>
										<li><a href="#">创业公司</a></li>
										<li><a href="#">创业人物</a></li>
										<li class="am-menu-nav-channel"><a href="#">泥煤 »</a></li>
									</ul>
								</li>
								<li class="am-parent">
									<a href="#">投融资</a>
									<ul class="am-avg-sm-3 am-collapse am-menu-sub">
										<li><a href="#">公司</a></li>
										<li><a href="#">人物</a></li>
										<li><a href="#">趋势</a></li>
										<li><a href="#">投融资</a></li>
										<li><a href="#">创业公司</a></li>
										<li><a href="#">创业人物</a></li>
									</ul>
								</li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="menu-demo-offcanvas1-1">offcanvas1（侧滑右侧）</h3>
			<div class="doc-example" data-url="doc/widget/menu_offcanvas1_1.jsp">
				<nav class="am-menu am-menu-offcanvas1" data-am-widget="menu" data-am-menu-offcanvas>
					<a href="javascript:;" class="am-menu-toggle"><i class="am-menu-toggle-icon am-icon-bars"></i></a>
					<div class="am-offcanvas">
						<div class="am-offcanvas-bar am-offcanvas-bar-flip">
							<ul class="am-avg-sm-1 am-menu-nav">
								<li class="am-parent">
									<a href="#">公司</a>
									<ul class="am-avg-sm-2 am-collapse am-menu-sub">
										<li><a href="#">公司</a></li>
										<li><a href="#">人物</a></li>
										<li><a href="#">趋势</a></li>
										<li><a href="#">投融资</a></li>
										<li><a href="#">创业公司</a></li>
										<li><a href="#">创业人物</a></li>
										<li class="am-menu-nav-channel"><a href="#">进入栏目 »</a></li>
									</ul>
								</li>
								<li class="am-parent">
									<a href="#">人物</a>
									<ul class="am-avg-sm-3 am-collapse am-menu-sub">
										<li><a href="#">公司</a></li>
										<li><a href="#">人物</a></li>
										<li><a href="#">趋势</a></li>
										<li><a href="#">投融资</a></li>
										<li><a href="#">创业公司</a></li>
										<li><a href="#">创业人物</a></li>
									</ul>
								</li>
								<li class="am-parent">
									<a href="#">趋势</a>
									<ul class="am-avg-sm-4 am-collapse am-menu-sub">
										<li><a href="#">公司</a></li>
										<li><a href="#">人物</a></li>
										<li><a href="#">趋势</a></li>
										<li><a href="#">投融资</a></li>
										<li><a href="#">创业公司</a></li>
										<li><a href="#">创业人物</a></li>
										<li class="am-menu-nav-channel"><a href="#">泥煤 »</a></li>
									</ul>
								</li>
								<li class="am-parent">
									<a href="#">投融资</a>
									<ul class="am-avg-sm-3 am-collapse am-menu-sub">
										<li><a href="#">公司</a></li>
										<li><a href="#">人物</a></li>
										<li><a href="#">趋势</a></li>
										<li><a href="#">投融资</a></li>
										<li><a href="#">创业公司</a></li>
										<li><a href="#">创业人物</a></li>
									</ul>
								</li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="menu-demo-offcanvas2-0">offcanvas2（侧滑横排）</h3>
			<div class="doc-example" data-url="doc/widget/menu_offcanvas2_0.jsp">
				<nav class="am-menu am-menu-offcanvas2" data-am-widget="menu">
					<a href="javascript:;" class="am-menu-toggle"><i class="am-menu-toggle-icon am-icon-bars"></i></a>
					<div class="am-offcanvas">
						<div class="am-offcanvas-bar am-offcanvas-bar-flip">
							<ul class="am-avg-sm-3 am-menu-nav">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="menu-demo-stack-0">stack（垂直菜单）</h3>
			<div class="doc-example" data-url="doc/widget/menu_stack_0.jsp">
				<nav class="am-menu am-menu-stack" data-am-widget="menu">
					<a href="javascript:;" class="am-menu-toggle"><i class="am-menu-toggle-icon am-icon-bars"></i></a>
					<ul class="am-avg-sm-1 am-menu-nav">
						<li class="am-parent">
							<a href="#">公司</a>
							<ul class="am-avg-sm-2 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">进入栏目 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">人物</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">趋势</a>
							<ul class="am-avg-sm-4 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
								<li class="am-menu-nav-channel"><a href="#">泥煤 »</a></li>
							</ul>
						</li>
						<li class="am-parent">
							<a href="#">投融资</a>
							<ul class="am-avg-sm-3 am-collapse am-menu-sub">
								<li><a href="#">公司</a></li>
								<li><a href="#">人物</a></li>
								<li><a href="#">趋势</a></li>
								<li><a href="#">投融资</a></li>
								<li><a href="#">创业公司</a></li>
								<li><a href="#">创业人物</a></li>
							</ul>
						</li>
						<li><a href="#">创业公司</a></li>
						<li><a href="#">创业人物</a></li>
					</ul>
				</nav>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的内容替换为自己的内容。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>menu</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="b6b0a6b2bf8a63e0c9d222cc479565bb" data-title="Menu 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>