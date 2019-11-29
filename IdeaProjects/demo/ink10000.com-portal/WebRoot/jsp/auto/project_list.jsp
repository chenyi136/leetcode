<%@ page language="java" import="
java.util.LinkedHashMap,
com.mc.core.entity.auto.Project,
com.mc.core.template.DaoImplTemplate,
com.mc.core.template.DaoMapperTemplate,
com.mc.core.template.DaoTemplate,
com.mc.core.template.EntityTemplate,
com.mc.core.template.ServiceImplTemplate,
com.mc.core.template.ServiceTemplate,
com.mc.portal.pojo.PageBody,
com.mc.portal.pojo.WorkConfig" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, String> drivers = (Map<Integer, String>) request.getAttribute("drivers");
@SuppressWarnings("unchecked")
Map<Integer, String[]> clazz = (Map<Integer, String[]>) request.getAttribute("clazz");
WorkConfig context = (WorkConfig) request.getAttribute("context");
PageBody pages = (PageBody) request.getAttribute("pages");
Project en = new Project();
String[] interfaces = new String[] { EntityTemplate.class.getName(), DaoTemplate.class.getName(), DaoImplTemplate.class.getName(), DaoMapperTemplate.class.getName(), ServiceTemplate.class.getName(), ServiceImplTemplate.class.getName() };
Map<Integer, String> EntityClassInterface = new LinkedHashMap<Integer, String>();
Map<Integer, String> DaoClassInterface = new LinkedHashMap<Integer, String>();
Map<Integer, String> DaoImplClassInterface = new LinkedHashMap<Integer, String>();
Map<Integer, String> DaoMapperXMLInterface = new LinkedHashMap<Integer, String>();
Map<Integer, String> ServiceClassInterface = new LinkedHashMap<Integer, String>();
Map<Integer, String> ServiceImplClassInterface = new LinkedHashMap<Integer, String>();
for (Map.Entry<Integer, String[]> temp : clazz.entrySet()) {
	String[] value = temp.getValue();
	if (value[1].indexOf(interfaces[0]) != -1) {
		EntityClassInterface.put(temp.getKey(), value[0]);
	}
	if (value[1].indexOf(interfaces[1]) != -1) {
		DaoClassInterface.put(temp.getKey(), value[0]);
	}
	if (value[1].indexOf(interfaces[2]) != -1) {
		DaoImplClassInterface.put(temp.getKey(), value[0]);
	}
	if (value[1].indexOf(interfaces[3]) != -1) {
		DaoMapperXMLInterface.put(temp.getKey(), value[0]);
	}
	if (value[1].indexOf(interfaces[4]) != -1) {
		ServiceClassInterface.put(temp.getKey(), value[0]);
	}
	if (value[1].indexOf(interfaces[5]) != -1) {
		ServiceImplClassInterface.put(temp.getKey(), value[0]);
	}
}
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
		<%=crumb(request, "auto/project/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setName(null), 1)%>
			<%=Search.input(en.setClazz(null), 1)%>
			<%=Search.select(en.setFkDriver(null).setAlias("项目驱动"), drivers)%>
			<%=Search.button(true, true, 4)%>
		</div>
		<%=Search.table(7, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setName(null), new Project.Field("驱动信息", false, null, null, null, 0, null), en.setClazz(null), en.setCreated(null))%>
		<%=Search.paging(true, true, new String[][] { { "auto/work/library.htm?id=" + context.id, icon("link"), "依赖" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<c:import url="${ROOT}global/part.htm?code=popup"/>
<div class="am-popup j_popup" id="load">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">定制项目模板</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.select(en.setFkEntityClass(null), EntityClassInterface, true)%>
				<%=Popup.select(en.setFkDaoClass(null), DaoClassInterface, false)%>
				<%=Popup.select(en.setFkDaoImplClass(null), DaoImplClassInterface, false)%>
				<%=Popup.select(en.setFkDaoMapperXml(null), DaoMapperXMLInterface, false)%>
				<%=Popup.select(en.setFkServiceClass(null), ServiceClassInterface, false)%>
				<%=Popup.select(en.setFkServiceImplClass(null), ServiceImplClassInterface, false)%>
				<%=Popup.button(en.setId(null))%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript" src="_/my/jbuild.js"></script>
<script type="text/javascript">
function jump(id){
	var ids=[id,0];
	if(window.confirm("是否在编译打包时包含源码")){
		ids[1]=1;
	}
	JTarget("${ROOT}auto/field/export.htm",ids);
}
function template(id){
	$.ajax({
		type:"post",
		url:"${ROOT}auto/project/load.htm",
		data:{id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			var data=res.data;
			$("#load [name='id']").val(id);
			document.getElementsByName("fkEntityClass")[0].value=data.fkEntityClass?data.fkEntityClass:-1;
			document.getElementsByName("fkDaoClass")[0].value=data.fkDaoClass?data.fkDaoClass:-1;
			document.getElementsByName("fkDaoImplClass")[0].value=data.fkDaoImplClass?data.fkDaoImplClass:-1;
			document.getElementsByName("fkDaoMapperXml")[0].value=data.fkDaoMapperXml?data.fkDaoMapperXml:-1;
			document.getElementsByName("fkServiceClass")[0].value=data.fkServiceClass?data.fkServiceClass:-1;
			document.getElementsByName("fkServiceImplClass")[0].value=data.fkServiceImplClass?data.fkServiceImplClass:-1;
			$("#load").modal();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
$(document).ready(function(){
	$("#load select").height($("#load .am-input-group-label").height());
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+(data.home?"<a href=\""+data.home+"\" target=\"_blank\">"+data.name+"</a>":data.name)+"</td>";
			h+="<td><a href=\"auto/driver/detail.htm?id="+data.driver[0]+"\">"+data.driver[1]+"</a></td>";
			h+="<td>"+data.clazz+"</td>";
			h+="<td data-am-popover=\"{content:'更新时间："+data.created[1]+"',trigger:'hover',theme:'sm'}\">"+data.created[0]+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("shopping-bag")%> am-text-secondary\" onclick=\"jump("+data.id+")\"> 导包</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("file-code-o")%> am-text-secondary\" onclick=\"JBuildCode("+data.id+")\"> 源码</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("cloud-download")%> am-text-secondary\" onclick=\"JBuildDown("+data.id+")\">下载</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("eye")%> am-text-secondary\" onclick=\"JBuildScript(null,"+data.id+")\"> 脚本</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("dropbox")%> am-text-secondary\" onclick=\"template("+data.id+")\"> 模板</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(["+data.id+"])\"> 删除</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("pencil-square-o")%> am-text-secondary\" onclick=\"JPageLoad("+data.id+")\"> 编辑</a>";
			h+="</div>";
			h+="</td>";
			h+="</tr>";
		}
		$("#j_table tbody").html(h);
	});
	$("#load form").submit(function(){
		var en=new Object();
		en.id=$("#load [name='id']").val();
		en.fkEntityClass=$("#load [name='fkEntityClass']").val();
		en.fkDaoClass=$("#load [name='fkDaoClass']").val();
		en.fkDaoImplClass=$("#load [name='fkDaoImplClass']").val();
		en.fkDaoMapperXml=$("#load [name='fkDaoMapperXml']").val();
		en.fkServiceClass=$("#load [name='fkServiceClass']").val();
		en.fkServiceImplClass=$("#load [name='fkServiceImplClass']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}auto/project/template.htm",
			data:en,
			dataType:"json",
			async:false,
			success:function(res){
				$("#load").modal("close");
				JAlert(res.state);
			},
			error:function(r,s,e){
				JAlert(r.status);
			}
		});
		return false;
	});
});
</script>
</body>
</html>