<%@ page language="java" import="
java.util.LinkedHashMap,
com.mc.core.entity.auth.Account,
com.mc.core.entity.auth.Group" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, String> group = (Map<Integer, String>) request.getAttribute("group");
Account pages = (Account) request.getAttribute("pages");
Map<Integer, String> datas = new LinkedHashMap<Integer, String>();
for (Group temp : Global.GROUP.values()) {
	if (temp.getForbid()) {
		continue;
	}
	datas.put(temp.getId(), temp.getName());
}
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, pages.getName(), pages.getUsername())%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/js/plugin/ztree/css/zTreeStyle/zTreeStyle.css">
	<link rel="stylesheet" type="text/css" href="_/my/jform.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<form class="am-g am-form am-form-horizontal" action="auth/account/save.htm" method="post" id="j_form">
			<div class="am-u-md-6">
				<%=pages.getUsername() != null ? Form.input(pages.setUsername(null).setField(null), pages.getUsername()) : Form.input(pages.setUsername(null), null)%>
				<%=Form.input(pages.setName(null), pages.getName())%>
				<%=Form.input(pages.getId() == null ? pages.setPassword(null).setLength(20).setNote(null) : pages.setPassword(null).setEmpty(true).setLength(20).setNote(null), "password", null, null)%>
			</div>
			<div class="am-u-md-6">
				<%=Form.radio(pages.setLocked(null), new String[] { "是", "否" }, pages.getLocked() != null ? pages.getLocked() : false)%>
				<%=Form.select(pages.setFkGroup(null), pages.getFkGroup(), datas)%>
				<%=Form.button(request, pages.setId(null), pages.getId(), new String[][] { { pages.setUsername(null).ClazzFieldName, pages.getUsername() }, { pages.setPermit(null).ClazzFieldName, pages.getPermit() != null ? pages.getPermit().replace("\"", "'") : "[]" }, { pages.setForbid(null).ClazzFieldName, pages.getForbid() != null ? pages.getForbid().replace("\"", "'") : "[]" }, { "clear", "NO" } })%>
			</div>
			<div class="am-u-md-6">
				<div class="am-form-group am-form-success am-form-icon am-form-feedback">
					<div class="am-u-md-3 am-form-label am-text-right"><%=pages.setPermit(null).getAlias()%></div>
					<div class="am-u-md-9"><ul style="height:200px;" class="ztree" id="permit"></ul></div>
				</div>
			</div>
			<div class="am-u-md-6 am-margin-top-xs">
				<div class="am-form-group am-form-success am-form-icon am-form-feedback">
					<div class="am-u-md-3 am-form-label am-text-right"><%=pages.setForbid(null).getAlias()%></div>
					<div class="am-u-md-9"><ul style="height:195px;" class="ztree" id="forbid"></ul></div>
				</div>
			</div>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/js/plugin/ztree/jquery.ztree.core.min-3.5.21.js"></script>
<script type="text/javascript" src="_/js/plugin/ztree/jquery.ztree.excheck.min-3.5.21.js"></script>
<script type="text/javascript" src="_/my/jform.js"></script>
<script type="text/javascript">
var name="<%=pages.getName() != null ? pages.getName() : ""%>";
function tree(id,entry){
	var param={
		view:{nameIsHTML:true,showIcon:false,selectedMulti:false},
		data:{simpleData:{enable:true}},
		check:{enable:true,nocheckInherit:true},
		async:{
			enable:true,
			url:"${ROOT}auth/power/tree.htm",
			autoParam:[],
			otherParam:{"menu":false,"check":false,"drag":false},
			dataFilter:function(id,parent,nodes){
				if(!entry||entry.length<1){
					return nodes;
				}
				var temp=","+entry.toString().replace(/\"/g,"")+",";
				for(var i=0;i<nodes.length;i++){
					nodes[i].checked=temp.indexOf(","+nodes[i].id+",")!=-1;
				}
				return nodes;
			}
		}
	};
	$.fn.zTree.init($("#"+id),param);
	$.fn.zTree.getZTreeObj(id).setting.check.chkboxType={"Y":"s","N":"s"};
}
$(document).ready(function(){
	tree("permit",<%=pages.getPermit()%>);
	tree("forbid",<%=pages.getForbid()%>);
	var permit=$.fn.zTree.getZTreeObj("permit");
	var forbid=$.fn.zTree.getZTreeObj("forbid");
	$("#j_form").submit(function(){
		var clear="NO";
		if($("#j_form [name='name']").val()!=name){
			clear="HEAD";
		}
		var nodes=permit.getCheckedNodes();
		var entry=[];
		if(nodes&&nodes.length>0){
			for(var i=0;i<nodes.length;i++){
				entry[entry.length]=nodes[i].id;
			}
		}
		entry=JSON.stringify(entry).replace(/\"/g,"'");
		if($("#j_form [name='permit']").val()!=entry){
			$("#j_form [name='permit']").val(entry);
			clear="OK";
		}
		nodes=forbid.getCheckedNodes();
		entry=[];
		if(nodes&&nodes.length>0){
			for(var i=0;i<nodes.length;i++){
				entry[entry.length]=nodes[i].id;
			}
		}
		entry=JSON.stringify(entry).replace(/\"/g,"'");
		if($("#j_form [name='forbid']").val()!=entry){
			$("#j_form [name='forbid']").val(entry);
			clear="OK";
		}
		$("#j_form [name='clear']").val(clear);
	});
});
</script>
</body>
</html>