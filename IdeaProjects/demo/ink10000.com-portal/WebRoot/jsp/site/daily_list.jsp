<%@ page language="java" import="
com.mc.core.crux.Legal,
com.mc.core.entity.site.Daily,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Daily en = new Daily();
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
		<%=crumb(request, "site/daily/")%>
		<div id="j_search">
			<div class="am-g">
				<%=Search.input(en.setName(null), 1)%>
				<%=Search.input(en.setAddress(null), 1)%>
				<%=Search.time(en.setCreated(null), null, "2018-09-14", 2)%>
				<%=Search.button(false, true, 4)%>
			</div>
			<div class="am-g am-padding-top-xs">
				<%=Search.input(en.setRemote(null), 1)%>
				<%=Search.input(en.setTitle(null), 1)%>
				<%=Search.select(en.setProject(null), Legal.GLOBAL_PROJECT_KEY)%>
				<%=Search.button(true, false, 4)%>
			</div>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setName(null), en.setType(null), en.setRemote(null), en.setTitle(null), en.setSize(null), en.setTrack(null), en.setFkAccount(null).setAlias("创建用户"), en.setCreated(null))%>
		<%=Search.paging(true, false, null, null)%>
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
			h+="<td>"+(data.address?"<a href=\""+data.address+(data.args?(typeof data.args=="string"?data.args:"?"+window.KEY_JUMP_PAGING+"="+JBase64(data.args)):"")+"\" target=\"_blank\">"+data.name+"</a>":data.name)+"</td>";
			h+="<td>"+data.type+"</td>";
			h+="<td>"+data.remote+"</td>";
			h+="<td>"+(data.title?"<a href=\""+data.refer+"\">"+data.title+"</a>":"-")+"</td>";
			h+="<td>"+data.size+"</td>";
			h+="<td>"+data.track+" ms</td>";
			h+="<td>"+data.fkAccount+"</td>";
			h+="<td>"+data.created+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(["+data.id+"])\"> 删除</a>";
			h+="<a href=\"site/daily/down.htm?id="+data.id+"\" class=\"am-btn am-btn-default <%=icon("cloud-download")%> am-text-secondary\" target=\"_blank\"> 下载</a>";
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