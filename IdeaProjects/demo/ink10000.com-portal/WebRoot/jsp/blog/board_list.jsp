<%@ page language="java" import="
com.mc.core.entity.blog.Board,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Board en = new Board();
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
		<%=crumb(request, "blog/board/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setId(null).setAlias("榜单编号"), 1)%>
			<%=Search.input(en.setName(null), 1)%>
			<%=Search.button(true, true, 6)%>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setId(null).setAlias("榜单编号"), en.setName(null), en.setQueue(null), en.setField(null), en.setEdited(null))%>
		<%=Search.paging(false, false, new String[][] { { "load()", icon("pencil-square-o"), "创建" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-popup j_popup" id="load">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">创建排行榜单</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.input(en.setId(null).setField("id2").setAlias("榜单编号"), true)%>
				<%=Popup.input(en.setName(null))%>
				<%=Popup.input(en.setQueue(null))%>
				<%=Popup.input(en.setAddress(null))%>
				<%=Popup.select(en.setField(null), new Object[][] { { "imdb", "imdb" }, { "douban", "douban" }, { "maoyan", "maoyan" } }, false)%>
				<%=Popup.button(en.setId(null))%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function pull(id,time){
	$.ajax({
		type:"post",
		url:"${ROOT}blog/board/pull.htm",
		data:{id:id,time:time},
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
function load(id,name,queue,address,field){
	if(!id){
		$("#load [type='reset']").click();
		$("#load [name='id']").val("");
		$("#load").modal();
		return;
	}
	$("#load [type='reset']").click();
	$("#load [name='id']").val(id);
	$("#load [name='id2']").val(id);
	$("#load [name='name']").val(name);
	$("#load [name='queue']").val(queue);
	$("#load [name='address']").val(address);
	document.getElementsByName("field")[0].value=field;
	$("#load").modal();
}
$(document).ready(function(){
	$("#load select").height($("#load .am-input-group-label").height());
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td><a href=\""+data.address+"\" target=\"_blank\">"+data.id+"</a></td>";
			h+="<td><a href=\"<%=Global.CLOUD%>board/"+data.id+".htm\" target=\"_blank\">"+data.name+"</a></td>";
			h+="<td>"+data.queue+"</td>";
			h+="<td>"+data.field+"</td>";
			h+="<td>"+data.edited+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("gg")%> am-text-secondary\" onclick=\"pull('"+data.id+"','"+data.edited+"')\"> 抓取</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("pencil-square-o")%> am-text-secondary\" onclick=\"load('"+data.id+"','"+data.name+"',"+data.queue+",'"+data.address+"','"+data.field+"')\"> 编辑</a>";
			h+="</div>";
			h+="</td>";
			h+="</tr>";
		}
		$("#j_table tbody").html(h);
	});
	$("#load form").submit(function(){
		var o=$(this);
		var en=new Object();
		en.id=o.find("[name='id']").val();
		en.id2=o.find("[name='id2']").val();
		en.name=o.find("[name='name']").val();
		en.queue=o.find("[name='queue']").val();
		en.address=o.find("[name='address']").val();
		en.field=o.find("[name='field']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}blog/board/save.htm",
			data:en,
			dataType:"json",
			async:false,
			success:function(res){
				o.closest(".am-popup").modal("close");
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