<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Table|Amaze UI</title>
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
						<li><a href="#ji-ben-yang-shi">基本样式</a></li>
						<li><a href="#ji-ben-bian-kuang">基本边框</a></li>
						<li><a href="#yuan-jiao-bian-kuang">圆角边框</a></li>
						<li><a href="#dan-yuan-ge-zhuang-tai">单元格状态</a></li>
						<li><a href="#qi-ta-xiao-guo">其他效果</a></li>
						<li><a href="#jin-cou-xing">紧凑型</a></li>
						<li><a href="#xiang-ying-shi-biao-ge">响应式表格</a></li>
						<li>
							<a href="#hou-xu-geng-xin">后续更新</a>
							<ul class="am-collapse"><li><a href="#2-4-x-xin-zeng">2.4.x 新增</a></li></ul>
						</li>
						<li><a href="#suo-you-yang-shi-die-jia">所有样式叠加</a></li>
						<li><a href="#can-kao-zi-yuan">参考资源</a></li>
					</ul>
				</div>
			</div>
			<h1 id="table">Table <a href="#table" class="doc-anchor"></a></h1>
			<hr>
			<p>使用时注意 <code>&lt;table&gt;</code> HTML 结构的完整性。</p>
			<p><strong>表格相关 JS 插件：</strong></p>
			<ul><li><a href="#">jQuery DataTables</a></li></ul>
			<h2 id="ji-ben-yang-shi">基本样式 <a href="#ji-ben-yang-shi" class="doc-anchor"></a></h2>
			<p>添加 <code>.am-table</code>。</p>
			<div class="doc-example">
				<table class="am-table">
					<thead>
						<tr>
							<th>网站名称</th>
							<th>网址</th>
							<th>创建时间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr class="am-active">
							<td>Amaze UI(Active)</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="ji-ben-bian-kuang">基本边框 <a href="#ji-ben-bian-kuang" class="doc-anchor"></a></h2>
			<p>添加 <code>.am-table-bordered</code> 类。</p>
			<div class="doc-example">
				<table class="am-table am-table-bordered">
					<thead>
						<tr>
							<th>网站名称</th>
							<th>网址</th>
							<th>创建时间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="yuan-jiao-bian-kuang">圆角边框 <a href="#yuan-jiao-bian-kuang" class="doc-anchor"></a></h2>
			<p>同时添加 <code>.am-table-bordered</code> 、 <code>.am-table-radius</code>，外层圆角边框通过 <code>box-shadow</code> 实现。</p>
			<div class="doc-example">
				<table class="am-table am-table-bordered am-table-radius am-table-striped">
					<thead>
						<tr>
							<th>网站名称</th>
							<th>网址</th>
							<th>创建时间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="dan-yuan-ge-zhuang-tai">单元格状态 <a href="#dan-yuan-ge-zhuang-tai" class="doc-anchor"></a></h2>
			<p>表示表格状态的 class 添加到 <code>tr</code> 整行整行，添加到 <code>td</code> 高亮单元格。</p>
			<ul>
				<li><code>.am-active</code> 激活；</li>
				<li><code>.am-disabled</code> 禁用；</li>
				<li><code>.am-primary</code> 蓝色高亮；</li>
				<li><code>.am-success</code> 绿色高亮；</li>
				<li><code>.am-warning</code> 橙色高亮；</li>
				<li><code>.am-danger</code> 红色高亮。</li>
			</ul>
			<div class="doc-example">
				<table class="am-table am-table-bordered am-table-radius">
					<thead>
						<tr>
							<th>Class</th>
							<th>状态描述</th>
							<th>目标元素</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>.am-active</td>
							<td class="am-active">激活</td>
							<td>td</td>
						</tr>
						<tr class="am-active">
							<td>.am-active</td>
							<td>激活</td>
							<td>tr</td>
						</tr>
						<tr>
							<td>.am-disabled</td>
							<td class="am-disabled">禁用</td>
							<td>td</td>
						</tr>
						<tr class="am-disabled">
							<td>.am-disabled</td>
							<td>禁用</td>
							<td>tr</td>
						</tr>
						<tr>
							<td class="am-primary">.am-primary</td>
							<td>蓝色高亮</td>
							<td>td</td>
						</tr>
						<tr class="am-primary">
							<td>.am-primary</td>
							<td>蓝色高亮</td>
							<td>tr</td>
						</tr>
						<tr>
							<td class="am-success">.am-success</td>
							<td>绿色高亮</td>
							<td>td</td>
						</tr>
						<tr class="am-success">
							<td>.am-success</td>
							<td>绿色高亮</td>
							<td>tr</td>
						</tr>
						<tr>
							<td class="am-warning">.am-warning</td>
							<td>橙色高亮</td>
							<td>td</td>
						</tr>
						<tr class="am-warning">
							<td>.am-warning</td>
							<td>橙色高亮</td>
							<td>tr</td>
						</tr>
						<tr>
							<td class="am-danger">.am-danger</td>
							<td>红色高亮</td>
							<td>td</td>
						</tr>
						<tr class="am-danger">
							<td>.am-danger</td>
							<td>红色高亮</td>
							<td>tr</td>
						</tr>
					</tbody>
				</table>
			</div>
			<h2 id="qi-ta-xiao-guo">其他效果 <a href="#qi-ta-xiao-guo" class="doc-anchor"></a></h2>
			<ul>
				<li><code>.am-table-striped</code> 斑马纹效果</li>
				<li><code>.am-table-hover</code> hover 状态</li>
			</ul>
			<div class="doc-example">
				<table class="am-table am-table-striped am-table-hover">
					<thead>
						<tr>
							<th>网站名称</th>
							<th>网址</th>
							<th>创建时间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="jin-cou-xing">紧凑型 <a href="#jin-cou-xing" class="doc-anchor"></a></h2>
			<p>添加 <code>.am-table-compact</code> class，调整 <code>padding</code> 显示更紧凑的单元格。</p>
			<div class="doc-example">
				<table class="am-table am-table-bordered am-table-striped am-table-compact">
					<thead>
						<tr>
							<th>网站名称</th>
							<th>网址</th>
							<th>创建时间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr class="am-active">
							<td>Amaze UI(Active)</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="xiang-ying-shi-biao-ge">响应式表格 <a href="#xiang-ying-shi-biao-ge" class="doc-anchor"></a></h2>
			<ul>
				<li><code>.am-text-nowrap</code>:禁止文字换行；</li>
				<li><code>.am-scrollable-horizontal</code>:内容超出容器宽度时显示水平滚动条。</li>
			</ul>
			<p>以上两个 class 在「<strong>辅助类</strong>」中定义。</p>
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
			<h2 id="hou-xu-geng-xin">后续更新 <a href="#hou-xu-geng-xin" class="doc-anchor"></a></h2>
			<h3 id="2-4-x-xin-zeng">2.4.x 新增 <a href="#2-4-x-xin-zeng" class="doc-anchor"></a></h3>
			<ul>
				<li><code>&lt;table&gt;</code> 上添加 <code>.am-table-centered</code> 实现单元格居中对齐</li>
				<li>单元格上添加 <code>.am-text-middle</code> 可以实现垂直居中，同样，在<strong>单元格</strong>上添加其他文本对齐 class 可以实现想要的效果（参见<a href="#">辅助类</a>）</li>
			</ul>
			<div class="doc-example">
				<table class="am-table am-table-bordered am-table-centered">
					<tr>
						<th>Savings for holiday!</th>
						<th>Month</th>
						<th>Savings</th>
					</tr>
					<tr>
						<td class="am-text-middle" rowspan="2">$50</td>
						<td>January</td>
						<td>$100</td>
					</tr>
					<tr>
						<td>February</td>
						<td>$80</td>
					</tr>
				</table>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="suo-you-yang-shi-die-jia">所有样式叠加 <a href="#suo-you-yang-shi-die-jia" class="doc-anchor"></a></h2>
			<div class="doc-example">
				<table class="am-table am-table-bordered am-table-striped am-table-hover">
					<thead>
						<tr>
							<th>网站名称</th>
							<th>网址</th>
							<th>创建时间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr class="am-active">
							<td>Amaze UI(Active)</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
						<tr>
							<td>Amaze UI</td>
							<td>http://amazeui.org</td>
							<td>2012-10-01</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="can-kao-zi-yuan">参考资源 <a href="#can-kao-zi-yuan" class="doc-anchor"></a></h2>
			<ul>
				<li>[表格排序 jQuery Table Sort] (<a href="#">https://github.com/kylefox/jquery-tablesort</a>)</li>
				<li><a href="#">Tablesaw - A set of jQuery plugins for responsive tables</a></li>
				<li><a href="#">FooTable - jQuery plugin to make HTML tables responsive</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="c38eee2de6afb4f13821f07d2b8d25a7" data-title="CSS - Table|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>