<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Button|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="2"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_plugin.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#an-niu-loading-zhuang-tai">按钮 loading 状态</a>
							<ul class="am-collapse">
								<li><a href="#mo-ren-wen-zi">默认文字</a></li>
								<li><a href="#zi-ding-yi-xuan-xiang">自定义选项</a></li>
							</ul>
						</li>
						<li><a href="#dan-an-niu-zhuang-tai-qie-huan">单按钮状态切换</a></li>
						<li><a href="#fu-xuan-kuang">复选框</a></li>
						<li><a href="#dan-xuan-kuang">单选框</a></li>
					</ul>
				</div>
			</div>
			<h1 id="button-js-jiao-hu">Button JS 交互 <a href="#button-js-jiao-hu" class="doc-anchor"></a></h1>
			<hr>
			<p>Button 及 Button group 与 JS 交互。</p>
			<h2 id="an-niu-loading-zhuang-tai">按钮 loading 状态 <a href="#an-niu-loading-zhuang-tai" class="doc-anchor"></a></h2>
			<h3 id="mo-ren-wen-zi">默认文字 <a href="#mo-ren-wen-zi" class="doc-anchor"></a></h3>
			<p>默认的文字为 <code>loading...</code>。</p>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-primary btn-loading-example">按钮 - button 元素</button>
				<input type="button" class="am-btn am-btn-secondary btn-loading-example" value="按钮 - input 元素">
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h3 id="zi-ding-yi-xuan-xiang">自定义选项 <a href="#zi-ding-yi-xuan-xiang" class="doc-anchor"></a></h3>
			<p>可以在元素上添加 <code>data-am-loading</code> 来设置选项：</p>
			<ul>
				<li><code>spinner</code> 加载动画图标，适用于支持 CSS3 动画、非 <code>input</code> 元素，写图标名称即可；</li>
				<li><code>loadingText</code> 加载时显示的文字， 默认为 <code>loading</code>；</li>
				<li><code>resetText</code> 重置以后的显示的文字，默认为原来的内容。</li>
			</ul>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-primary btn-loading-example" data-am-loading="{spinner:'circle-o-notch',loadingText:'加载中...',resetText:'加载过了'}">按钮 - button 元素</button>
				<input type="button" class="am-btn am-btn-secondary btn-loading-example" value="按钮 - input 元素" data-am-loading="{loadingText:'努力加载中...'}">
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="dan-an-niu-zhuang-tai-qie-huan">单按钮状态切换 <a href="#dan-an-niu-zhuang-tai-qie-huan" class="doc-anchor"></a></h2>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-primary" data-am-button id="doc-single-toggle">切换状态</button>
				<p>按钮状态：<span id="doc-single-toggle-status" class="am-text-danger">未激活</span></p>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="fu-xuan-kuang">复选框 <a href="#fu-xuan-kuang" class="doc-anchor"></a></h2>
			<p><strong>注意</strong>：由于 FastClick 的原因，触屏设备上使用时需要在 <code>input</code> 上添加 <code>.needsclick</code>，否则无法获取复选框的值。</p>
			<div class="doc-example">
				<div class="am-btn-group" data-am-button>
					<label class="am-btn am-btn-primary"><input type="checkbox" class="needsclick" value="苹果" name="doc-js-btn"> 苹果</label>
					<label class="am-btn am-btn-primary"><input type="checkbox" class="needsclick" value="橘子" name="doc-js-btn"> 橘子</label>
					<label class="am-btn am-btn-primary"><input type="checkbox" class="needsclick" value="香蕉" name="doc-js-btn"> 香蕉</label>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="dan-xuan-kuang">单选框 <a href="#dan-xuan-kuang" class="doc-anchor"></a></h2>
			<div class="doc-example">
				<div class="am-btn-group doc-js-btn-1" data-am-button>
					<label class="am-btn am-btn-primary"><input type="radio" value="选项 1" name="options" id="option1"> 选项 1</label>
					<label class="am-btn am-btn-primary"><input type="radio" value="选项 2" name="options" id="option2"> 选项 2</label>
					<label class="am-btn am-btn-primary"><input type="radio" value="选项 3" name="options" id="option3"> 选项 3</label>
					<label class="am-btn am-btn-primary am-disabled"><input type="radio" value="选项 4" name="options" id="option4"> 选项 4</label>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="41185178e926b6247a493e99e5eccbdc" data-title="JS 插件 - Button|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	var n0=$("#doc-single-toggle");
	var n1=$("[name='doc-js-btn']");
	var n2=$("[name='options']");
	function t(){
		var t=n0.hasClass("am-active")?"未激活":"激活";
		$("#doc-single-toggle-status").text(t);
	}
	$(".btn-loading-example").click(function(){
		var t=$(this);
		t.button("loading");
		window.setTimeout(function(){
			t.button("reset");
		},5000);
	});
	n0.on("click",function(){
		t();
	});
	n1.on("change",function(){
		var c=[];
		n1.filter(":checked").each(function(){
			c.push(this.value);
		});
		console.log("复选框选中的是：",c.join(" | "));
	});
	n2.on("change",function(){
		console.log("单选框当前选中的是：",n2.filter(":checked").val());
	});
});
</script>
</body>
</html>