<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Block-grid|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
<style type="text/css">
.boxes{
	width:300px;
}
.boxes .box{
	height:100px;
	line-height:100px;
	font-weight:700;
	text-align:center;
	color:#EEE;
	transition:transform .25s ease;
}
.boxes .box:hover{
	font-size:250%;
	transform:rotate(360deg);
	-webkit-animation:heart .45s ease-in-out .15s infinite;
	animation:heart .45s ease-in-out .15s infinite;
}
.box-1,.box-5,.box-9{
	background-color:red;
}
.box-2,.box-6{
	background-color:orange;
}
.box-3,.box-7{
	background-color:#00F;
}
.box-4,.box-8{
	background-color:green;
}
@-webkit-keyframes heart{
	0%{
		font-size:150%;
	}
	100%{
		font-size:300%;
	}
}
@keyframes heart{
	0%{
		font-size:150%;
	}
	100%{
		font-size:300%;
	}
}
</style>
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
						<li><a href="#xiang-ying-shi">响应式</a></li>
						<li><a href="#jiu-gong-ge">九宫格</a></li>
					</ul>
				</div>
			</div>
			<h1 id="avg-grid">AVG-Grid <a href="#avg-grid" class="doc-anchor"></a></h1>
			<hr>
			<p>Average Grid，均分网格（原 Block Grid），使用 <code>ul</code>/<code>ol</code>创建等分列，用于内容的排列。</p>
			<p>响应式断点为：</p>
			<table class="am-table am-table-bordered am-table-striped">
				<thead>
					<tr>
						<th style="width:160px;">Class</th>
						<th>区间</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>.am-avg-sm-*</code></td>
						<td><code>0 - 640px</code></td>
					</tr>
					<tr>
						<td><code>.am-avg-md-*</code></td>
						<td><code>641px - 1024px</code></td>
					</tr>
					<tr>
						<td><code>.am-avg-lg-*</code></td>
						<td><code>1025px +</code></td>
					</tr>
				</tbody>
			</table>
			<p>与布局网格不同的是，这里的<strong>数字表示几等分</strong>，而不是占 12 等分中的几列，比如 <code>.am-avg-sm-2</code>会将子元素 <code>&lt;li&gt;</code>的宽度设置为 <code>50%</code>。</p>
			<p>考虑到通用性（菜单、图片）等，<code>&lt;li&gt;</code>没有设置 <code>padding</code>，使用时需根据需求自行设置。</p>
			<p>另外需要注意的 AVG Grid <strong>只能用于 <code>&lt;ul&gt;</code>/<code>&lt;ol&gt;</code>结构</strong>。</p>
			<p><del>下面的演示中，添加了以下自定义样式（Less）：</del></p>
			<p>这部分代码已经整合到<a href="doc/css/thumbnail.jsp">缩略图</a>，无需再添加。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
.doc-block-grid{
   margin-left:-5px;
   margin-right:-5px;
   &gt; li{
      padding:0 5px 10px 5px;
      img{
         padding:2px;
         background:#FFF;
         border:1px solid #CCC;
      }
   }
}
					</code>
				</pre>
			</div>
			<p><strong>演示图标版权归<a href="#">微软 Bing</a>所有。</strong></p>
			<h2 id="ji-ben-shi-yong">基本使用 <a href="#ji-ben-shi-yong" class="doc-anchor"></a></h2>
			<p>只添加 <code>.am-avg-sm-*</code>，应用于所有屏幕尺寸。</p>
			<div class="doc-example">
				<ul class="am-avg-sm-4 am-thumbnails">
					<li><img src="doc/image/bing-1.jpg" class="am-thumbnail"></li>
					<li><img src="doc/image/bing-2.jpg" class="am-thumbnail"></li>
					<li><img src="doc/image/bing-3.jpg" class="am-thumbnail"></li>
					<li><img src="doc/image/bing-4.jpg" class="am-thumbnail"></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="xiang-ying-shi">响应式 <a href="#xiang-ying-shi" class="doc-anchor"></a></h2>
			<p>按需增加更多响应式 class，缩放窗口可以查看响应效果。</p>
			<div class="doc-example">
				<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-thumbnails">
					<li><img src="doc/image/bing-1.jpg" class="am-thumbnail"></li>
					<li><img src="doc/image/bing-2.jpg" class="am-thumbnail"></li>
					<li><img src="doc/image/bing-3.jpg" class="am-thumbnail"></li>
					<li><img src="doc/image/bing-4.jpg" class="am-thumbnail"></li>
					<li><img src="doc/image/bing-1.jpg" class="am-thumbnail"></li>
					<li><img src="doc/image/bing-2.jpg" class="am-thumbnail"></li>
					<li><img src="doc/image/bing-3.jpg" class="am-thumbnail"></li>
					<li><img src="doc/image/bing-4.jpg" class="am-thumbnail"></li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="jiu-gong-ge">九宫格 <a href="#jiu-gong-ge" class="doc-anchor"></a></h2>
			<p>看到同学提这样的需求，就简单写一个示例。</p>
			<div class="doc-example">
				<ul class="am-avg-sm-3 boxes">
					<li class="box box-1">1</li>
					<li class="box box-2">2</li>
					<li class="box box-3">3</li>
					<li class="box box-4">4</li>
					<li class="box box-5">5</li>
					<li class="box box-6">6</li>
					<li class="box box-7">7</li>
					<li class="box box-8">8</li>
					<li class="box box-9">9</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
<span class="hljs-class">.boxes</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">width</span>:<span class="hljs-value"><span class="hljs-number">300px</span></span></span>;
}</span>
<span class="hljs-class">.boxes</span> <span class="hljs-class">.box</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">height</span>:<span class="hljs-value"><span class="hljs-number">100px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">line-height</span>:<span class="hljs-value"><span class="hljs-number">100px</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">font-weight</span>:<span class="hljs-value">bold</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">text-align</span>:<span class="hljs-value">center</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">transition</span>:<span class="hljs-value">all .<span class="hljs-number">2s</span> ease</span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">color</span>:<span class="hljs-value"><span class="hljs-hexcolor">#EEE</span></span></span>;
}</span>
<span class="hljs-class">.boxes</span> <span class="hljs-class">.box</span><span class="hljs-pseudo">:hover</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">font-size</span>:<span class="hljs-value"><span class="hljs-number">250%</span></span></span>;
   <span class="hljs-rule"><span class="hljs-attribute">transform</span>:<span class="hljs-value"><span class="hljs-function">rotate</span>(<span class="hljs-number">360deg</span>)</span></span>;
}</span>
<span class="hljs-class">.box-1</span>,<span class="hljs-class">.box-5</span>,<span class="hljs-class">.box-9</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">background-color</span>:<span class="hljs-value">red</span></span>;
}</span>
<span class="hljs-class">.box-2</span>,<span class="hljs-class">.box-6</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">background-color</span>:<span class="hljs-value">orange</span></span>;
}</span>
<span class="hljs-class">.box-3</span>,<span class="hljs-class">.box-7</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">background-color</span>:<span class="hljs-value"><span class="hljs-hexcolor">#00F</span></span></span>;
}</span>
<span class="hljs-class">.box-4</span>,<span class="hljs-class">.box-8</span><span class="hljs-rules">{
   <span class="hljs-rule"><span class="hljs-attribute">background-color</span>:<span class="hljs-value"><span class="hljs-hexcolor">#008000</span></span></span>;
}</span>
					</code>
				</pre>
			</div>
			<div class="ds-thread" data-thread-key="1795be7ae2a3eb1e1594a7b5f939bcb3" data-title="CSS - Block-grid|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>