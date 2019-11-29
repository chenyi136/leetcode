<%@ page language="java" import="
java.util.Map,
com.ziniu.pojo.ProgramInfo" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, ProgramInfo> datas = (Map<Integer, ProgramInfo>) request.getAttribute("datas");
String id = request.getParameter("id");
boolean flag = "1".equals(request.getParameter("flag"));
%>
<div class="col-md-3" id="j_program">
	<div class="grabble_wrap">
		<div class="matter_box">
			<div class="handle clear">
				<a href="#"><span>充值中心</span></a>
				<%=id == null || id.equals("") ? "<a href=\"program/load.htm\"><span>快速设置</span></a>" :"<a href=\"javascript:JProgramDrop(" + id + ");\"><span>删除方案</span></a>"%>
			</div>
			<div class="info_box">
			<%
			// type="" 
				for (ProgramInfo data : datas.values()) {
					out.print("<div class=\"panel panel-default\" lang=\"" + data.id + "\">");
					out.print("<input type=\"hidden\" value=\"" + data.queue + "\">");
					out.print("<div class=\"panel-heading\">");
					out.print("<div style=\"display:block;\" class=\"panel-btns\">");
					out.print("<img src=\"_/images/wrench.png\" style=\"width:16px;\" class=\"cp\">");
					out.print("<div style=\"display:none;\" class=\"operate_box\">");
					out.print("<p><a onclick=\"JProgramKeyword(" + data.id + ")\">添加词语</a></p>");
					out.print("<p><a href=\"program/load.htm?id=" + data.id + "\">修改方案</a></p>");
					out.print("<p><a onclick=\"JProgramQueue(" + data.id + ",true)\">向上移动</a></p>");
					out.print("<p><a onclick=\"JProgramQueue(" + data.id + ",false)\">向下移动</a></p>");
					out.print("</div>");
					out.print("</div>");
					out.print("<h5 class=\"panel-title\">");
					out.print("<span class=\"vm panel-minimize tooltips maximize cp\"></span>");
					out.print("<span class=\"vm ml5\">" + data.name + "</span>");
					out.print("</h5>");
					out.print("</div>");
					out.print("<div style=\"display:none;\" class=\"panel-body\">");
					out.print("<div class=\"popover-example\">");
					if (flag) {
						for(Map.Entry<Integer, String> en : data.keywords.entrySet()) {
							out.print("<div class=\"info-box clear\">");
							out.print("<div class=\"info-left\"><div class=\"info-left-child\">" + en.getValue() + "</div></div>");
							out.print("</div>");
						}
					} else {
						for(Map.Entry<Integer, String> en : data.keywords.entrySet()) {
							out.print("<div class=\"info-box clear\">");
							out.print("<div class=\"info-left\"><div class=\"info-left-child\">" + en.getValue() + "</div></div>");
							out.print("<div class=\"info-right\"><input type=\"checkbox\" class=\"vm\" value=\"" + en.getKey() + "\" checked=\"checked\" name=\"keyword\"></div>");
							out.print("</div>");
						}
					}
					
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
			%>
			</div>
		</div>
	</div>
</div>