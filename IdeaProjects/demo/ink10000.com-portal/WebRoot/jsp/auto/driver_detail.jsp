<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<String, Object> meta = (Map<String, Object>) request.getAttribute("meta");
String title = (String) request.getAttribute("title");
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, title)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jline.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<ul class="am-margin-0 am-list am-list-static am-list-border am-list-striped" id="j_line">
		<%
			for (Map.Entry<String, Object> en : meta.entrySet()) {
				out.print("<li><i>" + en.getKey() + "</i>：<i>" + en.getValue() + "</i></li>");
			}
		%>
		</ul>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
</body>
</html>