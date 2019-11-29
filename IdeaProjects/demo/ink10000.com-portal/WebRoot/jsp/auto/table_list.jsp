<%@ page language="java" import="
com.mc.core.entity.auto.Module,
com.mc.core.entity.auto.Table,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, String> modules = (Map<Integer, String>) request.getAttribute("modules");
PageBody pages = (PageBody) request.getAttribute("pages");
Table en = new Table();
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
		<%=crumb(request, "auto/table/", "auto/field/index.htm")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setName(null), 1)%>
			<%=Search.input(en.setFrame(null), 1)%>
			<%=Search.select(en.setBuild(null), new Object[][] { { 1, "是" }, { 0, "否" } })%>
			<%=Search.select(en.setFkModule(null).setAlias("归属模块"), modules)%>
			<%=Search.button(true, true, 2)%>
		</div>
		<%=Search.table(7, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setName(null), en.setFkModule(null).setAlias("模块名称"), en.setClazz(null), en.setFrame(null).setAlias("表结构名"), en.setGrow(null), en.setCreated(null))%>
		<%=Search.paging(false, true, new String[][] { { "JBuildScript()", icon("eye"), "脚本" }, { "JBuildCode()", icon("file-code-o"), "源码" }, { "JBuildDown()", icon("cloud-download"), "下载" }, new String[] { "JBuildTask(null,null,$('#j_table [name=ids]:checked').parents('tr').find('a:contains(重建)'))", icon("codepen"), "重建" } }, new String[][] {
			{ en.getClass().getName(), "对象管理", en.setFrame(null).FrameFieldName, "0", null, "0" },
			{ "1", "1", en.setId(null).ClazzFieldName, en.setId(null).FrameFieldName, en.setId(null).getAlias(), null },
			{ "1", "1", en.setName(null).ClazzFieldName, en.setName(null).FrameFieldName, en.setName(null).getAlias(), null },
			{ "0", "1", en.setFkModule(null).ClazzFieldName, en.setFkModule(null).FrameFieldName, "模块名称", "3-" + Module.class.getName() },
			{ "1", "1", en.setClazz(null).ClazzFieldName, en.setClazz(null).FrameFieldName, en.setClazz(null).getAlias(), null },
			{ "1", "2", en.setFrame(null).ClazzFieldName, en.setFrame(null).FrameFieldName, en.setFrame(null).getAlias(), null },
			{ "1", "1", en.setGrow(null).ClazzFieldName, en.setGrow(null).FrameFieldName, en.setGrow(null).getAlias(), "4-boolean" },
			{ "0", "1", en.setBuild(null).ClazzFieldName, en.setBuild(null).FrameFieldName, en.setBuild(null).getAlias(), "4-boolean" },
			{ "0", "4", en.setNote(null).ClazzFieldName, en.setNote(null).FrameFieldName, en.setNote(null).getAlias(), null },
			{ "0", "2", en.setCreated(null).ClazzFieldName, en.setCreated(null).FrameFieldName, en.setCreated(null).getAlias(), null }
		})%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<c:import url="${ROOT}global/part.htm?code=popup"/>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript" src="_/my/jbuild.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td data-am-popover=\"{content:'备注说明："+data.name[1]+"',trigger:'hover',theme:'sm'}\">"+data.name[0]+"</td>";
			h+="<td>"+data.fk_module+"</td>";
			h+="<td>"+data.clazz+"</td>";
			h+="<td>"+data.frame+"</td>";
			h+="<td><i class="+(data.grow?"<%=icon("check")%>":"<%=icon("times")%>")+"></i></td>";
			h+="<td data-am-popover=\"{content:'更新时间："+data.created[1]+"',trigger:'hover',theme:'sm'}\">"+data.created[0]+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a href=\"auto/field/index.htm?id="+data.id+"\" class=\"am-btn am-btn-default <%=icon("houzz")%> am-text-secondary\"> 属性</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("eye")%> am-text-secondary\" onclick=\"JBuildScript(["+data.id+"])\"> 脚本</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("file-code-o")%> am-text-secondary\" onclick=\"JBuildCode(["+data.id+"])\"> 源码</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("cloud-download")%> am-text-secondary\" onclick=\"JBuildDown(["+data.id+"])\">下载</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("codepen")%> "+(data.build?"am-text-danger":"am-text-secondary")+"\" onclick=\"JBuildTask(["+data.id+"],null,$(this))\"> 重建</a>";
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