<%@ page language="java" import="
com.mc.core.entity.site.Donate,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Donate en = new Donate();
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
		<%=crumb(request, "site/donate/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setContact(null), 1)%>
			<%=Search.time(en.setOccur(null), null, "2013-03-03", 2)%>
			<%=Search.select(en.setState(null), new Object[][] { { 1, "是" }, { 0, "否" } })%>
			<%=Search.button(true, true, 5)%>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setMoney(null), en.setOccur(null).setNote(null), en.setNick(null), en.setContact(null), en.setCreated(null))%>
		<%=Search.paging(true, false, null, null)%>
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
				<%=Popup.input(en.setMoney(null), true)%>
				<%=Popup.time(en.setOccur(null), null, null)%>
				<%=Popup.input(en.setNick(null))%>
				<%=Popup.textarea(en.setContact(null), 120)%>
				<%=Popup.select(en.setState(null), new Object[][] { { 1, "是" }, { 0, "否" } }, false)%>
				<%=Popup.input(en.setCreated(null), false, true)%>
				<%=Popup.button(en.setId(null))%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function load(id){
	$.ajax({
		type:"post",
		url:"${ROOT}site/donate/load.htm",
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
			$("#load [name='money']").val(data.money);
			$("#load [name='occur']").val(data.occur);
			$("#load [name='nick']").val(data.nick);
			$("#load [name='contact']").val(data.contact);
			document.getElementsByName("state")[1].value=data.state;
			$("#load [name='created']").val(data.created);
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
			h+="<tr"+(data.state?"":" class=\"am-text-success\"")+">";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+data.money+"</td>";
			h+="<td>"+data.occur+"</td>";
			h+="<td>"+data.nick+"</td>";
			h+="<td>"+JChar(data.contact)+"</td>";
			h+="<td>"+data.created+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(["+data.id+"])\"> 删除</a>";
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
		en.money=$("#load [name='money']").val();
		en.occur=$("#load [name='occur']").val();
		en.nick=$("#load [name='nick']").val();
		en.contact=$("#load [name='contact']").val();
		en.state=$("#load [name='state']").val();
		if(!en.occur){
			$("#load [name='occur']").click();
			return false;
		}
		$.ajax({
			type:"post",
			url:"${ROOT}site/donate/save.htm",
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