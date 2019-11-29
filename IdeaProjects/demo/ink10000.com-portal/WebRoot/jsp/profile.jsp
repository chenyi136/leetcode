<%@ page language="java" import="com.mc.core.entity.auth.Account" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%Account pages = (Account) request.getAttribute("pages");%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jform.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<form class="am-g am-form am-form-horizontal" action="admin/profile.htm" method="post" id="j_form">
			<div class="am-u-md-6">
				<%=Form.input(pages.setUsername(null).setField(null), pages.getUsername())%>
				<%=Form.input(pages.setEmail(null).setField(null), pages.getEmail())%>
				<%=Form.input(pages.setPassword(null).setEmpty(true).setLength(20).setNote(null), "password", null, null)%>
				<%=Form.file(pages.setFace(null), pages.getFace(), null, ".bmp,.gif,.jpg,.png")%>
				<%=Form.input(pages.setName(null), pages.getName())%>
			</div>
			<div class="am-u-md-6">
				<%=Form.textarea(pages.setBrief(null).setNote("输入换行可进行分段"), 12, null, pages.getBrief())%>
				<%=Form.button(request, null, null, new String[][] { { "username2", pages.getUsername() } })%>
			</div>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jform.js"></script>
</body>
</html>