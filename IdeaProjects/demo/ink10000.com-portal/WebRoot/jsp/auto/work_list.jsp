<%@ page language="java" import="
com.mc.core.entity.auto.Work,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Work en = new Work();
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
		<%=crumb(request, "auto/work/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setName(null), 1)%>
			<%=Search.button(true, true, 9)%>
		</div>
		<%=Search.table(5, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setName(null), en.setVersion(null), new Work.Field("联合主键", false, null, null, null, 0, null), new Work.Field("驼峰命名", false, null, null, null, 0, null), new Work.Field("默认值填充到", false, null, null, null, 0, null), new Work.Field("取值集填充到", false, null, null, null, 0, null), new Work.Field("数字有无符号", false, null, null, null, 0, null), new Work.Field("小数点后几位", false, null, null, null, 0, null), new Work.Field("本人角色", false, null, null, null, 0, null), en.setCreated(null))%>
		<%=Search.paging(false, false, new String[][] { { "load()", icon("pencil-square-o"), "创建" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-popup j_popup" id="load">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">创建工作空间</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.input(en.setName(null), true)%>
				<%=Popup.textarea(new Work.Field("签名票据", true, "token", null, null, 0, null), 200, false, true)%>
				<%=Popup.button(en.setId(null))%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function load(id){
	if(!id){
		$("#load [type='reset']").click();
		$("#load [name='id']").val("");
		$("#load").modal();
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/work/load.htm",
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
			$("#load [name='name']").val(data.name);
			$("#load [name='token']").val(data.token);
			$("#load").modal();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function keyt(id){
	if(!window.confirm("你确认要重置密钥吗")){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/work/keyt.htm",
		data:{id:id},
		dataType:"json",
		async:false,
		success:function(res){
			JAlert(res.state);
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
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+data.name+"</td>";
			h+="<td title=\""+data.version[0]+"次\">"+data.version[1]+"</td>";
			h+="<td>"+data.MeshKeySupport+"</td>";
			h+="<td>"+data.HumpNamingSupport+"</td>";
			h+="<td>"+data.TacitValueType+"</td>";
			h+="<td>"+data.ItemValueType+"</td>";
			h+="<td><b title=\"整数有无符号\">"+data.UnsignedSupport[0]+"</b> | <b title=\"小数有无符号\">"+data.UnsignedSupport[1]+"<b/></td>";
			h+="<td><b title=\"低精度小数\">"+data.DotLength[0]+"</b> | <b title=\"高精度小数\">"+data.DotLength[1]+"<b/></td>";
			h+="<td>"+data.grade+"</td>";
			h+="<td data-am-popover=\"{content:'更新时间："+data.created[1]+"',trigger:'hover',theme:'sm'}\">"+data.created[0]+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a href=\"auto/work/index.htm?id="+data.id+"\" class=\"am-btn am-btn-default <%=icon("mail-forward")%> am-text-secondary\"> 进入</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("cog")%> am-text-secondary\" onclick=\"JPageLoad("+data.id+")\"> 配置</a>";
			h+="<a href=\"auto/work/library.htm?id="+data.id+"\" class=\"am-btn am-btn-default <%=icon("link")%> am-text-secondary\"> 依赖</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("key")%> am-text-secondary\" onclick=\"keyt("+data.id+")\"> 密钥</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("pencil-square-o")%> am-text-secondary\" onclick=\"load("+data.id+")\"> 编辑</a>";
			h+="</div>";
			h+="</td>";
			h+="</tr>";
		}
		$("#j_table tbody").html(h);
	});
	$("#load form").submit(function(){
		var en=new Object();
		en.id=$("#load [name='id']").val();
		en.name=$("#load [name='name']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}auto/work/save.htm",
			data:en,
			dataType:"json",
			async:false,
			success:function(res){
				$("#load").modal("close");
				var state=res.state;
				if(state!="OK"){
					JAlert(state);
					return;
				}
				JPageSend(JPage.now);
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