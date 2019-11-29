<%@ page language="java" import="
com.mc.core.crux.Legal,
com.mc.core.entity.blog.Locator,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Locator en = new Locator();
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
		<%=crumb(request, "blog/locator/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setTitle(null), 1)%>
			<%=Search.input(en.setAddress(null), 1)%>
			<%=Search.select(en.setType(null), Legal.BLOG_LOCATOR_TYPE)%>
			<%=Search.button(true, true, 4)%>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setTitle(null), en.setType(null), en.setAccess(null), en.setCreated(null))%>
		<%=Search.paging(true, false, new String[][] { { "load()", icon("pencil-square-o"), "创建" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-popup j_popup" id="load">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">创建视频系列</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.select(en.setType(null), Legal.BLOG_LOCATOR_TYPE, true)%>
				<%=Popup.input(en.setTitle(null))%>
				<%=Popup.input(en.setAddress(null))%>
				<%=Popup.button(en.setId(null))%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function load(id){
	if(!id){
		$("#load [type='reset']").click();
		$("#load [name='id']").val("");
		$("#load").modal();
		return;
	}
	var tr=$("#j_table input[value='"+id+"']").closest("tr");
	$("#load [name='id']").val(id);
	document.getElementsByName("type")[1].value=tr.find("td[lang='type']").attr("tabindex");
	$("#load [name='title']").val(tr.find("td[lang='title'] a").text());
	$("#load [name='address']").val(tr.find("td[lang='title'] a").attr("href"));
	$("#load").modal();
}
$(document).ready(function(){
	$("#load select").height($("#load .am-input-group-label").height());
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td lang=\"title\"><a href=\""+data.address+"\" style=\"width:240px;display:inline-block;\" class=\"am-text-truncate\" target=\"_blank\">"+data.title+"</a></td>";
			h+="<td tabindex=\""+data.type[0]+"\" lang=\"type\">"+data.type[1]+"</td>";
			h+="<td>"+data.access+"</td>";
			h+="<td>"+data.created+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(["+data.id+"])\"> 删除</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("pencil-square-o")%> am-text-secondary\" onclick=\"load("+data.id+")\"> 编辑</a>";
			h+="</div>";
			h+="</td>";
			h+="</tr>";
		}
		$("#j_table tbody").html(h);
	});
	$("#load form").submit(function(){
		var o=$(this);
		var en=new Object();
		en.id=o.find("[name='id']").val();
		en.type=o.find("[name='type']").val();
		en.title=o.find("[name='title']").val();
		en.address=o.find("[name='address']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}blog/locator/save.htm",
			data:en,
			dataType:"json",
			async:false,
			success:function(res){
				o.closest(".am-popup").modal("close");
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
		return false;
	});
});
</script>
</body>
</html>