<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 9]><html class="lte9 no-js demo"><![endif]-->
<!--[if gt IE 9]><!--><html class="no-js demo"><!--<![endif]-->
<head>
	<title>微信支付 - default（默认）|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body>
<div class="page pg-demo">
	<jsp:include page="/doc/widget_top.jsp"/>
	<div data-backend-compiled id="demo-view"><div class="am-wechatpay am-wechatpay-default" data-am-widget="wechatpay" data-wechat-pay="{timestamp:'1421914022',nonceStr:'8W93zPDk9fNRxRbpqv5yqwCkNRWZspyW',package:'prepay_id=wx20150122160705ac42dc60170063851392',signType:'MD5',paySign:'5AF3E6B975D35BA23B63277CB45C8830'}"><button type="button" class="am-btn am-btn-block am-btn-primary am-wechatpay-btn">速速支付！</button></div></div>
	<ul class="am-pagination">
		<li class="am-pagination-prev"><a href="doc/widget/titlebar_one_0.jsp">&laquo; Prev</a></li>
		<li class="am-pagination-next am-disabled"><a href="doc/widget/index_m.jsp">Next &raquo;</a></li>
	</ul>
	<div class="ds-thread" data-thread-key="b12a30135fd103cee2c826f8ddb83a1b" data-title="微信支付 - default（默认）|Amaze UI" id="ds-thread"></div>
</div>
<jsp:include page="/doc/widget_footer.jsp"/>
</body>
</html>