<%@ page language="java" import="
com.mc.core.entity.file.Region,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Region en = new Region();
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
		<%=crumb(request, "file/region/")%>
		<div id="j_search">
			<div class="am-g">
				<%=Search.input(en.setName(null), 1)%>
				<%=Search.input(en.setCode(null), 0)%>
				<%=Search.input(en.setPost(null), 0)%>
				<%=Search.button(false, true, 3)%>
			</div>
			<div class="am-g am-padding-top-xs">
				<%=Search.input(en.setAlias(null), 1)%>
				<%=Search.input(en.setRoute(null), 1)%>
				<%=Search.input(en.setParent(null), 0, 3, true)%>
				<%=Search.button(true, false, 3)%>
			</div>
		</div>
		<%=Search.table(0, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setId(null), en.setName(null), en.setLevel(null), en.setRoute(null), en.setCode(null), en.setPost(null), en.setLongitude(null), en.setLatitude(null))%>
		<%=Search.paging(false, false, new String[][] { { "down()", icon("cloud-download"), "下载" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-modal am-modal-prompt" id="down">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">下载区域数据<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd">
			请选择要下载的字段<br>
			<input type="checkbox" value="<%=en.setId(null).FrameFieldName%>" checked="checked" disabled="disabled" name="fields"><%=en.setId(null).getAlias()%>&nbsp;
			<input type="checkbox" value="<%=en.setName(null).FrameFieldName%>" checked="checked" disabled="disabled" name="fields"><%=en.setName(null).getAlias()%>&nbsp;
			<input type="checkbox" value="<%=en.setAlias(null).FrameFieldName%>" name="fields"><%=en.setAlias(null).getAlias()%>&nbsp;
			<input type="checkbox" value="<%=en.setLevel(null).FrameFieldName%>" name="fields"><%=en.setLevel(null).getAlias()%>&nbsp;
			<input type="checkbox" value="<%=en.setRoute(null).FrameFieldName%>" name="fields"><%=en.setRoute(null).getAlias()%><br>
			<input type="checkbox" value="<%=en.setCode(null).FrameFieldName%>" name="fields"><%=en.setCode(null).getAlias()%>&nbsp;
			<input type="checkbox" value="<%=en.setPost(null).FrameFieldName%>" name="fields"><%=en.setPost(null).getAlias()%>&nbsp;
			<input type="checkbox" value="<%=en.setLongitude(null).FrameFieldName%>" name="fields"><%=en.setLongitude(null).getAlias()%>&nbsp;
			<input type="checkbox" value="<%=en.setLatitude(null).FrameFieldName%>" name="fields"><%=en.setLatitude(null).getAlias()%>
		</div>
		<div class="am-modal-footer">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function next(parent){
	$("#j_search input[name='parent']").val(parent);
	var en=new Object();
	en.size=JPage.size;
	en.now=1;
	en.order=JPage.order;
	en.queue=JPage.queue;
	en.equal=[{tag:"input",value:parent,name:"<%=en.setParent(null).FrameFieldName%>"}];
	en.like=[];
	en.custom=[];
	JPageSend(null,en);
}
function down(){
	$("#down").modal({
		relatedTarget:this,
		onConfirm:function(n){
			var ids=[];
			$.each($("#down [name='fields']:checked"),function(){
				ids[ids.length]=$(this).val();
			});
			JTarget("file/region/down.htm",ids);
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
			h+="<td><a onclick=\"next("+data.id+")\">"+data.id+"</a></td>";
			h+="<td>"+data.name+"</td>";
			h+="<td>"+data.level+"</td>";
			h+="<td>"+data.route+"</td>";
			h+="<td>"+data.code+"</td>";
			h+="<td>"+data.post+"</td>";
			h+="<td>"+data.longitude+"</td>";
			h+="<td>"+data.latitude+"</td>";
			h+="</tr>";
		}
		$("#j_table tbody").html(h);
	});
});
</script>
</body>
</html>