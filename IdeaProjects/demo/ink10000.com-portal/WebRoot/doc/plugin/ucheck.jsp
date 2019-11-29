<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String[] data = new String[] { " minchecked=\"2\" maxchecked=\"4\"" };%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Ucheck|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
<style type="text/css">
.am-ucheck-icons [class*=am-icon]+[class*=am-icon]{
	margin-left:0;
}
</style>
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
							<a href="#shi-yong-yan-shi">使用演示</a>
							<ul class="am-collapse">
								<li><a href="#mo-ren-yang-shi">默认样式</a></li>
								<li><a href="#yan-se-bian-hua">颜色变化</a></li>
								<li><a href="#xing-nei-pai-lie">行内排列</a></li>
								<li><a href="#jie-he-biao-dan-yan-zheng-cha-jian">结合表单验证插件</a></li>
							</ul>
						</li>
						<li>
							<a href="#shi-yong-fang-shi">使用方式</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#tong-guo-js">通过 JS</a></li>
							</ul>
						</li>
						<li><a href="#can-kao-lian-jie">参考链接</a></li>
					</ul>
				</div>
			</div>
			<h1 id="ucheck">uCheck <a href="#ucheck" class="doc-anchor"></a></h1>
			<hr>
			<p><code>radio</code>、<code>checkbox</code> 样式重写。</p>
			<p>选框图标使用 Icon Font，如果你的浏览器不支持 Icon Font（<strong>一些国内的产商就是有把正常的功能搞残的本事</strong>），请谨慎使用。</p>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<h3 id="mo-ren-yang-shi">默认样式 <a href="#mo-ren-yang-shi" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-sm-6">
						<h3>复选框</h3>
						<label class="am-checkbox needsclick"><input type="checkbox" data-am-ucheck> 没有选中</label>
						<label class="am-checkbox needsclick"><input type="checkbox" checked="checked" data-am-ucheck> 已选中</label>
						<label class="am-checkbox"><input type="checkbox" disabled="disabled" data-am-ucheck> 禁用/未选中</label>
						<label class="am-checkbox"><input type="checkbox" disabled="disabled" checked="checked" data-am-ucheck> 禁用/已选中</label>
					</div>
					<div class="am-u-sm-6">
						<h3>单选框</h3>
						<label class="am-radio needsclick"><input type="radio" data-am-ucheck name="radio1"> 未选中</label>
						<label class="am-radio needsclick"><input type="radio" checked="checked" data-am-ucheck name="radio1"> 已选中</label>
						<label class="am-radio"><input type="radio" disabled="disabled" data-am-ucheck name="radio2"> 禁用/未选中</label>
						<label class="am-radio"><input type="radio" disabled="disabled" checked="checked" data-am-ucheck name="radio2"> 禁用/已选中</label>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="yan-se-bian-hua">颜色变化 <a href="#yan-se-bian-hua" class="doc-anchor"></a></h3>
			<p>默认使用主色，如果需要调整颜色在 <code>.am-checkbox</code>/<code>.am-checkbox</code> 上添加颜色 class。</p>
			<ul>
				<li><code>.am-secondary</code></li>
				<li><code>.am-success</code></li>
				<li><code>.am-warning</code></li>
				<li><code>.am-danger</code></li>
			</ul>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-sm-6 am-u-md-3">
						<h3>复选框</h3>
						<label class="am-checkbox am-secondary">
						<input type="checkbox" data-am-ucheck> 没有选中</label>
						<label class="am-checkbox am-secondary"><input type="checkbox" checked="checked" data-am-ucheck> 已选中</label>
					</div>
					<div class="am-u-sm-6 am-u-md-3">
						<h3>单选框</h3>
						<label class="am-radio am-secondary"><input type="radio" data-am-ucheck name="radio3"> 未选中</label>
						<label class="am-radio am-secondary"><input type="radio" checked="checked" data-am-ucheck name="radio3"> 已选中</label>
					</div>
					<div class="am-u-sm-6 am-u-md-3">
						<h3>复选框</h3>
						<label class="am-checkbox am-success"><input type="checkbox" data-am-ucheck> 没有选中</label>
						<label class="am-checkbox am-success"><input type="checkbox" checked="checked" data-am-ucheck> 已选中</label>
					</div>
					<div class="am-u-sm-6 am-u-md-3">
						<h3>单选框</h3>
						<label class="am-radio am-success"><input type="radio" data-am-ucheck name="radio7"> 未选中</label>
						<label class="am-radio am-success"><input type="radio" checked="checked" data-am-ucheck name="radio7"> 已选中</label>
					</div>
					<div class="am-u-sm-6 am-u-md-3">
						<h3>复选框</h3>
						<label class="am-checkbox am-warning"><input type="checkbox" data-am-ucheck> 没有选中</label>
						<label class="am-checkbox am-warning"><input type="checkbox" checked="checked" data-am-ucheck> 已选中</label>
					</div>
					<div class="am-u-sm-6 am-u-md-3">
						<h3>单选框</h3>
						<label class="am-radio am-warning"><input type="radio" data-am-ucheck name="radio4"> 未选中</label>
						<label class="am-radio am-warning"><input type="radio" checked="checked" data-am-ucheck name="radio4"> 已选中</label>
					</div>
					<div class="am-u-sm-6 am-u-md-3">
						<h3>复选框</h3>
						<label class="am-checkbox am-danger"><input type="checkbox" data-am-ucheck> 没有选中</label>
						<label class="am-checkbox am-danger"><input type="checkbox" checked="checked" data-am-ucheck> 已选中</label>
					</div>
					<div class="am-u-sm-6 am-u-md-3">
						<h3>单选框</h3>
						<label class="am-radio am-danger"><input type="radio" data-am-ucheck name="radio5"> 未选中</label>
						<label class="am-radio am-danger"><input type="radio" checked="checked" data-am-ucheck name="radio5"> 已选中</label>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="xing-nei-pai-lie">行内排列 <a href="#xing-nei-pai-lie" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<div class="am-form-group">
					<h3>装备</h3>
					<label class="am-checkbox-inline"><input type="checkbox" data-am-ucheck> iPhone</label>
					<label class="am-checkbox-inline"><input type="checkbox" data-am-ucheck> iMac</label>
					<label class="am-checkbox-inline"><input type="checkbox" data-am-ucheck> Macbook</label>
				</div>
				<div class="am-form-group">
					<h3>性别</h3>
					<label class="am-radio-inline"><input type="radio" value="male" data-am-ucheck name="radio10"> 男</label>
					<label class="am-radio-inline"><input type="radio" value="female" data-am-ucheck name="radio10"> 女</label>
					<label class="am-radio-inline"><input type="radio" value="pig" data-am-ucheck name="radio10"> 人妖</label>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="jie-he-biao-dan-yan-zheng-cha-jian">结合表单验证插件 <a href="#jie-he-biao-dan-yan-zheng-cha-jian" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<form class="am-form" data-am-validator>
					<div class="am-form-group">
						<h3>装备<sup class="am-text-danger">*</sup> （至少 2 项，至多 4 项）</h3>
						<label class="am-checkbox"><input type="checkbox" value="ip" required="required"<%=data[0]%> data-am-ucheck name="cbx"> iPhone</label>
						<label class="am-checkbox"><input type="checkbox" value="im" data-am-ucheck name="cbx"> iMac</label>
						<label class="am-checkbox"><input type="checkbox" value="mbp" data-am-ucheck name="cbx"> Macbook Pro</label>
						<label class="am-checkbox"><input type="checkbox" value="sf" data-am-ucheck name="cbx"> 苏菲·麻索</label>
						<label class="am-checkbox"><input type="checkbox" value="sur" data-am-ucheck name="cbx"> Surface</label>
						<label class="am-checkbox"><input type="checkbox" value="rb" data-am-ucheck name="cbx"> Razer Blade</label>
					</div>
					<div class="am-form-group">
						<h3>性别 <sup class="am-text-danger">*</sup></h3>
						<label class="am-radio"><input type="radio" value="male" required="required" data-am-ucheck name="radio10"> 男</label>
						<label class="am-radio"><input type="radio" value="female" data-am-ucheck name="radio10"> 女</label>
						<label class="am-radio"><input type="radio" value="pig" data-am-ucheck name="radio10"> 人妖</label>
						<button type="submit" class="am-btn am-btn-primary">提交</button>
					</div>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-shi">使用方式 <a href="#shi-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>在 <code>radio</code>/<code>checkbox</code> 上添加 <code>data-am-ucheck</code> 属性。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="tong-guo-js">通过 JS <a href="#tong-guo-js" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   $(<span class="hljs-string">'input[type='</span>checkbox<span class="hljs-string">'],input[type='</span>radio<span class="hljs-string">']'</span>).uCheck();
});
					</code>
				</pre>
			</div>
			<h4 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h4>
			<ul>
				<li><code>$().uCheck(&#39;check&#39;)</code>:选中</li>
				<li><code>$().uCheck(&#39;uncheck&#39;)</code>:取消选中</li>
				<li><code>$().uCheck(&#39;toggle&#39;)</code>:切换选中状态</li>
				<li><code>$().uCheck(&#39;disable&#39;)</code>:禁用</li>
				<li><code>$().uCheck(&#39;enable&#39;)</code>:启动</li>
			</ul>
			<h2 id="can-kao-lian-jie">参考链接 <a href="#can-kao-lian-jie" class="doc-anchor"></a></h2>
			<ul><li><a href="#">iCheck - Highly customizable checkboxes and radio buttons for jQuery and Zepto</a></li></ul>
			<div class="ds-thread" data-thread-key="dcdb1a13002ed1a7d1afafe1e9de0b8f" data-title="JS 插件 - Ucheck|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>