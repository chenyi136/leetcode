<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String[] data = new String[] { " minchecked=\"2\" maxchecked=\"3\"", " required", " placeholder=\"选一个撒\"" };%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Selected|Amaze UI</title>
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
							<a href="#shi-yong-shi-li">使用示例</a>
							<ul class="am-collapse">
								<li><a href="#dan-xuan-xia-la-kuang">单选下拉框</a></li>
								<li><a href="#duo-xuan-xia-la-kuang">多选下拉框</a></li>
								<li><a href="#duo-xuan-xia-la-kuang-you-mo-ren-xuan-zhong-xiang">多选下拉框 - 有默认选中项</a></li>
								<li><a href="#fen-zu-duo-xuan-xia-la-kuang">分组多选下拉框</a></li>
								<li><a href="#an-niu-chi-cun-ji-yan-se">按钮尺寸及颜色</a></li>
								<li><a href="#xian-zhi-lie-biao-gao-du">限制列表高度</a></li>
								<li><a href="#shang-la-xuan-ze">上拉选择</a></li>
								<li><a href="#jian-yi-sou-suo">简易搜索</a></li>
								<li><a href="#xuan-xiang-yan-zheng-ti-shi">选项验证提示</a></li>
								<li><a href="#js-cao-zuo-select">JS 操作 select</a></li>
								<li><a href="#yu-validator-cha-jian-jie-he-shi-yong">与 Validator 插件结合使用</a></li>
							</ul>
						</li>
						<li>
							<a href="#diao-yong-fang-shi">调用方式</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#tong-guo-js">通过 JS</a></li>
							</ul>
						</li>
						<li>
							<a href="#chang-jian-wen-ti">常见问题</a>
							<ul class="am-collapse">
								<li><a href="#yu-jquery-form-chong-tu-">与 jQuery Form 冲突？</a></li>
								<li><a href="#codeltselectgtcode-dan-xuan-mo-ren-xuan-ze-di-yi-xiang-de-wen-ti">&lt;select&gt; （单选）默认选择第一项的问题</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="selected">Selected <a href="#selected" class="doc-anchor"></a></h1>
			<hr>
			<p><code>&lt;select&gt;</code> 元素样式复写插件。</p>
			<p>本插件只提供样式重写及基本的功能，如果需要更高级的功能，请参考：</p>
			<ul>
				<li><a href="#">Amaze UI Styled Chosen</a></li>
				<li><a href="#">Chosen</a></li>
				<li><a href="#">Select2</a></li>
				<li><a href="#">bootstrap-select</a></li>
			</ul>
			<h2 id="shi-yong-shi-li">使用示例 <a href="#shi-yong-shi-li" class="doc-anchor"></a></h2>
			<h3 id="dan-xuan-xia-la-kuang">单选下拉框 <a href="#dan-xuan-xia-la-kuang" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<form>
					<select data-am-selected>
						<option value="a">Apple</option>
						<option value="b" selected="selected">Banana</option>
						<option value="o">Orange</option>
						<option value="m">Mango</option>
						<option value="d" disabled="disabled">禁用鸟</option>
					</select>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="duo-xuan-xia-la-kuang">多选下拉框 <a href="#duo-xuan-xia-la-kuang" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<select multiple="multiple" data-am-selected>
					<option value="a">Apple</option>
					<option value="b">Banana</option>
					<option value="o">Orange</option>
					<option value="m">Mango</option>
				</select>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="duo-xuan-xia-la-kuang-you-mo-ren-xuan-zhong-xiang">多选下拉框 - 有默认选中项 <a href="#duo-xuan-xia-la-kuang-you-mo-ren-xuan-zhong-xiang" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<select multiple="multiple" data-am-selected>
					<option value="a">Apple</option>
					<option value="b" selected="selected">Banana</option>
					<option value="o">Orange</option>
					<option value="m" selected="selected">Mango</option>
				</select>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="fen-zu-duo-xuan-xia-la-kuang">分组多选下拉框 <a href="#fen-zu-duo-xuan-xia-la-kuang" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<select multiple="multiple" data-am-selected>
					<optgroup label="水果">
						<option value="a">Apple</option>
						<option value="b">Banana</option>
						<option value="o">Orange</option>
						<option value="m">Mango</option>
					</optgroup>
					<optgroup label="装备">
						<option value="phone">iPhone</option>
						<option value="im">iMac</option>
						<option value="mbp">Macbook Pro</option>
					</optgroup>
				</select>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="an-niu-chi-cun-ji-yan-se">按钮尺寸及颜色 <a href="#an-niu-chi-cun-ji-yan-se" class="doc-anchor"></a></h3>
			<ul>
				<li><code>btnWidth</code>:按钮宽度，数字或者百分比，<code>btnWidth:&#39;50%&#39;</code></li>
				<li><code>btnSize</code>:按钮尺寸，<code>[xl|lg|sm|xs]</code> （<a href="doc/css/button.jsp">参见 Button</a>）</li>
				<li><code>btnStyle</code>:按钮风格，<code>[primary|secondary|success|warning|danger]</code></li>
			</ul>
			<div class="doc-example">
				<select data-am-selected="{btnWidth:'40%',btnSize:'sm',btnStyle:'secondary'}">
					<option value="a">Apple</option>
					<option value="b">Banana</option>
					<option value="o">Orange</option>
					<option value="m">Mango</option>
				</select>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="xian-zhi-lie-biao-gao-du">限制列表高度 <a href="#xian-zhi-lie-biao-gao-du" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<select data-am-selected="{maxHeight:100}">
					<option value="a">Apple</option>
					<option value="b">Banana</option>
					<option value="o">Orange</option>
					<option value="m">Mango</option>
					<option value="phone">iPhone</option>
					<option value="im">iMac</option>
					<option value="mbp">Macbook Pro</option>
				</select>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="shang-la-xuan-ze">上拉选择 <a href="#shang-la-xuan-ze" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<select data-am-selected="{dropUp:1}">
					<option value="a">Apple</option>
					<option value="b">Banana</option>
					<option value="o">Orange</option>
					<option value="m">Mango</option>
					<option value="phone">iPhone</option>
					<option value="im">iMac</option>
					<option value="mbp">Macbook Pro</option>
				</select>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="jian-yi-sou-suo">简易搜索 <a href="#jian-yi-sou-suo" class="doc-anchor"></a></h3>
			<p>基于 jQuery <code>:contains</code> 选择符实现的简易搜索。</p>
			<div class="doc-example">
				<select data-am-selected="{searchBox:1}">
					<option value="a">Apple</option>
					<option value="b">Banana</option>
					<option value="o">Orange</option>
					<option value="m">Mango</option>
					<option value="phone">iPhone</option>
					<option value="im">iMac</option>
					<option value="mbp">Macbook Pro</option>
				</select>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="xuan-xiang-yan-zheng-ti-shi">选项验证提示 <a href="#xuan-xiang-yan-zheng-ti-shi" class="doc-anchor"></a></h3>
			<p><strong><code>v2.5</code> 新增</strong>：设置 <code>maxchecked</code> 属性以后，超出设定值时会触发 <code>checkedOverflow.selected.amui</code> 事件，可以监听该事件提示用户。</p>
			<div class="doc-example">
				<select multiple="multiple"<%=data[0]%> data-am-selected id="demo-maxchecked">
					<option value="a">Apple</option>
					<option value="b">Banana</option>
					<option value="o">Orange</option>
					<option value="m">Mango</option>
				</select>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="js-cao-zuo-select">JS 操作 select <a href="#js-cao-zuo-select" class="doc-anchor"></a></h3>
			<p><span class="am-badge am-badge-danger">v2.3 新增！</span></p>
			<p>使用 JS 操作 <code>&lt;select&gt;</code>（如添加选项、禁用选项、选中选项等），需要重新渲染下拉菜单。</p>
			<ul>
				<li>支持 <a href="#">MutationObserver</a> 的浏览器会自动触发重新渲染；</li>
				<li>其他浏览器需要手动触发 <code>changed.selected.amui</code> 事件。</li>
			</ul>
			<p><strong>需要注意的是</strong>：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-comment">//使用`attr()`可以被 MutationObserver观察到</span>
$(<span class="hljs-string">'select'</span>).find(<span class="hljs-string">'option'</span>).eq(<span class="hljs-number">1</span>).attr(<span class="hljs-string">'selected'</span>,<span class="hljs-literal">true</span>);
<span class="hljs-comment">//以下操作不会被 MutationObserver观察到</span>
$(<span class="hljs-string">'select'</span>).val(<span class="hljs-string">'aa'</span>);
$(<span class="hljs-string">'select'</span>).find(<span class="hljs-string">'option'</span>).eq(<span class="hljs-number">1</span>).prop(<span class="hljs-string">'selected'</span>,<span class="hljs-literal">true</span>);
$(<span class="hljs-string">'select'</span>).find(<span class="hljs-string">'option'</span>)(<span class="hljs-number">1</span>).selected=<span class="hljs-literal">true</span>;
					</code>
				</pre>
			</div>
			<div class="doc-example">
				<select data-am-selected id="js-selected">
					<option value="a">Apple</option>
					<option value="b" selected="selected">Banana</option>
					<option value="o">Orange</option>
					<option value="m">Mango</option>
				</select>
				<hr>
				<button type="button" class="am-btn am-btn-primary" data-selected="add">添加选项</button>
				<button type="button" class="am-btn am-btn-secondary" data-selected="toggle">交替 Orange 选中状态</button>
				<button type="button" class="am-btn am-btn-danger" data-selected="disable">交替 Mango 禁用状态</button>
				<hr>
				<div id="js-selected-info"></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h3 id="yu-validator-cha-jian-jie-he-shi-yong">与 Validator 插件结合使用 <a href="#yu-validator-cha-jian-jie-he-shi-yong" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<form data-am-validator>
					<select<%=data[0]%> data-am-selected name="test">
						<option value="">请选择</option>
						<option value="a">Apple</option>
						<option value="b">Banana</option>
						<option value="o">Orange</option>
					</select>
					<p><button class="am-btn am-btn-primary">提交</button></p>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="diao-yong-fang-shi">调用方式 <a href="#diao-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>给 <code>&lt;select&gt;</code> 元素添加 <code>data-am-selected</code> 属性（可设置相关参数），如上面的示例所示。</p>
			<h3 id="tong-guo-js">通过 JS <a href="#tong-guo-js" class="doc-anchor"></a></h3>
			<p>通过 <code>$(&#39;select&#39;).selected(options)</code> 启用样式复写。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-comment">//使用默认参数</span>
   $(<span class="hljs-string">'select'</span>).selected();
   <span class="hljs-comment">//设置参数</span>
   $(<span class="hljs-string">'select'</span>).selected({
      btnWidth:<span class="hljs-string">'300px'</span>,
      btnSize:<span class="hljs-string">'sm'</span>,
      btnStyle:<span class="hljs-string">'primary'</span>,
      maxHeight:<span class="hljs-string">'100px'</span>
   });
});
					</code>
				</pre>
			</div>
			<h4 id="can-shu-shuo-ming">参数说明 <a href="#can-shu-shuo-ming" class="doc-anchor"></a></h4>
			<ul>
				<li><code>btnWidth:null</code>:按钮宽度，默认为 <code>200px</code></li>
				<li><code>btnSize:null</code>:按钮尺寸，可选值为 <code>xl|sm|lg|xl</code></li>
				<li><code>btnStyle:&#39;default&#39;</code>:按钮样式，可选值为 <code>primary|secondary|success|warning|danger</code></li>
				<li><code>maxHeight:null</code>:列表最大高度</li>
				<li><code>dropUp:0</code>:是否为上拉，默认为 <code>0</code> (<code>false</code>)</li>
				<li><code>placeholder</code>:占位符，默认读取 <code>&lt;select&gt;</code> 的 <code>placeholder</code> 属性，如果没有则为 <code>点击选择...</code></li>
			</ul>
			<h4 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h4>
			<ul>
				<li><code>$().selected(&#39;disable&#39;)</code>:禁用选框（<code>v2.5</code>）</li>
				<li><code>$().selected(&#39;enable&#39;)</code>:启用选框（<code>v2.5</code>）</li>
				<li><code>$().selected(&#39;destroy&#39;)</code>:销毁实例</li>
			</ul>
			<h4 id="shi-jian">事件 <a href="#shi-jian" class="doc-anchor"></a></h4>
			<table class="am-table am-table-bordered am-table-striped">
				<thead>
					<tr>
						<th>事件名称</th>
						<th>描述</th></tr>
					</thead>
				<tbody>
					<tr>
						<td><code>checkedOverflow.selected.amui</code></td>
						<td>超出设定的最多可选值时触发（<code>v2.5</code> 新增）</td>
					</tr>
				</tbody>
			</table>
			<h2 id="chang-jian-wen-ti">常见问题 <a href="#chang-jian-wen-ti" class="doc-anchor"></a></h2>
			<h3 id="yu-jquery-form-chong-tu-">与 jQuery Form 冲突？ <a href="#yu-jquery-form-chong-tu-" class="doc-anchor"></a></h3>
			<p>如果项目中同时使用了 <a href="#">jQuery Form</a>，<code>$.fn.selected</code> <strong>有命名冲突</strong>：</p>
			<ul>
				<li><code>2.4.1</code> 以前的版本：请使用 <code>$(&#39;select&#39;).selectIt(options)</code> 替代；</li>
				<li>
					<p><code>2.4.1</code> 及以后版本：</p>
					<p>在 <code>amazeui.js</code> <strong>之后</strong>引入 <code>jquery.form.js</code>，否则 jQuery Form 可能无法正常工作，然后执行以下代码（<a href="#">在线演示</a>）：</p>
					<div class="doc-code demo-highlight">
						<pre>
							<code class="javascript">
<span class="hljs-comment">//重新注册一个jQuery插件</span>
AMUI.plugin(<span class="hljs-string">'mySelected'</span>,AMUI.selected);
<span class="hljs-comment">//初始化插件</span>
$(<span class="hljs-string">'#my-select'</span>).mySelected();
							</code>
						</pre>
					</div>
					<p><strong>或者：</strong></p>
					<p>在 <code>amazeui.js</code> <strong>之前</strong>引入 <code>jquery.form.js</code>，然后按照以下方式调用（<a href="#">演示</a>）：</p>
					<div class="doc-code demo-highlight">
						<pre>
							<code class="javascript">
<span class="hljs-comment">//恢复jQuery Form插件的$.fn.selected，</span>
<span class="hljs-comment">//并把Amaze UI selected重新赋值给$.fn.amSelected</span>
$.fn.amSelected=$.fn.selected.noConflict();
<span class="hljs-comment">//使用 Amaze UI 的selected</span>
$(<span class="hljs-string">'[data-am-selected]'</span>).amSelected();
							</code>
						</pre>
					</div>
				</li>
			</ul>
			<h3 id="codeltselectgtcode-dan-xuan-mo-ren-xuan-ze-di-yi-xiang-de-wen-ti"><code>&lt;select&gt;</code> （单选）默认选择第一项的问题 <a href="#codeltselectgtcode-dan-xuan-mo-ren-xuan-ze-di-yi-xiang-de-wen-ti" class="doc-anchor"></a></h3>
			<p>缺省选中第一个 <code>&lt;option&gt;</code> 是 HTML 规范中 <code>&lt;select&gt;</code> 元素（单选）的默认行为。Selected 遵循了一致的行为，和规范保持一致。</p>
			<p>有用户提出<a href="#">默认不选中第一项的需求</a>，<code>v2.5</code> 增加了这个功能，只需将第一项设置为空的 <code>&lt;option&gt;</code> 即可。</p>
			<div class="doc-example">
				<form>
					<select<%=data[2]%> data-am-selected id="demo-default-selected">
						<option value="" selected="selected">请选择</option>
						<option value="01" label="01 - Proprietary">01 - Proprietary</option>
						<option value="02" label="02 - ISBN-10">02 - ISBN-10</option>
						<option value="03" label="03 - GTIN-13">03 - GTIN-13</option>
						<option value="04" label="04 - UPC">04 - UPC</option>
						<option value="05" label="05 - ISMN-10">05 - ISMN-10</option>
					</select>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="5e0d660c2e6bce57ff306412a3a6ff35" data-title="JS 插件 - Selected|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$("#demo-maxchecked").on("checkedOverflow.selected.amui",function(){
	window.alert("最多选择"+this.getAttribute("maxchecked")+"项");
});
$(function(){
	var e=$("#js-selected"),t=e.find('option[value="o"]'),n=e.find('option[value="m"]'),o=0;
	$("[data-selected]").on("click",function(){
		var s=$(this).data("selected");
		"add"===s&&(e.append('<option value="o'+o+'">动态插入的选项 '+o+"</option>"),o++),"toggle"===s&&t.attr("selected",!t.get(0).selected),"disable"===s&&(n[0].disabled=!n[0].disabled),$.AMUI.support.mutationobserver||e.trigger("changed.selected.amui");
	});
	e.on("change",function(){
		$("#js-selected-info").html(['选中项：<strong class="am-text-danger">',[$(this).find("option").eq(this.selectedIndex).text()],'</strong> 值：<strong class="am-text-warning">',$(this).val(),"</strong>"].join(""));
	});
});
</script>
</body>
</html>