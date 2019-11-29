<%@ page language="java" import="com.mc.core.entity.auto.Driver" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%Driver pages = (Driver) request.getAttribute("pages");%>
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
		<form class="am-g am-form am-form-horizontal" action="auto/driver/save.htm" method="post" id="j_form">
			<div class="am-u-md-6">
				<%=Form.select(pages.setClazz(null), pages.getClazz(), new Object[][] { { "com.mysql.jdbc.Driver", "com.mysql.jdbc.Driver" }, { "com.mysql.jdbc.NonRegisteringDriver", "com.mysql.jdbc.NonRegisteringDriver" }, { "com.mysql.jdbc.NonRegisteringReplicationDriver", "com.mysql.jdbc.NonRegisteringReplicationDriver" }, { "com.mysql.jdbc.ReplicationDriver", "com.mysql.jdbc.ReplicationDriver" }, { "com.mysql.fabric.jdbc.FabricMySQLDriver", "com.mysql.fabric.jdbc.FabricMySQLDriver" }, { "org.gjt.mm.mysql.Driver", "org.gjt.mm.mysql.Driver" } })%>
				<%=Form.input(pages.setName(null), pages.getName())%>
				<%=Form.input(pages.setVersion(null).setEmpty(true), pages.getVersion())%>
				<%=Form.input(pages.setAddress(null), pages.getAddress(), "占位符{database}代表数据库名")%>
				<%=Form.input(pages.setUsername(null), pages.getUsername())%>
				<%=Form.input(pages.setPassword(null).setEmpty(pages.getId() != null).setLength(20), "password", null, null)%>
			</div>
			<div class="am-u-md-6">
				<%=Form.input(pages.setEngine(null), pages.getEngine() != null ? pages.getEngine() : "InnoDB")%>
				<%=Form.input(pages.setUnicode(null), pages.getUnicode() != null ? pages.getUnicode() : "utf8mb4")%>
				<%=Form.input(pages.setIndexes(null), pages.getIndexes() != null ? pages.getIndexes() : "BTREE")%>
				<%=Form.input(pages.setSymbol(null), pages.getSymbol() != null ? pages.getSymbol() : "`")%>
				<%=Form.button(request, pages.setId(null), pages.getId())%>
			</div>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jform.js"></script>
</body>
</html>