<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Button-group|Amaze UI</title>
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
						<li><a href="#ji-ben-shi-yong">基本使用</a></li>
						<li><a href="#an-niu-gong-ju-lan">按钮工具栏</a></li>
						<li><a href="#an-niu-zu-da-xiao">按钮组大小</a></li>
						<li><a href="#chui-zhi-pai-lie">垂直排列</a></li>
						<li><a href="#zi-gua-ying-kuan-du">自适应宽度</a></li>
						<li>
							<a href="#jie-he-xia-la-zu-jian-shi-yong">结合下拉组件使用</a>
							<ul class="am-collapse">
								<li><a href="#an-niu-xia-la-cai-dan">按钮下拉菜单</a></li>
								<li><a href="#an-niu-shang-la-cai-dan">按钮上拉菜单</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="button-group">Button-group <a href="#button-group" class="doc-anchor"></a></h1>
			<hr>
			<p>组合 Button 元素。</p>
			<h2 id="ji-ben-shi-yong">基本使用 <a href="#ji-ben-shi-yong" class="doc-anchor"></a></h2>
			<p>把一系列要使用的 <code>.am-btn</code> 按钮放入 <code>.am-btn-group</code> 。</p>
			<div class="doc-example">
				<div class="am-btn-group">
					<button type="button" class="am-btn am-btn-default">左手</button>
					<button type="button" class="am-btn am-btn-default">猪手</button>
					<button type="button" class="am-btn am-btn-default">右手</button>
				</div>
				<div class="am-btn-group">
					<button type="button" class="am-btn am-btn-primary am-radius">左手</button>
					<button type="button" class="am-btn am-btn-primary am-radius">猪手</button>
					<button type="button" class="am-btn am-btn-primary am-radius">右手</button>
				</div>
				<div class="am-btn-group">
					<button type="button" class="am-btn am-btn-success am-round">左手</button>
					<button type="button" class="am-btn am-btn-success am-round">猪手</button>
					<button type="button" class="am-btn am-btn-success am-round">右手</button>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="an-niu-gong-ju-lan">按钮工具栏 <a href="#an-niu-gong-ju-lan" class="doc-anchor"></a></h2>
			<p>将 <code>.am-btn-group</code> 放进 <code>.am-btn-toolbar</code>，实现工具栏效果。</p>
			<div class="doc-example">
				<div class="am-btn-toolbar">
					<div class="am-btn-group">
						<button type="button" class="am-btn am-btn-primary"><i class="am-icon-align-left"></i></button>
						<button type="button" class="am-btn am-btn-primary"><i class="am-icon-align-center"></i></button>
						<button type="button" class="am-btn am-btn-primary"><i class="am-icon-align-right"></i></button>
						<button type="button" class="am-btn am-btn-primary"><i class="am-icon-align-justify"></i></button>
					</div>
					<div class="am-btn-group">
						<button type="button" class="am-btn am-btn-primary"><i class="am-icon-font"></i></button>
						<button type="button" class="am-btn am-btn-primary"><i class="am-icon-bold"></i></button>
						<button type="button" class="am-btn am-btn-primary"><i class="am-icon-italic"></i></button>
						<button type="button" class="am-btn am-btn-primary"><i class="am-icon-underline"></i></button>
					</div>
					<div class="am-btn-group">
						<button type="button" class="am-btn am-btn-primary"><i class="am-icon-copy"></i></button>
						<button type="button" class="am-btn am-btn-primary"><i class="am-icon-paste"></i></button>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="an-niu-zu-da-xiao">按钮组大小 <a href="#an-niu-zu-da-xiao" class="doc-anchor"></a></h2>
			<p>给 <code>.am-btn-group</code> 增加 class <code>.am-btn-group-lg</code> 或 <code>.am-btn-group-sm</code> 或 <code>.am-btn-group-xs</code> 改变按钮大小。</p>
			<div class="doc-example">
				<div class="am-btn-toolbar">
					<div class="am-btn-group am-btn-group-lg">
						<button type="button" class="am-btn am-btn-default">左手 lg</button>
						<button type="button" class="am-btn am-btn-default">猪手 lg</button>
						<button type="button" class="am-btn am-btn-default">右手 lg</button>
					</div>
				</div>
				<br>
				<div class="am-btn-toolbar">
					<div class="am-btn-group">
						<button type="button" class="am-btn am-btn-default">左手默认</button>
						<button type="button" class="am-btn am-btn-default">猪手默认</button>
						<button type="button" class="am-btn am-btn-default">右手默认</button>
					</div>
				</div>
				<br>
				<div class="am-btn-toolbar">
					<div class="am-btn-group am-btn-group-sm">
						<button type="button" class="am-btn am-btn-default">左手 sm</button>
						<button type="button" class="am-btn am-btn-default">猪手 sm</button>
						<button type="button" class="am-btn am-btn-default">右手 sm</button>
					</div>
				</div>
				<br>
				<div class="am-btn-toolbar">
					<div class="am-btn-group am-btn-group-xs">
						<button type="button" class="am-btn am-btn-default">左手 xs</button>
						<button type="button" class="am-btn am-btn-default">猪手 xs</button>
						<button type="button" class="am-btn am-btn-default">右手 xs</button>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="chui-zhi-pai-lie">垂直排列 <a href="#chui-zhi-pai-lie" class="doc-anchor"></a></h2>
			<p>使用 <code>.am-btn-group-stacked</code> 使按钮垂直排列显示。</p>
			<div class="doc-example">
				<div class="am-btn-group-stacked">
					<button type="button" class="am-btn am-btn-default">劳资是个按钮</button>
					<button type="button" class="am-btn am-btn-default">劳资是个按钮</button>
					<button type="button" class="am-btn am-btn-default">劳资是个按钮</button>
					<button type="button" class="am-btn am-btn-default">劳资是个按钮</button>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="zi-gua-ying-kuan-du">自适应宽度 <a href="#zi-gua-ying-kuan-du" class="doc-anchor"></a></h2>
			<p>添加 <code>.am-btn-group-justify</code> class 让按钮组里的按钮平均分布，填满容器宽度。</p>
			<p><del><strong>注意：</strong> 只适用 <code>&lt;a&gt;</code> 元素，<code>&lt;button&gt;</code> 不能应用 <code>display:table-cell</code> 样式</del>。</p>
			<p><strong>使用 <code>flexbox</code> 实现，只兼容 IE 10+ 及其他现代浏览器</strong>。</p>
			<div class="doc-example">
				<div class="am-btn-group am-btn-group-justify">
					<a class="am-btn am-btn-default">左手</a>
					<a class="am-btn am-btn-default">猪手</a>
					<a class="am-btn am-btn-default">右手</a>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="jie-he-xia-la-zu-jian-shi-yong">结合下拉组件使用 <a href="#jie-he-xia-la-zu-jian-shi-yong" class="doc-anchor"></a></h2>
			<p>下面的演示需要结合 <a href="doc/plugin/dropdown.jsp">Dropdown</a> 使用。</p>
			<h3 id="an-niu-xia-la-cai-dan">按钮下拉菜单 <a href="#an-niu-xia-la-cai-dan" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-btn-group">
					<button class="am-btn am-btn-secondary">下拉按钮</button>
					<div class="am-dropdown" data-am-dropdown>
						<button class="am-btn am-btn-secondary am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-caret-down"></span></button>
						<ul class="am-dropdown-content">
							<li class="am-dropdown-header">标题</li>
							<li><a href="#">快乐的方式不只一种</a></li>
							<li class="am-active"><a href="#">最荣幸是</a></li>
							<li><a href="#">谁都是造物者的光荣</a></li>
							<li class="am-disabled"><a href="#">就站在光明的角落</a></li>
							<li class="am-divider"></li>
							<li><a href="#">天空海阔 要做最坚强的泡沫</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn-group"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-secondary"</span>&gt;</span>下拉按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-dropdown"</span> <span class="hljs-attribute">data-am-dropdown</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-secondary am-dropdown-toggle"</span> <span class="hljs-attribute">data-am-dropdown-toggle</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-caret-down"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">ul</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-dropdown-content"</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-dropdown-header"</span>&gt;</span>标题<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>快乐的方式不只一种<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-active"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>最荣幸是<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>谁都是造物者的光荣<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-disabled"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>就站在光明的角落<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-divider"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>天空海阔 要做最坚强的泡沫<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
      <span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
   <span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="an-niu-shang-la-cai-dan">按钮上拉菜单 <a href="#an-niu-shang-la-cai-dan" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-btn-group">
					<button class="am-btn am-btn-secondary">上拉按钮</button>
					<div class="am-dropdown am-dropdown-up" data-am-dropdown>
						<button class="am-dropdown-toggle am-btn am-btn-secondary" data-am-dropdown-toggle><span class="am-icon-caret-up"></span></button>
						<ul class="am-dropdown-content">
							<li class="am-dropdown-header">标题</li>
							<li><a href="#">快乐的方式不只一种</a></li>
							<li class="am-active"><a href="#">最荣幸是</a></li>
							<li><a href="#">谁都是造物者的光荣</a></li>
							<li class="am-disabled"><a href="#">就站在光明的角落</a></li>
							<li class="am-divider"></li>
							<li><a href="#">天空海阔 要做最坚强的泡沫</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn-group"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-secondary"</span>&gt;</span>上拉按钮<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-dropdown am-dropdown-up"</span> <span class="hljs-attribute">data-am-dropdown</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-secondary am-dropdown-toggle"</span> <span class="hljs-attribute">data-am-dropdown-toggle</span>&gt;</span> <span class="hljs-tag">&lt;<span class="hljs-title">span</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-icon-caret-up"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">span</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">ul</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-dropdown-content"</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-dropdown-header"</span>&gt;</span>标题<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>快乐的方式不只一种<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-active"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>最荣幸是<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>谁都是造物者的光荣<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-disabled"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>就站在光明的角落<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-divider"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">li</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span>天空海阔 要做最坚强的泡沫<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
      <span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
   <span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<div class="ds-thread" data-thread-key="cb2741ccfe829befd525d9b1cf7721c4" data-title="CSS - Button-group|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	$("[data-am-dropdown]").on("open:dropdown:amui",function(){
		console.log("open event triggered");
	});
});
</script>
</body>
</html>