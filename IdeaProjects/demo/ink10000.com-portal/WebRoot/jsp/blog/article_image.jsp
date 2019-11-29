<%@ page language="java" import="com.mc.core.entity.blog.Article" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Article pages = (Article) request.getAttribute("pages");
@SuppressWarnings("unchecked")
Map<String, List<String>> image = JsonTool.read(pages.getImage(), Map.class);
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, pages.getTitle())%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jform.css">
<style type="text/css">
.am-u-md-2,.am-u-md-5{margin-top:0.5rem;padding:0;}
.am-form-group{margin:0;}
input[type='file']{display:none;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<form class="am-g am-form am-form-horizontal" action="blog/article/image.htm" method="post" enctype="multipart/form-data" id="j_form" onsubmit="javascript:return window.confirm('提交前先压缩图片');">
		<%
			int index = 1;
			for (Map.Entry<String, List<String>> data : image.entrySet()) {
				List<String> value = data.getValue();
				if (value.get(1).equals(Global.OK)) {
					continue;
				}
				if (index == 1) {
					out.print("<div class=\"am-u-md-2 am-margin-0\">");
					out.print("<a class=\"am-btn am-btn-sm am-btn-default am-btn-block\">" + index + "</a>");
					out.print("</div>");
					out.print("<div class=\"am-u-md-5 am-margin-0\">");
					out.print("<input type=\"hidden\" value=\"" + data.getKey() + "\" name=\"key\">");
					out.print("<a href=\"" + value.get(0) + "\" class=\"am-btn am-btn-sm am-btn-success am-btn-block\" target=\"_blank\">" + data.getKey() + "</a>");
					out.print("</div>");
					out.print("<div class=\"am-u-md-5 am-margin-0\">");
					out.print("<input type=\"file\" accept=\".gif,.jpeg,.jpg,.png,.webp\" lang=\"" + index + "\" name=\"" + data.getKey() + "\">");
					out.print("<a class=\"am-btn am-btn-sm am-btn-warning am-btn-block\" onclick=\"upload(this)\">选择文件</a>");
					out.print("</div>");
				} else {
					out.print("<div class=\"am-u-md-2\">");
					out.print("<a class=\"am-btn am-btn-sm am-btn-default am-btn-block\">" + index + "</a>");
					out.print("</div>");
					out.print("<div class=\"am-u-md-5\">");
					out.print("<input type=\"hidden\" value=\"" + data.getKey() + "\" name=\"key\">");
					out.print("<a href=\"" + value.get(0) + "\" class=\"am-btn am-btn-sm am-btn-success am-btn-block\" target=\"_blank\">" + data.getKey() + "</a>");
					out.print("</div>");
					out.print("<div class=\"am-u-md-5\">");
					out.print("<input type=\"file\" accept=\".gif,.jpeg,.jpg,.png,.webp\" lang=\"" + index + "\" name=\"" + data.getKey() + "\">");
					out.print("<a class=\"am-btn am-btn-sm am-btn-warning am-btn-block\" onclick=\"upload(this)\">选择文件</a>");
					out.print("</div>");
				}
				index++;
			}
			out.print("<div class=\"am-u-md-12 am-margin-top-xs am-padding-0\">" + Form.button(request, pages.setId(null), pages.getId()) + "</div>");
		%>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jform.js"></script>
<script type="text/javascript">
function upload(o){
	var input=$(o).parent().find("input");
	input.change(function(){
		var o=$(this);
		var v=o.val();
		var k=o.attr("lang");
		if(v&&v.toLowerCase().indexOf("\\"+k+".")!=-1){
			o.parent().find("a").removeClass("am-btn-warning").addClass("am-btn-default");
		}else{
			o.parent().find("a").removeClass("am-btn-default").addClass("am-btn-warning");
		}
	});
	input.click();
}
</script>
</body>
</html>