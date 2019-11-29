<%@ page language="java" import="
com.mc.core.entity.blog.Music,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Music en = new Music();
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
		<%=crumb(request, "blog/music/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setName(null), 1)%>
			<%=Search.select(en.setInline(null), new Object[][] { { 1, "是" }, { 0, "否" } })%>
			<%=Search.button(true, true, 7)%>
		</div>
		<%=Search.table(1, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setName(null), en.setInline(null), en.setTrack(null), new Music.Field("文件大小", false, null, null, null, 0, null), new Music.Field("创建时间", false, null, null, null, 0, null))%>
		<%=Search.paging(false, false, new String[][] { { "lead()", icon("clone"), "导入" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-modal am-modal-prompt" id="lead">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">导入音乐文件<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd">音乐的文件夹的名称必须包含国内歌曲或国外歌曲<input type="text" class="am-modal-prompt-input" placeholder="请输入文件路径"></div>
		<div class="am-modal-footer">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
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
				url:"${ROOT}blog/music/lead.htm",
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
			h+="<td><a href=\"<%=Global.CLOUD%>music/index-"+(data.inline?1:0)+".htm?word="+data.name+"\" target=\"_blank\">"+data.name+"</a></td>";
			h+="<td><i class="+(data.inline?"<%=icon("check")%>":"<%=icon("times")%>")+"></i></td>";
			h+="<td>"+data.track+"</td>";
			h+="<td data-am-popover=\"{content:'文件大小："+data.entry[0]+"',trigger:'hover',theme:'sm'}\">"+data.entry[1]+"</td>";
			h+="<td data-am-popover=\"{content:'更新时间："+data.edited+"',trigger:'hover',theme:'sm'}\">"+data.entry[2]+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(['"+data.id+"'])\"> 删除</a>";
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