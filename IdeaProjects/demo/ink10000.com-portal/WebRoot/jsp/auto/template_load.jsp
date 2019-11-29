<%@ page language="java" import="
org.apache.commons.codec.binary.Base64,
com.mc.core.entity.auto.Template,
com.mc.core.template.DaoImplTemplate,
com.mc.core.template.DaoMapperTemplate,
com.mc.core.template.DaoTemplate,
com.mc.core.template.EntityTemplate,
com.mc.core.template.ServiceImplTemplate,
com.mc.core.template.ServiceTemplate" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, String> modules = (Map<Integer, String>) request.getAttribute("modules");
Template pages = (Template) request.getAttribute("pages");
String paging = request.getParameter(Global.KEY_JUMP_PAGING);
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, pages.getClazz())%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link href="_/js/plugin/rainbow/css/github.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<form class="am-g am-form am-form-horizontal" action="auto/template/save.htm" method="post" enctype="multipart/form-data" id="j_form">
			<%
				if (paging != null && !paging.equals("")) {
					out.print("<input type=\"hidden\" value=\"" + paging + "\" name=\"" + Global.KEY_JUMP_PAGING + "\">");
				}
			%>
			<input type="hidden" value="${pages.id}" name="id">
			<input type="text" value="${pages.clazz}" readonly="readonly" placeholder="模板类名">
			<input type="text" class="am-margin-vertical-xs" value="<%=pages.getNozzle() != null ? pages.getNozzle().replace("[", "").replace("]", "").replace("\"", "").replace(",", " / ") : ""%>" readonly="readonly" placeholder="父级接口">
			<div class="am-margin-bottom-0 am-form-group am-form-file">
				<button class="am-btn am-btn-block <%=icon("cloud-upload")%>"> 请选择接口实现的类文件，类文件（.java）请使用UTF-8编码</button>
				<input type="file" accept=".java" name="file" id="file">
			</div>
			<div class="am-margin-top-xs">
				<a href="_/doc/demo.zip" class="am-btn am-btn-success <%=icon("code-fork")%>" target="_blank"> 本地开发</a>
				<button type="submit" class="am-btn am-btn-success <%=icon("save")%>"> 上传模板</button>
			</div>
		</form>
		<pre class="am-margin-vertical-xs" data-language="java">
<%
if (pages.getSource() != null) {
	out.print(new String(Base64.decodeBase64(pages.getSource())).replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"));
} else {
	out.println("//模板接口类有：");
	out.println("//" + EntityTemplate.class.getName());
	out.println("//" + DaoTemplate.class.getName());
	out.println("//" + DaoImplTemplate.class.getName());
	out.println("//" + DaoMapperTemplate.class.getName());
	out.println("//" + ServiceTemplate.class.getName());
	out.print("//" + ServiceImplTemplate.class.getName());
}
%>
		</pre>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/js/plugin/rainbow/rainbow.min-2.1.2.js"></script>
<script type="text/javascript" src="_/js/plugin/rainbow/lang/css.js"></script>
<script type="text/javascript" src="_/js/plugin/rainbow/lang/generic.js"></script>
<script type="text/javascript" src="_/js/plugin/rainbow/lang/html.js"></script>
<script type="text/javascript" src="_/js/plugin/rainbow/lang/java.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#file").on("change",function(){
		var files=this.files;
		if(files&&files.length>0){
			$(this).parent("div").find("button").html(" 请选择接口实现的类文件，类文件（.java）请使用UTF-8编码，已选择的文件："+files[0].name);
		}
	});
	$("#j_form").submit(function(){
		if(!"${pages.id}"&&!$("#file").val()){
			JAlert("请选择接口实现的类文件");
			return false;
		}
	});
});
</script>
</body>
</html>