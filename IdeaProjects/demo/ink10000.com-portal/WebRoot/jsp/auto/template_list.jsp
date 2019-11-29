<%@ page language="java" import="
java.util.LinkedHashMap,
com.mc.core.entity.auto.Template,
com.mc.core.template.DaoImplTemplate,
com.mc.core.template.DaoMapperTemplate,
com.mc.core.template.DaoTemplate,
com.mc.core.template.EntityTemplate,
com.mc.core.template.ServiceImplTemplate,
com.mc.core.template.ServiceTemplate,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Map<String, String> nozzle = new LinkedHashMap<String, String>();
nozzle.put(EntityTemplate.class.getName(), EntityTemplate.class.getName());
nozzle.put(DaoTemplate.class.getName(), DaoTemplate.class.getName());
nozzle.put(DaoImplTemplate.class.getName(), DaoImplTemplate.class.getName());
nozzle.put(DaoMapperTemplate.class.getName(), DaoMapperTemplate.class.getName());
nozzle.put(ServiceTemplate.class.getName(), ServiceTemplate.class.getName());
nozzle.put(ServiceImplTemplate.class.getName(), ServiceImplTemplate.class.getName());
Template en = new Template();
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "auto/template/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setClazz(null), 1)%>
			<%=Search.select(en.setNozzle(null), nozzle, 1)%>
			<%=Search.select(en.setKernel(null), new Object[][] { { 1, "是" }, { 0, "否" } })%>
			<%=Search.button(true, true, 5)%>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setClazz(null), en.setNozzle(null).setNote(null), en.setKernel(null), en.setCreated(null))%>
		<%=Search.paging(true, true, null, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<c:import url="${ROOT}global/part.htm?code=popup"/>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td class=\"am-text-left\">"+data.clazz+"</td>";
			h+="<td class=\"am-text-left\">"+data.nozzle+"</td>";
			h+="<td><i class="+(data.kernel?"<%=icon("check")%>":"<%=icon("times")%>")+"></i></td>";
			h+="<td data-am-popover=\"{content:'更新时间："+data.created[1]+"',trigger:'hover',theme:'sm'}\">"+data.created[0]+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\""+(data.kernel?"":" onclick=\"JPageDrop(["+data.id+"])\"")+"> 删除</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("pencil-square-o")%> am-text-secondary\" onclick=\"JPageLoad("+data.id+")\"> 编辑</a>";
			h+="</div>";
			h+="</td>";
			h+="</tr>";
		}
		$("#j_table tbody").html(h);
	});
});
</script>
</body>
</html>