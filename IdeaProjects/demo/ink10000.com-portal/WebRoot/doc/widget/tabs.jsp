<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Tabs 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="tabs-xuan-xiang-qia">Tabs 选项卡 <a href="#tabs-xuan-xiang-qia" class="doc-anchor"></a></h1>
			<hr>
			<p>选项卡组件。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#tabs-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#tabs-demo-default-0">default（蓝色选项卡）</a></li>
								<li><a href="#tabs-demo-d2-0">d2（下边框选项卡）</a></li>
							</ul>
						</li>
						<li>
							<a href="#shi-yong-fang-fa">使用方法</a>
							<ul class="am-collapse">
								<li><a href="#zhi-jie-shi-yong">直接使用</a></li>
								<li><a href="#shi-yong-handlebars">使用 Handlebars</a></li>
								<li><a href="#yun-gua-pei-webide">云适配 WebIDE</a></li>
							</ul>
						</li>
						<li><a href="#shu-ju-jie-kou">数据接口</a></li>
						<li>
							<a href="#chang-jian-wen-ti">常见问题</a>
							<ul class="am-collapse"><li><a href="#ru-he-jin-yong-hong-kong-cao-zuo-">如何禁用触控操作？</a></li></ul>
						</li>
					</ul>
				</div>
			</div>
			<h2 id="tabs-demo">组件演示</h2>
			<h3 id="tabs-demo-default-0">default（蓝色选项卡）</h3>
			<div class="doc-example" data-url="doc/widget/tabs_default_0.jsp">
				<div class="am-tabs am-tabs-default" data-am-widget="tabs">
					<ul class="am-tabs-nav am-cf">
						<li class="am-active"><a href="[data-tab-panel-0]">青春</a></li>
						<li><a href="[data-tab-panel-1]">彩虹</a></li>
						<li><a href="[data-tab-panel-2]">歌唱</a></li>
					</ul>
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active" data-tab-panel-0>【青春】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。</div>
						<div class="am-tab-panel" data-tab-panel-1>【彩虹】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。</div>
						<div class="am-tab-panel" data-tab-panel-2>【歌唱】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="tabs-demo-d2-0">d2（下边框选项卡）</h3>
			<div class="doc-example" data-url="doc/widget/tabs_d2_0.jsp">
				<div class="am-tabs am-tabs-d2" data-am-widget="tabs">
					<ul class="am-tabs-nav am-cf">
						<li class="am-active"><a href="[data-tab-panel-0]">青春</a></li>
						<li><a href="[data-tab-panel-1]">彩虹</a></li>
						<li><a href="[data-tab-panel-2]">歌唱</a></li>
					</ul>
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active" data-tab-panel-0>【青春】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。</div>
						<div class="am-tab-panel" data-tab-panel-1>【彩虹】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。</div>
						<div class="am-tab-panel" data-tab-panel-2>【歌唱】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。</div>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的内容替换为自己的内容。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>tabs</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="chang-jian-wen-ti">常见问题 <a href="#chang-jian-wen-ti" class="doc-anchor"></a></h2>
			<h3 id="ru-he-jin-yong-hong-kong-cao-zuo-">如何禁用触控操作？ <a href="#ru-he-jin-yong-hong-kong-cao-zuo-" class="doc-anchor"></a></h3>
			<p>在容器上添加 <code>data-am-tabs-noswipe=&quot;1&quot;</code>。</p>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">&quot;am-tabs am-tabs-default&quot;</span> <span class="hljs-attribute">data-am-tabs-noswipe</span>=<span class="hljs-value">&quot;1&quot;</span> <span class="hljs-attribute">data-am-widget</span>=<span class="hljs-value">&quot;tabs&quot;</span>&gt;</span></code></pre></div>
			<div class="ds-thread" data-thread-key="0c2d449afe4b4d59f9724a03bf93799a" data-title="Tabs 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>