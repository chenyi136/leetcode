<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Datepicker|Amaze UI</title>
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
							<a href="#shi-yong-yan-shi">使用演示</a>
							<ul class="am-collapse">
								<li><a href="#ji-ben-xing-shi">基本形式</a></li>
								<li><a href="#jie-he-zu-jian-shi-yong">结合组件使用</a></li>
								<li><a href="#geng-gai-yan-se">更改颜色</a></li>
								<li><a href="#shi-tu-mo-shi">视图模式</a></li>
								<li><a href="#xian-zhi-shi-tu-mo-shi">限制视图模式</a></li>
								<li><a href="#zi-ding-yi-shi-jian">自定义事件</a></li>
								<li><a href="#she-zhi-jin-zhi-xuan-ze-ri-qi">设置禁止选择日期</a></li>
							</ul>
						</li>
						<li>
							<a href="#diao-yong-fang-shi">调用方式</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#yu-yan-kuo-zhan">语言扩展</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="datepicker">Datepicker <a href="#datepicker" class="doc-anchor"></a></h1>
			<hr>
			<p>日期选择插件。<strong>需要时间选择的参见</strong>：<a href="#">DateTimePicker - 日期时间选择插件</a>。</p>
			<p><strong>注意：</strong></p>
			<p>在触控设备上， <code>&lt;input&gt;</code> 获得焦点时会激活键盘，部分浏览器添加 <code>readonly</code> 属性以后可禁止键盘激活。</p>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<h3 id="ji-ben-xing-shi">基本形式 <a href="#ji-ben-xing-shi" class="doc-anchor"></a></h3>
			<p>在 <code>&lt;input&gt;</code> 上增加 <code>.data-am-datepicker</code> 属性，调用日期插件。</p>
			<div class="doc-example">
				<form class="am-form" data-am-validator>
					<p><input type="text" class="am-form-field" readonly="readonly" placeholder="日历组件" data-am-datepicker></p>
					<p><button class="am-btn am-btn-primary">提交</button></p>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="jie-he-zu-jian-shi-yong">结合组件使用 <a href="#jie-he-zu-jian-shi-yong" class="doc-anchor"></a></h3>
			<p>结合 <code>.am-input-group</code> 使用，父类添加 class <code>.am-datepicker-date</code> ，非 <code>&lt;input&gt;</code> 触发元素需增加 <code>.am-datepicker-add-on</code> class。</p>
			<div class="doc-example">
				<div class="am-input-group am-datepicker-date" data-am-datepicker="{format:'dd-mm-yyyy'}">
					<input type="text" class="am-form-field" readonly="readonly" placeholder="日历组件">
					<span class="am-input-group-btn am-datepicker-add-on"><button type="button" class="am-btn am-btn-default"><span class="am-icon-calendar"></span></button></span>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="geng-gai-yan-se">更改颜色 <a href="#geng-gai-yan-se" class="doc-anchor"></a></h3>
			<p>默认为蓝色，设置 <code>theme</code> 选项可改变颜色：</p>
			<ul>
				<li><code>success</code>:绿色</li>
				<li><code>warning</code>:橙色</li>
				<li><code>danger</code>:红色</li>
			</ul>
			<div class="doc-example"><p><input type="text" class="am-form-field" readonly="readonly" placeholder="日历组件" data-am-datepicker="{theme:'success',weekStart:6}"></p></div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="shi-tu-mo-shi">视图模式 <a href="#shi-tu-mo-shi" class="doc-anchor"></a></h3>
			<p>通过参数 <code>viewMode</code> 设置日历初始视图模式：</p>
			<ul>
				<li><code>days</code>:显示天（默认）</li>
				<li><code>months</code>:显示月</li>
				<li><code>years</code>:显示年</li>
			</ul>
			<div class="doc-example">
				<div class="am-input-group am-datepicker-date" data-am-datepicker="{format:'yyyy-mm-dd',viewMode:'years'}">
					<input type="text" class="am-form-field" readonly="readonly" placeholder="日历组件">
					<span class="am-input-group-btn am-datepicker-add-on"><button type="button" class="am-btn am-btn-default"><span class="am-icon-calendar"></span></button></span>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="xian-zhi-shi-tu-mo-shi">限制视图模式 <a href="#xian-zhi-shi-tu-mo-shi" class="doc-anchor"></a></h3>
			<p>设置参数 <code>minViewMode</code> 可以限制视图模式。下面的示例中限制了只能选择到月份：</p>
			<div class="doc-example">
				<div class="am-input-group am-datepicker-date" data-am-datepicker="{format:'yyyy-mm',viewMode:'years',minViewMode:'months'}">
					<input type="text" class="am-form-field" readonly="readonly" placeholder="日历组件">
					<span class="am-input-group-btn am-datepicker-add-on"><button type="button" class="am-btn am-btn-default"><span class="am-icon-calendar"></span></button></span>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p><strong>只能选择年份：</strong></p>
			<p>注意 <code>format:&#39;yyyy &#39;</code> 里面 <code>yyyy</code> 后面多加一个空格。</p>
			<div class="doc-example"><div><input type="text" class="am-form-field" readonly="readonly" placeholder="日历组件" data-am-datepicker="{format:'yyyy ',viewMode:'years',minViewMode:'years'}"></div></div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="zi-ding-yi-shi-jian">自定义事件 <a href="#zi-ding-yi-shi-jian" class="doc-anchor"></a></h3>
			<p>通过监听自定义事件 <code>changeDate</code>，可以在回调函数中进行验证等操作。通过 <code>$().data(&#39;date&#39;)</code> 获取改变后的日期。</p>
			<div class="doc-example">
				<div style="display:none;" class="am-alert am-alert-danger" id="my-alert"><p>开始日期应小于结束日期！</p></div>
				<div class="am-g">
					<div class="am-u-sm-6">
						<button type="button" class="am-margin-right am-btn am-btn-default" id="my-start">开始日期</button>
						<span id="my-startDate">2014-12-20</span>
					</div>
					<div class="am-u-sm-6">
						<button type="button" class="am-margin-right am-btn am-btn-default" id="my-end">结束日期</button>
						<span id="my-endDate">2014-12-25</span>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="she-zhi-jin-zhi-xuan-ze-ri-qi">设置禁止选择日期 <a href="#she-zhi-jin-zhi-xuan-ze-ri-qi" class="doc-anchor"></a></h3>
			<p>初始化的时候通过 <code>onRender</code> 选项设置禁用日期。</p>
			<p><strong><code>v2.5</code></strong>：<code>onRender</code> 方法增加了 <code>viewMode</code> 参数，以便更准确的处理不同视图渲染。</p>
			<p><code>viewMode</code> 内部调用时使用了以下值：</p>
			<ul>
				<li><code>0</code>:天视图</li>
				<li><code>1</code>:月视图</li>
				<li><code>2</code>:年视图</li>
			</ul>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-sm-6">设置禁用日期<br><p><input type="text" class="am-form-field" placeholder="今天之前的日期被禁用" id="my-start-2"></p></div>
					<div class="am-u-sm-6">禁用日期<br><p><input type="text" class="am-form-field" id="my-end-2"></p></div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="diao-yong-fang-shi">调用方式 <a href="#diao-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>添加 <code>data-am-datepicker</code> 属性，并设置相关选项。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">input</span> <span class="hljs-attribute">data-am-datepicker</span>=<span class="hljs-value">"{format:'yyyy-mm'}"</span>&gt;</span></code></pre></div>
			<h4 id="js-diao-yong">JS 调用 <a href="#js-diao-yong" class="doc-anchor"></a></h4>
			<p>通过 <code>$().datepicker(options)</code> 调用。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'#my-datepicker'</span>).datepicker({format:<span class="hljs-string">'yyyy-mm'</span>});</code></pre></div>
			<h4 id="fang-fa-shuo-ming">方法说明 <a href="#fang-fa-shuo-ming" class="doc-anchor"></a></h4>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>方法名称</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>.datepicker('open')</code></td>
						<td>显示日历</td>
					</tr>
					<tr>
						<td><code>.datepicker('close')</code></td>
						<td>隐藏日历</td>
					</tr>
					<tr>
						<td><code>.datepicker('place')</code></td>
						<td>更新调用<code>datepicker</code>的相对位置</td>
					</tr>
					<tr>
						<td><code>.datepicker('setValue', value)</code></td>
						<td>设置<code>Datepicker</code>新值</td>
					</tr>
				</tbody>
			</table>
			<h4 id="xuan-xiang-shuo-ming">选项说明 <a href="#xuan-xiang-shuo-ming" class="doc-anchor"></a></h4>
			<ul>
				<li><code>format</code>:日期格式，默认为 <code>yyyy-mm-dd</code>，可以选择 <code>yy/mm/dd</code> 、<code>mm/dd</code>、<code>dd/mm/yyyy</code>、<code>dd/mm/yy</code>、<code>dd/mm</code>等，中间分隔符可以使用 <code>/</code>、<code>-</code>、<code></code>。</li>
				<li><code>viewMode</code>:日期选择器初始视图模式，<code>string</code>|<code>integer</code>， 默认为 0，可选值 <code>days</code>、<code>months</code>、<code>years</code>或者对应的 <code>0</code>、<code>1</code>、<code>2</code>。</li>
				<li><code>minViewMode</code>:日期选择器初始视图模式限制，<code>string</code>|<code>integer</code>， 默认为 <code>0</code>，可选值<code>days</code>、<code>months</code>、<code>years</code>或者对应的 <code>0</code>、<code>1</code>、<code>2</code>。</li>
				<li><code>onRender</code>:渲染日历时调用的函数，比如 <code>.am-disabled</code> 设置禁用日期。</li>
				<li><code>theme</code>:设置日期颜色主题，可选值为 <code>success</code>、<code>danger</code>、<code>warning</code>，对应为绿色、红色、橙色，默认为蓝色。</li>
				<li><code>locale</code>:语言设置, 可选值为 <code>zh_CN</code>、<code>en_US</code>，默认为中文。</li>
				<li><code>autoClose</code>:日期选定以后是否自动关闭日期选择器, 默认为 <code>true</code> (仅在 <code>days</code> 视图有效)。</li>
			</ul>
			<p>设置 <code>viewMode</code> 和 <code>minViewMode</code> 需要注意日期格式 <code>format</code> 的设置。</p>
			<h4 id="shi-jian-shuo-ming">事件说明 <a href="#shi-jian-shuo-ming" class="doc-anchor"></a></h4>
			<p>选择日期时，通过查看控制台选择的日期。</p>
			<div class="doc-example"><p><input type="text" class="am-form-field" placeholder="日历组件" id="doc-datepicker"></p></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<table class="am-table am-table-bd am-table-striped">
				<thead>
					<tr>
						<th>事件名称</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>changeDate.datepicker.amui</code></td>
						<td>日期改变时触发</td>
					</tr>
				</tbody>
			</table>
			<h3 id="yu-yan-kuo-zhan">语言扩展 <a href="#yu-yan-kuo-zhan" class="doc-anchor"></a></h3>
			<p>内置英语和简体中文支持，默认为中文，要支持更多语言可以通过 <code>Datepicker.locales</code> 扩展。</p>
			<p><strong>设置语言：</strong></p>
			<div class="doc-example"><p><input type="text" class="am-form-field" readonly="readonly" placeholder="YYYY-MM-DD" data-am-datepicker="{locale:'en_US'}"></p></div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p><strong>扩展语言：</strong></p>
			<div class="doc-example"><p><input type="text" class="am-form-field" readonly="readonly" placeholder="来一丢丢 French" data-am-datepicker="{locale:'fr',autoClose:0}"></p></div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="ef3a2fe05cc8c9266f65735dfb90f9b9" data-title="JS 插件 - Datepicker|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	var e=new Date(2014,11,20),t=new Date(2014,11,25),a=$("#my-alert");
	$("#my-start").datepicker().on("changeDate.datepicker.amui",function(d){
		d.date.valueOf()>t.valueOf()?a.find("p").text("开始日期应小于结束日期！").end().show():(a.hide(),e=new Date(d.date),$("#my-startDate").text($("#my-start").data("date")));
		$(this).datepicker("close");
	});
	$("#my-end").datepicker().on("changeDate.datepicker.amui",function(d){
		d.date.valueOf()<e.valueOf()?a.find("p").text("结束日期应大于开始日期！").end().show():(a.hide(),t=new Date(d.date),$("#my-endDate").text($("#my-end").data("date")));
		$(this).datepicker("close");
	});
});
$(function(){
	var e=new Date,a=new Date(e.getFullYear(),e.getMonth(),e.getDate(),0,0,0,0).valueOf();
	var t=new Date(e.getFullYear(),e.getMonth(),1,0,0,0,0).valueOf();
	var n=new Date(e.getFullYear(),0,1,0,0,0,0).valueOf(),u=$("#my-start-2");
	var l=null;
	l=u.datepicker({
	onRender:function(e,u){
		var l=a;
		switch(u){
			case 1:l=t;break;
			case 2:l=n;
		}
		return e.valueOf()<l?"am-disabled":"";
		}
	}).on("changeDate.datepicker.amui",function(e){
		if(e.date.valueOf()>r.date.valueOf()){
			var a=new Date(e.date);
			a.setDate(a.getDate()+1),r.setValue(a);
		}
		l.close(),$("#my-end-2")[0].focus();
	}).data("amui.datepicker");
	r=$("#my-end-2").datepicker({
		onRender:function(e,a){
			var t=l.date,n=t.valueOf(),u=new Date(t.getFullYear(),t.getMonth(),1,0,0,0,0).valueOf(),r=new Date(t.getFullYear(),0,1,0,0,0,0).valueOf();
			var c=n;
			switch(a){
				case 1:c=u;break;
				case 2:c=r;
			}
			return e.valueOf()<=c?"am-disabled":"";
		}
	}).on("changeDate.datepicker.amui",function(e){
		r.close();
	}).data("amui.datepicker");
	$("#doc-datepicker").datepicker().on("changeDate.datepicker.amui",function(e){
		console.log(e.date);
	});
});
!function(e){
	e.AMUI&&e.AMUI.datepicker&&(e.AMUI.datepicker.locales.fr={days:["Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi"],daysShort:["Dim","Lun","Mar","Mer","Jeu","Ven","Sam"],daysMin:["D","L","Ma","Me","J","V","S"],months:["Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre"],monthsShort:["Jan","Fev","Mar","Avr","Mai","Jui","Jul","Aou","Sep","Oct","Nov","Dec"],weekStart:1});
}(window.jQuery);
</script>
</body>
</html>