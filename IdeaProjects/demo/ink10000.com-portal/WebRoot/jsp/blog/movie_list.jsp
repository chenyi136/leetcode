<%@ page language="java" import="
com.mc.core.entity.blog.Movie,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<String, String> catena = (Map<String, String>) request.getAttribute("catena");
PageBody pages = (PageBody) request.getAttribute("pages");
Movie en = new Movie();
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
		<%=crumb(request, "blog/movie/")%>
		<div id="j_search">
			<div class="am-g">
				<%=Search.input(en.setName(null), 1)%>
				<%=Search.input(en.setAlias(null), 1)%>
				<%=Search.input(en.setEnglish(null), 1)%>
				<%=Search.time(en.setScreen(null).setAlias("上映年份"), "YYYY", null, 2)%>
				<%=Search.button(false, false, 1)%>
			</div>
			<div class="am-g am-padding-top-xs">
				<%=Search.input(en.setDirect(null), 1)%>
				<%=Search.input(en.setWriter(null), 1)%>
				<%=Search.input(en.setActor(null), 1)%>
				<%=Search.select(en.setTrash(null), new Object[][] { { 1, "是" }, { 0, "否" } })%>
				<%=Search.button(false, true, 1)%>
			</div>
			<div class="am-g am-padding-top-xs">
				<%=Search.input(en.setStyle(null), 1)%>
				<%=Search.input(en.setZone(null), 1)%>
				<%=Search.input(en.setDouban(null), 1)%>
				<%=Search.select(en.setFkCatena(null).setAlias("所属系列"), catena)%>
				<%=Search.button(true, false, 1)%>
			</div>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setName(null), en.setStyle(null).setNote(null), en.setScreen(null).setNote(null), new Movie.Field("文件大小", false, null, null, null, 0, null), en.setWidth(null), en.setHeight(null), en.setTrack(null), en.setRate(null), en.setJudge(null), en.setScore(null).setAlias("电影评分"))%>
		<%=Search.paging(false, false, new String[][] { { "fresh()", icon("refresh"), "同步" }, { "call()", icon("empire"), "命名" }, { "lead()", icon("clone"), "导入" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<c:import url="${ROOT}global/part.htm?code=popup"/>
<div class="am-modal am-modal-prompt" id="lead">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">导入电影文件<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd">电影文件的父文件夹必须是年份<input type="text" class="am-modal-prompt-input" placeholder="请输入文件路径"></div>
		<div class="am-modal-footer">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function fresh(){
	$.ajax({
		type:"post",
		url:"${ROOT}blog/movie/fresh.htm",
		data:JSON.stringify(JPageParam(1)),
		dataType:"json",
		contentType:"application/json;charset=UTF-8",
		async:false,
		success:function(res){
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
}
function call(){
	$.ajax({
		type:"post",
		url:"${ROOT}blog/movie/name.htm",
		data:JSON.stringify(JPageParam(1)),
		dataType:"html",
		contentType:"application/json;charset=UTF-8",
		async:false,
		success:function(res){
			$("#j_popup .am-popup-title").html("文件命名结果");
			$("#j_popup .am-popup-bd").html(res);
			$("#j_popup").modal();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function lead(){
	$("#lead").modal({
		relatedTarget:this,
		onConfirm:function(n){
			var v=n.data;
			if(!v){
				return;
			}
			$.ajax({
				type:"post",
				url:"${ROOT}blog/movie/lead.htm",
				data:{path:v},
				dataType:"json",
				async:false,
				success:function(res){
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
		},
		onCancel:function(n){}
	});
}
$(document).ready(function(){
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr"+(data.trash?" class=\"am-text-success\"":"")+">";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td data-am-popover=\"{content:'"+JChar(data.name[1])+"',trigger:'hover',theme:'sm'}\"><a href=\"<%=Global.CLOUD%>movie/"+data.id+".htm\" target=\"_blank\">"+data.name[0]+"</a></td>";
			h+="<td>"+data.style+"</td>";
			h+="<td>"+data.screen+"</td>";
			h+="<td data-am-popover=\"{content:'文件大小："+data.length[0]+"',trigger:'hover',theme:'sm'}\">"+data.length[1]+"</td>";
			h+="<td>"+data.width+"</td>";
			h+="<td>"+data.height+"</td>";
			h+="<td>"+data.track+"</td>";
			h+="<td>"+data.rate+"</td>";
			h+="<td>"+data.judge+"</td>";
			h+="<td>"+data.score[0]+" | <a href=\""+data.score[1]+"\" target=\"_blank\">资料</a> | <a href=\""+data.score[2]+"\" target=\"_blank\">豆瓣</a> | <a href=\""+data.score[3]+"\" target=\"_blank\">猫眼</a></td>";
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