<%@ page language="java" import="
com.mc.core.crux.Legal,
com.mc.core.entity.auth.Event,
com.mc.core.tool.TimeTool" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<Event> datas = (List<Event>) request.getAttribute("datas");
Boolean total = (Boolean) request.getAttribute("total");
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
<style type="text/css">
.am-list-static.am-list-border>li{padding:0.5rem;}
.am-list>li>.am-badge{cursor:pointer;}
.am-list-border>li>a{padding:0;display:inline;}
.am-gallery-default .am-gallery-item img{width:18px;height:15px;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "event/")%>
		<div class="am-g">
			<ul class="am-margin-0 am-list am-list-static am-list-border" data-am-widget="gallery" data-am-gallery="{pureview:1}" data-am-popover="{content:'点击页面左下角 + 来创建待办事项',trigger:'hover',theme:'sm'}">
			<%
				String[] color = new String[] { "am-badge-warning", "am-badge-success", "am-badge-secondary" };
				if (datas.size() > 0) {
					for (Event data : datas) {
						out.print("<li id=\"e" + data.getId() + "\"><a href=\"" + data.getAddress() + "\" class=\"" + icon("link") + "\"></a> [" + data.getClose() + "][" + TimeTool.getTime(data.getCreated(), null) + "]" + data.getContent());
						String image = Global.file(data.getImage());
						if (!image.equals("javascript:;")) {
							out.print(" <i class=\"am-gallery-item\"><img src=\"_/my/i/image.jpg\" alt=\"" + replace(data.getContent()) + "\" data-rel=\"" + image + "\"></i>");
						}
						if (data.getTrash()) {
							out.print("（" + Legal.AUTH_EVENT_STATE.get(data.getState()) + "）");
							out.print("<i class=\"am-badge am-badge-danger " + icon("trash-o") + "\" onclick=\"JEvent('delete',this," + data.getId() + "," + total + ")\"> </i></li>");
						} else {
							if (data.getState() != 2) {
								out.print("<i class=\"am-badge " + color[data.getState()] + " " + icon("arrow-circle-o-right") + "\" onclick=\"JEvent('state',this," + data.getId() + ")\"> " + Legal.AUTH_EVENT_STATE.get(data.getState()) + "</i>");
								out.print("<i class=\"am-badge am-badge-danger " + icon("trash-o") + "\" onclick=\"JEvent('trash',this," + data.getId() + "," + total + ")\"> </i></li>");
							} else {
								out.print("<i class=\"am-badge " + color[data.getState()] + " " + icon("check-circle-o") + "\"> " + Legal.AUTH_EVENT_STATE.get(data.getState()) + "</i>");
								out.print("<i class=\"am-badge am-badge-danger " + icon("trash-o") + "\" onclick=\"JEvent('delete',this," + data.getId() + "," + total + ")\"> </i></li>");
							}
						}
					}
				} else {
					out.print("<li class=\"am-text-center\">暂无数据</li>");
				}
			%>
			</ul>
			<a href="event/index.htm?total=1" class="am-margin-top-xs am-btn am-btn-secondary <%=icon("eye")%>"> 查看全部</a>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
</body>
</html>