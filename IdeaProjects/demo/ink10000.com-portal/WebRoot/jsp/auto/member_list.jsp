<%@ page language="java" import="
com.mc.core.entity.auto.Member,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Member en = new Member();
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
		<%=crumb(request, "auto/member/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setFkAccount(null).setAlias("成员名称"), 2) %>
			<%=Search.select(en.setGrade(null), new Object[][] { { Long.MAX_VALUE, "持有者" }, { System.currentTimeMillis(), "参与者" }, { 0, "游客" } })%>
			<%=Search.button(true, true, 7)%>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), new Member.Field("成员名称", false, null, null, null, 0, null), en.setGrade(null), en.setCreated(null))%>
		<%=Search.paging(true, false, new String[][] { { "JPageUser('radio',save)", icon("user-plus"), "成员" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<c:import url="${ROOT}global/part.htm?code=user"/>
<div class="am-modal am-modal-prompt" id="grade">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">设置成员等级<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd">
			<input type="hidden" name="id">
			<input type="radio" value="0" name="grade"> 游客
			<input type="radio" value="<%=System.currentTimeMillis()%>" checked="checked" name="grade"> 参与者
			<input type="radio" value="<%=Long.MAX_VALUE%>" name="grade"> 持有者（转让空间）
		</div>
		<div class="am-modal-footer">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function grade(id,grade){
	$("#grade [name='id']").val(id);
	$("#grade [name='grade'][value='"+grade+"']").attr("checked",true);
	$("#grade").modal({
		relatedTarget:this,
		onConfirm:function(n){
			var grade=$("#grade [name='grade']:checked").val();
			if(grade=="<%=Long.MAX_VALUE%>"&&!window.confirm("确认要转让空间吗")){
				return;
			}
			$.ajax({
				type:"post",
				url:"${ROOT}auto/member/grade.htm",
				data:{grade:grade,fkAccount:$("#grade [name='id']").val()},
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
function save(ids){
	if(ids.length<1){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/member/save.htm",
		data:{fkAccount:ids[0]},
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
}
$(document).ready(function(){
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+data.fkAccount+"</td>";
			h+="<td>"+data.grade[1]+"</td>";
			h+="<td>"+data.created+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(["+data.id+"])\"> 删除</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("street-view")%>\" onclick=\"grade("+data.id+","+data.grade[0]+")\"> 等级</a>";
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