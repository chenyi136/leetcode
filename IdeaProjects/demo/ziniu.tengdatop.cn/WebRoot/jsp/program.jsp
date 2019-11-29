<%@ page language="java" import="
java.net.URLEncoder,
java.util.Map,
com.ziniu.crux.Global,
com.ziniu.entity.core.Media,
com.ziniu.entity.core.Program,
com.ziniu.tool.JsonTool" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%Program pages = (Program) request.getAttribute("pages");%>
<!DOCTYPE html>
<html>
<head>
	<title><%=pages.getId() != null ? "修改方案" : "快速设置"%> - ${SITE}</title>
	<%@ include file="/jsp/_/meta.jsp"%>
</head>
<body>
<jsp:include page="/jsp/_/header.jsp"/>
<section>
	<div class="mainwrapper">
		<jsp:include page="/menu.htm"/>
		<div class="mainpanel">
			<div class="contentpanel">
				<div class="row">
					<jsp:include page="/program/list.htm">
						<jsp:param name="id" value="${pages.id}"/>
						<jsp:param name="flag" value="1"/>
					</jsp:include>
					<div class="col-md-9">
						<div class="setting_wrap">
							<form action="program/save.htm" method="post">
								<div class="brand_affixion_box">
									<div class="info-box clear">
										<div class="info-left"><span class="vm">方案名称：</span></div>
										<div class="info-right"><div class="info-right-child"><input type="text" style="width:100%;" class="public_input" value="${pages.name}" required="required" maxlength="10" placeholder="必填，管理用于抓取网页的关键字的分组，长度最多10位" name="name"></div></div>
									</div>
								</div>
								<div class="brand_affixion_box">
									<div class="info-box clear">
										<div class="info-left"><span class="vm">抓取媒体：</span></div>
										<div class="info-right">
											<div class="info-right-child">
												<div class="options">
												<%
													if (pages.getMedia() == null) {
														for (Media data : Global.HYPER_MEDIA_ENGINE.values()) {
															out.print("<label class=\"vm\">");
															out.print("<input type=\"checkbox\" class=\"vm checkbox1\" value=\"" + data.getId() + "\" checked=\"checked\" name=\"medias\">");
															out.print("<span class=\"vm\"> <a href=\"" + data.getAddress().replace("{COORDS}", data.getStart().toString()).replace("{KEYWORD}", data.getEncode().equals("UTF-8") ? "你好" : URLEncoder.encode("你好", data.getEncode())) + "\" target=\"_blank\">" + data.getName() + "</a></span>");
															out.print("</label>");
														}
													} else {
														@SuppressWarnings("unchecked")
														Map<String, String> cache = JsonTool.read(pages.getMedia(), Map.class);
														for (Media data : Global.HYPER_MEDIA_ENGINE.values()) {
															out.print("<label class=\"vm\">");
															out.print("<input type=\"checkbox\" class=\"vm checkbox1\" value=\"" + data.getId() + "\"" + (cache.containsKey(data.getId().toString()) ? " checked=\"checked\"" : "") + " name=\"medias\">");
															out.print("<span class=\"vm\"> <a href=\"" + data.getAddress().replace("{COORDS}", data.getStart().toString()).replace("{KEYWORD}", data.getEncode().equals("UTF-8") ? "你好" : URLEncoder.encode("你好", data.getEncode())) + "\" target=\"_blank\">" + data.getName() + "</a></span>");
															out.print("</label>");
														}
													}
												%>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="brand_affixion_box">
									<div class="info-box clear">
										<div class="info-left">&nbsp;</div>
										<div class="info-right">
											<div class="info-right-child">
												<input type="hidden" value="${pages.id}" name="id">
												<button type="submit" class="btn btn-danger">提交方案</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/jsp/_/copy.jsp"/>
		</div>
	</div>
</section>
</body>
</html>