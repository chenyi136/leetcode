<%@ page language="java" import="
com.mc.core.entity.blog.Sexy,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Sexy en = new Sexy();
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
		<%=crumb(request, "blog/sexy/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setName(null), 1)%>
			<%=Search.input(en.setAddress(null), 1)%>
			<%=Search.button(true, true, 6)%>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setAddress(null), en.setName(null), en.setLength(null), en.setWidth(null), en.setHeight(null), en.setCode(null))%>
		<%=Search.paging(false, false, new String[][] { { "lead()", icon("clone"), "导入" }, { "code()", icon("key"), "密码" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<c:import url="${ROOT}global/part.htm?code=popup"/>
<div class="am-modal am-modal-prompt" id="lead">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">导入开放视频<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd">加密压缩文件必须与原始视频文件存放在同一目录下<input type="text" class="am-modal-prompt-input" placeholder="请输入文件路径"></div>
		<div class="am-modal-footer">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>
<div class="am-modal am-modal-prompt" id="code">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">计算文件密码<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd">文件名称必须以摘要算法进行命名<input type="text" class="am-modal-prompt-input" placeholder="请输入文件路径"></div>
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
				url:"${ROOT}blog/sexy/lead.htm",
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
function code(){
	$("#code").modal({
		relatedTarget:this,
		onConfirm:function(n){
			var v=n.data;
			if(!v){
				return;
			}
			$.ajax({
				type:"post",
				url:"${ROOT}blog/sexy/code.htm",
				data:{path:v},
				dataType:"html",
				async:false,
				success:function(res){
					$("#j_popup .am-popup-title").html("文件密码结果");
					$("#j_popup .am-popup-bd").html(res);
					$("#j_popup").modal();
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
	$(".am-popup select").height($(".am-popup .am-input-group-label").height());
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+data.address+"</td>";
			h+="<td>"+data.name+"</td>";
			h+="<td data-am-popover=\"{content:'文件大小："+data.length[0]+"',trigger:'hover',theme:'sm'}\">"+data.length[1]+"</td>";
			h+="<td>"+data.width+"</td>";
			h+="<td>"+data.height+"</td>";
			h+="<td>"+data.code+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(['"+data.id+"'])\"> 删除</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("pencil-square-o")%> am-text-secondary\" onclick=\"load('"+data.id+"','"+data.address+"',"+data.groom+")\"> 编辑</a>";
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