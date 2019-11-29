<%@ page language="java" import="
java.util.LinkedHashMap,
com.mc.core.entity.auth.Account,
com.mc.core.entity.auth.Group,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Map<Integer, String> datas = new LinkedHashMap<Integer, String>();
for (Group temp : Global.GROUP.values()) {
	if (temp.getForbid()) {
		continue;
	}
	datas.put(temp.getId(), temp.getName());
}
Account en = new Account();
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/js/plugin/ztree/css/zTreeStyle/zTreeStyle.css">
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head${KEY_JUMP_CACHE}"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu${KEY_JUMP_CACHE}"/>
	<div id="j_right">
		<%=crumb(request, "auth/account/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setUsername(null), 1)%>
			<%=Search.input(en.setName(null), 1)%>
			<%=Search.select(en.setFkGroup(null).setAlias("所属群组"), datas, 0)%>
			<%=Search.button(true, true, 4)%>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), true, en.setUsername(null), en.setEmail(null), en.setName(null), en.setFkGroup(null), en.setLocked(null), en.setCreated(null))%>
		<%=Search.paging(false, true, null, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy${KEY_JUMP_CACHE}"/>
		<c:import url="${ROOT}global/part.htm?code=modal"/>
	</div>
</div>
<script type="text/javascript" src="_/js/plugin/ztree/jquery.ztree.core.min-3.5.21.js"></script>
<script type="text/javascript" src="_/js/plugin/ztree/jquery.ztree.excheck.min-3.5.21.js"></script>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function power(id,username){
	$.ajax({
		type:"post",
		url:"${ROOT}auth/account/power.htm",
		data:{id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			var entry=res.entry;
			var param={
				view:{nameIsHTML:true,showIcon:false,selectedMulti:false},
				data:{simpleData:{enable:true}},
				check:{enable:true,nocheckInherit:true},
				async:{
					enable:true,
					url:"${ROOT}auth/power/tree.htm",
					autoParam:[],
					otherParam:{"menu":false,"check":true,"drag":false},
					dataFilter:function(id,parent,nodes){
						if(!entry||entry.length<1){
							return nodes;
						}
						var temp=entry.toString().replace(/\"/g,"");
						for(var i=0;i<nodes.length;i++){
							nodes[i].checked=temp.indexOf(","+nodes[i].id+",")!=-1;
						}
						return nodes;
					}
				}
			};
			$.fn.zTree.init($("#power"),param);
			$.fn.zTree.getZTreeObj("power").setting.check.chkboxType={"Y":"s","N":"s"};
			$("#j_modal").modal({
				closeViaDimmer:0,
				width:380,
				height:"500"
			});
			window.setTimeout(function(){
				$("#j_modal h4").html("用户（"+username+"）有"+$.fn.zTree.getZTreeObj("power").getCheckedNodes().length+"个权限");
			},500);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
$(document).ready(function(){
	$("#j_modal .am-modal-bd").html("<ul style=\"height:440px;\" class=\"ztree\" id=\"power\"></ul>");
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+=data.face!="javascript:;"?"<td class=\"am-gallery-item\">"+data.username+" <img src=\"_/my/i/image.jpg\" alt=\""+data.username+"\" data-rel=\""+data.face+"\"></td>":"<td>"+data.username+"</td>";
			h+="<td>"+data.email+"</td>";
			h+="<td>"+data.name+"</td>";
			h+="<td>"+data.fkGroup+"</td>";
			h+="<td><i class="+(data.locked?"<%=icon("check")%>":"<%=icon("times")%>")+"></i></td>";
			h+="<td data-am-popover=\"{content:'更新时间："+data.created[1]+"',trigger:'hover',theme:'sm'}\">"+data.created[0]+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("eye")%> am-text-secondary\" onclick=\"power('"+data.id+"','"+data.username+"')\"> 权限</a>";
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