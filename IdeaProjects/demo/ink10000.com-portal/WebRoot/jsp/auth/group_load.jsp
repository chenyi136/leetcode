<%@ page language="java" import="com.mc.core.entity.auth.Group" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%Group pages = (Group) request.getAttribute("pages");%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, pages.getName())%></title>
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
		<form class="am-g am-form am-form-horizontal" action="auth/group/save.htm" method="post" id="j_form">
			<div class="am-u-md-6">
				<%=Form.input(pages.setName(null), pages.getName())%>
				<%=Form.input(pages.setTotal(null).setField(null), pages.getTotal())%>
				<%=Form.radio(pages.setForbid(null), new String[] { "是", "否" }, pages.getForbid() != null ? pages.getForbid() : false)%>
				<%=Form.button(request, pages.setId(null), pages.getId(), new String[][] { { pages.setEntry(null).ClazzFieldName, pages.getEntry() != null ? pages.getEntry().replace("\"", "'") : "[]" }, { pages.setTotal(null).ClazzFieldName, String.valueOf(pages.getTotal() != null ? pages.getTotal() : 0) }, { "clear", "NO" } })%>
			</div>
			<div class="am-u-md-6">
				<div class="am-form-group am-form-success am-form-icon am-form-feedback">
					<div class="am-u-md-3 am-form-label am-text-right"><%=pages.setEntry(null).getAlias()%></div>
					<div class="am-u-md-9"><ul style="height:200px;" class="ztree" id="entry"></ul></div>
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
var forbid=<%=pages.getForbid() != null && pages.getForbid() ? 1 : 0%>;
$(document).ready(function(){
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
				var entry=<%=pages.getEntry()%>;
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
	$.fn.zTree.init($("#entry"),param);
	$.fn.zTree.getZTreeObj("entry").setting.check.chkboxType={"Y":"s","N":"s"};
	var root=$.fn.zTree.getZTreeObj("entry");
	$("#j_form").submit(function(){
		var nodes=root.getCheckedNodes();
		if(!nodes||nodes.length<1){
			JAlert("请先选择权限");
			return false;
		}
		var clear="NO";
		if($("#j_form [name='forbid']:checked").val()!=forbid){
			clear="OK";
		}
		var entry=[];
		for(var i=0;i<nodes.length;i++){
			entry[entry.length]=nodes[i].id;
		}
		var length=entry.length;
		entry=JSON.stringify(entry).replace(/\"/g,"'");
		if($("#j_form [name='entry']").val()!=entry){
			$("#j_form [name='entry']").val(entry);
			$("#j_form [name='total']").val(length);
			clear="OK";
		}
		$("#j_form [name='clear']").val(clear);
	});
});
</script>
</body>
</html>