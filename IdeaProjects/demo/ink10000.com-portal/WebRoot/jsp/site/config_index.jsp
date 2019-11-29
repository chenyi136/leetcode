<%@ page language="java" import="com.mc.core.entity.site.Config" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<Config> datas = (List<Config>) request.getAttribute("datas");
Config en = new Config();
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
<style type="text/css">
#j_table table{padding:0;border-bottom:none;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "site/config/")%>
		<div class="am-g" id="j_table">
			<table class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover am-table-centered am-table-compact">
				<tbody>
				<%
					int index = 0;
					for (Config data : datas) {
						out.print("<tr id=\"" + data.getId() + "\">");
						out.print("<td>" + data.getName() + "</td>");
						out.print("<td>" + data.getClazz() + "</td>");
						out.print("<td>" + data.getField() + "</td>");
						out.print(data.getCode() ? "<td class=\"am-text-danger\"><i class=\"" + icon("key") + "\"></i> 保护中</td>" : "<td>" + data.getTacit() + "</td>");
						out.print(data.getCode() ? "<td class=\"am-text-danger\"><i class=\"" + icon("key") + "\"></i> 保护中</td>" : "<td>" + data.getEntry() + "</td>");
						out.print("</tr>");
						index++;
					}
				%>
				</tbody>
			</table>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-popup" id="load">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">创建工作空间</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.input(en.setName(null), true, true)%>
				<%=Popup.input(en.setClazz(null), false, true)%>
				<%=Popup.input(en.setField(null), false, true)%>
				<%=Popup.select(en.setCode(null), new Object[][] { { 1, "是" }, { 0, "否" } }, false)%>
				<%=Popup.textarea(en.setTacit(null), 160, false, true)%>
				<%=Popup.textarea(en.setEntry(null).setLength(400), 170)%>
				<%=Popup.button(en.setId(null))%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#load select").height($("#load .am-input-group-label").height());
	$("#j_table tr").click(function(){
		var id=$(this).attr("id");
		$.ajax({
			type:"post",
			url:"${ROOT}site/config/load.htm",
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
				$("#load [name='clazz']").val(data.clazz);
				$("#load [name='field']").val(data.field);
				document.getElementsByName("code")[0].value=data.code;
				$("#load [name='tacit']").val(data.tacit);
				$("#load [name='entry']").val(data.entry);
				$("#load").modal();
			},
			error:function(r,s,e){
				JAlert(r.status);
			}
		});
	});
	$("#load form").submit(function(){
		var en=new Object();
		en.id=$("#load [name='id']").val();
		en.entry=$("#load [name='entry']").val();
		en.code=$("#load [name='code']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}site/config/save.htm",
			data:en,
			dataType:"json",
			async:false,
			success:function(res){
				$("#load").modal("close");
				var state=res.state;
				if(state!="OK"){
					JAlert(res.state);
					return;
				}
				window.location=location.href;
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