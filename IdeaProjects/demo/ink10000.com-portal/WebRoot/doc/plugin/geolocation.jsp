<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Geolocation|Amaze UI</title>
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
							<a href="#html5-api-jian-jie">HTML5 API 简介</a>
							<ul class="am-collapse">
								<li><a href="#huo-qu-wei-zhi-cheng-gong-shi-chu-li-han-shu-de-can-shu">获取位置成功时处理函数的参数</a></li>
								<li><a href="#fa-sheng-cuo-wu-shi-fan-hui-positionerror-dui-xiang">发生错误时返回 PositionError 对象</a></li>
								<li><a href="#xuan-xiang">选项</a></li>
							</ul>
						</li>
						<li><a href="#amaze-ui-feng-zhuang-de-geolocation">Amaze UI 封装的 Geolocation</a></li>
						<li>
							<a href="#shi-yong-shi-li">使用示例</a>
							<ul class="am-collapse">
								<li><a href="#huo-qu-dang-qian-wei-zhi-bing-zai-bai-du-di-tu-shang-xian-shi">获取当前位置并在百度地图上显示</a></li>
								<li><a href="#jian-shi-wei-zhi-bian-hua">监视位置变化</a></li>
							</ul>
						</li>
						<li><a href="#can-kao-lian-jie">参考链接</a></li>
					</ul>
				</div>
			</div>
			<h1 id="geolocation">Geolocation <a href="#geolocation" class="doc-anchor"></a></h1>
			<hr>
			<p>HTML5 Geolocation 封装。</p>
			<h2 id="html5-api-jian-jie">HTML5 API 简介 <a href="#html5-api-jian-jie" class="doc-anchor"></a></h2>
			<p><code>navigator.geolocation</code> 对象有以下方法：</p>
			<pre>
//获取当前位置
.getCurrentPosition(successCallback,[[errorCallback,]options]);
//监视位置变化
.watchPosition(successCallback,[[errorCallback,]options]);
//清除监视
.clearWatch(watchId);
			</pre>
			<p>前两个方法的成功回调函数 <code>successCallback</code> 必需。</p>
			<h3 id="huo-qu-wei-zhi-cheng-gong-shi-chu-li-han-shu-de-can-shu">获取位置成功时处理函数的参数 <a href="#huo-qu-wei-zhi-cheng-gong-shi-chu-li-han-shu-de-can-shu" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight"><pre><code class="javascript"><span class="hljs-keyword">var</span> successCallback=<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">position</span>)</span>{};</code></pre></div>
			<p>获取位置成功时返回一个位置对象，可以在成功回调函数中调用：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
{
   coords:{
      latitude:,<span class="hljs-comment">//维度</span>
      longitude:,<span class="hljs-comment">//经度</span>
      altitude:,<span class="hljs-comment">//海拔</span>
      accuracy:,<span class="hljs-comment">//精确度</span>
      altitudeAccuracy:,<span class="hljs-comment">//海拔精确度</span>
      heading:,<span class="hljs-comment">//设备正北顺时针前进的方位</span>
      speed:<span class="hljs-string">''</span><span class="hljs-comment">//设备外部环境的移动速度（m/s）</span>
   }
   timestamp:<span class="hljs-string">''</span><span class="hljs-comment">//获得位置的时间戳</span>
}
					</code>
				</pre>
			</div>
			<h3 id="fa-sheng-cuo-wu-shi-fan-hui-positionerror-dui-xiang">发生错误时返回 PositionError 对象 <a href="#fa-sheng-cuo-wu-shi-fan-hui-positionerror-dui-xiang" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
{
   code:<span class="hljs-number">2</span>
   message:<span class="hljs-string">""</span>
}
<span class="hljs-comment">//PERMISSION_DENIED=1;</span>
<span class="hljs-comment">//POSITION_UNAVAILABLE=2;</span>
<span class="hljs-comment">//TIMEOUT=3;</span>
					</code>
				</pre>
			</div>
			<h3 id="xuan-xiang">选项 <a href="#xuan-xiang" class="doc-anchor"></a></h3>
			<ul>
				<li><code>enableHighAccuracy</code>:是否启用高精度，<code>Boolean</code>，默认为 <code>false</code>，开启以后响应时间会变长，在移动设备上会消耗更多流量；</li>
				<li><code>timeout</code>:响应超时时间（毫秒），默认为 <code>0</code>，即不限制时长；</li>
				<li><code>maximumAge</code>:缓存时间（毫秒），默认为 <code>0</code>，即不混存，每次都重新获取。</li>
			</ul>
			<h2 id="amaze-ui-feng-zhuang-de-geolocation">Amaze UI 封装的 Geolocation <a href="#amaze-ui-feng-zhuang-de-geolocation" class="doc-anchor"></a></h2>
			<p>通过 <code>jQuery.AMUI.Geolocation</code> 可以访问 Amaze UI 封装的 Geolocation 构造函数：</p>
			<div class="doc-code demo-highlight"><pre><code class="javascript"><span class="hljs-keyword">var</span> geo=<span class="hljs-keyword">new</span> jQuery.AMUI.Geolocation();</code></pre></div>
			<p>可以将上述 <code>enableHighAccuracy</code>、<code>timeout</code>、<code>maximumAge</code> 三个选项传递给构造函数。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">var</span> geo=<span class="hljs-keyword">new</span> jQuery.AMUI.Geolocation({
   enableHighAccuracy:<span class="hljs-literal">true</span>,
   timeout:<span class="hljs-number">5000</span>,
   maximumAge:<span class="hljs-number">60000</span>
});
					</code>
				</pre>
			</div>
			<p>Geolocation 实例有三个方法：</p>
			<ul>
				<li>
					<p><strong><code>.get(options)</code></strong>：</p>
					<ul>
						<li>对应原生 API 的 <code>getCurrentPosition()</code> 方法；</li>
						<li><code>options</code> 选项同上，这里设置的选项会覆盖该实例的选项；</li>
						<li>返回一个<a href="#">jQuery 延迟 Promise 对象</a>。</li>
					</ul>
					<div class="doc-code demo-highlight">
						<pre>
							<code class="javascript">
<span class="hljs-keyword">var</span> geo=<span class="hljs-keyword">new</span> jQuery.AMUI.Geolocation({
   enableHighAccuracy:<span class="hljs-literal">true</span>,
   timeout:<span class="hljs-number">5000</span>,
   maximumAge:<span class="hljs-number">60000</span>
});
geo.get().then(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">position</span>)</span>{
   <span class="hljs-comment">//成功回调，position为返回的位置对象</span>
},<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">err</span>)</span>{
   <span class="hljs-comment">//不支持或者发生错误时回调，err为错误提示信息</span>
});
							</code>
						</pre>
					</div>
				</li>
				<li>
					<p><strong><code>.watch(options)</code></strong>：</p>
					<ul>
						<li>对应原生 API 的 <code>getCurrentPosition()</code> 方法；</li>
						<li><code>options</code> 除三个选项以外，还必须通过 <code>options.done</code> 设置成功时的回调函数（失败回调 <code>options.fail</code> 可选）；</li>
						<li>返回 <code>watchID</code>；</li>
						<li><strong>出于电量、流量消耗等考虑，不建议在移动设备上使用此方法</strong>。</li>
					</ul>
					<div class="doc-code demo-highlight">
						<pre>
							<code class="javascript">
<span class="hljs-keyword">var</span> geo=<span class="hljs-keyword">new</span> jQuery.AMUI.Geolocation({
   enableHighAccuracy:<span class="hljs-literal">true</span>,
   timeout:<span class="hljs-number">5000</span>,
   maximumAge:<span class="hljs-number">60000</span>
});
geo.watch({
   done:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">position</span>)</span>{
      <span class="hljs-comment">// 成功回调，position 为返回的位置对象</span>
   },
   fail:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">err</span>)</span>{
      <span class="hljs-comment">// 不支持或者发生错误时回调，err 为错误提示信息</span>
   }
});
							</code>
						</pre>
					</div>
				</li>
				<li><p><code>.clearWatch()</code>：清除当前实例的 <code>watchID</code>。</p></li>
			</ul>
			<h2 id="shi-yong-shi-li">使用示例 <a href="#shi-yong-shi-li" class="doc-anchor"></a></h2>
			<p><strong>使用 Mac 的用户请使用 Safari 浏览器查看</strong>，其他浏览器可能由于安全性和隐私设置无法使用定位服务。</p>
			<h3 id="huo-qu-dang-qian-wei-zhi-bing-zai-bai-du-di-tu-shang-xian-shi">获取当前位置并在百度地图上显示 <a href="#huo-qu-dang-qian-wei-zhi-bing-zai-bai-du-di-tu-shang-xian-shi" class="doc-anchor"></a></h3>
			<div class="doc-example"><div style="width:100%;height:400px;" id="doc-geo-demo"></div></div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h3 id="jian-shi-wei-zhi-bian-hua">监视位置变化 <a href="#jian-shi-wei-zhi-bian-hua" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<button type="button" class="am-btn am-btn-primary" id="doc-geo-watch">开始监视位置</button>
				<button type="button" class="am-btn am-btn-warning" id="doc-geo-clear">清除监视</button>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="can-kao-lian-jie">参考链接 <a href="#can-kao-lian-jie" class="doc-anchor"></a></h2>
			<ul>
				<li><a href="#">W3C Geolocation API Specification</a></li>
				<li><a href="#">MDN - Geolocation</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="960d0cf666b097cdecdcb0ca3c4c8f37" data-title="JS 插件 - Geolocation|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=WVAXZ05oyNRXS5egLImmentg"></script>
<script type="text/javascript">
$(function(){
	var o=new $.AMUI.Geolocation,n=$("#doc-geo-demo");
	o.get({timeout:7e3}).then(
	function(o){
		var n="你的位置：\n	纬度 "+o.coords.latitude+"，\n	经度 "+o.coords.longitude+"，\n	精确度 "+o.coords.accuracy,c=new BMap.Map("doc-geo-demo"),e=new BMap.Point(o.coords.longitude,o.coords.latitude);
		c.centerAndZoom(e,15),c.addControl(new BMap.MapTypeControl),c.enableScrollWheelZoom(!0);
		var t=new BMap.Marker(e);
		c.addOverlay(t),t.setAnimation(BMAP_ANIMATION_BOUNCE),c.panTo(e);
		t.addEventListener("click",function(){
			alert(n);
		});
	},function(o){
		n.html("获取地理位置时发生错误，错误信息：<br>"+o),console.log(o);
	});
	var c=$("#doc-geo-watch"),e=$("#doc-geo-clear");
	c.on("click",function(){
		alert("开始监控，请打开控制台查看。");
		o.watch({
			done:function(n){
				console.log("watchID:"+o.watchID),console.log("你的位置：\n	纬度 "+n.coords.latitude+"，\n	经度 "+n.coords.longitude);
			},
			fail:function(o){
				console.log(o);
			}
		});
	});
	e.on("click",function(){
		o.clearWatch(),console.log("watchID:"+o.watchID);
	});
});
</script>
</body>
</html>