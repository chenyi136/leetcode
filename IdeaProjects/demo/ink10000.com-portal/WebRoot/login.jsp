<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
</head>
<body>
<div style="padding-top:20px;text-align:center;" class="am-g">
	<h1 style="font-size:36px;">${SITE}</h1>
	<p style="font-size:18px;">多项目全站式统一运营平台</p>
</div>
<hr>
<div class="am-g">
	<div class="am-u-sm-centered am-u-md-6 am-u-lg-4">
		<div class="am-btn-group">
			<a href="#" class="am-btn am-btn-sm am-btn-secondary am-icon-sm <%=icon("qq")%>"> QQ</a>
			<a href="#" class="am-btn am-btn-sm am-btn-success am-icon-sm <%=icon("weixin")%>"> 微信</a>
			<a href="#" class="am-btn am-btn-sm am-btn-primary am-icon-sm <%=icon("weibo")%>"> 微博</a>
		</div>
		<form class="am-form" action="login.htm" method="post">
			<input type="text" class="am-margin-top-sm" value="${username}" required="required" maxlength="40" placeholder="请输入注册账号" name="username">
			<input type="password" class="am-margin-top-sm" value="${password}" required="required" maxlength="20" placeholder="请输入登录密码" name="password">
			<div class="am-margin-top-sm">
				<div class="am-u-sm-6 am-padding-horizontal-0"><input type="text" value="1111" required="required" maxlength="4" placeholder="请输入验证码" name="captcha"></div>
				<div class="am-u-sm-2 am-padding-horizontal-0"><img src="global/captcha.htm?item=4&size=36" style="width:100%;cursor:pointer;" title="点击刷新" onclick="javascript:this.src='global/captcha.htm?item=4&size=36&now='+new Date().getTime();"></div>
				<div class="am-u-sm-4"><label class="am-margin-bottom-01 am-checkbox"><input type="checkbox" value="1" checked="checked" data-am-ucheck name="remember"> 记住密码</label></div>
			</div>
			<div class="am-cf">
				<div class="am-u-sm-4 am-margin-top-sm am-padding-horizontal-0"><button type="submit" class="am-btn am-btn-md am-btn-primary am-btn-block">登录系统</button></div>
				<div class="am-u-sm-4">&nbsp;</div>
				<div class="am-u-sm-4 am-margin-top-xs am-padding-horizontal-0"><a href="<%=Global.CLOUD%>" class="am-btn am-btn-md am-btn-default am-btn-block" target="_blank">忘记密码 ^_^?</a></div>
			</div>
		</form>
		<hr>
		<p>© 2017 <a href="<%=Global.CLOUD%>about.htm">${SITE}</a>, Co.ltd.</p>
	</div>
</div>
<div class="am-modal am-modal-alert">
	<div class="am-modal-dialog">
		<div class="am-modal-hd"><i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd">${message}</div>
		<div class="am-modal-footer"><a class="am-modal-btn">确定</a></div>
	</div>
</div>
<script type="text/javascript" src="_/js/jquery.min-2.2.3.js"></script>
<script type="text/javascript" src="_/js/amazeui.min-2.6.2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${message}"){
		$(".am-modal").modal();
	}
	var o=$("[name='captcha']");
	$(".am-form img").height(parseInt(o.css("padding-top"),10)+1+o.height()+parseInt(o.css("padding-bottom"),10)+1+"px");
});
</script>
</body>
</html>