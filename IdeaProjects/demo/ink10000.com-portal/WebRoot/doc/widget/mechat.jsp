<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>Mechat 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="mechat">MeChat <a href="#mechat" class="doc-anchor"></a></h1>
			<hr>
			<p><a href="#">美洽(http://mechat.im/)</a>在线客服模块（右下角的咨询图标）。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#mechat-demo">组件演示</a>
							<ul class="am-collapse"><li><a href="#mechat-demo-default-0">default（默认）</a></li></ul>
						</li>
						<li>
							<a href="#shi-yong-shuo-ming">使用说明</a>
							<ul class="am-collapse">
								<li><a href="#mei-you-mei-qia-zhang-hao-de-yong-hu-">没有美洽帐号的用户：</a></li>
								<li><a href="#yi-you-mei-qia-zhang-hao-de-yong-hu-">已有美洽帐号的用户：</a></li>
							</ul>
						</li>
						<li><a href="#api">API</a></li>
					</ul>
				</div>
			</div>
			<h2 id="mechat-demo">组件演示</h2>
			<h3 id="mechat-demo-default-0">default（默认）</h3>
			<div class="doc-example" data-url="doc/widget/mechat_default_0.jsp"><section class="am-mechat am-mechat-default" data-am-widget="mechat" data-am-mechat-unitid="2538"><div id="mechat"></div></section></div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-shuo-ming">使用说明 <a href="#shi-yong-shuo-ming" class="doc-anchor"></a></h2>
			<p>使用本模块需注册美洽账号并获取帐号ID信息，具体如下。</p>
			<h3 id="mei-you-mei-qia-zhang-hao-de-yong-hu-">没有美洽帐号的用户： <a href="#mei-you-mei-qia-zhang-hao-de-yong-hu-" class="doc-anchor"></a></h3>
			<h4 id="zhu-ce-yong-hu">注册用户 <a href="#zhu-ce-yong-hu" class="doc-anchor"></a></h4>
			<p>用户填写表单并提交，云适配通过接口发送相关数据到美洽平台。</p>
			<h4 id="ti-jiao-fan-hui">提交返回 <a href="#ti-jiao-fan-hui" class="doc-anchor"></a></h4>
			<p>美洽注册成功，返回相应配置，云适配渲染界面，提示添加成功。</p>
			<h3 id="yi-you-mei-qia-zhang-hao-de-yong-hu-">已有美洽帐号的用户： <a href="#yi-you-mei-qia-zhang-hao-de-yong-hu-" class="doc-anchor"></a></h3>
			<h4 id="zhu-ce-yong-hu-1">注册用户 <a href="#zhu-ce-yong-hu-1" class="doc-anchor"></a></h4>
			<p>用户填写表单并提交，云适配通过接口发送相关数据到美洽平台。</p>
			<h4 id="ti-jiao-fan-hui-1">提交返回 <a href="#ti-jiao-fan-hui-1" class="doc-anchor"></a></h4>
			<p>美洽返回相应配置，云适配渲染界面，提示用户输入相应帐号密码。</p>
			<h4 id="zai-ci-ti-jiao">再次提交 <a href="#zai-ci-ti-jiao" class="doc-anchor"></a></h4>
			<p>用户提交，云适配通过接口发送相关数据到美洽平台，美洽返回相应配置， 云适配渲染界面，提示绑定成功。</p>
			<h2 id="api">API <a href="#api" class="doc-anchor"></a></h2>
			<p>API由美洽提供。</p>
			<p>1：注册接口：<a href="#">http://open.mechatim.com/cgi-bin/create/unit2?appid=T4v1KpVM7QOvzxgbQ9</a></p>
			<pre>
功能：邮箱未注册则注册，返回已添加页面配置。已注册则返回密码验证页面配置。
参数{
   unitname:企业名字，
   email:企业邮箱
}
返回{
   errcode:'0' --表示成功，
   unitid:用于生成植入网站JS，
   form:{
      url:'----',
      type:'POST',
      desc:'',
      fields:{}
   }
}
			</pre>
			<p>2：验证接口：<a href="#">http://open.mechatim.com/cgi-bin/check/unit2?appid=T4v1KpVM7QOvzxgbQ9</a></p>
			<pre>
功能：验证密码，正确则返回绑定成功页面配置。
参数：{
   email:企业邮箱,
   password:密码
}
返回{
   errcode:'0'--表示成功，
   unitid: 用于生成植入网站JS，
   form:{
      url:'----',
      type:'POST',
      desc:'',
      fields:{}
   }
}
			</pre>
			<div class="ds-thread" data-thread-key="d7f8fdb50ec4335395ba107d8d500c4e" data-title="Mechat 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>