<%@ page language="java" import="
com.mc.core.crux.Legal,
com.mc.core.entity.blog.Cloud,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Cloud en = new Cloud();
Object[][] email = new Object[][] {
	{ "1175397344@qq.com", "百度网盘-全部-ABC789051" },
	{ "1138789752@qq.com", "百度网盘-电视-ink10000(AM)" },
	{ "shangerqiusuo@qq.com", "百度网盘-电视-shangerqiusuo(NT)" },
	{ "13141326144", "百度网盘-电视-13141326144(UZ)" },
	{ "T今夜无眠", "百度网盘-动纪-T今夜无眠" },
	{ "1138789752lmc@sina.com", "百度网盘-开放-1123189726" },
	{ "13141326144lmc@sina.com", "百度网盘-外剧-qq1138789752" },
	{ "FORBID", "禁止分享" }
};
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
		<%=crumb(request, "blog/cloud/")%>
		<div id="j_search">
			<div class="am-g">
				<%=Search.input(en.setId(null).setAlias("文件路径"), 1)%>
				<%=Search.input(en.setTitle(null), 1)%>
				<%=Search.select(en.setForbid(null), new Object[][] { { 1, "是" }, { 0, "否" } })%>
				<%=Search.button(false, true, 4)%>
			</div>
			<div class="am-g am-padding-top-xs">
				<%=Search.input(en.setLink(null), 1)%>
				<%=Search.input(en.setCode(null), 0)%>
				<%=Search.select(en.setEmail(null), email)%>
				<%=Search.button(true, false, 4)%>
			</div>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setId(null), en.setEmail(null), en.setCode(null), en.setTitle(null), en.setLength(null), en.setCreated(null))%>
		<%=Search.paging(true, false, new String[][] { { "verify()", icon("check-circle-o"), "检测" }, { "load()", icon("pencil-square-o"), "创建" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-popup j_popup" id="load">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">创建云盘分享</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.input(en.setId(null).setAlias("文件路径"), true)%>
				<%=Popup.select(en.setEmail(null), email, false)%>
				<%=Popup.input(en.setLink(null))%>
				<%=Popup.input(en.setCode(null))%>
				<%=Popup.input(en.setTitle(null))%>
				<%=Popup.input(en.setJump(null))%>
				<%=Popup.input(en.setLength(null).setEmpty(true))%>
				<%=Popup.select(en.setForbid(null), new Object[][] { { 0, "否" }, { 1, "是" } }, false)%>
				<%=Popup.button(null)%>
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
		$("#load [name='id']").removeAttr("readonly");
		$("#load").modal();
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}blog/cloud/load.htm",
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
			$("#load [name='id']").attr("readonly",true).val(id);
			document.getElementsByName("email")[1].value=data.email;
			$("#load [name='link']").val(data.link);
			$("#load [name='code']").val("-");
			$("#load [name='title']").val(data.title);
			$("#load [name='jump']").val(data.jump);
			$("#load [name='length']").val(data.length);
			document.getElementsByName("forbid")[1].value=data.forbid;
			$("#load").modal();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function verify(){
	$.ajax({
		type:"post",
		url:"${ROOT}blog/cloud/verify.htm",
		data:JSON.stringify(JPageParam(JPage.now)),
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
$(document).ready(function(){
	$("#load select").height($("#load .am-input-group-label").height());
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr"+(data.forbid?" class=\"am-text-success\"":"")+">";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td class=\"am-text-left\"><a href=\""+data.link+"\" target=\"_blank\">"+data.id+"</a></td>";
			h+="<td>"+data.email+"</td>";
			h+="<td>"+data.code+"</td>";
			h+="<td class=\"am-text-left\">"+(data.jump?"<a href=\"<%=Global.CLOUD%>"+data.jump+"\" target=\"_blank\">"+data.title+"</a>":data.title)+"</td>";
			h+=data.length[1]?"<td data-am-popover=\"{content:'文件大小："+data.length[0]+"',trigger:'hover',theme:'sm'}\">"+data.length[1]+"</td>":"<td>-</td>";
			h+="<td>"+data.created+"</td>";
			h+="<td>"; 
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(['"+data.id+"'])\"> 删除</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("pencil-square-o")%> am-text-secondary\" onclick=\"load('"+data.id+"')\"> 编辑</a>";
			h+="</div>";
			h+="</td>";
			h+="</tr>";
		}
		$("#j_table tbody").html(h);
	});
	$("#load form").submit(function(){
		var en=new Object();
		en.id=$("#load [name='id']").val();
		en.email=$("#load [name='email']").val();
		en.link=$("#load [name='link']").val();
		en.code=$("#load [name='code']").val();
		en.title=$("#load [name='title']").val();
		en.jump=$("#load [name='jump']").val();
		en.length=$("#load [name='length']").val();
		en.address=$("#load [name='address']").val();
		en.forbid=$("#load [name='forbid']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}blog/cloud/save.htm",
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