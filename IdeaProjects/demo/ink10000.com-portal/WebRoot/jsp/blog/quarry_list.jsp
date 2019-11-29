<%@ page language="java" import="
com.mc.core.entity.blog.Quarry,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Quarry en = new Quarry();
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
		<%=crumb(request, "blog/quarry/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setLydq(null), 1)%>
			<%=Search.input(en.setFwdz(null), 1)%>
			<%=Search.input(en.setYmdz(null), 1)%>
			<%=Search.button(true, true, 3)%>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setFwsj(null), en.setLydq(null), en.setRkym(null), en.setFwdz(null), en.setFwsc(null), en.setFwys(null), en.setDksj(null), en.setTlsc(null), en.setYmdz(null))%>
		<%=Search.paging(true, false, new String[][] { { "lead()", icon("clone"), "导入" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-modal am-modal-prompt" id="lead">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">导入百度统计<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd">删除当天、已导入的并另存<a href="https://tongji.baidu.com/web/welcome/login" target="_blank">2003版.xls</a><input type="text" class="am-modal-prompt-input" value="E:\实时访客.xls" placeholder="请输入文件路径"></div>
		<div class="am-modal-footer">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>
<c:import url="${ROOT}global/part.htm?code=popup"/>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function load(id){
	$.ajax({
		type:"post",
		url:"${ROOT}blog/quarry/load.htm",
		data:{id:id},
		dataType:"json",
		success:function(res){
			var h=res.state;
			if(h=="OK"){
				h="";
				var datas=res.data;
				for(var i=0;i<datas.length;i++){
					h+=datas[i][0]+"：<b>"+datas[i][1]+"</b><br>";
				}
			}
			$("#j_popup .am-popup-bd").html(h);
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
				url:"${ROOT}blog/quarry/lead.htm",
				data:{path:v},
				dataType:"json",
				success:function(res){
					JAlert(res.state,10000);
				},
				error:function(r,s,e){
					JAlert(r.status);
				}
			});
		}
	});
}
$(document).ready(function(){
	$("#j_popup .am-popup-title").html("百度统计数据");
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr"+(data.trash?" class=\"am-text-success\"":"")+">";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+data.fwsj+"</td>";
			h+="<td>"+data.lydq+"</td>";
			h+="<td>"+(data.rkym?"<a href=\""+data.rkym+"\" target=\"_blank\">访问</a>":"-")+"</td>";
			h+="<td>"+data.fwdz+"</td>";
			h+="<td>"+data.fwsc+"</td>";
			h+="<td>"+data.fwys+"</td>";
			h+="<td>"+data.dksj+"</td>";
			h+="<td>"+data.tlsc+"</td>";
			h+="<td><a href=\""+data.ymdz+"\" target=\"_blank\">访问</a></td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(['"+data.id+"'])\"> 删除</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("eye")%> am-text-secondary\" onclick=\"load('"+data.id+"')\"> 查看</a>";
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