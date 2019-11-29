<%@ page language="java" import="
java.net.URLEncoder,
com.mc.portal.crux.Global" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String target = (String) request.getAttribute(Global.KEY_JUMP_TARGET);
String paging = (String) request.getAttribute(Global.KEY_JUMP_PAGING);
String message = (String) request.getAttribute(Global.KEY_JUMP_MESSAGE);
if (target == null) {
	throw new Exception("非法参数");
}
StringBuffer param = new StringBuffer();
if (paging != null && !paging.equals("")) {
	param.append("&" + Global.KEY_JUMP_PAGING + "=" + paging);
}
if (message != null && !message.equals("")) {
	param.append("&" + Global.KEY_JUMP_MESSAGE + "=" + URLEncoder.encode(message, "UTF-8"));
}
if (param.length() > 0) {
	param.deleteCharAt(0);
	param.insert(0, target.indexOf("?") !=-1 ? "&" : "?");
}
response.sendRedirect((target.startsWith(Global.ROOT) ? "" : Global.ROOT) + target + param.toString());
%>