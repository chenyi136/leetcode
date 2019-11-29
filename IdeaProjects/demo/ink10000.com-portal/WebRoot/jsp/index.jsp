<%@ page language="java" import="
com.mc.core.crux.Legal,
com.mc.core.entity.auth.Account,
com.mc.core.entity.auth.Event,
com.mc.core.entity.auth.Feedback,
com.mc.core.entity.auth.Group,
com.mc.core.entity.auth.Power,
com.mc.core.tool.TimeTool,
com.mc.portal.pojo.OnlineInfo" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<Power> hobby = (List<Power>) request.getAttribute("hobby");
@SuppressWarnings("unchecked")
List<Event> event = (List<Event>) request.getAttribute("event");
@SuppressWarnings("unchecked")
List<Feedback> feedback = (List<Feedback>) request.getAttribute("feedback");
@SuppressWarnings("unchecked")
Map<String, OnlineInfo> cache = (Map<String, OnlineInfo>) request.getAttribute("cache");
Group group = (Group) request.getAttribute("group");
Account pages = (Account) request.getAttribute("pages");
%>
<!DOCTYPE html>
<html>
<head>
	<title>首页 - ${SITE}</title>
	<%@ include file="/jsp/_/meta.jsp"%>
<style type="text/css">
.am-panel{margin-bottom:0;}
.am-panel-bd>div{padding:0.5rem;}
.am-panel-bd>div>p{margin:0 0 0.5rem 0;}
.am-panel-bd>div>p:last-child{margin:0;}
.am-panel-bd .meta{margin-top:0.5rem;font-size:1.6rem;font-style:normal;color:#999;}
.am-panel-bd .body{font-size:1.7rem;font-style:normal;}
.am-panel-bd .block{font-size:1.4rem;text-indent:2em;}
.am-avg-md-5 li{margin-right:-1px;padding:0.5rem 0;border-bottom:1px solid #FBD0AE;border-right:1px solid #FBD0AE;}
.am-avg-md-5 li b{cursor:pointer;display:block;}
.am-list-static.am-list-border>li{padding:0.5rem;}
.am-list>li>.am-badge{cursor:pointer;}
.am-list-border>li>a{padding:0;display:inline;}
.am-gallery-default .am-gallery-item img{width:18px;height:15px;}
.am-comments-list .am-comment{margin:0 0 0.5rem 0;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "enjoy/", "global/", "admin/", "login.htm", "logout.htm", "share/", "ueditor/")%>
		<div class="am-g">
			<div class="am-u-md-6 am-padding-0">
				<div class="am-panel am-panel-warning">
					<div class="am-panel-hd am-cf" data-am-collapse="{target:'#hobby'}"><i class="<%=icon("map-signs")%>"></i> 我的收藏<i class="<%=icon("caret-down")%> am-fr"></i></div>
					<div class="am-padding-0 am-panel-bd am-in" id="hobby">
					<%
						int size = hobby.size();
						if (size > 0) {
							int start = size % 5 == 0 ? size - 5 : size - size % 5;
							out.print("<ul class=\"am-padding-horizontal-xs1 am-avg-md-5 am-text-center\">");
							for (int i = 0; i < start; i++) {
								Power power = hobby.get(i);
								out.print("<li" + ((i + 1) % 5 == 0 ? " style=\"border-right:none;\"" : "") + " lang=\"" + power.getId() + "\"><a href=\"" + power.getRoute() + "\" class=\"am-text-warning\"><i class=\"am-icon-btn " + power.getIcon() + "\"></i><br>" + power.getName() + "</a><b class=\"" + icon("trash-o") + "\" onclick=\"enjoy(" + power.getId() + ")\"></b></li>");
							}
							for (int i = start; i < size; i++) {
								Power power = hobby.get(i);
								out.print("<li" + ((i + 1) % 5 == 0 ? " style=\"border-bottom:none;border-right:none;\"" : " style=\"border-bottom:none;\"") + " lang=\"" + power.getId() + "\"><a href=\"" + power.getRoute() + "\" class=\"am-text-warning\"><i class=\"am-icon-btn " + power.getIcon() + "\"></i><br>" + power.getName() + "</a><b class=\"" + icon("trash-o") + "\" onclick=\"enjoy(" + power.getId() + ")\"></b></li>");
							}
							out.print("</ul>");
						} else {
							out.print("<div class=\"am-padding-xs am-text-center am-text-warning\">你还未收藏任何页面</div>");
						}
					%>
					</div>
				</div>
				<div class="am-margin-top-xs am-panel am-panel-warning">
					<div class="am-panel-hd am-cf" data-am-collapse="{target:'#event'}"><i class="<%=icon("map-signs")%>"></i> 待办事项<i class="<%=icon("caret-down")%> am-fr"></i></div>
					<div class="am-padding-0 am-panel-bd am-in" id="event">
						<ul class="am-margin-0 am-list am-list-static am-list-border" data-am-widget="gallery" data-am-gallery="{pureview:1}">
						<%
							String[] color = new String[] { "am-badge-warning", "am-badge-success", "am-badge-secondary" };
							for (Event data : event) {
								out.print("<li id=\"e" + data.getId() + "\"><a href=\"" + data.getAddress() + "\" class=\"" + icon("link") + "\"></a> [" + data.getClose() + "][" + TimeTool.getTime(data.getCreated(), null) + "]" + data.getContent());
								String image = Global.file(data.getImage());
								if (!image.equals("javascript:;")) {
									out.print(" <i class=\"am-gallery-item\"><img src=\"_/my/i/image.jpg\" alt=\"" + replace(data.getContent()) + "\" data-rel=\"" + image + "\"></i>");
								}
								if (data.getTrash()) {
									out.print("（" + Legal.AUTH_EVENT_STATE.get(data.getState()) + "）");
									out.print("<i class=\"am-badge am-badge-danger " + icon("trash-o") + "\" onclick=\"JEvent('delete',this," + data.getId() + ",false)\"> </i></li>");
								} else {
									if (data.getState() != 2) {
										out.print("<i class=\"am-badge " + color[data.getState()] + " " + icon("arrow-circle-o-right") + "\" onclick=\"JEvent('state',this," + data.getId() + ")\"> " + Legal.AUTH_EVENT_STATE.get(data.getState()) + "</i>");
										out.print("<i class=\"am-badge am-badge-danger " + icon("trash-o") + "\" onclick=\"JEvent('trash',this," + data.getId() + ",false)\"> </i></li>");
									} else {
										out.print("<i class=\"am-badge " + color[data.getState()] + " " + icon("check-circle-o") + "\"> " + Legal.AUTH_EVENT_STATE.get(data.getState()) + "</i>");
										out.print("<i class=\"am-badge am-badge-danger " + icon("trash-o") + "\" onclick=\"JEvent('delete',this," + data.getId() + ",false)\"> </i></li>");
									}
								}
							}
							out.print("<li style=\"border:0;\" class=\"am-text-center\"><a href=\"event/index.htm\" class=\"am-text-warning\">查看更多</a></li>");
						%>
						</ul>
					</div>
				</div>
				<div class="am-margin-top-xs am-panel am-panel-warning">
					<div class="am-panel-hd am-cf" data-am-collapse="{target:'#feedback'}"><i class="<%=icon("map-signs")%>"></i> 意见反馈<i class="<%=icon("caret-down")%> am-fr"></i></div>
					<div class="am-padding-xs am-panel-bd am-in" id="feedback">
						<ul class="am-margin-0 am-comments-list">
						<%
							for (Feedback data : feedback) {
								if (data.getProject().intValue() == 2) {
									data.setAddress(Global.CLOUD + data.getAddress());
								}
								OnlineInfo temp = cache.get(data.getFkAccount());
								out.print("<li class=\"am-comment\">");
								out.print("<img src=\"" + temp.face + "\" style=\"width:48px;height:48px;\" class=\"am-comment-avatar\">");
								out.print("<div class=\"am-comment-main\">");
								out.print("<header class=\"am-comment-hd\"><div class=\"am-comment-meta\"><a class=\"am-comment-author\">" + temp.name + "</a> 评论于 " + TimeTool.getTime(data.getCreated(), null) + "</div></header>");
								out.print("<div class=\"am-comment-bd\"><p>" + data.getContent() + "（来源页面：<a href=\"" + data.getAddress() + "\" target=\"_blank\">" + data.getAddress() + "</a>）<a class=\"am-badge am-badge-danger am-round\"" + (!data.doIsEmpty(data.getReply()) ? " data-am-popover=\"{content:'" + replace(data.getReply()) + "',trigger:'hover',theme:'sm'}\"" : "") + ">" + (data.getSolve() ? "已解决" : "待解决") + "</a></p></div>");
								out.print("</div>");
								out.print("</li>");
							}
							out.print("<li class=\"am-text-center\"><a href=\"feedback/index.htm\" class=\"am-text-warning\">查看更多</a></li>");
						%>
						</ul>
					</div>
				</div>
			</div>
			<div class="am-u-md-6 am-padding-right-0 am-padding-left-xs">
				<div class="am-panel am-panel-warning">
					<div class="am-panel-hd am-cf"><i class="<%=icon("map-signs")%>"></i> 个人资料<a href="admin/profile.htm" class="<%=icon("pencil-square-o")%> am-text-warning am-fr"></a></div>
					<div class="am-padding-0 am-panel-bd am-in">
						<div style="padding-bottom:0;width:70%;display:inline-block;">
							<p><i class="meta">登录账号：</i><i class="body"><%=pages.getUsername()%></i></p>
							<p><i class="meta">绑定邮箱：</i><i class="body"><%=!pages.doIsEmpty(pages.getEmail()) ? pages.getEmail() + " " : ""%></i></p>
							<p><i class="meta">真实姓名：</i><i class="body"><%=replace(pages.getName())%></i></p>
							<p><i class="meta">是否锁定：</i><i class="body"><%=pages.getLocked() ? "是" : "否"%></i></p>
							<p><i class="meta">角色分组：</i><i class="body"><%=group != null ? group.getName() : ""%></i></p>
							<p><i class="meta">创建时间：</i><i class="body"><%=TimeTool.getTime(pages.getCreated(), null)%></i></p>
							<p><i class="meta">更新时间：</i><i class="body"><%=TimeTool.getTime(pages.getEdited(), null)%></i></p>
						</div>
						<div style="width:30%;height:240px;text-align:right;float:right;"><img src="<%=pages.getFace()%>" class="am-img-circle am-img-thumbnail" style="max-height:100%;"></div>
						<div style="width:100%;padding-top:0;">
							<div class="meta">个人简介：</div>
							<%
								String brief = replace(pages.getBrief());
								if (brief.replace("\n", "").trim().equals("")) {
									out.print("<p class=\"block\">尚未完善个人简介</p>");
								} else {
									String[] datas = brief.split("\n");
									for (String data : datas) {
										data = data.trim();
										if (!data.equals("")) {
											out.print("<p class=\"am-text-break block\">" + data + "</p>");
										}
									}
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript">
function enjoy(id){
	if(!window.confirm("确认删除吗？")){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}enjoy/drop.htm",
		data:{id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			$(".am-avg-md-5 li[lang='"+id+"']").remove();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
</script>
</body>
</html>