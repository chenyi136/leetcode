<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Topbar|Amaze UI</title>
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
								<li><a href="#mo-ren-yang-shi-qian-se-">默认样式（浅色）</a></li>
								<li><a href="#shen-se-yang-shi">深色样式</a></li>
								<li><a href="#logo-tu-pian-ti-huan">Logo 图片替换</a></li>
							</ul>
						</li>
						<li>
							<a href="#ding-bu-di-bu-gu-ding">顶部、底部固定</a>
							<ul class="am-collapse">
								<li><a href="#ding-bu-gu-ding">顶部固定</a></li>
								<li><a href="#di-bu-gu-ding">底部固定</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="topbar-dao-hang-tiao">Topbar 导航条 <a href="#topbar-dao-hang-tiao" class="doc-anchor"></a></h1>
			<hr>
			<p>常用于网页顶部放置 Logo、导航等信息（这个名称起得不太好，出现了 <code>top</code> 这个表象的词）。</p>
			<p>由于需求的差异性，很难整理出一个适合不同网站的导航条组件，Amaze UI 现在整理的版本适合导航条相对简单（Logo + 链接 + 按钮 + 搜索框）的页面，后续还会进一步优化。</p>
			<h2 id="ji-ben-yang-shi">基本样式 <a href="#ji-ben-yang-shi" class="doc-anchor"></a></h2>
			<h3 id="mo-ren-yang-shi-qian-se-">默认样式（浅色） <a href="#mo-ren-yang-shi-qian-se-" class="doc-anchor"></a></h3>
			<p>在容器上添加 <code>.am-topbar</code> class，然后按照示例组织所需内容。</p>
			<div class="doc-example">
				<header class="am-topbar">
					<h1 class="am-topbar-brand"><a href="#">Amaze UI</a></h1>
					<button class="am-show-sm-only am-topbar-toggle am-topbar-btn am-btn am-btn-sm am-btn-success" data-am-collapse="{target:'#doc-topbar-collapse'}">
						<span class="am-sr-only">&nbsp;</span>
						<span class="am-icon-bars"></span>
					</button>
					<div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse">
						<ul class="am-nav am-nav-pills am-topbar-nav">
							<li class="am-active"><a href="#">首页</a></li>
							<li><a href="#">项目</a></li>
							<li class="am-dropdown" data-am-dropdown>
								<a href="javascript:;" class="am-dropdown-toggle" data-am-dropdown-toggle>下拉 <span class="am-icon-caret-down"></span></a>
								<ul class="am-dropdown-content">
									<li class="am-dropdown-header">标题</li>
									<li><a href="#">1. 去月球</a></li>
									<li class="am-active"><a href="#">2. 去火星</a></li>
									<li><a href="#">3. 还是回地球</a></li>
									<li class="am-disabled"><a href="#">4. 下地狱</a></li>
									<li class="am-divider"></li>
									<li><a href="#">5. 桥头一回首</a></li>
								</ul>
							</li>
						</ul>
						<form class="am-topbar-left am-topbar-form am-form-inline"><div class="am-form-group"><input type="text" class="am-form-field am-input-sm" placeholder="搜索"></div></form>
						<div class="am-topbar-right">
							<div class="am-dropdown" data-am-dropdown="{boundary:'.am-topbar'}">
								<button class="am-dropdown-toggle am-topbar-btn am-btn am-btn-sm am-btn-secondary" data-am-dropdown-toggle>其他 <span class="am-icon-caret-down"></span></button>
								<ul class="am-dropdown-content">
									<li><a href="#">注册</a></li>
									<li><a href="#">随便看看</a></li>
								</ul>
							</div>
						</div>
						<div class="am-topbar-right"><button class="am-topbar-btn am-btn am-btn-sm am-btn-primary">登录</button></div>
					</div>
				</header>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="shen-se-yang-shi">深色样式 <a href="#shen-se-yang-shi" class="doc-anchor"></a></h3>
			<p>在容器上添加 <code>.am-topbar-inverse</code>，调整为背景色为主色调的样式，内部结构同上。</p>
			<div class="doc-example">
				<header class="am-topbar am-topbar-inverse">
					<h1 class="am-topbar-brand"><a href="#">Amaze UI</a></h1>
					<button class="am-show-sm-only am-topbar-toggle am-topbar-btn am-btn am-btn-sm am-btn-secondary" data-am-collapse="{target:'#doc-topbar-collapse-2'}">
						<span class="am-sr-only">&nbsp;</span>
						<span class="am-icon-bars"></span>
					</button>
					<div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse-2">
						<ul class="am-nav am-nav-pills am-topbar-nav">
							<li class="am-active"><a href="#">首页</a></li>
							<li><a href="#">项目</a></li>
							<li class="am-dropdown" data-am-dropdown>
								<a href="javascript:;" class="am-dropdown-toggle" data-am-dropdown-toggle>下拉 <span class="am-icon-caret-down"></span></a>
								<ul class="am-dropdown-content">
									<li class="am-dropdown-header">标题</li>
									<li><a href="#">1. 去月球</a></li>
									<li class="am-active"><a href="#">2. 去火星</a></li>
									<li><a href="#">3. 还是回地球</a></li>
									<li class="am-disabled"><a href="#">4. 下地狱</a></li>
									<li class="am-divider"></li>
									<li><a href="#">5. 桥头一回首</a></li>
								</ul>
							</li>
						</ul>
						<form class="am-topbar-left am-topbar-form am-form-inline"><div class="am-form-group"><input type="text" class="am-form-field am-input-sm" placeholder="搜索"></div></form>
						<div class="am-topbar-right">
							<div class="am-dropdown" data-am-dropdown="{boundary:'.am-topbar'}">
								<button class="am-dropdown-toggle am-topbar-btn am-btn am-btn-sm am-btn-secondary" data-am-dropdown-toggle>其他 <span class="am-icon-caret-down"></span></button>
								<ul class="am-dropdown-content">
									<li><a href="#">注册</a></li>
									<li><a href="#">随便看看</a></li>
								</ul>
							</div>
						</div>
						<div class="am-topbar-right"><button class="am-topbar-btn am-btn am-btn-sm am-btn-primary">登录</button></div>
					</div>
				</header>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="logo-tu-pian-ti-huan">Logo 图片替换 <a href="#logo-tu-pian-ti-huan" class="doc-anchor"></a></h3>
			<p>前端的有趣之处，不是给你一个美轮美奂的城堡，而是使用简单甚至枯燥的组件，通过发挥自己的想象，创造出属于自己的那个小屋。</p>
			<p>结合<a href="doc/css/utility.jsp">辅助 Class</a> <code>.am-text-ir</code> 使用，需要手动设置替换的背景图片。</p>
			<div class="doc-example">
				<header class="am-topbar am-topbar-inverse">
					<h1 class="am-topbar-brand"><a href="#" class="am-text-ir">Amaze UI</a></h1>
					<button class="am-show-sm-only am-topbar-toggle am-topbar-btn am-btn am-btn-sm am-btn-success" data-am-collapse="{target:'#doc-topbar-collapse-3'}">
						<span class="am-sr-only">&nbsp;</span>
						<span class="am-icon-bars"></span>
					</button>
					<div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse-3">
						<ul class="am-nav am-nav-pills am-topbar-nav">
							<li class="am-active"><a href="#">首页</a></li>
							<li><a href="#">项目</a></li>
							<li class="am-dropdown" data-am-dropdown>
								<a href="javascript:;" class="am-dropdown-toggle" data-am-dropdown-toggle>下拉 <span class="am-icon-caret-down"></span></a>
								<ul class="am-dropdown-content">
									<li><a href="#">带我去月球</a></li>
									<li><a href="#">还是回地球</a></li>
									<li class="am-disabled"><a href="#">臣妾做不到</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</header>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-topbar</span> <span class="hljs-class">.am-text-ir</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">display</span>:<span class="hljs-value">block</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">margin-right</span>:<span class="hljs-value"><span class="hljs-number">10px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">height</span>:<span class="hljs-value"><span class="hljs-number">50px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">125px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">background</span>:<span class="hljs-value"><span class="hljs-function">url</span>(http://a.static.amazeui.org/assets/i/ui/logo.png) no-repeat left center</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-background-size</span>:<span class="hljs-value"><span class="hljs-number">125px</span> <span class="hljs-number">24px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">background-size</span>:<span class="hljs-value"><span class="hljs-number">125px</span> <span class="hljs-number">24px</span></span></span>;
}</span>
					</code>
				</pre>
			</div>
			<h2 id="ding-bu-di-bu-gu-ding">顶部、底部固定 <a href="#ding-bu-di-bu-gu-ding" class="doc-anchor"></a></h2>
			<h3 id="ding-bu-gu-ding">顶部固定 <a href="#ding-bu-gu-ding" class="doc-anchor"></a></h3>
			<p>在 <code>.am-topbar</code> 上添加 <code>.am-topbar-fixed-top</code> class，实现顶部固定。</p>
			<p>包含顶部固定导航条的页面会在 <code>body</code> 上添加 <code>.am-with-topbar-fixed-top</code>，用户可以在这个 class 下设置样式，默认设置了 <code>padding-top:51px</code>。</p>
			<div style="display:none;" class="doc-example">
				<header class="am-topbar am-topbar-inverse am-topbar-fixed-top">
					<div class="am-container">
						<h1 class="am-topbar-brand"><a href="#" class="am-text-ir">Amaze UI</a></h1>
						<button class="am-show-sm-only am-topbar-toggle am-topbar-btn am-btn am-btn-sm am-btn-success" data-am-collapse="{target:'#doc-topbar-collapse-4'}">
							<span class="am-sr-only">&nbsp;</span>
							<span class="am-icon-bars"></span>
						</button>
						<div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse-4">
							<ul class="am-nav am-nav-pills am-topbar-nav">
								<li class="am-active"><a href="#">首页</a></li>
								<li><a href="#">项目</a></li>
								<li class="am-dropdown" data-am-dropdown>
									<a href="javascript:;" class="am-dropdown-toggle" data-am-dropdown-toggle>下拉 <span class="am-icon-caret-down"></span></a>
									<ul class="am-dropdown-content">
										<li><a href="#">带我去月球</a></li>
										<li><a href="#">还是回地球</a></li>
										<li class="am-disabled"><a href="#">臣妾做不到</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</header>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">demo已隐藏</code></pre></div>
			<h3 id="di-bu-gu-ding">底部固定 <a href="#di-bu-gu-ding" class="doc-anchor"></a></h3>
			<p>在 <code>.am-topbar</code> 上添加 <code>.am-topbar-fixed-bottom</code> class，实现底部固定。</p>
			<p>包含底部固定导航条的页面会在 <code>body</code> 上添加 <code>.am-with-topbar-fixed-bottom</code>，用户可以在这个 class 下设置样式，默认设置了 <code>padding-bottom:51px</code>。</p>
			<div class="doc-example">
				<header class="am-topbar am-topbar-inverse am-topbar-fixed-bottom">
					<div class="am-container"><h1 class="am-topbar-brand"><a href="#" class="am-text-ir">Amaze UI</a></h1>
						<button class="am-show-sm-only am-topbar-toggle am-topbar-btn am-btn am-btn-sm am-btn-success" data-am-collapse="{target:'#doc-topbar-collapse-5'}">
							<span class="am-sr-only">&nbsp;</span>
							<span class="am-icon-bars"></span>
						</button>
						<div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse-5">
							<ul class="am-nav am-nav-pills am-topbar-nav">
								<li class="am-active"><a href="#">首页</a></li>
								<li><a href="#">项目</a></li>
								<li class="am-dropdown am-dropdown-up" data-am-dropdown>
									<a href="javascript:;" class="am-dropdown-toggle" data-am-dropdown-toggle>上拉 <span class="am-icon-caret-up"></span></a>
									<ul class="am-dropdown-content">
										<li><a href="#">带我去月球</a></li>
										<li><a href="#">还是回地球</a></li>
										<li class="am-disabled"><a href="#">臣妾做不到</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</header>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">demo已隐藏</code></pre></div>
			<div class="ds-thread" data-thread-key="bde9411a5d8145a55562078add967779" data-title="CSS - Topbar|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>