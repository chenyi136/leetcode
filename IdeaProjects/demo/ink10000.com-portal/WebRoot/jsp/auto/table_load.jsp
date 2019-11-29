<%@ page language="java" import="com.mc.core.entity.auto.Table" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, String> modules = (Map<Integer, String>) request.getAttribute("modules");
Table pages = (Table) request.getAttribute("pages");
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, pages.getName())%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jform.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<form class="am-g am-form am-form-horizontal" action="auto/table/save.htm" method="post" id="j_form">
			<div class="am-u-md-6">
				<%=Form.input(pages.setName(null), pages.getName())%>
				<%=Form.input(pages.setClazz(null).setNote("同一空间下不能重复"), pages.getClazz())%>
				<%=Form.input(pages.setFrame(null).setNote("表结构名称必须与归属模块的表结构前缀保持一致，同一空间下不能重复"), pages.getFrame())%>
				<%=Form.select(pages.setFkModule(null).setAlias("归属模块"), pages.getFkModule(), modules)%>
				<%=Form.textarea(pages.setNode(null).setLength(8000), 8, null, pages.getNode())%>
			</div>
			<div class="am-u-md-6">
				<%=Form.textarea(pages.setCode(null).setLength(4000), 4, null, pages.getCode())%>
				<%=Form.textarea(pages.setBasis(null).setLength(4000), 4, null, pages.getBasis())%>
				<%=Form.textarea(pages.setNote(null), 4, null, pages.getNote())%>
				<%=Form.button(request, pages.setId(null), pages.getId(), new Object[][]{ { "name2", pages.getName() } })%>
			</div>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jform.js"></script>
</body>
</html>