<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link href="_/js/plugin/rainbow/css/github.css" rel="stylesheet" type="text/css" media="screen" id="screen">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<div id="j_right">
		<%=crumb(request)%>
		<div class="am-g">
			<select data-am-selected="{btnStyle:'secondary',btnWidth:'10%',searchBox:1}" id="style">
			<%
				String[] styles = new String[] { "all-hallows-eve", "blackboard", "dreamweaver", "espresso-libre", "github", "kimbie-dark", "kimbie-light", "monokai", "obsidian", "paraiso-dark", "paraiso-light", "pastie", "rainbow", "solarized-dark", "solarized-light", "sunburst", "tomorrow-night", "tricolore", "twilight", "zenburnesque"};
				for (String style : styles) {
					out.print("<option value=\"" + style + "\"" + (style.equals("github") ? " selected=\"selected\"" : "") + ">" + style + "</option>");
				}
			%>
			</select>
			<a href="auto/field/down.htm?<%=request.getQueryString()%>" class="am-btn am-btn-secondary <%=icon("cloud-download")%>" target="_blank"> 下载源码</a>
		</div>
		<%
			String[][] codes = (String[][]) request.getAttribute("codes");
			for (String[] code : codes) {
				boolean start = true;
				out.println("<pre class=\"am-margin-top-xs am-margin-bottom-0\">");
				for (int i = 0; i < code.length; i++) {
					String temp = code[i];
					if (temp == null) {
						continue;
					}
					if (start) {
						start = false;
					} else {
						out.print("\n\n");
					}
					if (temp != null) {
						out.print("<code data-language=\"" + (i == 3 ? "html" : "java") + "\">" + temp.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;") + "</code>");
					}
				}
				out.println("</pre>");
			}
		%>
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
	$("#style").change(function(){
		$("#screen").attr("href","_/js/plugin/rainbow/css/"+$(this).find(":selected").val()+".css");
	});
});
</script>
</body>
</html>