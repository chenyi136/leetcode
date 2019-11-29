<%@ page language="java" import="
com.mc.core.crux.Legal,
com.mc.core.entity.blog.Catena,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Catena en = new Catena();
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
		<%=crumb(request, "blog/catena/")%>
		<div id="j_search">
			<div class="am-g">
				<%=Search.input(en.setName(null), 1)%>
				<%=Search.input(en.setEnglish(null), 1)%>
				<%=Search.input(en.setAlias(null), 1)%>
				<%=Search.select(en.setFinish(null), new Object[][] { { 0, "否" }, { 1, "是" } })%>
				<%=Search.button(false, false, 1)%>
			</div>
			<div class="am-g am-padding-top-xs">
				<%=Search.input(en.setStyle(null), 1)%>
				<%=Search.input(en.setZone(null), 1)%>
				<%=Search.input(en.setDouban(null), 1)%>
				<%=Search.select(en.setPlay(null), new Object[][] { { 0, "否" }, { 1, "是" } })%>
				<%=Search.button(false, true, 1)%>
			</div>
			<div class="am-g am-padding-top-xs">
				<%=Search.input(en.setAddress(null), 1)%>
				<%=Search.input(en.setDirect(null), 1)%>
				<%=Search.input(en.setGroom(null), 1)%>
				<%=Search.select(en.setType(null), Legal.BLOG_CATENA_TYPE)%>
				<%=Search.button(true, false, 1)%>
			</div>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setName(null), en.setType(null), en.setAddress(null), en.setWidth(null), en.setHeight(null), en.setTotal(null), en.setScreen(null).setNote(null), en.setJudge(null), en.setScore(null), en.setQueue(null), en.setFinish(null))%>
		<%=Search.paging(false, false, new String[][] { { "fresh()", icon("refresh"), "同步" }, { "blog/catena/task.htm", icon("tasks"), "任务" }, { "call()", icon("empire"), "命名" }, { "load()", icon
		("pencil-square-o"), "创建" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<c:import url="${ROOT}global/part.htm?code=popup"/>
<div id="load">
	<div class="am-popup j_popup">
		<div class="am-popup-inner">
			<div class="am-popup-hd">
				<h4 class="am-popup-title">创建视频系列</h4>
				<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
			</div>
			<div class="am-popup-bd">
				<form>
					<%=Popup.select(en.setType(null), Legal.BLOG_CATENA_TYPE, true)%>
					<%=Popup.input(en.setName(null))%>
					<%=Popup.select(en.setPlay(null), new Object[][] { { 0, "否" }, { 1, "是" } }, false)%>
					<%=Popup.button(en.setId(null))%>
				</form>
			</div>
		</div>
	</div>
	<div class="am-popup j_popup">
		<div class="am-popup-inner">
			<div class="am-popup-hd">
				<h4 class="am-popup-title">创建视频系列</h4>
				<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
			</div>
			<div class="am-popup-bd">
				<form>
					<input type="hidden" name="play">
					<input type="hidden" name="type">
					<%=Popup.input(en.setType(null).setField("type1"), true, true)%>
					<%=Popup.input(en.setName(null))%>
					<%=Popup.select(en.setFinish(null), new Object[][] { { 0, "否" }, { 1, "是" } }, false)%>
					<%=Popup.button(en.setId(null))%>
				</form>
			</div>
		</div>
	</div>
	<div style="height:630px;overflow:scroll-y;" class="am-popup j_popup">
		<div class="am-popup-inner">
			<div class="am-popup-hd">
				<h4 class="am-popup-title">创建视频系列</h4>
				<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
			</div>
			<div class="am-popup-bd">
				<form>
					<input type="hidden" name="play">
					<input type="hidden" name="type">
					<%=Popup.input(en.setType(null).setField("type1"), true, true)%>
					<%=Popup.input(en.setName(null))%>
					<%=Popup.select(en.setFinish(null), new Object[][] { { 0, "否" }, { 1, "是" } }, false)%>
					<%=Popup.input(en.setAddress(null).setEmpty(false))%>
					<%=Popup.input(en.setWidth(null).setEmpty(false))%>
					<%=Popup.input(en.setHeight(null).setEmpty(false))%>
					<%=Popup.select(en.setSorted(null), new Object[][] { { 1, "升级" }, { 0, "降序" } }, false)%>
					<%=Popup.input(en.setTotal(null))%>
					<%=Popup.input(en.setEnglish(null))%>
					<%=Popup.input(en.setZone(null).setEmpty(false).setNote(null))%>
					<%=Popup.time(en.setScreen(null).setEmpty(false), null, null)%>
					<%=Popup.textarea(en.setBrief(null).setEmpty(false), 120)%>
					<%=Popup.input(en.setScore(null).setEmpty(false))%>
					<%=Popup.input(en.setDouban(null).setEmpty(false))%>
					<%=Popup.input(en.setGroom(null))%>
					<%=Popup.button(en.setId(null))%>
				</form>
			</div>
		</div>
	</div>
	<div style="height:630px;overflow:scroll-y;" class="am-popup j_popup">
		<div class="am-popup-inner">
			<div class="am-popup-hd">
				<h4 class="am-popup-title">创建视频系列</h4>
				<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
			</div>
			<div class="am-popup-bd">
				<form>
					<input type="hidden" name="play">
					<input type="hidden" name="type">
					<%=Popup.input(en.setType(null).setField("type1"), true, true)%>
					<%=Popup.input(en.setName(null))%>
					<%=Popup.select(en.setFinish(null), new Object[][] { { 0, "否" }, { 1, "是" } }, false)%>
					<%=Popup.input(en.setAddress(null).setEmpty(false))%>
					<%=Popup.input(en.setWidth(null).setEmpty(false))%>
					<%=Popup.input(en.setHeight(null).setEmpty(false))%>
					<%=Popup.select(en.setSorted(null), new Object[][] { { 1, "升级" }, { 0, "降序" } }, false)%>
					<%=Popup.input(en.setTotal(null))%>
					<%=Popup.input(en.setEnglish(null))%>
					<%=Popup.input(en.setZone(null).setEmpty(false).setNote(null))%>
					<%=Popup.time(en.setScreen(null).setEmpty(false), null, null)%>
					<%=Popup.textarea(en.setBrief(null).setEmpty(false), 120)%>
					<%=Popup.input(en.setScore(null).setEmpty(false))%>
					<%=Popup.input(en.setDouban(null).setEmpty(false))%>
					<%=Popup.input(en.setGroom(null))%>
					<%=Popup.input(en.setFolder(null).setEmpty(false))%>
					<%=Popup.input(en.setAttach(null))%>
					<%=Popup.input(en.setQueue(null).setEmpty(false))%>
					<%=Popup.button(en.setId(null))%>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function load(id){
	if(!id){
		$("#load .am-popup:eq(0) [type='reset']").click();
		$("#load .am-popup:eq(0) [name='id']").val("");
		$("#load .am-popup:eq(0)").modal();
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}blog/catena/load.htm",
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
			var key=1;
			if(data.type[0]!="CINE"){
				key=data.play?3:2;
			}
			$("#load .am-popup:eq("+key+") [type='reset']").click();
			$("#load .am-popup:eq("+key+") [name='id']").val(id);
			$("#load .am-popup:eq("+key+") [name='play']").val(data.play);
			$("#load .am-popup:eq("+key+") [name='type']").val(data.type[0]);
			$("#load .am-popup:eq("+key+") [name='type1']").val(data.type[1]);
			$("#load .am-popup:eq("+key+") [name='name']").val(data.name);
			document.getElementsByName("finish")[key].value=data.finish;
			$("#load .am-popup:eq("+key+") [name='address']").val(data.address);
			$("#load .am-popup:eq("+key+") [name='width']").val(data.width);
			$("#load .am-popup:eq("+key+") [name='height']").val(data.height);
			if(key>1){
				document.getElementsByName("sorted")[key-2].value=data.sorted;
			}
			$("#load .am-popup:eq("+key+") [name='total']").val(data.total);
			$("#load .am-popup:eq("+key+") [name='english']").val(data.english);
			var zone=$("#load .am-popup:eq("+key+") [name='zone']");
			if(data.type[0]=="WARD"){
				zone.parent("div").show();
				zone.attr("required",true).val(data.zone);
			}else{
				zone.parent("div").hide();
				zone.removeAttr("required");
			}
			$("#load .am-popup:eq("+key+") [name='screen']").val(data.screen);
			$("#load .am-popup:eq("+key+") [name='brief']").val(data.brief);
			$("#load .am-popup:eq("+key+") [name='score']").val(data.score);
			$("#load .am-popup:eq("+key+") [name='douban']").val(data.douban);
			$("#load .am-popup:eq("+key+") [name='groom']").val(data.groom);
			$("#load .am-popup:eq("+key+") [name='folder']").val(data.folder);
			if(data.attach){
				$("#load .am-popup:eq("+key+") [name='attach']").val(data.attach.replace(/&quot;/g,"\"").replace(/&apos;/g,"'"));
			}
			$("#load .am-popup:eq("+key+") [name='queue']").val(data.queue);
			$("#load .am-popup:eq("+key+")").modal();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function fresh(){
	$.ajax({
		type:"post",
		url:"${ROOT}blog/catena/fresh.htm",
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
		url:"${ROOT}blog/catena/name.htm",
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
$(document).ready(function(){
	$("#load select").height($("#load .am-input-group-label").height());
	$("#load .am-popup [name='zone']").parent("div").hide();
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td data-am-popover=\"{content:'"+JChar(data.type[2])+"',trigger:'hover',theme:'sm'}\"><a href=\"<%=Global.CLOUD%>catena/"+data.id+".htm\" target=\"_blank\">"+data.name+"</a></td>";
			h+="<td>"+data.type[1]+"</td>";
			h+="<td class=\"am-text-left\">"+data.address+"</td>";
			h+="<td>"+data.width+"</td>";
			h+="<td>"+data.height+"</td>";
			h+="<td><i class=\""+(data.sorted? "am-icon-long-arrow-up" : "am-icon-long-arrow-down")+"\"> "+data.total+"</i></td>";
			h+="<td>"+data.screen+"</td>";
			h+="<td>"+data.judge+"</td>";
			h+="<td>"+(data.douban?data.score+"分 | <a href=\""+data.douban+"\" target=\"_blank\">豆瓣</a>":data.score+"分")+"</td>";
			h+="<td>"+(data.play?"<a href=\"<%=Global.CLOUD%>player/index.htm?word="+data.name+"\" target=\"_blank\">"+data.queue+"</a>":data.queue)+"</td>";
			h+="<td><i class="+(data.finish?"<%=icon("check")%>":"<%=icon("times")%>")+"></i></td>";
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
		var o=$(this);
		var en=new Object();
		en.id=o.find("[name='id']").val();
		en.play=o.find("[name='play']").val();
		en.type=o.find("[name='type']").val();
		en.name=o.find("[name='name']").val();
		en.finish=o.find("[name='finish']").val();
		en.address=o.find("[name='address']").val();
		en.width=o.find("[name='width']").val();
		en.height=o.find("[name='height']").val();
		en.sorted=o.find("[name='sorted']").val();
		en.total=o.find("[name='total']").val();
		en.english=o.find("[name='english']").val();
		en.zone=o.find("[name='zone']").val();
		en.screen=o.find("[name='screen']").val();
		en.score=o.find("[name='score']").val();
		en.brief=o.find("[name='brief']").val();
		en.douban=o.find("[name='douban']").val();
		en.groom=o.find("[name='groom']").val();
		en.folder=o.find("[name='folder']").val();
		en.attach=o.find("[name='attach']").val();
		en.queue=o.find("[name='queue']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}blog/catena/save.htm",
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