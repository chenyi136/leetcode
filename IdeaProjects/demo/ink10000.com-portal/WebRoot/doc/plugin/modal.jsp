<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Modal|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
<style type="text/css">
.confirm-list i{
	position:absolute;
	top:12px;
	right:0;
	width:32px;
	text-align:center;
	color:#888;
	cursor:pointer;
}
.confirm-list i:hover{
	color:#555;
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
								<li><a href="#ji-ben-xing-shi">基本形式</a></li>
								<li><a href="#mo-ni-alert">模拟 Alert</a></li>
								<li><a href="#mo-ni-confirm">模拟 Confirm</a></li>
								<li><a href="#mo-ni-prompt">模拟 Prompt</a></li>
								<li><a href="#modal-loading">Modal Loading</a></li>
								<li><a href="#actions">Actions</a></li>
								<li><a href="#popup">Popup</a></li>
							</ul>
						</li>
						<li>
							<a href="#shi-yong-fang-shi">使用方式</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#tong-guo-js">通过 JS</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="modal">Modal <a href="#modal" class="doc-anchor"></a></h1>
			<hr>
			<p>Modal 交互窗口，可以用来模拟浏览器的 <code>alert</code>、<code>confirm</code>、<code>prompt</code> 窗口。</p>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<p>使用过程中需按示例代码组织好 HTML。</p>
			<h3 id="ji-ben-xing-shi">基本形式 <a href="#ji-ben-xing-shi" class="doc-anchor"></a></h3>
			<p>此 Demo 设置了 <code>closeViaDimmer</code>、<code>width</code>、<code>height</code> 参数。</p>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-primary" data-am-modal="{target:'#doc-modal-1',closeViaDimmer:0,width:400,height:225}">Modal</button>
				<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
					<div class="am-modal-dialog">
						<div class="am-modal-hd">Modal 标题 <a href="javascript:;" class="am-close am-close-spin" data-am-modal-close>&times;</a></div>
						<div class="am-modal-bd">Modal 内容。本 Modal 无法通过遮罩层关闭。</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="mo-ni-alert">模拟 Alert <a href="#mo-ni-alert" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-primary" data-am-modal="{target:'#my-alert'}">Alert</button>
				<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
					<div class="am-modal-dialog">
						<div class="am-modal-hd">Amaze UI</div>
						<div class="am-modal-bd">Hello world！</div>
						<div class="am-modal-footer"><span class="am-modal-btn am-modal-btn-bold">确定</span></div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="mo-ni-confirm">模拟 Confirm <a href="#mo-ni-confirm" class="doc-anchor"></a></h3>
			<p>点击列表右边的 <code>x</code> 查看效果。</p>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-warning" id="doc-confirm-toggle">Confirm</button>
				<ul class="am-list confirm-list" id="doc-modal-list">
					<li>
						<a href="#" data-id="1">每个人都有一个死角， 自己走不出来，别人也闯不进去。</a>
						<i class="am-icon-close"></i>
					</li>
					<li>
						<a href="#" data-id="2">我把最深沉的秘密放在那里。</a>
						<i class="am-icon-close"></i>
					</li>
					<li>
						<a href="#" data-id="3">你不懂我，我不怪你。</a>
						<i class="am-icon-close"></i>
					</li>
					<li>
						<a href="#" data-id="4">每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</a>
						<i class="am-icon-close"></i>
					</li>
				</ul>
				<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
					<div class="am-modal-dialog">
						<div class="am-modal-hd">Amaze UI</div>
						<div class="am-modal-bd">你，确定要删除这条记录吗？</div>
						<div class="am-modal-footer">
							<span class="am-modal-btn" data-am-modal-cancel>取消</span>
							<span class="am-modal-btn" data-am-modal-confirm>确定</span>
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<p><strong>存在问题：</strong></p>
			<p>出于性能考虑，每个 Modal 实例都存储在对应元素的 <code>$(&#39;.am-modal&#39;).data(&#39;am.modal&#39;)</code> 属性中，<code>onConfirm</code>/<code>onCancel</code> 会保存第一次运行 Modal 时候的数据，导致在某些场景不能按照预期工作（<a href="#">#274</a>）。<code>2.1</code> 中做了一些处理，但并不是很如意，大家有更好的方案可以提供给我们。</p>
			<p>可以选择的处理方式：</p>
			<ul>
				<li><strong>法一</strong>：通过 <code>relatedTarget</code> 这个钩子获取数据，如上面的演示，以该元素为桥梁获取想要的数据（<strong>2.1 开始支持</strong>）；</li>
				<li>法二：按照<a href="#"><strong>这种方式</strong></a> 每次都重新给这两个参数赋值；</li>
				<li>法三：Confirm 关闭后移除暂存的实例，再次调用时重新初始化；</li>
			</ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-string">'#your-confirm'</span>).on(<span class="hljs-string">'closed.modal.amui'</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   $(<span class="hljs-keyword">this</span>).removeData(<span class="hljs-string">'amui.modal'</span>);
});
					</code>
				</pre>
			</div>
			<ul><li>法四： 重写 <code>cancel</code>/<code>confirm</code> 按钮的事件处理函数。</li></ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-keyword">var</span> $confirm=$(<span class="hljs-string">'#your-confirm'</span>);
   <span class="hljs-keyword">var</span> $confirmBtn=$confirm.find(<span class="hljs-string">'[data-am-modal-confirm]'</span>);
   <span class="hljs-keyword">var</span> $cancelBtn=$confirm.find(<span class="hljs-string">'[data-am-modal-cancel]'</span>);
   $confirmBtn.off(<span class="hljs-string">'click.confirm.modal.amui'</span>).on(<span class="hljs-string">'click'</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
      <span class="hljs-comment">//do something</span>
   });
   $cancelBtn.off(<span class="hljs-string">'click.cancel.modal.amui'</span>).on(<span class="hljs-string">'click'</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
      <span class="hljs-comment">// do something</span>
   });
});
					</code>
				</pre>
			</div>
			<p>法二、三以牺牲性能为代价，<strong>不推荐</strong>；如果要使用法四，可以不添加两个按钮的 <code>data-am-modal-xx</code> 属性，免去解绑默认事件的步奏。</p>
			<h3 id="mo-ni-prompt">模拟 Prompt <a href="#mo-ni-prompt" class="doc-anchor"></a></h3>
			<p>Prompt 从 <code>2.1</code> 开始支持多个输入框，输入框的值通过参数 <code>options.data</code> 获取：</p>
			<ul>
				<li>只有一个输入框时，<code>options.data</code> 为字符串；</li>
				<li>多个输入框时，<code>options.data</code> 为数组。</li>
			</ul>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-success" id="doc-prompt-toggle">Prompt</button>
				<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
					<div class="am-modal-dialog">
						<div class="am-modal-hd">Amaze UI</div>
						<div class="am-modal-bd">来来来，吐槽点啥吧 <input type="text" class="am-modal-prompt-input"></div>
						<div class="am-modal-footer">
							<span class="am-modal-btn" data-am-modal-cancel>取消</span>
							<span class="am-modal-btn" data-am-modal-confirm>提交</span>
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h3 id="modal-loading">Modal Loading <a href="#modal-loading" class="doc-anchor"></a></h3>
			<p>采纳网友意见，Loading 窗口只能通过 JS 关闭。</p>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-success" data-am-modal="{target:'#my-modal-loading'}">Modal Loading</button>
				<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
					<div class="am-modal-dialog">
						<div class="am-modal-hd">正在载入...</div>
						<div class="am-modal-bd"><span class="am-icon-spinner am-icon-spin"></span></div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="actions">Actions <a href="#actions" class="doc-anchor"></a></h3>
			<p>结合 <a href="doc/css/list.jsp">List 组件</a>使用，创建类似 iOS 的操作列表。</p>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-secondary" data-am-modal="{target:'#my-actions'}">Actions</button>
				<div class="am-modal-actions" id="my-actions">
					<div class="am-modal-actions-group">
						<ul class="am-list">
							<li class="am-modal-actions-header">你想整哪样？你想整哪样？你想整哪样？你想整哪样？你想整哪样？你想整哪样？你想整哪样？</li>
							<li><a href="#"><span class="am-icon-wechat"></span> 分享到微信</a></li>
							<li><a href="#"><i class="am-icon-mobile"></i> 短信分享</a></li>
							<li class="am-modal-actions-danger"><a href="#"><i class="am-icon-twitter"></i> 分享到 XX 萎跛</a></li>
						</ul>
					</div>
					<div class="am-modal-actions-group"><button class="am-btn am-btn-block am-btn-secondary" data-am-modal-close>取消</button></div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="popup">Popup <a href="#popup" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-danger" data-am-modal="{target:'#my-popup'}">Popup</button>
				<div class="am-popup" id="my-popup">
					<div class="am-popup-inner">
						<div class="am-popup-hd">
							<h4 class="am-popup-title">标题 - 女爵</h4>
							<span class="am-close" data-am-modal-close>&times;</span>
						</div>
						<div class="am-popup-bd">
							<p>为你封了国境<br>为你赦了罪<br>为你撤了历史记载<br>为你涂了装扮<br>为你喝了醉<br>为你建了城池围墙<br>一颗热的心穿着冰冷外衣<br>一张白的脸漆上多少褪色的情节<br>在我的空虚身体里面<br>爱上哪个肤浅的王位<br>在你的空虚宝座里面<br>爱过什麽女爵的滋味<br>为你封了国境</p>
							<p>为你赦了罪<br>为你撤了历史记载<br>一颗热的心<br>穿着冰冷外衣<br>一张白的脸<br>漆上多少褪色的情节<br>在我的空虚身体里面<br>爱上哪个肤浅的王位<br>在你的空虚宝座里面<br>爱过什麽女爵的滋味<br>在我的空虚身体里面<br>爱上哪个肤浅的王位<br>在你的空虚宝座里面<br>爱过什麽女爵的滋味</p>
						</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-shi">使用方式 <a href="#shi-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>在 <code>&lt;button&gt;</code>、<code>&lt;a&gt;</code> 等元素上添加 <code>data-am-modal='{target:&#39;#my-modal&#39;}'</code>，其中 <code>#my-modal</code> 为 Modal 窗口容器 ID。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">button</span><span class="hljs-attribute">type</span>=<span class="hljs-value">"button"</span><span class="hljs-attribute"> data-am-modal</span>=<span class="hljs-value">"{target:'#my-modal'}"</span>&gt;</span>My Modal<span class="hljs-tag">&lt;/<span class="hljs-title">button</span>&gt;</span></code></pre></div>
			<h3 id="tong-guo-js">通过 JS <a href="#tong-guo-js" class="doc-anchor"></a></h3>
			<p>组织好 Modal HTML 以后，可以通过 Javascript 调用。</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript">$(<span class="hljs-string">'#your-modal'</span>).modal(options);</code></pre></div>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-primary js-modal-open">打开 Modal</button>
				<button type="button" class="am-btn am-btn-secondary js-modal-close">关闭 Modal</button>
				<button type="button" class="am-btn am-btn-danger js-modal-toggle">Toggle Modal</button>
				<div class="am-modal am-modal-no-btn" tabindex="-1" id="your-modal">
					<div class="am-modal-dialog">
						<div class="am-modal-hd">Modal 标题 <a href="javascript:;" class="am-close am-close-spin" data-am-modal-close>&times;</a></div>
						<div class="am-modal-bd">Modal 内容。</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h4 id="can-shu-shuo-ming">参数说明 <a href="#can-shu-shuo-ming" class="doc-anchor"></a></h4>
			<table class="am-table am-table-bordered am-table-striped">
				<thead>
					<tr>
						<th>参数</th>
						<th>类型</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>onConfirm</code></td>
						<td><code>function</code></td>
						<td>具有 <code>data-am-modal-confirm</code> 属性的按钮关闭时触发的函数</td>
					</tr>
					<tr>
						<td><code>closeOnConfirm</code></td>
						<td><code>bool</code></td>
						<td>具有 <code>data-am-modal-confirm</code> 属性的按钮点击时是否关闭 Modal，默认为 <code>true</code>（<strong>v2.4.1 新增</strong>）</td>
					</tr>
					<tr>
						<td><code>onCancel</code></td>
						<td><code>function</code></td>
						<td>具有 <code>data-am-modal-cancel</code> 属性的按钮关闭时触发的函数</td>
					</tr>
					<tr>
						<td><code>closeOnCancel</code></td>
						<td><code>bool</code></td>
						<td>具有 <code>data-am-modal-cancel</code> 属性的按钮点击时是否关闭 Modal，默认为 <code>true</code>（<strong>v2.4.1 新增</strong>）</td>
					</tr>
					<tr>
						<td><code>closeViaDimmer</code></td>
						<td><code>bool</code></td>
						<td>点击遮罩层时关闭 Modal，默认为 <code>true</code></td>
					</tr>
					<tr>
						<td><code>width</code></td>
						<td><code>number</code></td>
						<td>Modal 宽度，对 Popup 和 Actions 无效</td>
					</tr>
					<tr>
						<td><code>height</code></td>
						<td><code>number</code></td>
						<td>Modal 高度，对 Popup 和 Actions 无效</td>
					</tr>
					<tr>
						<td><code>dimmer</code></td>
						<td><code>bool</code></td>
						<td>是否显示 Modal 遮罩背景，默认为 <code>true</code> (<strong>v2.5</strong>)</td>
					</tr>
				</tbody>
			</table>
			<p><strong>注意：</strong></p>
			<ul>
				<li><strong>如无必要，请不要设置 <code>width</code>、<code>height</code>，以免破坏响应式样式。</strong></li>
				<li><code>onConfirm</code>/<code>onCanel</code> 函数中 <code>this</code> 指向 Modal 实例，可以通过 <code>this.</code> 访问实例的方法和属性。</li>
			</ul>
			<h4 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h4>
			<ul>
				<li><code>.modal(options)</code> - 激活元素的 Modal 窗口交互，<code>options</code> 为对象</li>
				<li><code>.modal(&#39;toggle&#39;)</code> - 交替 Modal 窗口状态</li>
				<li><code>.modal(&#39;open&#39;)</code> - 显示 Modal 窗口</li>
				<li><code>.modal(&#39;close&#39;)</code> - 关闭 Modal 窗口</li>
			</ul>
			<h4 id="zi-ding-yi-shi-jian">自定义事件 <a href="#zi-ding-yi-shi-jian" class="doc-anchor"></a></h4>
			<p>自定义事件在弹窗上触发，可以监听弹窗元素来执行其他操作。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-string">'#doc-modal-1'</span>).on(<span class="hljs-string">'open.modal.amui'</span>,<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-built_in">console</span>.log(<span class="hljs-string">'第一个演示弹窗打开了'</span>);
});
					</code>
				</pre>
			</div>
			<p>拷贝上面的代码粘贴到控制台执行，然后每次打开第一个演示弹窗（标题 <code>1.1</code> 下面的），控制台都会输出那行文字。</p>
			<table class="am-table am-table-bordered am-table-striped">
				<thead>
					<tr>
						<th>事件名称</th>
						<th>描述</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><code>open.modal.amui</code></td>
						<td><code>open</code> 方法被调用是立即触发</td>
					</tr>
					<tr>
						<td><code>opened.modal.amui</code></td>
						<td>Modal 窗口打开完成以后触发（CSS 动画执行完成）</td>
					</tr>
					<tr>
						<td><code>close.modal.amui</code></td>
						<td><code>close</code> 方法被调用是立即触发</td>
					</tr>
					<tr>
						<td><code>closed.modal.amui</code></td>
						<td>Modal 窗口完全关闭以后触发（CSS 动画执行完成）</td>
					</tr>
				</tbody>
			</table>
			<div class="ds-thread" data-thread-key="38968a0646e7b96d0e56686a436ec1d0" data-title="JS 插件 - Modal|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	var a=$("#your-modal");
	$("#doc-modal-list").find(".am-icon-close").add("#doc-confirm-toggle").on("click",function(){
		$("#my-confirm").modal({
			relatedTarget:this,
			onConfirm:function(n){
				var o=$(this.relatedTarget).prev("a"),t=o.length?"你要删除的链接 ID 为 "+o.data("id"):"确定了，但不知道要整哪样";
				window.alert(t);
			},
			onCancel:function(n){
				window.alert("算求，不弄了");
			}
		});
	});
	$("#doc-prompt-toggle").on("click",function(){
		$("#my-prompt").modal({
			relatedTarget:this,
			onConfirm:function(n){
				window.alert("你输入的是："+n.data||"");
			},onCancel:function(n){
				window.alert("不想说!");
			}
		});
	});
	a.siblings(".am-btn").on("click",function(o){
		var l=$(o.target);
		l.hasClass("js-modal-open")?a.modal():l.hasClass("js-modal-close")?a.modal("close"):a.modal("toggle");
	});
	$(document).on("open.modal.amui opened.modal.amui close.modal.amui closed.modal.amui",function(o){
		console.log("#"+$(o.target).attr("id")+" 触发了 "+o.type+" 事件");
	});
});
</script>
</body>
</html>