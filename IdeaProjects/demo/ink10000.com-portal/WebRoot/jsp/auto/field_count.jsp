<%@ page language="java" import="java.util.Comparator" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, String> modules = (Map<Integer, String>) request.getAttribute("modules");
@SuppressWarnings("unchecked")
Map<String, Map<String, List<String>>> pages = (Map<String, Map<String, List<String>>>) request.getAttribute("pages");
Integer module = (Integer) request.getAttribute("module");
String count = (String) request.getAttribute("count");
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jline.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<div class="am-g">
			<select data-am-selected="{btnStyle:'secondary',searchBox:1}" onchange="javascript:location.href='${ROOT}auto/field/count.htm?id='+this.value">
				<option value="-1">请选择模块</option>
				<%
					for (Map.Entry<Integer, String> en : modules.entrySet()) {
						out.print("<option value=\"" + en.getKey() + "\"" + (String.valueOf(en.getKey()).equals(String.valueOf(module)) ? " selected=\"selected\"" : "") + ">" + en.getValue() + "</option>");
					}
				%>
			</select>
			<a class="am-btn am-btn-secondary <%=icon("eye")%>" onclick="javascript:$('#popup').modal();"> 清理脚本</a>
		</div>
		<ul class="am-margin-0 am-padding-top-xs am-list am-list-static am-list-border am-list-striped" id="j_line">
		<%
			int queue = 1;
			for (Map.Entry<String, Map<String, List<String>>> en : pages.entrySet()) {
				out.print("<li>" + queue + ".<i>" + en.getKey() + "</i>：");
				Map<String, List<String>> value = en.getValue();
				int size = value.size();
				int index = 0;
				for (Map.Entry<String, List<String>> data : value.entrySet()) {
					index++;
					List<String> entrys = data.getValue();
					entrys.sort(new Comparator<String>() {
						public int compare(String o1, String o2) {
							return o1.compareTo(o2);
						}
					});
					out.print("<i data-am-popover=\"{content:'" + entrys.toString().replace("[", "").replace("]", "") + "',trigger:'hover',theme:'sm'}\">" + data.getKey() + "(" + entrys.size() + ")</i>");
					if (index < size) {
						out.print("、");
					}
				}
				out.print("</li>");
				queue++;
			}
		%>
		</ul>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-popup" id="popup">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">清理空字符串的脚本</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd"><%=count%></div>
	</div>
</div>
</body>
</html>