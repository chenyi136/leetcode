<%@ page language="java" import="
com.mc.core.entity.file.Enroll,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Enroll en = new Enroll();
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
<style type="text/css">
.j_block td{height:28px;line-height:100%;vertical-align:middle;}
.j_block td input{width:100%;height:24px;line-height:100%;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "file/enroll/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setAccount(null), 1)%>
			<%=Search.button(true, true, 9)%>
		</div>
		<%=Search.table(1, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setId(null), en.setAccount(null), en.setVerify(null))%>
		<%=Search.paging(false, false, new String[][] { { "collect()", icon("leanpub"), "汇总" }, { "lead()", icon("clone"), "导入" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-modal am-modal-prompt j_block" id="collect">
	<div style="width:70%;" class="am-modal-dialog">
		<div style="padding-top:5px;" class="am-modal-hd">邮箱汇总统计<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div style="padding-bottom:5px;" class="am-modal-bd">
			<table class="am-table-striped am-table-hover">
				<thead>
					<tr class="am-primary">
						<th>邮箱域名</th>
						<th>统计总数</th>
						<th>邮箱域名</th>
						<th>统计总数</th>
						<th>邮箱域名</th>
						<th>统计总数</th>
						<th>邮箱域名</th>
						<th>统计总数</th>
						<th>邮箱域名</th>
						<th>统计总数</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
		<div class="am-modal-footer"><a class="am-btn am-modal-btn" data-am-modal-confirm>确定</a></div>
	</div>
</div>
<div class="am-modal am-modal-prompt" id="lead">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">导入邮箱地址<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd"><input type="text" class="am-modal-prompt-input" maxlength="80" placeholder="请输入邮箱地址"></div>
		<div class="am-modal-footer">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function collect(){
	var keys=[
		"qq.com","163.com","126.com","yahoo.cn","yahoo.com.cn",
		"sina.com","hotmail.com","sohu.com","gmail.com","139.com",
		"yeah.net","vip.qq.com","tom.com","21cn.com","sina.cn",
		"live.cn","foxmail.com","sina.com.cn","msn.com","189.cn",
		"yahoo.com","eyou.com","vip.sina.com","sogou.com"
	];
	$.ajax({
		type:"post",
		url:"${ROOT}file/enroll/collect.htm",
		data:{keys:keys},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				window.alert(state);
				return;
			}
			var h="";
			var s0="";
			var s1="";
			var datas=res.datas;
			for(var i=0;i<datas.length;i++){
				var data=datas[i];
				if(i%5==0){
					if (i>0){
						h+="</tr>";
					}
					h+="<tr>";
				}
				h+="<td>"+data[0]+"</td>";
				h+="<td>"+data[1]+"</td>";
				s0+=" AND account NOT LIKE '%@"+data[0]+"'";
				s1+=" UNION (SELECT * FROM file_enroll WHERE account LIKE '%@"+data[0]+"' AND account NOT LIKE BINARY '%@"+data[0]+"')";
			}
			if(datas.length%5!=0){
				h+="<td colspan=\""+(15-datas.length%5*2)+"\">&nbsp</td></tr>";
			}
			var total=res.total;
			h+="<tr><td colspan=\"10\"><input value=\"SELECT COUNT(id) FROM file_enroll "+s0.substring(4)+";"+s1.substring(7)+";\" readonly=\"readonly\" onclick=\"javascript:$(this).select();\"></td></tr>";
			h+="<tr><td colspan=\"5\">数据总数："+total[0]+"</td><td colspan=\"5\">分组统计："+total[1]+"</td></tr>";
			$("#collect tbody").html(h);
			$("#collect").modal();
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
				url:"${ROOT}file/enroll/lead.htm",
				data:{account:v},
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
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+data.id+"</td>";
			h+="<td>"+data.account+"</td>";
			h+="<td>"+data.verify+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(["+data.id+"])\"> 删除</a>";
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