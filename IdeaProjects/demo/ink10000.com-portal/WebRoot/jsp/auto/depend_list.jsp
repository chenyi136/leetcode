<%@ page language="java" import="
com.mc.core.entity.auto.Depend,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Depend en = new Depend();
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
		<%=crumb(request, "auto/depend/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setClazz(null), 1)%>
			<%=Search.button(true, true, 9)%>
		</div>
		<%=Search.table(Global.OUTPUT != null ? 3 : 2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setName(null), en.setClazz(null), en.setEntry(null).setNote(null), en.setTotal(null))%>
		<%=Search.paging(true, true, new String[][] { { "auto/depend/library.htm", icon("link"), "依赖" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function jump(id){
	var ids=[id,0];
	if(window.confirm("是否在编译打包时包含源码")) {
		ids[1]=1;
	}
	JTarget("${ROOT}auto/depend/export.htm",ids);
}
$(document).ready(function(){
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+data.name+"</td>";
			h+="<td>"+data.clazz+"</td>";
			h+="<td data-am-popover=\"{content:'"+data.entry[1]+"',trigger:'hover',theme:'sm'}\">"+data.entry[0]+"</td>";
			h+="<td>"+data.total+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+=<%=Global.OUTPUT != null%>?"<a class=\"am-btn am-btn-default <%=icon("shopping-bag")%> am-text-secondary\" onclick=\"jump("+data.id+")\"> 导包</a>":"";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(["+data.id+"])\"> 删除</a>";
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