<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js"><!--<![endif]-->
<head>
	<title>Amaze UI|中国首个开源 HTML5 跨屏前端框架</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body class="amz-index" data-amui="2.x">
<!--[if lte IE 9]>
	<div class="am-alert am-alert-danger ie-warning" data-am-alert>
		<button type="button" class="am-close">&times;</button>
		<div class="am-container">365 安全卫士提醒：你的浏览器太古董了，妹子无爱，<a href="#">速速点击换一个</a>！</div>
	</div>
<![endif]-->
<div style="height:40px;background:#444;" class="am-projects">
	<div class="am-cf amz-container">
		<nav class="am-projects-nav">
			<a href="#" class="active">Web</a>
			<a href="#">Touch</a>
		</nav>
		<nav class="am-projects-misc"><a href="#"><span class="am-icon-comments-o"></span> 社区</a></nav>
	</div>
</div>
<header id="amz-header">
	<div class="am-cf amz-container">
		<h1><a href="#">Amaze UI</a></h1>
		<button class="am-show-sm-only am-btn am-btn-primary" data-am-collapse="{target:'.amz-header-nav'}">
			<span class="am-sr-only">&nbsp;</span>
			<span class="am-icon-bars"></span>
		</button>
		<nav>
			<ul class="am-collapse amz-header-nav">
				<li><a href="doc/start/index.jsp">开始使用</a></li>
				<li><a href="doc/css/index.jsp">CSS</a></li>
				<li><a href="doc/plugin/index.jsp">JS 插件</a></li>
				<li><a href="doc/widget/index.jsp">Web 组件</a></li>
				<li><a href="doc/about/index.jsp">关于</a></li>
				<li class="amz-cse">
					<form class="cse-form">
						<input type="text" placeholder="搜索" name="q">
						<button><span class="am-icon-search"></span></button>
					</form>
				</li>
			</ul>
		</nav>
	</div>
</header>
<div id="amz-home">
	<section id="amz-hero">
		<div class="am-cf amz-container">
			<div class="amz-mascot" data-am-scrollspy="{animation:'slide-left',delay:100}"><img src="doc/image/mascot.png" class="am-img-responsive"></div>
			<div class="amz-hero-intro">
				<div class="amz-hero-headings">
					<h1 data-am-scrollspy="{animation:'slide-left'}">Amaze ~ 妹子 UI</h1>
					<h2 data-am-scrollspy="{animation:'slide-right',delay:500}">中国首个开源 HTML5 跨屏前端框架</h2>
				</div>
				<ul class="github-status">
					<li><a href="#"><span class="am-icon-star"></span> <span>6942</span> Stars</a></li>
					<li><a href="#"><span class="am-icon-code-fork"></span> <span>1826</span> Forks</a></li>
				</ul>
				<div class="amz-btn-started" data-am-scrollspy="{animation:'scale-up',delay:1500,repeat:false}">
					<a href="doc/start/index.jsp" class="am-btn am-btn-lg am-btn-success">开始使用</a>
					<a href="#" class="am-btn am-btn-lg am-btn-default">贡献代码</a>
				</div>
			</div>
		</div>
		<div class="amz-notify">
			<form action="javascript:;" onsubmit="search()">
				<div class="am-g am-g-fixed">
					<div class="am-u-md-6 col-md-6 notify-latest">
						<a href="#">
							<span class="amz-notify-date">2015-11-30</span>
							<span class="amz-notify-divider">|</span>
							<span>Amaze UI v2.6.2发布</span>
						</a>
					</div>
					<div class="am-u-md-4 am-text-right col-md-4 subscribe-field"><input type="email" class="am-form-field ipt-email" placeholder="请输入 Email"></div>
					<div class="am-u-md-2 col-md-2"><button type="submit" class="am-btn am-btn-block am-btn-secondary" id="index-submit">订阅更新</button></div>
					<div class="am-u-md-6 am-alert am-alert-danger col-md-6 subscribe-alert">
						<button type="button" class="am-close">&times;</button>
						<p>邮箱已经存在，静候 Amaze 传书吧！</p>
					</div>
					<div class="am-u-md-6 am-alert am-alert-warning am-animation-slide-topcol-md-6 subscribe-alert">
						<button type="button" class="am-close">&times;</button>
						<p>提交成功，请查收邮件点击确认链接！</p>
					</div>
				</div>
			</form>
		</div>
	</section>
	<section class="amz-features">
		<div class="am-g am-g-fixed">
			<div class="am-u-md-6 col-md-6" data-scrollspy="{animation:&#x27;,slide-top:&#x27;,delay:500}">
				<img src="doc/image/foundation.png" class="am-img-responsive img">
				<h2>为移动而生</h2>
				<p>Amaze UI 以移动优先（Mobile first）为理念，从小屏逐步扩展到大屏，最终实现所有屏幕适配，适应移动互联潮流。</p>
			</div>
			<div class="am-u-md-6 col-md-6" data-scrollspy="{animation:&#x27;,slide-top:&#x27;,delay:500}">
				<img src="doc/image/web.png" class="am-img-responsive img">
				<h2>组件丰富，模块化</h2>
				<p>Amaze UI 含近 20 个 CSS 组件、20 余 JS 组件，更有多个包含不同主题的 Web 组件，可快速构建界面出色、体验优秀的跨屏页面，大幅提升开发效率。</p>
			</div>
		</div>
		<div class="am-g am-g-fixed">
			<div class="am-u-md-6 col-md-6" data-scrollspy="{animation:&#x27;,slide-right:&#x27;,delay:1000}">
				<img src="doc/image/chinese.png" class="am-img-responsive img">
				<h2>本地化支持</h2>
				<p>相比国外框架，Amaze UI 关注中文排版，根据用户代理调整字体，实现更好的中文排版效果；兼顾国内主流浏览器及 App 内置浏览器兼容支持。</p>
			</div>
			<div class="am-u-md-6 col-md-6" data-scrollspy="{animation:&#x27;,slide-bottom:&#x27;,delay:1500}">
				<img src="doc/image/mobile.png" class="am-img-responsive img">
				<h2>轻量级，高性能</h2>
				<p>Amaze UI 面向 HTML5 开发，使用 CSS3 来做动画交互，平滑、高效，更适合移动设备，让 Web 应用更快速载入。</p>
			</div>
		</div>
	</section>
	<section class="amz-credits">
		<div class="amz-container">
			<header>
				<h1 data-am-scrollspy="{animation:'fade'}">站在巨人的肩膀上</h1>
				<h2 data-scrollspy="{animation:'slide-bottom',delay:500}">Amaze UI 汲取了很多优秀的社区资源，通过开源的形式来回馈社区。</h2>
			</header>
		</div>
		<div class="am-g am-g-fixed amz-credits-list">
			<div class="am-u-md-4 col-md-4" data-scrollspy="{animation:'scale-up',delay:1000}">
				<h2>MIT License</h2>
				<p>Amaze UI 使用 <a href="#">MIT 许可证</a>发布，用户可以自由使用、复制、修改、合并、出版发行、散布、再授权及贩售 Amaze UI 及其副本。</p>
			</div>
			<div class="am-u-md-4 col-md-4" data-scrollspy="{animation:'scale-up',delay:1000}">
				<h2>Heroes</h2>
				<p><a href="#">参考、使用的项目</a>：jQuery, Zepto.js, Seajs, LESS, normalize.css, FontAwesome, Bootstrap, Foundation, UIKit, Pure, Framework7, etc.</p>
			</div>
			<div class="am-u-md-4 col-md-4" data-scrollspy="{animation:'scale-up',delay:1000}">
				<h2>Credits</h2>
				<p>我们追求卓越，然时间、经验、能力有限。Amaze UI 有很多不足的地方，希望大家包容、不吝赐教，给我们提意见、建议。<a href="#">感谢你们</a>！</p>
			</div>
		</div>
	</section>
</div>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
function search(){
	$("#index-submit").button({loadingWithSpinner:"<span class=\"am-icon-circle-o-notch am-icon-spin\"></span> 提交中..."}).button("loading");
}
</script>
</body>
</html>