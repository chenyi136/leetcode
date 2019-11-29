<%@ page language="java" import="
com.mc.core.entity.auth.Feedback,
com.mc.core.tool.TimeTool,
com.mc.portal.pojo.OnlineInfo" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<Feedback> datas = (List<Feedback>) request.getAttribute("datas");
@SuppressWarnings("unchecked")
Map<String, OnlineInfo> cache = (Map<String, OnlineInfo>) request.getAttribute("cache");
Boolean manager = (Boolean) request.getAttribute("manager");
Boolean solve = (Boolean) request.getAttribute("solve");
Feedback en = new Feedback();
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "feedback/")%>
		<div class="am-g am-u-md-12 am-padding-0">
			<div class="am-input-group">
				<%if (manager) {%><b class="am-input-group-btn"><a href="feedback/index.htm?solve=1" class="am-btn am-btn-default <%=icon("check-circle-o")%>"> 待解决的</a></b><%}%>
				<input type="text" class="am-form-field" maxlength="2000" placeholder="请描述您遇到的问题或分享您的想法" onkeydown="javascript:if(event.keyCode==13){JFeedback(this);}">
				<b class="am-input-group-btn"><a class="am-btn am-btn-default <%=icon("send-o")%>" onclick="JFeedback($(this).closest('.am-input-group').find('input'));"></a></b>
			</div>
			<ul class="am-margin-0 am-comments-list">
			<%
				if (datas.size() > 0) {
					for (Feedback data : datas) {
						if (data.getProject().intValue() == 2) {
							data.setAddress(Global.CLOUD + data.getAddress());
						}
						OnlineInfo temp = cache.get(data.getFkAccount());
						out.print("<li class=\"am-comment\" id=\"f" + data.getId() + "\">");
						out.print("<img src=\"" + temp.face + "\" style=\"width:48px;height:48px;\" class=\"am-comment-avatar\">");
						out.print("<div class=\"am-comment-main\">");
						out.print("<header class=\"am-comment-hd\"><div class=\"am-comment-meta\"><a class=\"am-comment-author\">" + temp.name + "</a> 评论于 " + TimeTool.getTime(data.getCreated(), null) + "</div></header>");
						out.print("<div class=\"am-comment-bd\"><p>" + data.getContent() + "（源页面：<a href=\"" + data.getAddress() + "\" target=\"_blank\">" + data.getAddress() + "</a>）" + (data.getAdopt() ? "<a class=\"am-margin-right-xs am-badge am-badge-primary am-round\">已采纳</a>" : "") + "<a class=\"am-badge am-badge-warning am-round\" data-am-popover=\"{content:'" + (!data.doIsEmpty(data.getReply()) ? replace(data.getReply()) : "暂未回复") + "',trigger:'hover',theme:'sm'}\"" + (manager ? " onclick=\"load(" + data.getId() + ")\"" : "") + ">" + (data.getSolve() ? "已解决" : "待解决") + "</a>" + (manager ? " <a class=\"am-badge am-badge-danger am-round\" onclick=\"drop(" + data.getId() + ")\">删除</a>" : "") + "</p></div>");
						out.print("</div>");
						out.print("</li>");
					}
				}
				out.print(datas.size() >= 3 ? "<li class=\"am-text-center\" id=\"f0\"><a class=\"am-text-warning\" onclick=\"list()\">加载更多</a></li>" : "<li class=\"am-text-center\">加载完了</li>");
			%>
			</ul>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-popup" id="load">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">回复意见反馈</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.textarea(en.setContent(null), 150, true, true)%>
				<%=Popup.input(en.setAddress(null), false, true)%>
				<%=Popup.select(en.setSolve(null), new Object[][] { { 1, "是" }, { 0, "否" } }, false)%>
				<%=Popup.select(en.setAdopt(null), new Object[][] { { 1, "是" }, { 0, "否" } }, false)%>
				<%=Popup.textarea(en.setReply(null), 180)%>
				<%=Popup.input(en.setCreated(null), false, true)%>
				<%=Popup.button(en.setId(null))%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
var next=<%=datas.size() >= 3 ? datas.get(2).getId() : null%>;
function load(id){
	$.ajax({
		type:"post",
		url:"${ROOT}feedback/index.htm",
		data:{type:"load",id:id},
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
			$("#load [name='content']").val(data.content);
			$("#load [name='address']").val(data.address);
			document.getElementsByName("solve")[0].value=data.solve;
			document.getElementsByName("adopt")[0].value=data.adopt;
			$("#load [name='reply']").val(data.reply);
			$("#load [name='created']").val(data.created);
			$("#load").modal();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function drop(id){
	if(!window.confirm("确认删除吗？")){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}feedback/index.htm",
		data:{type:"drop",id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			$("#f"+id).closest(".am-comment").hide(250);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function list(){
	if(!next){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}feedback/index.htm",
		data:{type:"list",solve:<%=solve%>,id:next},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state=="NO"){
				$("#f0").html("加载完了");
				next=null;
				return;
			}
			if(state!="OK"){
				JAlert(state);
				return;
			}
			var datas=res.datas;
			var h="";
			for(var i=0;i<datas.length;i++){
				var data=datas[i];
				h+="<li class=\"am-comment\" id=\"f"+data.id+"\">";
				h+="<img src=\""+data.fkAccount.face+"\" style=\"width:48px;height:48px;\" class=\"am-comment-avatar\">";
				h+="<div class=\"am-comment-main\">";
				h+="<header class=\"am-comment-hd\"><div class=\"am-comment-meta\"><a class=\"am-comment-author\">"+data.fkAccount.name+"</a> 评论于 "+data.created+"</div></header>";
				h+="<div class=\"am-comment-bd\"><p>"+data.content+"（源页面：<a href=\""+data.address+"\" target=\"_blank\">"+data.address+"</a>）"+(data.adopt?"<a class=\"am-margin-right-xs am-badge am-badge-primary am-round\">已采纳</a>":"")+"<a class=\"am-badge am-badge-warning am-round\" data-am-popover=\"{content:'"+(data.reply?JChar(data.reply):"暂未回复")+"',trigger:'hover',theme:'sm'}\""+(<%=manager%>?" onclick=\"load("+data.id+")\"":"")+">"+(data.solve?"已解决":"待解决")+"</a>"+(<%=manager%>?" <a class=\"am-badge am-badge-danger am-round\" onclick=\"drop("+data.id+")\">删除</a>":"")+"</p></div>";
				h+="</div>";
				h+="</li>";
			}
			$("#f0").before(h);
			$(".am-comments-list a[data-am-popover]").popover();
			next=datas[datas.length-1].id;
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
$(document).ready(function(){
	$("#load select").height($("#load .am-input-group-label").height());
	$("#load form").submit(function(){
		var en=new Object();
		en.type="reply";
		en.id=$("#load [name='id']").val();
		en.solve=$("#load [name='solve']").val();
		en.adopt=$("#load [name='adopt']").val();
		en.reply=$("#load [name='reply']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}feedback/index.htm",
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
				if(en.adopt=="1"){
					if(!$("#f"+en.id+" .am-badge-primary").length){
						$("#f"+en.id+" .am-badge-warning").before("<a class=\"am-margin-right-xs am-badge am-badge-primary am-round\">已采纳</a>");
					}
				}else{
					$("#f"+en.id+" .am-badge-primary").remove();
				}
				$("#f"+en.id+" .am-badge-warning").text(en.solve=="1"?"已解决":"待解决");
				$("#f"+en.id+" .am-badge-warning").popover("setContent",en.reply?JChar(en.reply):"暂未回复");
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