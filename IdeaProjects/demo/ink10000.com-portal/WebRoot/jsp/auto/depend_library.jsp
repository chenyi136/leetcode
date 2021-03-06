<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/js/plugin/ztree/css/zTreeStyle/zTreeStyle.css">
<style type="text/css">
.ztree li span.node_name u{vertical-align:top;text-decoration:none;display:table-cell;}
.ztree li span.node_name u:first-child{width:230px;}
.ztree#left li span.node_name u input[type='text']{margin-top:1px;width:120px;height:15px;}
.ztree#left li span.node_name u input[type='checkbox']{margin:1px 1px 0 5px;vertical-align:middle;}
.ztree#left li u[onclick]{text-decoration:underline;}
.ztree#left li u:last-child{padding-left:5px;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<div class="am-g">
			<div class="am-u-md-12 am-margin-bottom-xs am-padding-0"><a class="am-btn am-btn-secondary <%=icon("save")%>" onclick="save()"> 保存配置</a></div>
			<ul style="width:60%;height:900px;float:left;" class="ztree" id="left"></ul>
			<ul style="width:39.5%;height:900px;float:right;" class="ztree" id="right"></ul>
			<div class="am-u-md-12 am-margin-top-xs am-padding-0" data-am-alert><div class="am-alert" id="alert"><i class="am-close am-close-spin">&times;</i></div></div>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/js/plugin/ztree/jquery.ztree.core.min-3.5.21.js"></script>
<script type="text/javascript">
var LEFT=null;
var RIGHT=null;
var setting={
	view:{
		fontCss:function(id,node){
			if(id!="right"){
				return {};
			}
			if(!LEFT){
				LEFT=$.fn.zTree.getZTreeObj("left");
			}
			var o=LEFT.getNodeByParam("id",node.id);
			if(!o){
				return {};
			}
			if($(o.name).find("[name='CHECK']").is(":checked")){
				return {color:"#DD514C"};
			}
			return {};
		},
		nameIsHTML:true,
		showIcon:false,
		showTitle:false
	},
	data:{simpleData:{enable:true}},
	callback:{
		onClick:function(event,id,node,type){
			if(id=="right"){
				var o=$("#left [name='ID'][value='"+node.id+"']").parents("span").find("[name='CHECK']");
				if(o.is(":checked")){
					return;
				}
				o.click();
				$("#right [name='id'][value='"+node.id+"']").parents("a").css("color","#DD514C");
			}
		}
	}
};
function save(){
	var IDS=document.getElementsByName("ID");
	var KINDS=document.getElementsByName("KIND");
	var body=[];
	for(var i=0;i<IDS.length;i++){
		body[i]={ID:IDS[i].value,KIND:KINDS[i].value?KINDS[i].value:null};
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/depend/library.htm",
		data:JSON.stringify(body),
		dataType:"json",
		contentType:"application/json;charset=UTF-8",
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
	$.ajax({
		type:"post",
		url:"${ROOT}auto/field/library.htm",
		data:{keys:[],editable:true},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			$.fn.zTree.init($("#left"),setting,res.left);
			$.fn.zTree.init($("#right"),setting,res.right);
			LEFT=$.fn.zTree.getZTreeObj("left");
			RIGHT=$.fn.zTree.getZTreeObj("right");
			$("#alert").append(res.alert);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
	$("#left [name='CHECK']").click(function(){
		var o=$("#right [name='id'][value='"+$(this).parents("span").find("u:first [name='ID']").val()+"']");
		if(o.length>0){
			o.parents("a").css("color",this.checked?"#DD514C":"");
		}
	});
});
</script>
</body>
</html>