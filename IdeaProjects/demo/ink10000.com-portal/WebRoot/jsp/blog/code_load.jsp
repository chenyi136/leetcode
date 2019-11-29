<%@ page language="java" import="
com.mc.core.entity.blog.Code,
com.mc.core.tool.CryptoTool" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Code pages = (Code) request.getAttribute("pages");
String paging = request.getParameter(Global.KEY_JUMP_PAGING);
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, pages.getName())%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link href="_/js/plugin/rainbow/css/github.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<form class="am-g am-form" action="blog/code/save.htm" method="post">
			<%
				if (paging != null && !paging.equals("")) {
					out.print("<input type=\"hidden\" value=\"" + paging + "\" name=\"" + Global.KEY_JUMP_PAGING + "\">");
				}
			%>
			<input type="hidden" value="${pages.id}" name="id">
			<input type="hidden" value="<%=pages.getEntry() != null ? CryptoTool.DES.encode(pages.getEntry()) : ""%>" name="entry" id="entry">
			<input type="text" value="${pages.type}" required="required" maxlength="20" placeholder="请输入代码分类" name="type">
			<input type="text" class="am-margin-top-xs" value="${pages.name}" required="required" maxlength="40" placeholder="请输入代码名称" name="name">
			<%if (pages.getId() != null && Global.OUTPUT != null) {%>
			<a class="am-margin-top-xs am-btn am-btn-success <%=icon("pencil-square-o")%>" onclick="read(false)"> 本地编辑</a>
			<a class="am-margin-top-xs am-btn am-btn-success <%=icon("houzz")%>" onclick="read(true)"> 本地读取</a>
			<%}%>
			<button type="submit" class="am-margin-top-xs am-btn am-btn-success <%=icon("save")%>"> 提交</button>
		</form>
		<%if (pages.getEntry() != null) {%>
		<pre class="am-margin-vertical-xs" data-language="<%=pages.getName() != null && pages.getName().endsWith(".java") ? "java" : "html"%>" id="code">
			<code>
<%=pages.getEntry().replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")%>
			</code>
		</pre>
		<%}%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/js/plugin/rainbow/rainbow.min-2.1.2.js"></script>
<script type="text/javascript" src="_/js/plugin/rainbow/lang/css.js"></script>
<script type="text/javascript" src="_/js/plugin/rainbow/lang/generic.js"></script>
<script type="text/javascript" src="_/js/plugin/rainbow/lang/html.js"></script>
<script type="text/javascript" src="_/js/plugin/rainbow/lang/java.js"></script>
<script type="text/javascript">
function read(flag){
	$.ajax({
		type:"post",
		url:"${ROOT}blog/code/read.htm",
		data:{id:<%=pages.getId()%>,flag:flag},
		dataType:"json",
		async:false,
		success:function(res){
			if(res.state=="OK"){
				$("#entry").val(res.entry);
				$("#code").html("<code>"+res.code+"</code>");
				Rainbow.color();
			}
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
	return false;
}
</script>
</body>
</html>