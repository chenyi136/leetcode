<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
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
		<div class="am-g am-text-center"><a class="am-btn am-btn-secondary <%=icon("arrows-v")%>" onclick="queue()"> 权限排序</a></div>
		<div class="am-g am-margin-top-xs">
			<div class="am-u-md-6 am-padding-0"><ul class="ztree" id="total"></ul></div>
			<div class="am-u-md-6 am-padding-left-xs am-padding-right-0"><ul class="ztree" id="menu"></ul></div>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/js/plugin/ztree/jquery.ztree.core.min-3.5.21.js"></script>
<script type="text/javascript" src="_/js/plugin/ztree/jquery.ztree.excheck.min-3.5.21.js"></script>
<script type="text/javascript" src="_/js/plugin/ztree/jquery.ztree.exedit.min-3.5.21.js"></script>
<script type="text/javascript">
var total=null;
var datas=[];
function tree(id,data,drag){
	var param={
		view:{nameIsHTML:true,showIcon:false,selectedMulti:false},
		data:{simpleData:{enable:true}},
		check:{enable:true,nocheckInherit:true},
		async:{
			enable:true,
			url:"${ROOT}auth/power/tree.htm",
			autoParam:[],
			otherParam:data
		}
	};
	if(drag){
		param.edit={enable:true,showRemoveBtn:false,showRenameBtn:false};
		param.callback={
			beforeDrag:function(id,nodes){
				for(var i=0;i<nodes.length;i++){
					if(!nodes[i].drag){
						return false;
					}
				}
				return true;
			}
		};
	}
	$.fn.zTree.init($("#"+id),param);
	$.fn.zTree.getZTreeObj(id).setting.check.chkboxType={"Y":"s","N":"s"};
}
function list(nodes){
	if(!nodes||nodes.length<1){
		return;
	}
	for(var i=0;i<nodes.length;i++){
		datas[datas.length]=nodes[i].id;
		list(nodes[i].children);
	}
}
function queue(){
	datas=[];
	list(total.getNodes());
	$.ajax({
		type:"post",
		url:"${ROOT}auth/power/queue.htm",
		data:{ids:datas},
		dataType:"json",
		async:false,
		success:function(res){
			JAlert(res.state);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
$(document).ready(function(){
	tree("total",{"menu":false,"check":false,"drag":true},true);
	tree("menu",{"menu":true,"check":false,"drag":false},false);
	total=$.fn.zTree.getZTreeObj("total");
	total.setting.edit.drag.isCopy=false;
	total.setting.edit.drag.isMove=true;
	total.setting.edit.drag.prev=true;
	total.setting.edit.drag.inner=false;
	total.setting.edit.drag.next=true;
	total.setting.edit.showRenameBtn=false;
	total.setting.edit.showRemoveBtn=false;
	total.setting.edit.renameTitle="权限名称";
	total.setting.edit.removeTitle=null;
});
</script>
</body>
</html>