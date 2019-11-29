<%@ page language="java" import="
com.mc.core.crux.Legal,
com.mc.core.entity.blog.Article,
com.mc.core.tool.TimeTool" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Article pages = (Article) request.getAttribute("pages");
@SuppressWarnings("unchecked")
Map<String, String> part = JsonTool.read(pages.getPart(), Map.class);
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, pages.getTitle())%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jform.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<form class="am-g am-form am-form-horizontal" action="blog/article/save.htm" method="post" id="j_form">
			<div class="am-u-md-6">
				<%=Form.select(pages.setType(null), pages.getType(), Legal.BLOG_ARTICLE_TYPE)%>
				<%=Form.select(new Article.Field("重新检测", false, "focus", null, null, 0, null) , null, new Object[][] { { false, "否" }, { true, "是" } })%>
				<%=Form.time(pages.setScreen(null).setNote(null), pages.getScreen(), null, null, null)%>
			</div>
			<div class="am-u-md-6">
				<%=Form.input(pages.setTitle(null), pages.getTitle())%>
				<%=Form.input(pages.setSource(null), "url", pages.getSource(), null)%>
				<%=Form.input(pages.setCreated(null).setField(null).setEmpty(true), TimeTool.getTime(pages.getCreated(), null))%>
			</div>
			<div class="am-u-md-12 am-margin-top">
				<textarea style="height:330px;" name="content" id="content">${pages.content}</textarea>
				<%
					for (String data : part.keySet()) {
						out.println("<code>&lt;pre data-primary=\"" + data + "\"&gt;源码片段&lt;/pre&gt;</code>");
					}
				%>
			</div>
			<div class="am-u-md-12 am-margin-top am-padding-0"><%=Form.button(request, pages.setId(null), pages.getId(), null, pages.getId() != null ? new String[][] { { Global.CLOUD + "article/" + pages.getId() + ".htm", icon("eye"), "查看" } } : null)%></div>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/js/plugin/ueditor/config.js"></script>
<script type="text/javascript" src="_/js/plugin/ueditor/ueditor.all.min-1.4.3.3.js"></script>
<script type="text/javascript" src="_/my/jform.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var label=$("#j_form>.am-u-md-6>.am-form-group>.am-u-md-3");
	$("#content").parent("div").css({"padding-left":label.width()+parseInt(label.css("padding-right"))+"px","padding-right":0});
	if(<%=pages.doIsEmpty(pages.getId())%>){
		UE.getEditor("content");
	}
});
</script>
</body>
</html>