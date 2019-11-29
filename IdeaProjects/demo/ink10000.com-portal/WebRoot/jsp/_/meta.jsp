<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/jsp/_/clazz.jsp"%>
<%
String KEY_JUMP_MESSAGE = request.getParameter(Global.KEY_JUMP_MESSAGE);
if (KEY_JUMP_MESSAGE == null || KEY_JUMP_MESSAGE.equals("")) {
	KEY_JUMP_MESSAGE = (String) request.getAttribute("KEY_JUMP_MESSAGE");
}
if (KEY_JUMP_MESSAGE == null) {
	KEY_JUMP_MESSAGE = "";
}
%>
	<base href="${ROOT}">
	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-title" content="">
	<meta name="author" content="1138789752@qq.com">
	<meta name="baidu-site-verification" content="">
	<meta name="cache-control" content="no-siteapp">
	<meta name="description" content="">
	<meta name="format-detection" content="telephone=no">
	<meta name="keywords" content="">
	<meta name="mobile-web-app-capable" content="yes">
	<meta name="msapplication-TileColor" content="#0E90D2">
	<meta name="msapplication-TileImage" content="_/i/app-icon72x72@2x.png">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta name="x-ua-compatible" content="IE=edge">
	<link rel="alternate icon" type="image/png" href="_/i/favicon.png">
	<link rel="apple-touch-icon-precomposed" type="image/png" href="_/i/app-icon72x72@2x.png">
	<link rel="canonical" href="">
	<link rel="icon" type="image/png" href="_/i/favicon.png">
	<link rel="icon" type="image/png" href="_/i/app-icon72x72@2x.png" sizes="192x192">
	<link rel="stylesheet" type="text/css" href="_/css/amazeui.min-2.6.2.css">
	<link rel="stylesheet" type="text/css" href="_/js/plugin/jedate/jedate-3.4.0.css">
	<link rel="stylesheet" type="text/css" href="_/js/plugin/pace/themes/red/pace-theme-minimal.css">
	<link rel="stylesheet" type="text/css" href="_/my/jshare.css">
	<script type="text/javascript">if("<%=KEY_JUMP_MESSAGE%>"){window.alert(decodeURI("<%=KEY_JUMP_MESSAGE%>"));}</script>
	<script type="text/javascript" src="_/js/plugin/pace/pace.min-1.0.2.js"></script>
	