<%@ page language="java" import="
com.mc.core.entity.auto.Driver,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Driver en = new Driver();
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
		<%=crumb(request, "auto/driver/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setName(null), 1)%>
			<%=Search.input(en.setAddress(null), 1)%>
			<%=Search.input(en.setUsername(null), 0)%>
			<%=Search.button(true, true, 3)%>
		</div>
		<%=Search.table(5, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setName(null), en.setVersion(null), en.setClazz(null), en.setUsername(null), en.setEngine(null), en.setUnicode(null), en.setIndexes(null), en.setSymbol(null), en.setCreated(null))%>
		<%=Search.paging(false, true, null, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function tacit(id,o){
	var tr=$(o).parents("tr");
	if(tr.is(".am-text-success")){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/driver/tacit.htm",
		data:{id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			tr.siblings().removeClass("am-text-success");
			tr.addClass("am-text-success");
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
$(document).ready(function(){
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr"+(data.tacit?" class=\"am-text-success\"":"")+">";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+data.name+"</td>";
			h+="<td>"+data.version+"</td>";
			h+="<td data-am-popover=\"{content:'连接地址："+data.clazz[1]+"',trigger:'hover',theme:'sm'}\">"+data.clazz[0]+"</td>";
			h+="<td>"+data.username+"</td>";
			h+="<td>"+data.engine+"</td>";
			h+="<td>"+data.unicode+"</td>";
			h+="<td>"+data.indexes+"</td>";
			h+="<td>"+data.symbol+"</td>";
			h+="<td data-am-popover=\"{content:'更新时间："+data.created[1]+"',trigger:'hover',theme:'sm'}\">"+data.created[0]+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a href=\"auto/driver/detail.htm?id="+data.id+"\" class=\"am-btn am-btn-default <%=icon("eye")%> am-text-secondary\"> 查看</a>";
			h+="<a href=\"auto/driver/state.htm?id="+data.id+"\" class=\"am-btn am-btn-default <%=icon("cog")%> am-text-secondary\"> 配置</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(["+data.id+"])\"> 删除</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("check-circle-o")%> am-text-secondary\" onclick=\"tacit("+data.id+",this)\"> 默认</a>";
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