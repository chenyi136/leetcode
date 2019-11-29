<%@ page language="java" import="
com.mc.core.entity.auth.Power,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Power en = new Power();
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
		<%=crumb(request, "auth/power/")%>
		<div id="j_search">
			<div class="am-g">
				<%=Search.input(en.setName(null), 1)%>
				<%=Search.input(en.setIcon(null), 1)%>
				<%=Search.select(en.setForbid(null), new Object[][] { { 1, "是" }, { 0, "否" } })%>
				<%=Search.select(en.setTacit(null), new Object[][] { { 1, "是" }, { 0, "否" } })%>
				<%=Search.button(false, true, 2)%>
			</div>
			<div class="am-g am-padding-top-xs">
				<%=Search.input(en.setRoute(null), 1)%>
				<%=Search.input(en.setParent(null), 0, 3, true)%>
				<%=Search.select(en.setMenu(null), new Object[][] { { 1, "是" }, { 0, "否" } })%>
				<%=Search.select(en.setQuick(null), new Object[][] { { 1, "是" }, { 0, "否" } })%>
				<%=Search.button(true, false, 2)%>
			</div>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setId(null).setAlias("权限代号"), en.setName(null), en.setIcon(null), en.setRoute(null), en.setLevel(null), en.setForbid(null), en.setTacit(null), en.setMenu(null), en.setQuick(null), en.setQueue(null))%>
		<%=Search.paging(false, true, new String[][] { { "auth/power/queue.htm", icon("arrows-v"), "排序" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function next(parent){
	$("#j_search input[name='parent']").val(parent);
	var en=new Object();
	en.size=JPage.size;
	en.now=1;
	en.order=JPage.order;
	en.queue=JPage.queue;
	en.equal=[{tag:"input",value:parent,name:"<%=en.setParent(null).FrameFieldName%>"}];
	en.like=[];
	en.custom=[];
	JPageSend(null,en);
}
$(document).ready(function(){
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td><a onclick=\"next('"+data.id+"')\">"+data.id+"</a></td>";
			h+="<td>"+data.name+"</td>";
			h+="<td><i class=\""+data.icon+"\"></i> "+data.icon+"</td>";
			h+="<td>"+(data.menu?"<a href=\""+data.route+"\">"+data.route+"</a>":data.route)+"</td>";
			h+="<td>"+data.level+"级</td>";
			h+="<td><i class="+(data.forbid?"<%=icon("check")%>":"<%=icon("times")%>")+"></i></td>";
			h+="<td><i class="+(data.tacit?"<%=icon("check")%>":"<%=icon("times")%>")+"></i></td>";
			h+="<td><i class="+(data.menu?"<%=icon("check")%>":"<%=icon("times")%>")+"></i></td>";
			h+="<td><i class="+(data.quick?"<%=icon("check")%>":"<%=icon("times")%>")+"></i></td>";
			h+="<td>"+data.queue+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(['"+data.id+"'])\"> 删除</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("pencil-square-o")%> am-text-secondary\" onclick=\"JPageLoad('"+data.id+"')\"> 编辑</a>";
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