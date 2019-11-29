<%@ page language="java" import="com.mc.core.entity.auto.Project" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, String> tables = (Map<Integer, String>) request.getAttribute("tables");
@SuppressWarnings("unchecked")
Map<Integer, String> drivers = (Map<Integer, String>) request.getAttribute("drivers");
Project pages = (Project) request.getAttribute("pages");
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
		<form class="am-g am-form am-form-horizontal" action="auto/project/save.htm" method="post" id="j_form">
			<div class="am-u-md-6">
				<%=Form.input(pages.setName(null), pages.getName())%>
				<%=Form.input(pages.setHome(null), pages.getHome())%>
				<%=Form.input(pages.setClazz(null).setAlias("导包名称").setEmpty(true), pages.getClazz(), "占位符{version}代表版本序号，以.jar为后缀")%>
				<%=Form.input(pages.setRoute(null), pages.getRoute())%>
				<%=Form.select(pages.setFkDriver(null).setAlias("项目驱动").setEmpty(false), pages.getFkDriver(), drivers)%>
				<%=Form.textarea(pages.setNeglect(null), 6, null, pages.getNeglect())%>
			</div>
			<div class="am-u-md-6">
				<%=Form.checkbox(pages.setLevel(null).setNote("请选择对象的导出级别"), JsonTool.list(pages.getLevel(), String.class), pages.getLevel(), Global.AUTO_PROJECT_LEVEL)%>
				<%=Form.checkbox(pages.setEntry(null).setAlias("选择对象").setNote("请选择项目需要的对象"), JsonTool.list(pages.getEntry(), Integer.class), pages.getEntry(), tables)%>
				<%=Global.OUTPUT != null && pages.getId() != null ? Form.button(request, pages.setId(null), pages.getId(), null, new String[][] { { "auto/project/library.htm?id=" + pages.getId(), icon("link"), "依赖" } }) : Form.button(request, pages.setId(null), pages.getId())%>
			</div>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jform.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#j_form").submit(function(){
		var vs=[];
		$.each($("#j_form [name='<%=pages.setLevel(null).ClazzFieldName%>s']:checked"),function(){
			vs[vs.length]=$(this).val();
		});
		$("#j_form [name='<%=pages.setLevel(null).ClazzFieldName%>']").val(JSON.stringify(vs));
		vs=[];
		$.each($("#j_form [name='<%=pages.setEntry(null).ClazzFieldName%>s']:checked"),function(){
			vs[vs.length]=$(this).val();
		});
		$("#j_form [name='<%=pages.setEntry(null).ClazzFieldName%>']").val(JSON.stringify(vs));
	});
});
</script>
</body>
</html>