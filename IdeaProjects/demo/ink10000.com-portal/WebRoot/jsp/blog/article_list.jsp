<%@ page language="java" import="
com.mc.core.crux.Legal,
com.mc.core.entity.blog.Article,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Article en = new Article();
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
		<%=crumb(request, "blog/article/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setTitle(null), 1)%>
			<%=Search.time(en.setSource(null), null, null, 0)%>
			<%=Search.select(en.setType(null), Legal.BLOG_ARTICLE_TYPE, 0)%>
			<%=Search.select(en.setFinish(null), new Object[][] { { 1, "是" }, { 0, "否" } })%>
			<%=Search.button(true, true, 3)%>
		</div>
		<%=Search.table(3, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setTitle(null), en.setType(null), en.setBulk(null), en.setScreen(null).setNote(null), en.setSize(null), en.setLength(null), en.setGood(null), en.setFinish(null), en.setUpload(null), en.setCreated(null))%>
		<%=Search.paging(true, true, null, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function image(id){
	location.href=window.WEB_CONFIG_ROOT+"blog/article/image.htm?"+window.KEY_JUMP_PAGING+"="+JBase64(JPageParam(JPage.now))+"&id="+id;
}
$(document).ready(function(){
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td><a href=\"<%=Global.CLOUD%>article/"+data.id+".htm\" style=\"width:290px;display:inline-block;\" class=\"am-text-truncate\" target=\"_blank\">"+data.title+"</a></td>";
			h+="<td>"+data.type+"</td>";
			h+="<td data-am-popover=\"{content:'文章大小："+data.bulk[0]+"',trigger:'hover',theme:'sm'}\">"+data.bulk[1]+"</td>";
			h+="<td>"+(data.source?"<a href=\""+data.source+"\" target=\"_blank\">"+data.screen+"</a>":data.screen)+"</td>";
			h+="<td>"+data.size+"</td>";
			h+="<td data-am-popover=\"{content:'图片大小："+data.length[0]+"',trigger:'hover',theme:'sm'}\">"+data.length[1]+"</td>";
			h+="<td>"+data.good+"</td>";
			h+="<td><i class="+(data.finish?"<%=icon("check")%>":"<%=icon("times")%>")+"></i></td>";
			h+="<td><i class="+(data.upload?"<%=icon("check")%>":"<%=icon("times")%>")+"></i></td>";
			h+="<td data-am-popover=\"{content:'更新时间："+data.created[1]+"',trigger:'hover',theme:'sm'}\">"+data.created[0]+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+=data.finish?"<a class=\"am-btn am-btn-default am-disabled <%=icon("image")%> am-text-secondary\"> 图片</a>":"<a class=\"am-btn am-btn-default <%=icon("image")%> am-text-secondary\" onclick=\"image('"+data.id+"')\"> 图片</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(['"+data.id+"'])\"> 删除</a>";
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