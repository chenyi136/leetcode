<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Utility|Amaze UI</title>
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
							<a href="#bu-ju-xiang-guan">布局相关</a>
							<ul class="am-collapse">
								<li><a href="#rong-qi">容器</a></li>
								<li><a href="#fu-dong-xiang-guan">浮动相关</a></li>
								<li><a href="#chui-zhi-dui-qi">垂直对齐</a></li>
								<li><a href="#yuan-su-xian-shi">元素显示</a></li>
								<li><a href="#nei-wai-bian-ju">内外边距</a></li>
							</ul>
						</li>
						<li>
							<a href="#wen-ben-gong-ju">文本工具</a>
							<ul class="am-collapse">
								<li><a href="#zi-ti">字体</a></li>
								<li><a href="#wen-ben-yan-se">文本颜色</a></li>
								<li><a href="#lian-jie-yan-se-jian-dan">链接颜色减淡</a></li>
								<li><a href="#wen-zi-da-xiao">文字大小</a></li>
								<li><a href="#wen-ben-zuo-you-dui-qi">文本左右对齐</a></li>
								<li><a href="#wen-ben-chui-zhi-dui-qi">文本垂直对齐</a></li>
								<li><a href="#wen-zi-huan-xing-ji-jie-duan">文字换行及截断</a></li>
								<li><a href="#tu-pian-ti-huan">图片替换</a></li>
								<li><a href="#tu-wen-hun-pai-fu-zhu">图文混排辅助</a></li>
							</ul>
						</li>
						<li>
							<a href="#xiang-ying-shi-fu-zhu">响应式辅助</a>
							<ul class="am-collapse">
								<li><a href="#shi-kou-da-xiao">视口大小</a></li>
								<li><a href="#ping-mu-fang-xiang">屏幕方向</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="utility">Utility <a href="#utility" class="doc-anchor"></a></h1>
			<hr>
			<p>一些常用样式的 class，与 LESS minxins 的区别在于：mixins 在样式中调用，而 utility 直接在 HTML 中引用。比如要对一个元素清除浮动，在元素上添加 <code>am-cf</code> 这个 class 即可。</p>
			<h2 id="bu-ju-xiang-guan">布局相关 <a href="#bu-ju-xiang-guan" class="doc-anchor"></a></h2>
			<h3 id="rong-qi">容器 <a href="#rong-qi" class="doc-anchor"></a></h3>
			<h4 id="ji-ben-rong-qi">基本容器 <a href="#ji-ben-rong-qi" class="doc-anchor"></a></h4>
			<p><del><code>.am-container</code>，盒模型为 <code>border-box</code>，水平居中对齐，清除浮动。</del></p>
			<p><code>.am-container</code> 放到了<a href="doc/css/grid.jsp">网格</a>里面。</p>
			<h4 id="shui-ping-gun-dong">水平滚动 <a href="#shui-ping-gun-dong" class="doc-anchor"></a></h4>
			<p><code>.am-scrollable-horizontal</code> 内容超出容器宽度时显示水平滚动条。</p>
			<div class="doc-example">
				<div class="am-scrollable-horizontal">
					<table class="am-table am-table-bordered am-table-striped am-text-nowrap">
						<thead>
							<tr>
								<th>-=表格标题=-</th>
								<th>-=表格标题=-</th>
								<th>-=表格标题=-</th>
								<th>-=表格标题=-</th>
								<th>-=表格标题=-</th>
								<th>-=表格标题=-</th>
								<th>-=表格标题=-</th>
								<th>-=表格标题=-</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
							</tr>
							<tr>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
							</tr>
							<tr>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
								<td>表格数据</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h4 id="chui-zhi-gun-dong">垂直滚动 <a href="#chui-zhi-gun-dong" class="doc-anchor"></a></h4>
			<p><code>.am-scrollable-vertical</code> 内容超过设置的高度以后显示滚动条，默认设置的高度为 <code>240px</code>。</p>
			<div class="doc-example">
				<div class="am-scrollable-vertical">
					<p>《你不懂我，我不怪你》<br>作者：莫言</p>
					<p>每个人都有一个死角， 自己走不出来，别人也闯不进去。<br>我把最深沉的秘密放在那里。<br>你不懂我，我不怪你。</p>
					<p>每个人都有一道伤口， 或深或浅，盖上布，以为不存在。<br>我把最殷红的鲜血涂在那里。<br>你不懂我，我不怪你。</p>
					<p>每个人都有一场爱恋， 用心、用情、用力，感动也感伤。<br>我把最炙热的心情 藏在那里。<br>你不懂我，我不怪你。</p>
					<p>每个人都有 一行眼泪， 喝下的冰冷的水，酝酿成的热泪。<br>我把最心酸的委屈汇在那里。<br>你不懂我，我不怪你。</p>
					<p>每个人都有一段告白， 忐忑、不安，却饱含真心和勇气。<br>我把最抒情的语言用在那里。<br>你不懂我，我不怪你。</p>
				</div>
			</div>
			<h3 id="fu-dong-xiang-guan">浮动相关 <a href="#fu-dong-xiang-guan" class="doc-anchor"></a></h3>
			<ul>
				<li><p><code>.am-cf</code> - 清除浮动</p></li>
				<li><p><code>.am-nbfc</code> - 使用 <code>overflow:hidden;</code> 创建新的 <abbr>BFC</abbr> 清除浮动（<a href="#">参考</a>）</p></li>
			</ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
.am-cf{
   .clearfix();
}
					</code>
				</pre>
			</div>
			<ul>
				<li><code>.am-fl</code> - 左浮动</li>
				<li><code>.am-fr</code> - 右浮动</li>
				<li><code>.am-center</code> - 水平居中</li>
			</ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-center</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">display</span>:<span class="hljs-value">block</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">margin-left</span>:<span class="hljs-value">auto</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">margin-right</span>:<span class="hljs-value">auto</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<p>示例：</p>
			<div class="doc-example">
				<div style="padding:10px;border:1px dashed #DDD;" class="am-cf">
					<button class="am-btn am-btn-success am-fl">向左浮动</button>
					<button class="am-btn am-btn-success am-fr">向右浮动</button>
				</div>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-cf"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-success am-fl"</span>&gt;</span>向左浮动<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-success am-fr"</span>&gt;</span>向右浮动<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="chui-zhi-dui-qi">垂直对齐 <a href="#chui-zhi-dui-qi" class="doc-anchor"></a></h3>
			<p>垂直对齐的原理为把父容器内的 “幽灵”元素（使用伪元素）高度设置为 <code>100%</code>，再通过设置需要对齐的元素 <code>vertical-align</code> 属性实现（<a href="#">参考</a>）。</p>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>Class</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>.am-vertical-align</code></td>
						<td>将这个 class 添加到父容器，父容器需要指定高度。</td>
					</tr>
					<tr>
						<td><code>.am-vertical-align-middle</code></td>
						<td>需要垂直居中的元素</td>
					</tr>
					<tr>
						<td><code>.am-vertical-align-bottom</code></td>
						<td>添加到需要底部对齐的元素</td>
					</tr>
				</tbody>
			</table>
			<h4 id="chui-zhi-ju-zhong-dui-qi">垂直居中对齐 <a href="#chui-zhi-ju-zhong-dui-qi" class="doc-anchor"></a></h4>
			<div class="doc-example"><div style="height:150px;border:1px dashed #DDD;" class="am-vertical-align"><div class="am-vertical-align-middle">飘在半空中的 XX</div></div></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">style</span>=<span class="hljs-value">"height:150px;"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-vertical-align"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-vertical-align-middle"</span>&gt;</span>飘在半空中的 XX<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
			<h4 id="di-bu-dui-qi">底部对齐 <a href="#di-bu-dui-qi" class="doc-anchor"></a></h4>
			<div class="doc-example"><div style="height:150px;border:1px dashed #DDD;" class="am-vertical-align"><div class="am-vertical-align-bottom">DOWN 到了谷底...降到零下几度 C</div></div></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">style</span>=<span class="hljs-value">"height:150px;"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-vertical-align"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-vertical-align-bottom"</span>&gt;</span>DOWN 到了谷底...降到零下几度 C<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span></code></pre></div>
			<h4 id="can-kao-lian-jie">参考链接 <a href="#can-kao-lian-jie" class="doc-anchor"></a></h4>
			<ul>
				<li><a href="#">CSS 实现水平、垂直居中</a></li>
				<li><a href="#">Centering in the Unknown</a></li>
				<li><a href="#">Cube Layout.css</a></li>
			</ul>
			<h3 id="yuan-su-xian-shi">元素显示 <a href="#yuan-su-xian-shi" class="doc-anchor"></a></h3>
			<h4 id="xian-shi-shu-xing">显示属性 <a href="#xian-shi-shu-xing" class="doc-anchor"></a></h4>
			<ul>
				<li><code>.am-block</code> - <code>display</code> 设置为 <code>block</code></li>
				<li><code>.am-inline</code> - <code>display</code> 设置为 <code>inline</code></li>
				<li><code>.am-inline-block</code> - <code>display</code> 设置为 <code>inline-block</code></li>
			</ul>
			<h4 id="yin-cang-yuan-su">隐藏元素 <a href="#yin-cang-yuan-su" class="doc-anchor"></a></h4>
			<p>添加 <code>.am-hide</code> class。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-hide</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">display</span>:<span class="hljs-value">none <span class="hljs-important">!important</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">visibility</span>:<span class="hljs-value">hidden <span class="hljs-important">!important</span></span></span>;
}</span>
					</code>
				</pre>
			</div>
			<div class="doc-example"><button class="am-btn am-btn-danger am-hide">I'm hidden.....</button></div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!--隐藏了，Demo里看不到按钮--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">button</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-danger am-hide"</span>&gt;</span>I'm hidden.....<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="nei-wai-bian-ju">内外边距 <a href="#nei-wai-bian-ju" class="doc-anchor"></a></h3>
			<h4 id="chi-cun">尺寸 <a href="#chi-cun" class="doc-anchor"></a></h4>
			<ul>
				<li><code>xs</code> - 5px</li>
				<li><code>sm</code> - 10px</li>
				<li>default - 16px</li>
				<li><code>lg</code> - 24px</li>
				<li><code>xl</code> - 32px</li>
			</ul>
			<h4 id="class-lie-biao">class 列表 <a href="#class-lie-biao" class="doc-anchor"></a></h4>
			<p>不加尺寸为默认大小（16px），<code>{size}</code> 可以为 <code>0, xs, sm, lg, xl</code> 中之一。</p>
			<ul><li><strong>v2.4:</strong> 增加 <code>0</code> 值的内外边距辅助类。</li></ul>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>Margin</th>
						<th>Padding</th>
					</tr>
				</thead>
				<tr>
					<td><code>.am-margin</code><br><code>.am-margin-{size}</code></td>
					<td><code>.am-padding</code><br><code>.am-padding-{size}</code></td>
				</tr>
				<tr>
					<td>水平方向外边距<br><code>.am-margin-horizontal</code><br><code>.am-margin-horizontal-{size}</code></td>
					<td>水平方向内边距<br><code>.am-padding-horizontal</code><br><code>.am-padding-horizontal-{size}</code></td>
				</tr>
				<tr>
					<td>垂直方向外边距<br><code>.am-margin-vertical</code><br><code>.am-margin-vertical-{size}</code></td>
					<td>垂直方向内边距<br><code>.am-padding-vertical</code><br><code>.am-padding-vertical-{size}</code></td>
				</tr>
				<tr>
					<td>左外边距<br><code>.am-margin-left</code><br><code>.am-margin-left-{size}</code></td>
					<td>左内边距<br><code>.am-padding-left</code><br><code>.am-padding-left-{size}</code></td>
				</tr>
				<tr>
					<td>右外边距<br><code>.am-margin-right</code><br><code>.am-margin-right-{size}</code></td>
					<td>右内边距<br><code>.am-padding-right</code><br><code>.am-padding-right-{size}</code></td>
				</tr>
				<tr>
					<td>上外边距<br><code>.am-margin-top</code><br><code>.am-margin-top-{size}</code></td>
					<td>上内边距<br><code>.am-padding-top</code><br><code>.am-padding-top-{size}</code></td>
				</tr>
				<tr>
					<td>下外边距<br><code>.am-margin-bottom</code><br><code>.am-margin-bottom-{size}</code></td>
					<td>下内边距<br><code>.am-padding-bottom</code><br><code>.am-padding-bottom-{size}</code></td>
				</tr>
			</table>
			<h2 id="wen-ben-gong-ju">文本工具 <a href="#wen-ben-gong-ju" class="doc-anchor"></a></h2>
			<h3 id="zi-ti">字体 <a href="#zi-ti" class="doc-anchor"></a></h3>
			<ul>
				<li><code>.am-sans-serif</code> 非衬线，Amaze UI 主要使用的。</li>
				<li><code>.am-serif</code> 衬线字体，中文为宋体，Amaze UI 中未使用。</li>
				<li><code>.am-kai</code> 应为衬线字体，中文为楷体，Amaze UI <code>&lt;blockquote&gt;</code> 使用此。</li>
				<li><code>.am-monospace</code> 等宽字体，Amaze UI 源代码中使用。</li>
			</ul>
			<p>下面为几种字体系列演示：</p>
			<div class="doc-example">
				<p>The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
				<p class="am-serif">The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
				<p class="am-kai">The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
				<p class="am-monospace">The quick brown fox jumps over the lazy dog.<br>千万不要因为走得太久，而忘记了我们为什么出发。<br>千萬不要因為走得太久，而忘記了我們為什麼出發。</p>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="wen-ben-yan-se">文本颜色 <a href="#wen-ben-yan-se" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<p>千万不要因为走得太久，而忘记了我们为什么出发。</p>
				<p class="am-text-primary">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				<p class="am-text-secondary">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				<p class="am-text-success">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				<p class="am-text-warning">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				<p class="am-text-danger">千万不要因为走得太久，而忘记了我们为什么出发。</p>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="lian-jie-yan-se-jian-dan">链接颜色减淡 <a href="#lian-jie-yan-se-jian-dan" class="doc-anchor"></a></h3>
			<p>超链接颜色默认为主色（蓝色），添加 <code>.am-link-muted</code> class 将链接颜色设置为灰色。</p>
			<div class="doc-example">
				<a href="#" class="am-link-muted">超级链接</a>
				<h3 class="am-link-muted"><a href="#">超级链接</a></h3>
				<ul class="am-link-muted">
					<li><a href="#">超级链接</a></li>
					<li><a href="#">超级链接</a></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="wen-zi-da-xiao">文字大小 <a href="#wen-zi-da-xiao" class="doc-anchor"></a></h3>
			<ul>
				<li><code>.am-text-xs</code> - 12px</li>
				<li><code>.am-text-sm</code> - 14px</li>
				<li><code>.am-text-default</code> - 16px</li>
				<li><code>.am-text-lg</code> - 18px</li>
				<li><code>.am-text-xl</code> - 24px</li>
				<li><code>.am-text-xxl</code> - 32px</li>
				<li><code>.am-text-xxxl</code> - 42px</li>
			</ul>
			<div class="doc-example">
				<p class="am-text-xs am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				<p class="am-text-sm am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				<p class="am-text-default am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				<p class="am-text-lg am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				<p class="am-text-xl am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				<p class="am-text-xxl am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
				<p class="am-text-xxxl am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发。</p>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p>常用字号参考：</p>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th class="text-center">REMs</th>
						<th class="text-center">Pixels</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>6.8rem</td>
						<td>68px</td>
					</tr>
					<tr>
						<td>5rem</td>
						<td>50px</td>
					</tr>
					<tr>
						<td>3.8rem</td>
						<td>38px</td>
					</tr>
					<tr>
						<td>3.2rem</td>
						<td>32px</td>
					</tr>
					<tr>
						<td>2.8rem</td>
						<td>28px</td>
					</tr>
					<tr>
						<td>2.4rem</td>
						<td>24px</td>
					</tr>
					<tr>
						<td>2.2rem</td>
						<td>22px</td>
					</tr>
					<tr>
						<td>1.8rem</td>
						<td>18px</td>
					</tr>
					<tr>
						<td><strong>1.6rem (base)</strong></td>
						<td><strong>16px (base)</strong></td>
					</tr>
					<tr>
						<td>1.4rem</td>
						<td>14px</td>
					</tr>
					<tr>
						<td>1.2rem</td>
						<td>12px</td>
					</tr>
					<tr>
						<td>1rem</td>
						<td>10px</td>
					</tr>
					<tr>
						<td>0.8rem</td>
						<td>8px</td>
					</tr>
					<tr>
						<td>0.5rem</td>
						<td>5px</td>
					</tr>
				</tbody>
			</table>
			<h3 id="wen-ben-zuo-you-dui-qi">文本左右对齐 <a href="#wen-ben-zuo-you-dui-qi" class="doc-anchor"></a></h3>
			<p>文字对齐辅助 class，可设置为响应式。</p>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>左对齐</th>
						<th>右对齐</th>
						<th>居中</th>
						<th>自适应</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>.am-text-left</code></td>
						<td><code>.am-text-right</code></td>
						<td><code>.am-text-center</code></td>
						<td><code>.am-text-justify</code></td>
					</tr>
					<tr>
						<td><code>.am-sm-text-left</code></td>
						<td><code>.am-sm-text-right</code></td>
						<td><code>.am-sm-text-center</code></td>
						<td><code>.am-sm-text-justify</code></td>
					</tr>
					<tr>
						<td><code>.am-sm-only-text-left</code></td>
						<td><code>.am-sm-only-text-right</code></td>
						<td><code>.am-sm-only-text-center</code></td>
						<td><code>.am-sm-only-text-justify</code></td>
					</tr>
					<tr>
						<td><code>.am-md-text-left</code></td>
						<td><code>.am-md-text-right</code></td>
						<td><code>.am-md-text-center</code></td>
						<td><code>.am-md-text-justify</code></td>
					</tr>
					<tr>
						<td><code>.am-md-only-text-left</code></td>
						<td><code>.am-md-only-text-right</code></td>
						<td><code>.am-md-only-text-center</code></td>
						<td><code>.am-md-only-text-justify</code></td>
					</tr>
					<tr>
						<td><code>.am-lg-text-left</code></td>
						<td><code>.am-lg-text-right</code></td>
						<td><code>.am-lg-text-center</code></td>
						<td><code>.am-lg-text-justify</code></td>
					</tr>
				</tbody>
			</table>
			<h3 id="wen-ben-chui-zhi-dui-qi">文本垂直对齐 <a href="#wen-ben-chui-zhi-dui-qi" class="doc-anchor"></a></h3>
			<ul>
				<li><code>.am-text-top</code> - 顶对齐</li>
				<li><code>.am-text-middle</code> - 居中对齐</li>
				<li><code>.am-text-bottom</code> - 底对齐</li>
			</ul>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-md-4">
						<img src="doc/image/bing-6.jpg" width="48px" height="48px">
						<span class="am-text-top">顶部对齐</span>
					</div>
					<div class="am-u-md-4">
						<img src="doc/image/bing-6.jpg" width="48px" height="48px">
						<span class="am-text-middle">居中对齐</span>
					</div>
					<div class="am-u-md-4">
						<img src="doc/image/bing-6.jpg" width="48px" height="48px">
						<span class="am-text-bottom">底部对齐</span>
					</div>
				</div>
			</div>
			<h3 id="wen-zi-huan-xing-ji-jie-duan">文字换行及截断 <a href="#wen-zi-huan-xing-ji-jie-duan" class="doc-anchor"></a></h3>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th style="min-width:130px;">Class</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>.am-text-truncate</code></td>
						<td>禁止换行，超出容器部分截断（以 <code>...</code> 结束）</td>
					</tr>
					<tr>
						<td><code>.am-text-break</code></td>
						<td>超出文字容器宽度时强制换行，主要用于英文排版</td>
					</tr>
					<tr>
						<td><code>.am-text-nowrap</code></td>
						<td>禁止换行，不截断超出容器宽度部分</td>
					</tr>
				</tbody>
			</table>
			<h4 id="dan-xing-wen-zi-jie-duan">单行文字截断 <a href="#dan-xing-wen-zi-jie-duan" class="doc-anchor"></a></h4>
			<p><code>.am-text-truncate</code>，元素 <code>display</code> 属性需为 <code>block</code> 或 <code>inline-block</code>。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.am-text-truncate</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">word-wrap</span>:<span class="hljs-value">normal</span></span>; <span class="hljs-comment">/*for IE*/</span>
   <span class="hljs-rule"><span class="hljs-attribute">text-overflow</span>:<span class="hljs-value">ellipsis</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">white-space</span>:<span class="hljs-value">nowrap</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">overflow</span>:<span class="hljs-value">hidden</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<div class="doc-example"><div style="padding:10px;width:250px;border:1px dashed #DDD;" class="am-text-truncate">千万不要因为走得太久，而忘记了我们为什么出发</div></div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!--超出200px的文字将会被截断--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">style</span>=<span class="hljs-value">"padding:10px;width:250px;"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-text-truncate"</span>&gt;</span>千万不要因为走得太久，而忘记了我们为什么出发<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>参考链接：</p>
			<ul>
				<li><a href="#">https://developer.mozilla.org/en-US/docs/Web/CSS/white-space</a></li>
				<li><a href="#">https://developer.mozilla.org/en-US/docs/Web/CSS/text-overflow</a></li>
				<li><a href="#">IE8 &amp; 9 white-space nowrap 失效</a></li>
			</ul>
			<h4 id="duo-xing-wen-zi-jie-duan">多行文字截断 <a href="#duo-xing-wen-zi-jie-duan" class="doc-anchor"></a></h4>
			<p>在只针对 PC 端开发的年代，可以通过后端控制输出文字的长度来实现固定行数的效果。</p>
			<p>但在响应式页面，这可能不再适用，只能输出足够多的文字，然后通过前端截取需要的行数。</p>
			<p>Webkit 内核的浏览器可以通过 <code>-webkit-line-clamp</code> 私有属性实现多行文字截取。其他浏览器没有这个属性，我的做法通常是把容器的高度限定为 <code>行高 * 显示的行数</code>，超出的部分隐藏，勉强达到目的。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
.line-clamp{
   text-overflow:ellipsis;
   overflow:hidden;
   display:-webkit-box;
   -webkit-line-clamp:2; /*这里修改为要显示的行数*/
   -webkit-box-orient:vertical;
}
					</code>
				</pre>
			</div>
			<p>如果需要考虑其他内核的浏览器，可以使用 Amaze UI 封装的 Mixin:</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-tag">line-clamp</span>(<span class="hljs-at_rule">@<span class="hljs-keyword">lines,</span>@line-height:<span class="hljs-number">1.3em</span>)</span>{
   <span class="hljs-tag">text-overflow</span>:<span class="hljs-tag">ellipsis</span>;
   <span class="hljs-tag">display</span>:<span class="hljs-tag">-webkit-box</span>;
   <span class="hljs-tag">-webkit-box-orient</span>:<span class="hljs-tag">vertical</span>;
   <span class="hljs-tag">-webkit-line-clamp</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">lines;</span> //number of lines to show
   overflow:hidden</span>;
   <span class="hljs-tag">line-height</span>:<span class="hljs-at_rule">@<span class="hljs-keyword">line-height;</span>
   max-height:@line-height * @lines</span>;
}
					</code>
				</pre>
			</div>
			<p>当然，也有一些 JS 插件可以跨浏览器实现，但个人并不推荐在这种场合使用 JS。</p>
			<p><strong>参考链接</strong></p>
			<ul>
				<li><a href="#">-webkit-line-clamp</a></li>
				<li><a href="#">Line Clampin’ - Truncating Multiple Line Text</a></li>
				<li><a href="#">CSS Ellipsis:How to Manage Multi-Line Ellipsis in Pure CSS</a></li>
				<li><a href="#">Clamp.js</a></li>
				<li><a href="#">TextTailor.JS</a></li>
			</ul>
			<h3 id="tu-pian-ti-huan">图片替换 <a href="#tu-pian-ti-huan" class="doc-anchor"></a></h3>
			<p>CSS Image Replacement 是一个历史悠久的技术，也随着前端技术的发展不断进化。</p>
			<p>图片替换技术兼顾显示效果、可访性、SEO，推荐开发者在网站 Logo 、设计特殊的栏目标题等场合使用。</p>
			<p>使用 <code>.am-text-ir</code> class 结合背景图片实现图片替换。</p>
			<div class="doc-example"><header class="doc-ir-demo"><h1><a href="#" class="am-text-ir">Amaze UI</a></h1></header></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">header</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"doc-ir-demo"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">h1</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-text-ir"</span>&gt;</span>Amaze UI<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">h1</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">header</span>&gt;</span></code></pre></div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.doc-ir-demo</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">background</span>:<span class="hljs-value"><span class="hljs-hexcolor">#3BB4F2</span></span></span>;
}</span>
<span class="hljs-class">.doc-ir-demo</span> <span class="hljs-tag">h1</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">margin</span>:<span class="hljs-value"><span class="hljs-number">0</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">padding</span>:<span class="hljs-value"><span class="hljs-number">10px</span></span></span>;
}</span>
<span class="hljs-class">.doc-ir-demo</span> <span class="hljs-tag">a</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">height</span>:<span class="hljs-value"><span class="hljs-number">29px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">125px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">background</span>:<span class="hljs-value"><span class="hljs-function">url</span>(docs/image/landing/logo.png) no-repeat left center</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">background-size</span>:<span class="hljs-value"><span class="hljs-number">125px</span> <span class="hljs-number">24px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">-webkit-background-size</span>:<span class="hljs-value"><span class="hljs-number">125px</span> <span class="hljs-number">24px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">display</span>:<span class="hljs-value">block</span></span>;
}</span>
					</code>
				</pre>
			</div>
			<ul>
				<li><a href="#">Update CSS image replacement technique</a></li>
				<li><a href="#">CSS-Tricks|Search Results for &#39;image replace&#39;</a></li>
			</ul>
			<h3 id="tu-wen-hun-pai-fu-zhu">图文混排辅助 <a href="#tu-wen-hun-pai-fu-zhu" class="doc-anchor"></a></h3>
			<p>使用 <code>float</code> 实现的类似 HTML <code>align</code> 属性的效果，父容器要清除浮动。与 <code>.am-fl</code>、<code>.am-fr</code> 相比，浮动的元素加了 <code>margin</code>。</p>
			<ul>
				<li><code>.am-align-left</code></li>
				<li><code>.am-align-right</code></li>
			</ul>
			<div class="doc-example">
				<div class="am-cf">
					<p class="am-align-left"><img src="doc/image/bing-1.jpg" width="240px"></p>
					<p style="margin-top:0;">那时候刚好下着雨，柏油路面湿冷冷的，还闪烁着青、黄、红颜色的灯火。我们就在骑楼下躲雨，看绿色的邮筒孤独地站在街的对面。我白色风衣的大口袋里有一封要寄给南部的母亲的信。樱子说她可以撑伞过去帮我寄信。我默默点头。</p>
					<p>“谁叫我们只带来一把小伞哪。”她微笑着说，一面撑起伞，准备过马路帮我寄信。从她伞骨渗下来的小雨点，溅在我的眼镜玻璃上。</p>
					<p>随着一阵拔尖的煞车声，樱子的一生轻轻地飞了起来。缓缓地，飘落在湿冷的街面上，好像一只夜晚的蝴蝶。</p>
					<p>虽然是春天，好像已是秋深了。</p>
					<div class="am-align-right"><img src="doc/image/bing-2.jpg" width="240px"></div>
					<p>她只是过马路去帮我寄信。这简单的行动，却要叫我终身难忘了。我缓缓睁开眼，茫然站在骑楼下，眼里裹着滚烫的泪水。世上所有的车子都停了下来，人潮涌向马路中央。没有人知道那躺在街面的，就是我的，蝴蝶。这时她只离我五公尺，竟是那么遥远。更大的雨点溅在我的眼镜上，溅到我的生命里来。</p>
					<p>为什么呢？只带一把雨伞？</p>
					<p>然而我又看到樱子穿着白色的风衣，撑着伞，静静地过马路了。她是要帮我寄信的。那，那是一封写给南部母亲的信。我茫然站在骑楼下，我又看到永远的樱子走到街心。其实雨下得并不大，却是一生一世中最大的一场雨。而那封信是这样写的，年轻的樱子知不知道呢？</p>
					<p>妈：我打算在下个月和樱子结婚。</p>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="xiang-ying-shi-fu-zhu">响应式辅助 <a href="#xiang-ying-shi-fu-zhu" class="doc-anchor"></a></h2>
			<h3 id="shi-kou-da-xiao">视口大小 <a href="#shi-kou-da-xiao" class="doc-anchor"></a></h3>
			<p><code>.am-[show|hide]-[sm|md|lg][-up|-down|-only]</code>，调整浏览器窗口大小查看元素的显隐。</p>
			<p>class 释义：</p>
			<ul>
				<li><code>show</code> 显示，<code>hide</code> 隐藏，这应该不难理解；</li>
				<li><code>sm</code>、<code>md</code>、<code>lg</code> 是划分屏幕大小区间的缩写，对应 small、medium、large，网格里面做了说明；</li>
				<li><code>down</code> 指小于区间，<code>up</code> 指大于区间， <code>only</code> 指仅在这个区间。</li>
			</ul>
			<p>按照上面的翻译一下下面的 class:</p>
			<ul>
				<li><code>.am-show-sm-only</code>:只在 <code>sm</code> 区间显示</li>
				<li><code>.am-show-sm-up</code>:大于 <code>sm</code> 区间时显示</li>
				<li><code>.am-show-sm</code>:在 <code>sm</code> 区间显示，如果没有设置 <code>md</code>、<code>lg</code> 区间的显隐，则元素在所有区间都显示</li>
				<li><code>.am-show-md-down</code>:小于 <code>md</code> 区间时显示</li>
			</ul>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>显示辅助 class</th>
						<th>隐藏辅助 class</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>.am-show-sm-only</code><br><code>.am-show-sm-up</code><br><code>.am-show-sm</code><br><code>.am-show-sm-down</code></td>
						<td><code>.am-hide-sm-only</code><br><code>.am-hide-sm-up</code><br><code>.am-hide-sm</code><br><code>.am-hide-sm-down</code></td>
					</tr>
					<tr>
						<td><code>.am-show-md-only</code><br><code>.am-show-md-up</code><br><code>.am-show-md</code><br><code>.am-show-md-down</code></td>
						<td><code>.am-hide-md-only</code><br><code>.am-hide-md-up</code><br><code>.am-hide-md</code><br><code>.am-hide-md-down</code></td>
					</tr>
					<tr>
						<td><code>.am-show-lg-only</code><br><code>.am-show-lg-up</code><br><code>.am-show-lg</code><br><code>.am-show-lg-down</code></td>
						<td><code>.am-hide-lg-only</code><br><code>.am-hide-lg-up</code><br><code>.am-hide-lg</code><br><code>.am-hide-lg-down</code></td>
					</tr>
				</tbody>
			</table>
			<div class="doc-example">
				<ul>
					<li class="am-show-sm-only">仅 small 可见</li>
					<li class="am-show-md-up">medium + 可见</li>
					<li class="am-show-md-only">仅 medium 可见</li>
					<li class="am-show-lg-up">large 可见</li>
					<li class="am-show-lg-only">仅 large 可见</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">ul</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-sm-only"</span>&gt;</span>仅 small 可见<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-md-up"</span>&gt;</span>medium + 可见<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-md-only"</span>&gt;</span>仅 medium 可见<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-lg-up"</span>&gt;</span>large 可见<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-lg-only"</span>&gt;</span>仅 large 可见<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h3 id="ping-mu-fang-xiang">屏幕方向 <a href="#ping-mu-fang-xiang" class="doc-anchor"></a></h3>
			<ul>
				<li>横屏：<code>.am-show-landscape</code>, <code>.am-hide-landscape</code></li>
				<li>竖屏：<code>.am-show-portrait</code>, <code>.am-hide-portrait</code></li>
			</ul>
			<div class="doc-example">
				<ul>
					<li class="am-show-landscape">横屏可见...</li>
					<li class="am-show-portrait">竖屏可见...</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">ul</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-landscape"</span>&gt;</span>横屏可见...<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">li</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-show-portrait"</span>&gt;</span>竖屏可见...<span class="hljs-tag">&lt;/<span class="hljs-title">li</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">ul</span>&gt;</span>
					</code>
				</pre>
			</div>
			<div class="ds-thread" data-thread-key="a707804c3753694d5b0d1380f4a6db46" data-title="CSS - Utility|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>