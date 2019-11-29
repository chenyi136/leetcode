<%@ page language="java" import="
com.mc.core.crux.Legal,
com.mc.core.entity.auto.Bound,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, String> tables = (Map<Integer, String>) request.getAttribute("tables");
PageBody pages = (PageBody) request.getAttribute("pages");
Bound en = new Bound();
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
		<%=crumb(request, "auto/bound/")%>
		<div id="j_search">
			<div class="am-g">
				<%=Search.select(en.setType(null), Legal.AUTO_BOUND_TYPE)%>
				<%=Search.select(en.setFkTableHost(null).setAlias("主表对象"), tables)%>
				<%=Search.select(en.setFkTableObey(null).setAlias("从表对象"), tables)%>
				<%=Search.select(en.setTrash(null), Legal.AUTO_BOUND_ACTION)%>
				<%=Search.select(en.setModify(null), Legal.AUTO_BOUND_ACTION)%>
				<%=Search.button(false, true, 2)%>
			</div>
			<div class="am-g am-padding-top-xs">
				<%=Search.input(en.setName(null), 1, 4)%>
				<%=Search.input(en.setFieldHost(null), 1)%>
				<%=Search.input(en.setFieldObey(null), 1)%>
				<%=Search.button(true, false, 2)%>
			</div>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setName(null), en.setType(null), en.setFkTableHost(null).setAlias("主表对象"), en.setFieldHost(null).setNote(null), en.setFkTableObey(null).setAlias("从表对象"), en.setFieldObey(null).setNote(null), en.setTrash(null), en.setModify(null))%>
		<%=Search.paging(false, false, null, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td class=\"am-text-left\">"+data.name+"</td>";
			h+="<td>"+data.type+"</td>";
			h+="<td>"+data.fk_table_host[1]+"</td>";
			h+="<td>"+data.field_host+"</td>";
			h+="<td>"+data.fk_table_obey+"</td>";
			h+="<td>"+data.field_obey+"</td>";
			h+="<td>"+data.trash+"</td>";
			h+="<td>"+data.modify+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(["+data.id+"])\"> 删除</a>";
			h+="<a href=\"auto/field/index.htm?id="+data.fk_table_host[0]+"\" class=\"am-btn am-btn-default <%=icon("pencil-square-o")%> am-text-secondary\"> 属性</a>";
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